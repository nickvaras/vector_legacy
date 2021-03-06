@#
@# Author: Mike Purvis <mpurvis@clearpathrobotics.com>
@#         Copyright (c) 2013-2014, Clearpath Robotics, Inc.
@#
@# Redistribution and use in source and binary forms, with or without
@# modification, are permitted provided that the following conditions are met:
@#    * Redistributions of source code must retain the above copyright
@#       notice, this list of conditions and the following disclaimer.
@#    * Redistributions in binary form must reproduce the above copyright
@#       notice, this list of conditions and the following disclaimer in the
@#       documentation and/or other materials provided with the distribution.
@#    * Neither the name of Clearpath Robotics, Inc. nor the
@#       names of its contributors may be used to endorse or promote products
@#       derived from this software without specific prior written permission.
@#
@# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
@# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
@# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
@# DISCLAIMED. IN NO EVENT SHALL CLEARPATH ROBOTICS, INC. BE LIABLE FOR ANY
@# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
@# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
@# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
@# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
@# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
@# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
@#
@# Please send comments, questions, or patches to code@clearpathrobotics.com
# THIS IS A GENERATED FILE, NOT RECOMMENDED TO EDIT.
# THE TEMPLATE HAS BEEN MODIFIED FOR VECTOR 

description "bringup @(name)"

@[if interface]@
@# Start and stop ROS with the availability of the network interface
@# which is used as the source for ROS_IP.
start on net-device-up IFACE=@(interface)
stop on net-device-down IFACE=@(interface)
@[else]@
@# We must start ROS after the local filesystems are up, since the catkin setup
@# script requires the use of /tmp.
start on local-filesystems
stop on runlevel [016]
@[end if]@

console log
respawn

exec @(name)-start
pre-stop exec @(name)-stop
