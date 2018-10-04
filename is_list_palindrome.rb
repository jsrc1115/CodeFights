require 'pp'
module ListPalindrome
  class ListNode
    attr_accessor :value, :next
    def initialize(val, next_node)
      @value = val
      @next = next_node
    end
  end

  def is_list_palindrome(l)
    return true unless l
    inverted_list = invert_list(l)
    array = list_to_a(l)
    inverted_array = list_to_a(inverted_list)
    pp array
    pp inverted_array
    pp array == inverted_array
  end

  def invert_list(head)
    previous = clone_node(head)
    current = clone_node(head.next)
    previous.next = nil
    new_head = nil
    loop do
      next_node = clone_node(current.next)
      current.next = previous

      if next_node
        previous = clone_node(current)
        current = clone_node(next_node)
      else
        new_head = current
        break
      end
    end

    new_head
  end

  def clone_node(node)
    return nil unless node
    ListNode.new(node.value, node.next)
  end

  def list_to_a(head)
    array = []
    current = head
    loop do
      array.push(current.value)
      break unless current.next
      current = current.next
    end
    array
  end
end

list = ListPalindrome::ListNode.new(
  1,
  ListPalindrome::ListNode.new(
    2,
    ListPalindrome::ListNode.new(
      2,
      ListPalindrome::ListNode.new(
        1,
        nil
      )
    )
  )
)

ListPalindrome::is_list_palindrome(list)
