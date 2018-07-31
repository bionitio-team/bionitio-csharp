/*
File:       : Exception.cs 
Description : Exception handling 
Copyright   : (c) BIONITIO_AUTHOR, BIONITIO_DATE  
License     : BIONITIO_LICENSE 
Maintainer  : BIONITIO_EMAIL 
Stability   : stable
Portability : POSIX
*/

using System;

namespace bionitio
{
    public class IOException : BionitioException
    {
        public IOException(string filename, Exception inner)
            : base($"Error reading file {filename}", inner)
        {
        }
    }

    public class BionitioException : Exception
    {
        public BionitioException(string message, Exception inner) : base(message, inner)
        {
        }
    }
}
