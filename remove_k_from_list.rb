require 'pp'
class ListNode
  attr_accessor :value, :next
  def initialize(val, next_node)
    @value = val
    @next = next_node
  end
end

# @param [ListNode] l
# @param [Integer] k
def remove_k_from_list(l, k)
  return nil if l.nil?

  head = remove_k_from_head(l, k)

  return nil if head.nil?
  return l if l.next.nil?

  previous = head
  current = head.next
  loop do
    if current.value == k
      previous.next = current.next
    else
      previous = current
    end

    break if current.next.nil?

    current = current.next
  end

  head
end

# @param [ListNode] head
# @param [Integer] k
def remove_k_from_head(head, k)
  while !head.nil? && head.value == k
    head = head.next
  end
  head
end

list = ListNode.new(
  3,
  ListNode.new(
    1,
    ListNode.new(
      2,
      ListNode.new(
        3,
        ListNode.new(
          3,
          ListNode.new(
            5,
            nil
          )
        )
      )
    )
  )
)

k = 3

pp remove_k_from_list(list, k)