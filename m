Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FB710E6C7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 07:00:06 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  9 Oct 2022 23:59:18 -0700
Message-Id: <20221010065929.32110-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 00/11] vm_bind: Add VM_BIND validation
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

Add sanity tests to validate the VM_BIND, VM_UNBIND and execbuf3 ioctls.

Add basic test to create and VM_BIND the objects and issue execbuf3 for
GPU to copy the data from a source to destination buffer.

TODOs:
* More validation support.
* Port some relevant gem_exec_* tests for execbuf3.

NOTEs:
* It is based on below VM_BIND design+uapi rfc.
  Documentation/gpu/rfc/i915_vm_bind.rst

* The i915 VM_BIND support is posted as,
  [PATCH v3 00/17] drm/i915/vm_bind: Add VM_BIND functionality

v2: Address various review comments
v3: Add gem_exec3_basic and gem_exec3_balancer tests,
    add gem_lmem_swapping@vm_bind subtest and some fixes.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (9):
  lib/vm_bind: import uapi definitions
  lib/vm_bind: Add vm_bind/unbind and execbuf3 ioctls
  lib/vm_bind: Add vm_bind mode support for VM
  lib/vm_bind: Add support for VM private objects
  lib/vm_bind: Add prime_handle_to_fd_no_assert()
  tests/i915/vm_bind: Add vm_bind sanity test
  tests/i915/vm_bind: Add basic VM_BIND test support
  tests/i915/vm_bind: Add userptr subtest
  tests/i915/vm_bind: Add gem_exec3_basic test

Vishwanathapura, Niranjana (2):
  tests/i915/vm_bind: Add gem_exec3_balancer test
  tests/i915/vm_bind: Add gem_lmem_swapping@vm_bind sub test

 lib/i915/gem_context.c                |  24 +
 lib/i915/gem_context.h                |   3 +
 lib/i915/gem_vm.c                     |  31 +-
 lib/i915/gem_vm.h                     |   3 +-
 lib/i915/i915_drm_local.h             | 308 +++++++++++++
 lib/i915/intel_memory_region.c        |  48 +-
 lib/i915/intel_memory_region.h        |  25 ++
 lib/intel_chipset.h                   |   2 +
 lib/ioctl_wrappers.c                  | 117 ++++-
 lib/ioctl_wrappers.h                  |   7 +
 tests/i915/gem_exec3_balancer.c       | 500 +++++++++++++++++++++
 tests/i915/gem_exec3_basic.c          | 160 +++++++
 tests/i915/gem_lmem_swapping.c        | 153 ++++++-
 tests/i915/i915_vm_bind_basic.c       | 606 ++++++++++++++++++++++++++
 tests/i915/i915_vm_bind_sanity.c      | 275 ++++++++++++
 tests/intel-ci/fast-feedback.testlist |   3 +
 tests/meson.build                     |  10 +
 tests/prime_mmap.c                    |  26 +-
 18 files changed, 2261 insertions(+), 40 deletions(-)
 create mode 100644 tests/i915/gem_exec3_balancer.c
 create mode 100644 tests/i915/gem_exec3_basic.c
 create mode 100644 tests/i915/i915_vm_bind_basic.c
 create mode 100644 tests/i915/i915_vm_bind_sanity.c

-- 
2.21.0.rc0.32.g243a4c7e27
