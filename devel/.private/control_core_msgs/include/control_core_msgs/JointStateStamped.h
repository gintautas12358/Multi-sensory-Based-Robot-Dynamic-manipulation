// Generated by gencpp from file control_core_msgs/JointStateStamped.msg
// DO NOT EDIT!


#ifndef CONTROL_CORE_MSGS_MESSAGE_JOINTSTATESTAMPED_H
#define CONTROL_CORE_MSGS_MESSAGE_JOINTSTATESTAMPED_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <control_core_msgs/JointState.h>

namespace control_core_msgs
{
template <class ContainerAllocator>
struct JointStateStamped_
{
  typedef JointStateStamped_<ContainerAllocator> Type;

  JointStateStamped_()
    : header()
    , state()  {
    }
  JointStateStamped_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , state(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::control_core_msgs::JointState_<ContainerAllocator>  _state_type;
  _state_type state;





  typedef boost::shared_ptr< ::control_core_msgs::JointStateStamped_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::control_core_msgs::JointStateStamped_<ContainerAllocator> const> ConstPtr;

}; // struct JointStateStamped_

typedef ::control_core_msgs::JointStateStamped_<std::allocator<void> > JointStateStamped;

typedef boost::shared_ptr< ::control_core_msgs::JointStateStamped > JointStateStampedPtr;
typedef boost::shared_ptr< ::control_core_msgs::JointStateStamped const> JointStateStampedConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::control_core_msgs::JointStateStamped_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::control_core_msgs::JointStateStamped_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::control_core_msgs::JointStateStamped_<ContainerAllocator1> & lhs, const ::control_core_msgs::JointStateStamped_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.state == rhs.state;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::control_core_msgs::JointStateStamped_<ContainerAllocator1> & lhs, const ::control_core_msgs::JointStateStamped_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace control_core_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::control_core_msgs::JointStateStamped_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::control_core_msgs::JointStateStamped_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::control_core_msgs::JointStateStamped_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::control_core_msgs::JointStateStamped_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::control_core_msgs::JointStateStamped_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::control_core_msgs::JointStateStamped_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::control_core_msgs::JointStateStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "688f84195619f23b63a20c53b614a37f";
  }

  static const char* value(const ::control_core_msgs::JointStateStamped_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x688f84195619f23bULL;
  static const uint64_t static_value2 = 0x63a20c53b614a37fULL;
};

template<class ContainerAllocator>
struct DataType< ::control_core_msgs::JointStateStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "control_core_msgs/JointStateStamped";
  }

  static const char* value(const ::control_core_msgs::JointStateStamped_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::control_core_msgs::JointStateStamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n"
"JointState state\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: control_core_msgs/JointState\n"
"Vector position\n"
"Vector velocity\n"
"Vector acceleration\n"
"Vector effort\n"
"================================================================================\n"
"MSG: control_core_msgs/Vector\n"
"float64[] data\n"
;
  }

  static const char* value(const ::control_core_msgs::JointStateStamped_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::control_core_msgs::JointStateStamped_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.state);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct JointStateStamped_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::control_core_msgs::JointStateStamped_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::control_core_msgs::JointStateStamped_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "state: ";
    s << std::endl;
    Printer< ::control_core_msgs::JointState_<ContainerAllocator> >::stream(s, indent + "  ", v.state);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CONTROL_CORE_MSGS_MESSAGE_JOINTSTATESTAMPED_H
