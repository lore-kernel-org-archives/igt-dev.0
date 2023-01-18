Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9787910E1E2
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 07:13:58 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 23:13:31 -0800
Message-Id: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 00/19] vm_bind: Add VM_BIND validation
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM
buffer objects (BOs) or sections of a BOs at specified GPU virtual
addresses on a specified address space (VM). Multiple mappings can map
to the same physical pages of an object (aliasing). These mappings (also
referred to as persistent mappings) will be persistent across multiple
GPU submissions (execbuf calls) issued by the UMD, without user having
to provide a list of all required mappings during each submission (as
required by older execbuf mode).

The new execbuf3 ioctl (I915_GEM_EXECBUFFER3) will only work in vm_bind
mode. The vm_bind mode only works with this new execbuf3 ioctl.

Add tests to validate the VM_BIND, VM_UNBIND and execbuf3 ioctls and
various scenarios involving persistent mappings.

TODOs:
* More validation support.
* Port some relevant gem_exec_* tests for execbuf3.

NOTEs:
* It is based on below VM_BIND design+uapi rfc.
  Documentation/gpu/rfc/i915_vm_bind.rst

* The i915 VM_BIND support is posted as,
  [PATCH v10 00/23] drm/i915/vm_bind: Add VM_BIND functionality

v2: Address various review comments
v3: Add gem_exec3_basic and gem_exec3_balancer tests,
    add gem_lmem_swapping@vm_bind subtest and some fixes.
v4: Add and use i915_vm_bind library functions,
    add lmem test if lmem region is present instead of skipping,
    remove helpers to create vm_private objects, instead use
    gem_create_ext() function.
v5: Use memory region's gtt_alignment, use non-recoverable faults,
    fix review comments.
v6: Rebased, add sanity tests for added reserved uapi fields,
    add gem_shrink@vm_bind* subtests.
v7: Pull in uapi changes and address review comments
v8: Rebased, add capture test
v9: Add exec3 support for igt_spin_factory, add userptr invalidation
    test, move common syncobj and capture functions to libraries
v10: Address feedback from v9 by adding documentation and checks

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (19):
  lib/i915: memory region gtt_alignment support
  lib/i915: Move common syncobj functions to library
  lib/vm_bind: import uapi definitions
  lib/vm_bind: Add vm_bind/unbind and execbuf3 ioctls
  lib/vm_bind: Add vm_bind mode support for VM
  lib/vm_bind: Add vm_bind specific library functions
  lib/vm_bind: Add __prime_handle_to_fd()
  tests/i915/vm_bind: Add vm_bind sanity test
  tests/i915/vm_bind: Add basic VM_BIND test support
  tests/i915/vm_bind: Add userptr subtest
  tests/i915/vm_bind: Add gem_exec3_basic test
  tests/i915/vm_bind: Add gem_exec3_balancer test
  tests/i915/vm_bind: Add gem_lmem_swapping@vm_bind sub test
  tests/i915/vm_bind: Add gem_shrink@vm_bind* subtests
  tests/i915/vm_bind: Add i915_error_decode library routines
  tests/i915/vm_bind: Test capture of persistent mappings
  lib/vm_bind: Add execbuf3 support to igt_spin_factory
  tests/i915/vm_bind: Use execbuf3 spinner
  tests/i915/vm_bind: Add userptr invalidation test

 lib/i915/gem_context.c                |  24 ++
 lib/i915/gem_context.h                |   3 +
 lib/i915/gem_vm.c                     |  31 +-
 lib/i915/gem_vm.h                     |   3 +-
 lib/i915/i915_drm_local.h             | 304 ++++++++++++++
 lib/i915/i915_error_decode.c          | 111 +++++
 lib/i915/i915_error_decode.h          |  14 +
 lib/i915/i915_vm_bind.c               |  62 +++
 lib/i915/i915_vm_bind.h               |  16 +
 lib/i915/intel_memory_region.c        |   6 +
 lib/i915/intel_memory_region.h        |   1 +
 lib/igt_dummyload.c                   | 245 ++++++++++-
 lib/igt_dummyload.h                   |   8 +
 lib/igt_syncobj.c                     |  21 +
 lib/igt_syncobj.h                     |   9 +
 lib/intel_chipset.h                   |   2 +
 lib/ioctl_wrappers.c                  | 117 +++++-
 lib/ioctl_wrappers.h                  |   7 +
 lib/meson.build                       |   2 +
 tests/i915/gem_exec3_balancer.c       | 449 ++++++++++++++++++++
 tests/i915/gem_exec3_basic.c          | 132 ++++++
 tests/i915/gem_exec_capture.c         |  90 +---
 tests/i915/gem_exec_fence.c           |  21 -
 tests/i915/gem_lmem_swapping.c        | 125 +++++-
 tests/i915/gem_pwrite.c               |  16 +-
 tests/i915/gem_shrink.c               |  63 ++-
 tests/i915/gem_userptr_blits.c        |  72 ++++
 tests/i915/i915_vm_bind_basic.c       | 583 ++++++++++++++++++++++++++
 tests/i915/i915_vm_bind_capture.c     | 358 ++++++++++++++++
 tests/i915/i915_vm_bind_sanity.c      | 335 +++++++++++++++
 tests/intel-ci/blacklist.txt          |   2 +-
 tests/intel-ci/fast-feedback.testlist |   3 +
 tests/meson.build                     |  11 +
 tests/prime_mmap.c                    |  26 +-
 tests/syncobj_timeline.c              |   8 -
 tests/syncobj_wait.c                  |   8 -
 tools/intel_error_decode.c            |  88 +---
 37 files changed, 3105 insertions(+), 271 deletions(-)
 create mode 100644 lib/i915/i915_error_decode.c
 create mode 100644 lib/i915/i915_error_decode.h
 create mode 100644 lib/i915/i915_vm_bind.c
 create mode 100644 lib/i915/i915_vm_bind.h
 create mode 100644 tests/i915/gem_exec3_balancer.c
 create mode 100644 tests/i915/gem_exec3_basic.c
 create mode 100644 tests/i915/i915_vm_bind_basic.c
 create mode 100644 tests/i915/i915_vm_bind_capture.c
 create mode 100644 tests/i915/i915_vm_bind_sanity.c

-- 
2.21.0.rc0.32.g243a4c7e27
