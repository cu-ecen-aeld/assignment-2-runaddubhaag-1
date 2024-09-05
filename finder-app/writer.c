#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <syslog.h>


#define EXIT_SUCCESS (0)
#define EXIT_FAILURE (1)

int main(int argc, char* argv[])
{

	int fd = -1;
	char *buf = NULL;
	char *file = NULL;
	ssize_t wc, len = 0;

	openlog(NULL, LOG_CONS|LOG_NDELAY|LOG_PERROR, LOG_USER);

	// process arguments
	if (argc != 3)
	{
		syslog(LOG_ERR,"Incorrect number of arguments specified!");
		syslog(LOG_INFO,"Usage: ./writer <file_path> <write_string>");
		return EXIT_FAILURE;
	}


	file = argv[1];
	buf  = argv[2];
	len = strlen(buf);

	// open file it doesn't exist, in write mode
	fd = open(file, O_WRONLY | O_CREAT, 0644);
	
	if(fd == -1)
	{
		syslog(LOG_ERR,"Couldn't open file %d (%s)", errno, strerror(errno));
		return EXIT_FAILURE;
	}

	syslog(LOG_DEBUG, "Writing %s to %s", buf, file);

	// write string to file
	while (len != 0 && (wc = write(fd, buf, len)) != 0) 
	{
		if (wc == -1) 
		{
			if (errno == EINTR) continue;
 			syslog(LOG_ERR,"write error %d (%s)", errno, strerror(errno));
 			break;
 		}
 		len -= wc;
 		buf += wc;
	}

	return EXIT_SUCCESS;
}