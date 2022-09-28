Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Wed, 28 Sep 2022 12:22:21 -0000
Message-ID: <166436774130.594.18429710768239778797@emeril.freedesktop.org>
References: <20220928062115.6412-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20220928062115.6412-1-niranjana.vishwanathapura@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB2bV9i?=
 =?utf-8?q?ind=3A_Add_VM=5FBIND_validation_support_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: vm_bind: Add VM_BIND validation support (rev5)
URL   : https://patchwork.freedesktop.org/series/105881/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
5f29c9369550164b35b65baaaeba4b370f434cf1 i915/gem_spin_batch: Typo fix

../../../usr/src/igt-gpu-tools/tests/i915/gem_mmap_offset.c:705:77: warning: passing argument 5 of ‘__gem_create_in_memory_region_list’ makes integer from pointer without a cast [-Wint-conversion]
  705 |   igt_assert_eq(__gem_create_in_memory_region_list(i915, &handle, &size, 0, &arg->region, 1), 0);
      |                                                                             ^~~~~~~~~~~~
      |                                                                             |
      |                                                                             struct drm_i915_gem_memory_class_instance *
../../../usr/src/igt-gpu-tools/lib/igt_core.h:729:15: note: in definition of macro ‘igt_assert_cmpint’
  729 |   int __n1 = (n1), __n2 = (n2); \
      |               ^~
../../../usr/src/igt-gpu-tools/tests/i915/gem_mmap_offset.c:705:3: note: in expansion of macro ‘igt_assert_eq’
  705 |   igt_assert_eq(__gem_create_in_memory_region_list(i915, &handle, &size, 0, &arg->region, 1), 0);
      |   ^~~~~~~~~~~~~
In file included from ../../../usr/src/igt-gpu-tools/tests/i915/gem_mmap_offset.c:38:
../../../usr/src/igt-gpu-tools/lib/i915/intel_memory_region.h:67:107: note: expected ‘uint32_t’ {aka ‘unsigned int’} but argument is of type ‘struct drm_i915_gem_memory_class_instance *’
   67 | int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags, uint32_t vm_id,
      |                                                                                                  ~~~~~~~~~^~~~~
In file included from ../../../usr/src/igt-gpu-tools/lib/drmtest.h:39,
                 from ../../../usr/src/igt-gpu-tools/lib/igt.h:27,
                 from ../../../usr/src/igt-gpu-tools/tests/i915/gem_mmap_offset.c:39:
../../../usr/src/igt-gpu-tools/tests/i915/gem_mmap_offset.c:705:91: warning: passing argument 6 of ‘__gem_create_in_memory_region_list’ makes pointer from integer without a cast [-Wint-conversion]
  705 |   igt_assert_eq(__gem_create_in_memory_region_list(i915, &handle, &size, 0, &arg->region, 1), 0);
      |                                                                                           ^
      |                                                                                           |
      |                                                                                           int
../../../usr/src/igt-gpu-tools/lib/igt_core.h:729:15: note: in definition of macro ‘igt_assert_cmpint’
  729 |   int __n1 = (n1), __n2 = (n2); \
      |               ^~
../../../usr/src/igt-gpu-tools/tests/i915/gem_mmap_offset.c:705:3: note: in expansion of macro ‘igt_assert_eq’
  705 |   igt_assert_eq(__gem_create_in_memory_region_list(i915, &handle, &size, 0, &arg->region, 1), 0);
      |   ^~~~~~~~~~~~~
In file included from ../../../usr/src/igt-gpu-tools/tests/i915/gem_mmap_offset.c:38:
../../../usr/src/igt-gpu-tools/lib/i915/intel_memory_region.h:68:61: note: expected ‘const struct drm_i915_gem_memory_class_instance *’ but argument is of type ‘int’
   68 |            const struct drm_i915_gem_memory_class_instance *mem_regions,
      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
In file included from ../../../usr/src/igt-gpu-tools/lib/drmtest.h:39,
                 from ../../../usr/src/igt-gpu-tools/lib/igt.h:27,
                 from ../../../usr/src/igt-gpu-tools/tests/i915/gem_mmap_offset.c:39:
../../../usr/src/igt-gpu-tools/tests/i915/gem_mmap_offset.c:705:17: error: too few arguments to function ‘__gem_create_in_memory_region_list’
  705 |   igt_assert_eq(__gem_create_in_memory_region_list(i915, &handle, &size, 0, &arg->region, 1), 0);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/lib/igt_core.h:729:15: note: in definition of macro ‘igt_assert_cmpint’
  729 |   int __n1 = (n1), __n2 = (n2); \
      |               ^~
../../../usr/src/igt-gpu-tools/tests/i915/gem_mmap_offset.c:705:3: note: in expansion of macro ‘igt_assert_eq’
  705 |   igt_assert_eq(__gem_create_in_memory_region_list(i915, &handle, &size, 0, &arg->region, 1), 0);
      |   ^~~~~~~~~~~~~
In file included from ../../../usr/src/igt-gpu-tools/tests/i915/gem_mmap_offset.c:38:
../../../usr/src/igt-gpu-tools/lib/i915/intel_memory_region.h:67:5: note: declared here
   67 | int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags, uint32_t vm_id,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.

