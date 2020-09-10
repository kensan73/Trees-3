#https://leetcode.com/problems/path-sum-ii/
#// Time Complexity : O(max(n, c*maxdepth)) where n is number of nodes
#// Space Complexity : O(maxdepth) <- the recursive step + O(maxdepth) <- currPath
#// Did this code successfully run on Leetcode : yes
#// Any problem you faced while coding this :
#
# keeping currSum updated at each iteration
#
#// Your code here along with comments explaining your approach

TreeNode = (val, left = null, right = null) -> Object.assign(
  Object.create(TreeNode::),
  val: val
  left: left
  right: right
)

pathSum = (root, sum) ->
  recurse = (root, target, currSum, currPath, output) ->
    return if root is null

    if root.left is null and root.right is null
      if currSum + root.val is target
        output.push([currPath..., root.val])

      return

    recurse(root.left, target, currSum + root.val, [currPath..., root.val], output)
    recurse(root.right, target, currSum + root.val, [currPath..., root.val], output)

  currPath = []
  output = []
  recurse(root, sum, 0, currPath, output)
  output

pathSum(TreeNode(5, TreeNode(4, TreeNode(11, TreeNode(7), TreeNode(2))),
  TreeNode(8, TreeNode(13), TreeNode(4, TreeNode(5), TreeNode(1)))), 22)
#        5
#       / \
#      4   8
#     /   / \
#    11  13  4
#  /  \    / \
# 7    2  5   1
#
#Return:
#
#[
#  [5,4,11,2],
#  [5,8,4,5]
#]
