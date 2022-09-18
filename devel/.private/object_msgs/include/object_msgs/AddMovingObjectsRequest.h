// Generated by gencpp from file object_msgs/AddMovingObjectsRequest.msg
// DO NOT EDIT!


#ifndef OBJECT_MSGS_MESSAGE_ADDMOVINGOBJECTSREQUEST_H
#define OBJECT_MSGS_MESSAGE_ADDMOVINGOBJECTSREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace object_msgs
{
template <class ContainerAllocator>
struct AddMovingObjectsRequest_
{
  typedef AddMovingObjectsRequest_<ContainerAllocator> Type;

  AddMovingObjectsRequest_()
    : num(0)  {
    }
  AddMovingObjectsRequest_(const ContainerAllocator& _alloc)
    : num(0)  {
  (void)_alloc;
    }



   typedef int32_t _num_type;
  _num_type num;





  typedef boost::shared_ptr< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> const> ConstPtr;

}; // struct AddMovingObjectsRequest_

typedef ::object_msgs::AddMovingObjectsRequest_<std::allocator<void> > AddMovingObjectsRequest;

typedef boost::shared_ptr< ::object_msgs::AddMovingObjectsRequest > AddMovingObjectsRequestPtr;
typedef boost::shared_ptr< ::object_msgs::AddMovingObjectsRequest const> AddMovingObjectsRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator1> & lhs, const ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator2> & rhs)
{
  return lhs.num == rhs.num;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator1> & lhs, const ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace object_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "54b3c80efd6fae6e6ffff8a4b9facd69";
  }

  static const char* value(const ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x54b3c80efd6fae6eULL;
  static const uint64_t static_value2 = 0x6ffff8a4b9facd69ULL;
};

template<class ContainerAllocator>
struct DataType< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "object_msgs/AddMovingObjectsRequest";
  }

  static const char* value(const ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Add n moving object\n"
"int32 num\n"
;
  }

  static const char* value(const ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.num);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AddMovingObjectsRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::object_msgs::AddMovingObjectsRequest_<ContainerAllocator>& v)
  {
    s << indent << "num: ";
    Printer<int32_t>::stream(s, indent + "  ", v.num);
  }
};

} // namespace message_operations
} // namespace ros

#endif // OBJECT_MSGS_MESSAGE_ADDMOVINGOBJECTSREQUEST_H
