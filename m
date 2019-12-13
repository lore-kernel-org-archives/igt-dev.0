Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850876EDE4
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 22:05:42 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date: Fri, 13 Dec 2019 13:54:22 -0800
Message-Id: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 0/7] tests/i915/svm: Shared Virtual Memory
 (SVM) test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, sanjay.k.kumar@intel.com, jason.ekstrand@intel.com, dave.hansen@intel.com, jglisse@redhat.com, jon.bloomfield@intel.com, daniel.vetter@intel.com, dan.j.williams@intel.com, ira.weiny@intel.com, jgg@mellanox.com
List-ID: <igt-dev@lists.freedesktop.org>

Shared Virtual Memory (SVM) allows the programmer to use a single virtual
address space which will be shared between threads executing on CPUs and GPUs.
It abstracts away from the user the location of the backing memory, and hence
simplifies the user programming model.
SVM supports two types of virtual memory allocation methods.
Runtime allocator requires a driver to provide memory allocation and
management interface like buffer object (BO) interface.
Whereas system allocator makes use of default OS memory allocation and
management support (like malloc()).

This patch series validates both SVM system and runtime allocator support.

The patch series adds driver interface and some test cases.
It tests for
 - Binding an address range or a BO in device page table
 - Migrating of pages to and from device memory
 - GPU access to memory through shared virtual address space
 - Implicit migration back to host memory upon CPU access
 - SVM capability and configurability on per vm basis
 - Large mappings
 - Both CPU copy and blitter copy of pages
 - Multiple context/vm support
 - Proper unbinding when the buffer is freed
 - Different allocation methods
 - Stress test
 - etc.

Niranjana (1):
  drm-uapi: Import SVM UAPI

Niranjana Vishwanathapura (6):
  lib: Add interface to support SVM
  tests/i915/svm: Add basic SVM RT allocator test support
  tests/i915/svm: Add mmap support for SVM RT allocator
  tests/i915/svm: Add basic SVM SYS allocator test support
  tests/i915/svm: Add multiple process tests
  tests/i915/svm: Add stress test

 include/drm-uapi/i915_drm.h |  74 ++++
 lib/i915/gem_context.c      |  27 ++
 lib/i915/gem_context.h      |   2 +
 lib/i915/gem_vm.c           |  48 +++
 lib/i915/gem_vm.h           |   6 +
 lib/ioctl_wrappers.c        | 154 +++++++
 lib/ioctl_wrappers.h        |  14 +
 tests/Makefile.sources      |   3 +
 tests/i915/i915_svm_basic.c | 808 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 10 files changed, 1137 insertions(+)
 create mode 100644 tests/i915/i915_svm_basic.c

-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
