Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6270112A84
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Jul 2022 23:06:11 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Jul 2022 16:05:41 -0700
Message-Id: <20220701230546.8348-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC i-g-t 0/5] vm_bind: Add VM_BIND validation support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com
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
* It is based on below VM_BIND design+uapi patch series.
  https://lists.freedesktop.org/archives/intel-gfx/2022-July/300760.html

* The i915 VM_BIND support is posted as,
  [RFC 00/10] drm/i915/vm_bind: Add VM_BIND functionality

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Adam Miszczak (1):
  lib/vm_bind: Add interface to support VM_BIND

Niranjana Vishwanathapura (4):
  vm_bind: import uapi definitions
  tests/i915/vm_bind: Add vm_bind sanity test
  tests/i915/vm_bind: Add basic VM_BIND test support
  tests/i915/vm_bind: Add userptr subtest

 include/drm-uapi/i915_drm.h      | 288 ++++++++++++++-
 lib/i915/gem_context.c           |  24 ++
 lib/i915/gem_context.h           |   3 +
 lib/i915/gem_vm.c                |  31 +-
 lib/i915/gem_vm.h                |   3 +-
 lib/i915/intel_memory_region.c   |  14 +-
 lib/i915/intel_memory_region.h   |  21 +-
 lib/intel_chipset.h              |   2 +
 lib/ioctl_wrappers.c             | 117 ++++++-
 lib/ioctl_wrappers.h             |   7 +
 tests/i915/gem_eio.c             |   2 +-
 tests/i915/gem_lmem_swapping.c   |   2 +-
 tests/i915/i915_pm_rpm.c         |   6 +-
 tests/i915/i915_query.c          |   2 +-
 tests/i915/i915_vm_bind_basic.c  | 585 +++++++++++++++++++++++++++++++
 tests/i915/i915_vm_bind_sanity.c | 247 +++++++++++++
 tests/meson.build                |   2 +
 tests/prime_mmap.c               |  26 +-
 18 files changed, 1330 insertions(+), 52 deletions(-)
 create mode 100644 tests/i915/i915_vm_bind_basic.c
 create mode 100644 tests/i915/i915_vm_bind_sanity.c

-- 
2.21.0.rc0.32.g243a4c7e27
