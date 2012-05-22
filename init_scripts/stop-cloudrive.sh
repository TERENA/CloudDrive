#!/bin/bash
#Cloud backed storage
#
#Copyright (c) 2010-2012, vrijheid.net
#All rights reserved.
#
#Redistribution and use in source and binary forms, with or without
#modification, are permitted provided that the following conditions are met:
#
#*    Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#*    Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#*    Neither the name of vrijheid.net nor the
#     names of its contributors may be used to endorse or promote products
#     derived from this software without specific prior written permission.
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
#FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
#OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

usage="Usage: stop-clouddrive.sh"

bin=`dirname "$0"`
bin=`cd "$bin"; pwd`

if [ "$#" != "0" ]
then
	echo $usage
	exit 1
fi

pids=`ps xwww | grep clouddrive.jar | awk '{print $1}'`

if [ "$pids" != "" ]
then
	echo $(hostname)': Stopping clouddrive WebDAV daemon...'
	kill $pids
	exit 0
fi 

echo $(hostname)': WevDAV Server daemon not running!'
exit 1
