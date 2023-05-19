Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5BC10E4E3
 for <igt-dev@lists.freedesktop.org>; Fri, 19 May 2023 15:43:07 +0000 (UTC)
Date: Fri, 19 May 2023 17:43:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230519154303.625slc2o372hrmu6@kamilkon-desk1>
References: <20230517151110.1710407-1-mauro.chehab@linux.intel.com>
 <20230517151110.1710407-3-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230517151110.1710407-3-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] tests: better document the
 remaining core used by i915 validation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-05-17 at 17:11:06 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Merge data from some ancillary internal documentation to improve
> test descriptions for the remaining core tests used during i915
> validation.
> 
> This patch was auto-generated via script.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/debugfs_test.c         | 15 +++++++++++++--
>  tests/device_reset.c         |  8 +++++++-
>  tests/dmabuf.c               |  2 +-
>  tests/dumb_buffer.c          |  4 ++++
>  tests/prime_busy.c           |  4 ++++
>  tests/prime_mmap.c           |  4 ++++
>  tests/prime_mmap_coherency.c |  4 ++++
>  tests/prime_self_import.c    |  4 ++++
>  tests/prime_vgem.c           |  9 ++++-----
>  tests/sw_sync.c              |  4 ++++
>  tests/syncobj_basic.c        |  4 ++++
>  tests/syncobj_timeline.c     |  4 ++++
>  tests/syncobj_wait.c         |  4 ++++
>  tests/vgem_basic.c           | 14 ++++++++++++++
>  tests/vgem_slow.c            |  4 ++++
>  15 files changed, 79 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
> index 39b001671bcc..d6439e139790 100644
> --- a/tests/debugfs_test.c
> +++ b/tests/debugfs_test.c
> @@ -33,14 +33,20 @@
>   * TEST: debugfs test
>   * Description: Read entries from debugfs, hwmon and sysfs paths.
>   * Feature: core
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-hwmon
>   * Description: Read all entries from hwmon path
>   * Run type: BAT
>   *
>   * SUBTEST: read_all_entries
> - * Description: Read all entries from debugfs path.
> + * Category: Infrastructure
> + * Description:
> + *   Read all entries from debugfs path.
> + *   validating debugfs entries
> + * Functionality: debugfs entries
>   * Run type: BAT
> + * Sub-category: i915
>   *
>   * SUBTEST: read_all_entries_display_off
>   * Description: Read all debugfs entries with display on/off.
> @@ -51,8 +57,13 @@
>   * Run type: FULL
>   *
>   * SUBTEST: sysfs
> - * Description: Read all entries from sysfs path.
> + * Category: Infrastructure
> + * Description:
> + *   Read all entries from sysfs path.
> + *   validating debugfs entries
> + * Functionality: debugfs entries
>   * Run type: FULL
> + * Sub-category: i915
>   */
>  
>  IGT_TEST_DESCRIPTION("Read entries from debugfs, hwmon and sysfs paths.");
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 0c23aecff595..9ebd479dfefa 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -32,8 +32,14 @@
>   * Feature: reset
>   *
>   * SUBTEST: unbind-reset-rebind
> - * Description: Unbinds driver from device, initiates reset then rebinds driver to device
> + * Category: Server
> + * Description:
> + *   Unbinds driver from device, initiates reset then rebinds driver to device
> + *   validating device resets
>   * Feature: reset, sriov-reset
> + * Functionality: reset
> + * Sub-category: sysman
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Examine behavior of a driver on device sysfs reset");
> diff --git a/tests/dmabuf.c b/tests/dmabuf.c
> index 4bc9b35b619d..acd3080cf3d3 100644
> --- a/tests/dmabuf.c
> +++ b/tests/dmabuf.c
> @@ -27,9 +27,9 @@
>   * TEST: dmabuf
>   * Description: Kernel selftests for the dmabuf API
>   * Feature: mapping, prime
> - * Run type: BAT
>   *
>   * SUBTEST: all-tests
> + * Run type: BAT
>   */
>  
>  IGT_TEST_DESCRIPTION("Kernel selftests for the dmabuf API");
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index 0c7ce714eb6c..9495d28ff724 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -51,9 +51,13 @@
>  #include "ioctl_wrappers.h"
>  /**
>   * TEST: dumb buffer
> + * Category: Desktop client
>   * Description: This is a test for the generic dumb buffer interface.
>   * Feature: prime
> + * Functionality: IOCTL check for buffer management
>   * Run type: FULL
> + * Sub-category: Compositor
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-clear
>   *
> diff --git a/tests/prime_busy.c b/tests/prime_busy.c
> index 4f7dba7d0e3c..6b0d7310b806 100644
> --- a/tests/prime_busy.c
> +++ b/tests/prime_busy.c
> @@ -28,9 +28,13 @@
>  #include "igt.h"
>  /**
>   * TEST: prime busy
> + * Category: Infrastructure
>   * Description: Basic check of polling for prime fences.
>   * Feature: prime
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: after
>   *
> diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
> index 8ffe37fe199f..efd4deff921e 100644
> --- a/tests/prime_mmap.c
> +++ b/tests/prime_mmap.c
> @@ -52,8 +52,12 @@
>  #include "i915/intel_memory_region.h"
>  /**
>   * TEST: prime mmap
> + * Category: Infrastructure
>   * Feature: prime
> + * Functionality: memory management
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: test_aperture_limit
>   *
> diff --git a/tests/prime_mmap_coherency.c b/tests/prime_mmap_coherency.c
> index e50f52fdfdb0..e5f7c92b2324 100644
> --- a/tests/prime_mmap_coherency.c
> +++ b/tests/prime_mmap_coherency.c
> @@ -33,11 +33,15 @@
>  #include "igt.h"
>  /**
>   * TEST: prime mmap coherency
> + * Category: Infrastructure
>   * Description:
>   *   Test dma-buf mmap on !llc platforms mostly and provoke coherency bugs so we know for sure where
>   *   we need the sync ioctls.
>   * Feature: prime
> + * Functionality: memory management
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: ioctl-errors
>   *
> diff --git a/tests/prime_self_import.c b/tests/prime_self_import.c
> index 7d423b8cd442..30f2bf013cb5 100644
> --- a/tests/prime_self_import.c
> +++ b/tests/prime_self_import.c
> @@ -47,8 +47,12 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: prime self import
> + * Category: Infrastructure
>   * Description: Check whether prime import/export works on the same device... but with different fds.
>   * Feature: prime
> + * Functionality: buffer management
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-llseek-bad
>   * Description: Check dmabuf llseek support with invalid values.
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 27b3744014bb..827d9b1d496c 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -32,7 +32,11 @@
>  #include "intel_batchbuffer.h"	/* igt_blitter_src_copy() */
>  /**
>   * TEST: prime vgem
> + * Category: Infrastructure
>   * Description: Basic check of polling for prime/vgem fences.
> + * Functionality: mock device
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-blt
>   * Description: Examine blitter access path.
> @@ -69,11 +73,6 @@
>   * Feature: gtt, prime
>   * Run type: BAT
>   *
> - * SUBTEST: basic-userptr
> - * Description: Check that we wrap the vgem mmap with userptr.
> - * Feature: prime
> - * Run type: BAT
> - *
>   * SUBTEST: basic-write
>   * Description: Examine write access path.
>   * Feature: gtt, prime
> diff --git a/tests/sw_sync.c b/tests/sw_sync.c
> index e626cd14cd28..6c476ff46776 100644
> --- a/tests/sw_sync.c
> +++ b/tests/sw_sync.c
> @@ -40,9 +40,13 @@
>  
>  /**
>   * TEST: sw sync
> + * Category: Infrastructure
>   * Description: Test SW Sync Framework
>   * Feature: synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: alloc_fence
>   *
> diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
> index 8d98137e7bd6..3252dbd693fb 100644
> --- a/tests/syncobj_basic.c
> +++ b/tests/syncobj_basic.c
> @@ -28,9 +28,13 @@
>  #include "drm.h"
>  /**
>   * TEST: syncobj basic
> + * Category: Infrastructure
>   * Description: Basic check for drm sync objects.
>   * Feature: synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: bad-create-flags
>   *
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index 1158a99fe58f..134a6099512e 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -32,9 +32,13 @@
>  #include "drm.h"
>  /**
>   * TEST: syncobj timeline
> + * Category: Infrastructure
>   * Description: Tests for the drm timeline sync object API
>   * Feature: synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: 32bits-limit
>   * Description:
> diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
> index 930096f6d10e..2583ef72eb1d 100644
> --- a/tests/syncobj_wait.c
> +++ b/tests/syncobj_wait.c
> @@ -32,9 +32,13 @@
>  #include "drm.h"
>  /**
>   * TEST: syncobj wait
> + * Category: Infrastructure
>   * Description: Tests for the drm sync object wait API
>   * Feature: synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-multi-wait-all-unsubmitted
>   *
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index 2a5f6242e995..f2255a61902d 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -33,7 +33,10 @@
>  #include <dirent.h>
>  /**
>   * TEST: vgem basic
> + * Category: Infrastructure
>   * Description: Basic sanity check of Virtual GEM module (vGEM).
> + * Functionality: mock device
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: bad-fence
>   * Description: Make sure a non-existent fence cannot be signaled.
> @@ -64,56 +67,67 @@
>   * Description: Check the basic working of vgem_create ioctl.
>   * Feature: vgem
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: debugfs
>   * Description: Check the basic access to debugfs and also try to read entries in the directory.
>   * Feature: vgem
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: dmabuf-export
>   * Description: Check whether it can export/import the vgem handle using prime.
>   * Feature: prime, vgem
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: dmabuf-fence
>   * Description: Check the working of dma-buf fence interop.
>   * Feature: prime, vgem
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: dmabuf-fence-before
>   * Description: Attach a fence before exporting a vgem handle and check the working of fence.
>   * Feature: prime, vgem
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: dmabuf-mmap
>   * Description: Export the vgem handle along with RDWR capabilities using prime and check if it can be mmaped.
>   * Feature: prime, vgem
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: mmap
>   * Description: Create a vgem handle and check if it can be mmaped.
>   * Feature: vgem
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: second-client
>   * Description: Check whether it can open multiple clients.
>   * Feature: vgem
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: setversion
>   * Description: Check the working of SET_VERSION ioctl.
>   * Feature: vgem
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: sysfs
>   * Description: Check the basic access to sysfs and also try to read entries in the directory.
>   * Feature: vgem
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: unload
>   * Description: Basic test for handling of module unload.
>   * Feature: vgem
>   * Run type: BAT
> + * Sub-category: DRM
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of Virtual GEM module (vGEM).");
> diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
> index d2a7effff115..0c91cdb9dece 100644
> --- a/tests/vgem_slow.c
> +++ b/tests/vgem_slow.c
> @@ -32,9 +32,13 @@
>  #include <dirent.h>
>  /**
>   * TEST: vgem slow
> + * Category: Infrastructure
>   * Description: Extended sanity check of Virtual GEM module (vGEM).
>   * Feature: vgem
> + * Functionality: mock device
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: nohang
>   */
> -- 
> 2.40.1
> 

