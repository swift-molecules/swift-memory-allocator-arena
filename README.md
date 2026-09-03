# Memory Allocator Arena

The concrete bump-allocation policy `Memory.Allocator.Arena`.

This molecule composes the atom-level `Memory.Allocator` namespace and protocol
with an arena policy. It intentionally does not depend on `Memory.Allocation`.
