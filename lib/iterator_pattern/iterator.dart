// FIRST VERSION, not correctly working

// class Node {
//   final int id;
//   final String name;

//   Node(this.name, this.id);

//   @override
//   String toString() => 'Node: $name, NodeId: $id';
// }

// abstract class GraphIterator{
//   Node get current;
//   bool moveNext();
// }

// abstract class Graph {
//   GraphIterator createDepthFirstIterator();
//   GraphIterator createBreadthFirstIterator();
// }

// class MyGraph implements Graph {
//   List<Node> getNodeRequest(String type) {
//     return List<Node>.generate(10, (index) => Node('Node$index type: $type', index));
//   }

//   @override
//   GraphIterator createBreadthFirstIterator() {
//     return MyGraphIterator(this, 'Breadth-first');
//   }

//   @override
//   GraphIterator createDepthFirstIterator() {
//     return MyGraphIterator(this, 'Depth-first');
//   }
// }

// class MyGraphIterator implements GraphIterator {
//   final MyGraph _myGraph;
//   final String _nodeType;
//   List<Node>? _nodes;
//   var _index = 0;

//   MyGraphIterator(
//     this._myGraph,
//     this._nodeType,
//   );

//   @override
//   Node get current {
//     _nodes ??= _myGraph.getNodeRequest(_nodeType);
//     return _nodes![_index++];
//   }

//   @override
//   bool moveNext() => _nodes != null && _index < _nodes!.length+1;
// }

// class IterationTester {
//   static void getNodes(GraphIterator graphIterator) {
//     while (graphIterator.moveNext()) {
//       print(graphIterator.current);
//     }
//   }
// }

import 'dart:collection';

class Graph {
  final Map<int, Set<int>> adjacencyList = <int, Set<int>>{};

  void addEdge(int source, int target) {
    if (adjacencyList.containsKey(source)) {
      adjacencyList[source]!.add(target);
    } else {
      adjacencyList[source] = {target};
    }
  }
}

abstract class TreeIterator {
  bool hasNext();
  int? getNext();
  void reset();
}

class DepthFirstIterator implements TreeIterator {
  final DepthFirstTreeCollection treeCollection;
  final Set<int> visitedNodes = <int>{};
  final ListQueue<int> nodeStack = ListQueue<int>();

  final int _initialNode = 1;
  late int _currentNode;

  DepthFirstIterator(this.treeCollection) {
    _currentNode = _initialNode;
    nodeStack.add(_initialNode);
  }

  Map<int, Set<int>> get adjacencyList => treeCollection.graph.adjacencyList;

  @override
  int? getNext() {
    if (!hasNext()) {
      return null;
    }

    _currentNode = nodeStack.removeLast();
    visitedNodes.add(_currentNode);

    if (adjacencyList.containsKey(_currentNode)) {
      for (var node in adjacencyList[_currentNode]!.where(
        (element) => !visitedNodes.contains(element),
      )) {
        nodeStack.addLast(node);
      }
    }

    return _currentNode;
  }

  @override
  bool hasNext() {
    return nodeStack.isNotEmpty;
  }

  @override
  void reset() {
    _currentNode = _initialNode;
    visitedNodes.clear();
    nodeStack.clear();
    nodeStack.add(_initialNode);
  }
}

class BreadthFirstIterator implements TreeIterator {
  final BreadthFirstCollection treeCollection;
  final Set<int> visitedNodes = <int>{};
  final ListQueue<int> nodeQueue = ListQueue<int>();

  final int _initialNode = 1;
  late int _currentNode;

  BreadthFirstIterator(this.treeCollection) {
    _currentNode = _initialNode;
    nodeQueue.add(_initialNode);
  }

  Map<int, Set<int>> get adjacencyList => treeCollection.graph.adjacencyList;

  @override
  int? getNext() {
    if (!hasNext()) {
      return null;
    }

    _currentNode = nodeQueue.removeFirst();
    visitedNodes.add(_currentNode);

    if (adjacencyList.containsKey(_currentNode)) {
      for (var node in adjacencyList[_currentNode]!.where(
        (element) => !visitedNodes.contains(element),
      )) {
        nodeQueue.addLast(node);
      }
    }

    return _currentNode;
  }

  @override
  bool hasNext() {
    return nodeQueue.isNotEmpty;
  }

  @override
  void reset() {
    _currentNode = _initialNode;
    visitedNodes.clear();
    nodeQueue.clear();
    nodeQueue.add(_initialNode);
  }
}

abstract class TreeCollection {
  TreeIterator createIterator();
  String getName();
}

class DepthFirstTreeCollection implements TreeCollection {
  final Graph graph;

  DepthFirstTreeCollection(this.graph);

  @override
  TreeIterator createIterator() => DepthFirstIterator(this);

  @override
  String getName() {
    return 'Depth-first';
  }
}

class BreadthFirstCollection implements TreeCollection {
  final Graph graph;

  BreadthFirstCollection(this.graph);

  @override
  TreeIterator createIterator() => BreadthFirstIterator(this);

  @override
  String getName() {
    return 'Breadth-first';
  }
}

class IteratorApp {
  final List<TreeCollection> treeCollection = [];

  int _selectedTreeCollectionIndex = 0;
  int _currentNodeIndex = 0;
  bool _isTraveling = false;
  void nodesIteration() {
    var graph = _buildGraph();
    treeCollection.add(DepthFirstTreeCollection(graph));
    treeCollection.add(BreadthFirstCollection(graph));

    print('Depth-first graph iteration:');
    _travelTroughTree();

    _resetTree();
    _setSelectedTreeCollection(1);

    print('\r\nBreadth-first graph iteration:');
    _travelTroughTree();
  }

  Graph _buildGraph() {
    var graph = Graph();

    graph.addEdge(1, 2);
    graph.addEdge(1, 3);
    graph.addEdge(1, 4);
    graph.addEdge(2, 5);
    graph.addEdge(2, 6);
    graph.addEdge(3, 7);
    graph.addEdge(3, 8);
    graph.addEdge(4, 9);
    graph.addEdge(4, 10);

    return graph;
  }

  void _resetTree() {
    _currentNodeIndex = 0;
  }

  void _switchIsTraveling() {
    _isTraveling = !_isTraveling;
  }

  void _setSelectedTreeCollection(int index) {
    _selectedTreeCollectionIndex = index;
  }

  void _travelTroughTree() {
    _switchIsTraveling();

    var iterator =
        treeCollection[_selectedTreeCollectionIndex].createIterator();

    while (iterator.hasNext()) {
      _currentNodeIndex = iterator.getNext()!;
      getData(_currentNodeIndex);
    }

    _switchIsTraveling();
  }

  void getData(int index) {
    print('Node index: $index');
  }
}
