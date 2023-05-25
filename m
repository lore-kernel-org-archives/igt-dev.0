Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEEF10E0E6
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 19:03:11 +0000 (UTC)
Date: Thu, 25 May 2023 21:02:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230525190248.55qawr5qqgefiqbf@kamilkon-desk1>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
 <20230525090535.2791739-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230525090535.2791739-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 03/11] tests: better document the
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

On 2023-05-25 at 11:05:27 +0200, Mauro Carvalho Chehab wrote:
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
>  tests/debugfs_test.c         | 23 +++++++++++++++++++---
>  tests/device_reset.c         |  8 +++++++-
>  tests/dumb_buffer.c          |  4 ++++
>  tests/prime_busy.c           |  4 ++++
>  tests/prime_mmap.c           |  4 ++++
>  tests/prime_mmap_coherency.c |  4 ++++
>  tests/prime_self_import.c    |  4 ++++
>  tests/prime_vgem.c           | 37 +++++++++++++++++++++++++++++++-----
>  tests/sw_sync.c              |  4 ++++
>  tests/syncobj_basic.c        |  4 ++++
>  tests/syncobj_timeline.c     |  4 ++++
>  tests/syncobj_wait.c         |  4 ++++
>  tests/vgem_basic.c           | 14 ++++++++++++++
>  tests/vgem_slow.c            |  4 ++++
>  14 files changed, 113 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
> index 39b001671bcc..5ee615abaf6d 100644
> --- a/tests/debugfs_test.c
> +++ b/tests/debugfs_test.c
> @@ -35,12 +35,23 @@
>   * Feature: core
>   *
>   * SUBTEST: basic-hwmon
> - * Description: Read all entries from hwmon path
> + * Category: Infrastructure
> + * Description:
> + *   Read all entries from hwmon path
> + *   validating debugfs entries
> + * Functionality: debugfs entries
>   * Run type: BAT
> + * Test category: GEM_Legacy
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
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: read_all_entries_display_off
>   * Description: Read all debugfs entries with display on/off.
> @@ -51,8 +62,14 @@
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
> + * Test category: GEM_Legacy
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
> index 27b3744014bb..85b9cf880331 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -35,14 +35,22 @@
>   * Description: Basic check of polling for prime/vgem fences.
>   *
>   * SUBTEST: basic-blt
> + * Category: Infrastructure
>   * Description: Examine blitter access path.
>   * Feature: prime
> + * Functionality: mock device
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-fence-blt
> + * Category: Infrastructure
>   * Description: Examine blitter access path fencing.
>   * Feature: prime
> + * Functionality: mock device
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-fence-flip
>   * Description: Examine vgem bo front/back flip fencing.
> @@ -69,25 +77,28 @@
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
>   * Run type: BAT
>   *
>   * SUBTEST: busy
> + * Category: Infrastructure
>   * Description: Examine busy check of polling for vgem fence.
>   * Feature: prime
> + * Functionality: mock device
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: coherency-blt
> + * Category: Infrastructure
>   * Description: Examine blitter access path WC coherency.
>   * Feature: prime
> + * Functionality: mock device
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: coherency-gtt
>   * Description: Examine concurrent access of vgem bo.
> @@ -105,9 +116,13 @@
>   * Run type: FULL
>   *
>   * SUBTEST: fence-wait
> + * Category: Infrastructure
>   * Description: Examine basic dma-buf fence interop.
>   * Feature: prime, synchronization
> + * Functionality: mock device
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: fence-write-hang
>   * Description: Examine write access path fencing with a pending gpu hang.
> @@ -115,19 +130,31 @@
>   * Run type: FULL
>   *
>   * SUBTEST: shrink
> + * Category: Infrastructure
>   * Description: Examine link establishment between shrinker and vgem bo.
>   * Feature: prime
> + * Functionality: mock device
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sync
> + * Category: Infrastructure
>   * Description: Examine sync on vgem fence.
>   * Feature: prime
> + * Functionality: mock device
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait
> + * Category: Infrastructure
>   * Description: Examine wait on vgem fence.
>   * Feature: prime
> + * Functionality: mock device
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic check of polling for prime/vgem fences.");
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

