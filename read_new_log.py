import time
import os

def follow_log(log_file):
    
    # seek the end of the file
    log_file.seek(0, os.SEEK_END)
    
    while True:
        # read last line of file
        line = log_file.readline()
        
        # sleep if file hasn't been updated
        if not line:
            time.sleep(0.1)
            continue
        
        yield line

if __name__ == '__main__':
    
    logfile = open("log_file_name.log", "r")
    loglines = follow_log(logfile)
    
    for line in loglines:
        print(line)
