Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1A010E26C
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Oct 2022 06:59:45 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 24 Oct 2022 23:59:29 -0700
Message-Id: <20221025065941.13397-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 00/12] vm_bind: Add VM_BIND validation
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
  [PATCH v5 00/19] drm/i915/vm_bind: Add VM_BIND functionality

v2: Address various review comments
v3: Add gem_exec3_basic and gem_exec3_balancer tests,
    add gem_lmem_swapping@vm_bind subtest and some fixes.
v4: Add and use i915_vm_bind library functions,
    add lmem test if lmem region is present instead of skipping,
    remove helpers to create vm_private objects, instead use
    gem_create_ext() function.
v5: Use memory region's gtt_alignment, use non-recoverable faults,
    fix review comments.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (12):
  include/drm-uapi: memory region gtt_alignment support
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

 include/drm-uapi/i915_drm.h           |  30 +-
 lib/i915/gem_context.c                |  24 +
 lib/i915/gem_context.h                |   3 +
 lib/i915/gem_vm.c                     |  31 +-
 lib/i915/gem_vm.h                     |   3 +-
 lib/i915/i915_drm_local.h             | 298 +++++++++++++
 lib/i915/i915_vm_bind.c               |  61 +++
 lib/i915/i915_vm_bind.h               |  16 +
 lib/i915/intel_memory_region.c        |   1 +
 lib/i915/intel_memory_region.h        |   1 +
 lib/ioctl_wrappers.c                  | 117 ++++-
 lib/ioctl_wrappers.h                  |   7 +
 lib/meson.build                       |   1 +
 tests/i915/gem_exec3_balancer.c       | 466 ++++++++++++++++++++
 tests/i915/gem_exec3_basic.c          | 139 ++++++
 tests/i915/gem_lmem_swapping.c        | 134 +++++-
 tests/i915/gem_pwrite.c               |  16 +-
 tests/i915/i915_vm_bind_basic.c       | 602 ++++++++++++++++++++++++++
 tests/i915/i915_vm_bind_sanity.c      | 306 +++++++++++++
 tests/intel-ci/fast-feedback.testlist |   3 +
 tests/meson.build                     |  10 +
 tests/prime_mmap.c                    |  26 +-
 22 files changed, 2243 insertions(+), 52 deletions(-)
 create mode 100644 lib/i915/i915_vm_bind.c
 create mode 100644 lib/i915/i915_vm_bind.h
 create mode 100644 tests/i915/gem_exec3_balancer.c
 create mode 100644 tests/i915/gem_exec3_basic.c
 create mode 100644 tests/i915/i915_vm_bind_basic.c
 create mode 100644 tests/i915/i915_vm_bind_sanity.c

-- 
2.21.0.rc0.32.g243a4c7e27
