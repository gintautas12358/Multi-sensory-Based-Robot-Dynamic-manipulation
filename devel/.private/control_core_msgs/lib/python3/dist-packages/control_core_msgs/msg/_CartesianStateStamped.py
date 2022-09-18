# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from control_core_msgs/CartesianStateStamped.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import control_core_msgs.msg
import geometry_msgs.msg
import std_msgs.msg

class CartesianStateStamped(genpy.Message):
  _md5sum = "c9ed8fe6dfc8e947ca6e8bd068f04705"
  _type = "control_core_msgs/CartesianStateStamped"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """std_msgs/Header header
CartesianState state
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: control_core_msgs/CartesianState
geometry_msgs/Pose position
geometry_msgs/Twist velocity
geometry_msgs/Accel acceleration
geometry_msgs/Wrench wrench
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Accel
# This expresses acceleration in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Wrench
# This represents force in free space, separated into
# its linear and angular parts.
Vector3  force
Vector3  torque
"""
  __slots__ = ['header','state']
  _slot_types = ['std_msgs/Header','control_core_msgs/CartesianState']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,state

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(CartesianStateStamped, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.state is None:
        self.state = control_core_msgs.msg.CartesianState()
    else:
      self.header = std_msgs.msg.Header()
      self.state = control_core_msgs.msg.CartesianState()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_25d().pack(_x.state.position.position.x, _x.state.position.position.y, _x.state.position.position.z, _x.state.position.orientation.x, _x.state.position.orientation.y, _x.state.position.orientation.z, _x.state.position.orientation.w, _x.state.velocity.linear.x, _x.state.velocity.linear.y, _x.state.velocity.linear.z, _x.state.velocity.angular.x, _x.state.velocity.angular.y, _x.state.velocity.angular.z, _x.state.acceleration.linear.x, _x.state.acceleration.linear.y, _x.state.acceleration.linear.z, _x.state.acceleration.angular.x, _x.state.acceleration.angular.y, _x.state.acceleration.angular.z, _x.state.wrench.force.x, _x.state.wrench.force.y, _x.state.wrench.force.z, _x.state.wrench.torque.x, _x.state.wrench.torque.y, _x.state.wrench.torque.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.state is None:
        self.state = control_core_msgs.msg.CartesianState()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 200
      (_x.state.position.position.x, _x.state.position.position.y, _x.state.position.position.z, _x.state.position.orientation.x, _x.state.position.orientation.y, _x.state.position.orientation.z, _x.state.position.orientation.w, _x.state.velocity.linear.x, _x.state.velocity.linear.y, _x.state.velocity.linear.z, _x.state.velocity.angular.x, _x.state.velocity.angular.y, _x.state.velocity.angular.z, _x.state.acceleration.linear.x, _x.state.acceleration.linear.y, _x.state.acceleration.linear.z, _x.state.acceleration.angular.x, _x.state.acceleration.angular.y, _x.state.acceleration.angular.z, _x.state.wrench.force.x, _x.state.wrench.force.y, _x.state.wrench.force.z, _x.state.wrench.torque.x, _x.state.wrench.torque.y, _x.state.wrench.torque.z,) = _get_struct_25d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_25d().pack(_x.state.position.position.x, _x.state.position.position.y, _x.state.position.position.z, _x.state.position.orientation.x, _x.state.position.orientation.y, _x.state.position.orientation.z, _x.state.position.orientation.w, _x.state.velocity.linear.x, _x.state.velocity.linear.y, _x.state.velocity.linear.z, _x.state.velocity.angular.x, _x.state.velocity.angular.y, _x.state.velocity.angular.z, _x.state.acceleration.linear.x, _x.state.acceleration.linear.y, _x.state.acceleration.linear.z, _x.state.acceleration.angular.x, _x.state.acceleration.angular.y, _x.state.acceleration.angular.z, _x.state.wrench.force.x, _x.state.wrench.force.y, _x.state.wrench.force.z, _x.state.wrench.torque.x, _x.state.wrench.torque.y, _x.state.wrench.torque.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.state is None:
        self.state = control_core_msgs.msg.CartesianState()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 200
      (_x.state.position.position.x, _x.state.position.position.y, _x.state.position.position.z, _x.state.position.orientation.x, _x.state.position.orientation.y, _x.state.position.orientation.z, _x.state.position.orientation.w, _x.state.velocity.linear.x, _x.state.velocity.linear.y, _x.state.velocity.linear.z, _x.state.velocity.angular.x, _x.state.velocity.angular.y, _x.state.velocity.angular.z, _x.state.acceleration.linear.x, _x.state.acceleration.linear.y, _x.state.acceleration.linear.z, _x.state.acceleration.angular.x, _x.state.acceleration.angular.y, _x.state.acceleration.angular.z, _x.state.wrench.force.x, _x.state.wrench.force.y, _x.state.wrench.force.z, _x.state.wrench.torque.x, _x.state.wrench.torque.y, _x.state.wrench.torque.z,) = _get_struct_25d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_25d = None
def _get_struct_25d():
    global _struct_25d
    if _struct_25d is None:
        _struct_25d = struct.Struct("<25d")
    return _struct_25d
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
