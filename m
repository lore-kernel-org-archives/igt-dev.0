Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E562310E359
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 18:41:38 +0000 (UTC)
Date: Tue, 16 May 2023 20:41:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230516184133.sxbp4743hrlf3m4n@kamilkon-desk1>
References: <20230509090738.1157939-1-mauro.chehab@linux.intel.com>
 <20230509090738.1157939-7-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230509090738.1157939-7-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 6/6] tests/i915: Enhance test
 documentation
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

Hi Mauro,

On 2023-05-09 at 11:07:38 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Merge data from some ancillary documentation to the i915
> test descriptions.
> 
> This patch was auto-generated via script.

Could it be splitted at least by some functionallity ?
It will ease somewhat review, for example: core_*, other in
tests/* , i195/gem_exec*, i915/gem_ctx*, i915/perf* and other
in i915/*

+cc Umesh for perf part

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/core_auth.c                        |   4 +
>  tests/core_getclient.c                   |   4 +
>  tests/core_getstats.c                    |   4 +
>  tests/core_getversion.c                  |   4 +
>  tests/core_hotunplug.c                   |  13 +-
>  tests/core_setmaster.c                   |   4 +
>  tests/core_setmaster_vs_auth.c           |   5 +
>  tests/debugfs_test.c                     |  17 ++-
>  tests/device_reset.c                     |   4 +
>  tests/dmabuf.c                           |   2 +-
>  tests/dumb_buffer.c                      |  19 +++
>  tests/i915/api_intel_allocator.c         |  38 ++++-
>  tests/i915/api_intel_bb.c                |  48 ++++++
>  tests/i915/gem_barrier_race.c            |   3 +
>  tests/i915/gem_basic.c                   |  15 +-
>  tests/i915/gem_blits.c                   |   4 +
>  tests/i915/gem_busy.c                    |   7 +
>  tests/i915/gem_caching.c                 |   8 +
>  tests/i915/gem_close.c                   |   4 +
>  tests/i915/gem_close_race.c              |   8 +
>  tests/i915/gem_create.c                  |  41 ++++-
>  tests/i915/gem_cs_tlb.c                  |   4 +
>  tests/i915/gem_ctx_bad_destroy.c         |   4 +
>  tests/i915/gem_ctx_create.c              |   8 +
>  tests/i915/gem_ctx_engines.c             |   9 ++
>  tests/i915/gem_ctx_exec.c                |  20 +++
>  tests/i915/gem_ctx_freq.c                |   4 +
>  tests/i915/gem_ctx_isolation.c           |  32 +++-
>  tests/i915/gem_ctx_param.c               |  58 +++++++
>  tests/i915/gem_ctx_persistence.c         |  85 +++++++++++
>  tests/i915/gem_ctx_shared.c              |  22 +++
>  tests/i915/gem_eio.c                     |  91 ++++++++++-
>  tests/i915/gem_exec_alignment.c          |   9 ++
>  tests/i915/gem_exec_async.c              |   4 +
>  tests/i915/gem_exec_await.c              |   7 +
>  tests/i915/gem_exec_balancer.c           | 101 +++++++++++++
>  tests/i915/gem_exec_basic.c              |   7 +-
>  tests/i915/gem_exec_big.c                |   4 +
>  tests/i915/gem_exec_capture.c            |  10 ++
>  tests/i915/gem_exec_create.c             |  20 ++-
>  tests/i915/gem_exec_endless.c            |   4 +
>  tests/i915/gem_exec_fence.c              | 143 +++++++++++++++++-
>  tests/i915/gem_exec_gttfill.c            |  14 +-
>  tests/i915/gem_exec_nop.c                |   8 +
>  tests/i915/gem_exec_parallel.c           |  20 ++-
>  tests/i915/gem_exec_params.c             |  76 ++++++++++
>  tests/i915/gem_exec_schedule.c           | 154 +++++++++++++++++++
>  tests/i915/gem_exec_store.c              |  14 +-
>  tests/i915/gem_exec_whisper.c            |  67 +++++++++
>  tests/i915/gem_exercise_blt.c            |   7 +-
>  tests/i915/gem_flink_basic.c             |  22 ++-
>  tests/i915/gem_flink_race.c              |   7 +
>  tests/i915/gem_gpgpu_fill.c              |   4 +
>  tests/i915/gem_linear_blits.c            |   8 +
>  tests/i915/gem_lmem_evict.c              |   1 +
>  tests/i915/gem_lmem_swapping.c           |  34 ++++-
>  tests/i915/gem_madvise.c                 |   6 +
>  tests/i915/gem_mmap_offset.c             |  40 +++++
>  tests/i915/gem_pipe_control_store_loop.c |   5 +
>  tests/i915/gem_ppgtt.c                   |   8 +
>  tests/i915/gem_request_retire.c          |   4 +
>  tests/i915/gem_ringfill.c                |  16 +-
>  tests/i915/gem_shrink.c                  |   4 +
>  tests/i915/gem_softpin.c                 |  96 +++++++++++-
>  tests/i915/gem_spin_batch.c              |  26 ++++
>  tests/i915/gem_sync.c                    |  28 +++-
>  tests/i915/gem_unref_active_buffers.c    |   4 +
>  tests/i915/gem_userptr_blits.c           |  76 ++++++++++
>  tests/i915/gem_vm_create.c               |  20 +++
>  tests/i915/gem_wait.c                    |  22 +++
>  tests/i915/gem_workarounds.c             |  37 ++++-
>  tests/i915/i915_getparams_basic.c        |   7 +
>  tests/i915/i915_hangman.c                |  56 ++++++-
>  tests/i915/i915_hwmon.c                  |   1 +
>  tests/i915/i915_module_load.c            |  12 +-
>  tests/i915/i915_pciid.c                  |   5 +
>  tests/i915/i915_pm_rpm.c                 |   7 +-
>  tests/i915/i915_pm_rps.c                 |  12 +-
>  tests/i915/i915_power.c                  |   3 +
>  tests/i915/i915_query.c                  |  36 ++++-
>  tests/i915/i915_suspend.c                |  34 ++++-
>  tests/i915/perf.c                        | 184 +++++++++++++++++++----
>  tests/i915/perf_pmu.c                    | 180 +++++++++++++++++-----
>  tests/i915/sysfs_defaults.c              |   5 +
>  tests/i915/sysfs_heartbeat_interval.c    |   6 +
>  tests/i915/sysfs_preempt_timeout.c       |   5 +
>  tests/i915/sysfs_timeslice_duration.c    |   9 ++
>  tests/prime_busy.c                       |   9 ++
>  tests/prime_mmap.c                       |   4 +
>  tests/prime_mmap_coherency.c             |   6 +
>  tests/prime_self_import.c                |  15 +-
>  tests/prime_vgem.c                       |  11 ++
>  tests/sw_sync.c                          |   4 +
>  tests/syncobj_basic.c                    |   4 +
>  tests/syncobj_timeline.c                 |   4 +
>  tests/syncobj_wait.c                     | 140 +++++++++++++++++
>  tests/vgem_basic.c                       |  37 ++++-
>  tests/vgem_slow.c                        |   5 +
>  98 files changed, 2407 insertions(+), 124 deletions(-)
> 
> diff --git a/tests/core_auth.c b/tests/core_auth.c
> index ee7fbaabfa92..ed736e1ae39f 100644
> --- a/tests/core_auth.c
> +++ b/tests/core_auth.c
> @@ -44,8 +44,12 @@
>  #include "drm.h"
>  /**
>   * TEST: core auth
--------------- ^
Missing '_' in patch 5/6.

> + * Category: Desktop client
>   * Description: Call drmGetMagic() and drmAuthMagic() and see if it behaves.
>   * Feature: core
> + * Functionality: permission management for clients
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-auth
>   * Description: Test magic numbers for master and slave.
> diff --git a/tests/core_getclient.c b/tests/core_getclient.c
> index 1ab56e9f304c..993801ead5a0 100644
> --- a/tests/core_getclient.c
> +++ b/tests/core_getclient.c
> @@ -33,9 +33,13 @@
>  
>  /**
>   * TEST: core getclient
> + * Category: Desktop client
>   * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
>   * Feature: core
> + * Functionality: permission management for clients
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/core_getstats.c b/tests/core_getstats.c
> index f2b1abac738e..fef12258356e 100644
> --- a/tests/core_getstats.c
> +++ b/tests/core_getstats.c
> @@ -34,9 +34,13 @@
>  
>  /**
>   * TEST: core getstats
> + * Category: Desktop client
>   * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
>   * Feature: core
> + * Functionality: permission management for clients
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index ae6fc8f8d7d9..bd74575c8617 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -30,9 +30,13 @@
>  #include <sys/ioctl.h>
>  /**
>   * TEST: core getversion
> + * Category: Desktop client
>   * Description: Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's drmGetVersion() interface to it.
>   * Feature: core
> + * Functionality: permission management for clients
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: SysMan
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 472e9237ddc2..dc8bcd85a219 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -48,11 +48,17 @@
>   * Description:
>   *   Check if the driver can be cleanly rebound to a device with a still open hot unbound driver
>   *   instance
> + * Functionality: Check if a hot unbound driver instance still open after hot rebind can be cleanly released.
-------------------- ^
This looks like a description, not functionallity.

>   * Run type: FULL
> + * Test category: SysMan
>   *
>   * SUBTEST: hotrebind-lateclose
> - * Description: Check if a hot unbound driver instance still open after hot rebind can be cleanly released
> + * Description:
> + *   Check if a hot unbound driver instance still open after hot rebind can be cleanly released.
> + *   Buffer is created only in lmem, created_bytes is being checked after creating and deleting buffer.
> + * Functionality: Check if the driver can be cleanly unbound from an open device, then released and rebound.
--------------------- ^
Same here, maybe we should ask Janusz Krzysztofik about this ?
+cc Janusz

What about naming this: hotplug ?

>   * Run type: FULL
> + * Test category: SysMan
>   *
>   * SUBTEST: hotreplug
>   * Description: Check if a hot unplugged and still open device can be cleanly restored
> @@ -64,15 +70,20 @@
>   *
>   * SUBTEST: hotunbind-rebind
>   * Description: Check if the driver can be cleanly unbound from an open device, then released and rebound
> + * Functionality: Check if the driver can be cleanly rebound to a device with a still open hot unbound driver instance.

Same here.

>   * Run type: FULL
> + * Test category: SysMan
>   *
>   * SUBTEST: hotunplug-rescan
>   * Description: Check if an open device can be cleanly unplugged, then released and restored
>   * Run type: FULL
>   *
>   * SUBTEST: unbind-rebind
> + * Category: Desktop client
>   * Description: Check if the driver can be cleanly unbound from a device believed to be closed, then rebound
> + * Functionality: Check if the driver can be cleanly unbound from an open device, then released and rebound.

Same here.

>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: unplug-rescan
>   * Description: Check if a device believed to be closed can be cleanly unplugged, then restored
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 95a131a4d3c9..621bc24696a8 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -40,9 +40,13 @@
>  #include <sys/stat.h>
>  /**
>   * TEST: core setmaster
> + * Category: Desktop client
>   * Description: Check that Drop/SetMaster behaves correctly wrt root/user access
>   * Feature: core
> + * Functionality: permission management for clients
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: master-drop-set-root
>   * Description: Ensure that root can Set/DropMaster
> diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
> index 37bb378ab011..76f567b9cfd3 100644
> --- a/tests/core_setmaster_vs_auth.c
> +++ b/tests/core_setmaster_vs_auth.c
> @@ -42,11 +42,16 @@
>  #include "igt_device.h"
>  /**
>   * TEST: core setmaster vs auth
> + * Category: Infrastructure
>   * Description: Check that drop/setMaster correctly transfer master state
>   * Feature: core
> + * Functionality: debugfs entries
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST:
> + * Description: validating debugfs entries
>   */
>  
>  IGT_TEST_DESCRIPTION("Check that drop/setMaster correctly transfer master "
> diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
> index 39b001671bcc..eea9fea87db8 100644
> --- a/tests/debugfs_test.c
> +++ b/tests/debugfs_test.c
> @@ -33,14 +33,22 @@
>   * TEST: debugfs test
>   * Description: Read entries from debugfs, hwmon and sysfs paths.
>   * Feature: core
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-hwmon
> + * Category: Infrastructure
>   * Description: Read all entries from hwmon path
> + * Functionality: validating debugfs entries
--------------------- ^
>   * Run type: BAT
>   *
>   * SUBTEST: read_all_entries
> - * Description: Read all entries from debugfs path.
> + * Category: Infrastructure
> + * Description:
> + *   Read all entries from debugfs path.
> + *   validating debugfs entries
--------------------- ^
> + * Functionality: driver handler
--------------------- ^

Looks like mixed ?
 
>   * Run type: BAT
> + * Sub-category: i915
>   *
>   * SUBTEST: read_all_entries_display_off
>   * Description: Read all debugfs entries with display on/off.
> @@ -51,8 +59,13 @@
>   * Run type: FULL
>   *
>   * SUBTEST: sysfs
> - * Description: Read all entries from sysfs path.
> + * Category: Server
> + * Description:
> + *   Read all entries from sysfs path.
> + *   validating device resets
> + * Functionality: reset
>   * Run type: FULL
> + * Sub-category: sysman
>   */
>  
>  IGT_TEST_DESCRIPTION("Read entries from debugfs, hwmon and sysfs paths.");
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 0c23aecff595..531c089d97bd 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -32,8 +32,12 @@
>   * Feature: reset
>   *
>   * SUBTEST: unbind-reset-rebind
> + * Category: Desktop client
>   * Description: Unbinds driver from device, initiates reset then rebinds driver to device
>   * Feature: reset, sriov-reset
> + * Functionality: legacy buffer sharing
> + * Sub-category: DRM
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
> index 0c7ce714eb6c..719682bdf057 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -54,18 +54,37 @@
>   * Description: This is a test for the generic dumb buffer interface.
>   * Feature: prime
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-clear
> + * Category: Desktop client
> + * Functionality: IOCTL check for buffer management
> + * Sub-category: Compositor
>   *
>   * SUBTEST: create-valid-dumb
> + * Category: Desktop client
> + * Functionality: IOCTL check for buffer management
> + * Sub-category: Compositor
>   *
>   * SUBTEST: invalid-bpp
> + * Category: Desktop client
> + * Functionality: IOCTL check for buffer management
> + * Sub-category: Compositor
>   *
>   * SUBTEST: map-invalid-size
> + * Category: Desktop client
> + * Functionality: IOCTL check for buffer management
> + * Sub-category: Compositor
>   *
>   * SUBTEST: map-uaf
> + * Category: Desktop client
> + * Functionality: IOCTL check for buffer management
> + * Sub-category: Compositor
>   *
>   * SUBTEST: map-valid
> + * Category: Infrastructure
> + * Functionality: semaphore
> + * Sub-category: HW
>   */
>  
>  IGT_TEST_DESCRIPTION("This is a test for the generic dumb buffer interface.");
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index f0144821c911..2d6b95ca69a6 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -11,44 +11,80 @@
>  #include "intel_allocator.h"
>  /**
>   * TEST: api intel allocator
> + * Category: Infrastructure
>   * Feature: igt_core
>   * Run type: FULL
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: alloc-simple
> + * Description: checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: default-alignment
>   * Description:
>   *   For simple allocator check does default alignment is properly handled in open and alloc
>   *   functions
> + *   checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: execbuf-with-allocator
> + * Description: checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: fork-simple-once
> + * Description: checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: fork-simple-stress
> + * Description: checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: fork-simple-stress-signal
> + * Description: checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: gem-pool
> - * Description: Verifies creating and executing bb from gem pool
> + * Description:
> + *   Verifies creating and executing bb from gem pool
> + *   checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: open-vm
> + * Description: checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: reloc-allocator
> + * Description: checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: reopen
> + * Description: checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: reopen-fork
> + * Description: checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: reserve-simple
> + * Description: checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: simple-allocator
> + * Description: checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: standalone
> + * Description: checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: two-level-inception
> + * Description: checking the virtual address ranges
> + * Functionality: virtual address ranges
>   *
>   * SUBTEST: two-level-inception-interruptible
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   */
>  
>  #define OBJ_SIZE 1024
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index 198a29eb4f26..5188d5ae5af0 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -43,53 +43,94 @@
>  #include "i915/i915_blt.h"
>  /**
>   * TEST: api intel bb
> + * Category: Infrastructure
>   * Description: intel_bb API check.
>   * Feature: igt_core
>   * Run type: FULL
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: add-remove-objects
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: bb-with-allocator
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: blit-noreloc-keep-cache
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: blit-noreloc-purge-cache
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: blit-reloc-keep-cache
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: blit-reloc-purge-cache
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: crc32
>   * Description: Compare cpu and gpu crc32 sums on input object
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: delta-check
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: destroy-bb
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: full-batch
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: intel-bb-blit-none
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: intel-bb-blit-x
>   *
>   * SUBTEST: intel-bb-blit-y
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: lot-of-buffers
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: misplaced-blitter
>   * Description: Execute intel_bb with set of engines provided by userspace
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: object-noreloc-keep-cache-simple
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: object-noreloc-purge-cache-simple
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: object-reloc-keep-cache
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: object-reloc-purge-cache
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: offset-control
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: purge-bb
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: render
>   *
> @@ -97,12 +138,19 @@
>   *
>   * SUBTEST: reset-bb
>   * Description: Ensure reset is possible on fresh bb
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: reset-flags
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: simple-bb
> + * Description: checking dummy buffer creation & submission
> + * Functionality: dummy buffer creation & submission
>   *
>   * SUBTEST: simple-bb-ctx
> + * Description: device mapping check
> + * Functionality: device mapping
>   */
>  
>  #define PAGE_SIZE 4096
> diff --git a/tests/i915/gem_barrier_race.c b/tests/i915/gem_barrier_race.c
> index 0b1da7713520..2faefa07cbd1 100644
> --- a/tests/i915/gem_barrier_race.c
> +++ b/tests/i915/gem_barrier_race.c
> @@ -19,9 +19,12 @@
>  #include "i915/perf.h"
>  /**
>   * TEST: gem barrier race
> + * Category: Infrastructure
>   * Description: Exercise engine barriers and their interaction with other subsystems
>   * Feature: core
> + * Functionality: driver handler
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: remote-request
>   * Description:
> diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
> index 8605429799aa..3d3300d172a6 100644
> --- a/tests/i915/gem_basic.c
> +++ b/tests/i915/gem_basic.c
> @@ -43,27 +43,40 @@
>  #include "lib/igt_device_scan.h"
>  /**
>   * TEST: gem basic
> + * Category: Infrastructure
>   * Description: Tests basic gem_create and gem_close IOCTLs
>   *
>   * SUBTEST: bad-close
>   * Description: Verify that gem_close fails with bad params.
>   * Feature: gem_core
> + * Functionality: driver handler
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-close
>   * Description: Verify basic functionality of gem_create and gem_close.
>   * Feature: gem_core
> + * Functionality: driver handler
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-fd-close
> - * Description: Verify that closing drm driver is possible with opened gem object.
> + * Description:
> + *   Verify that closing drm driver is possible with opened gem object.
> + *   Validate Command streamer
>   * Feature: gem_core
> + * Functionality: Semaphore
>   * Run type: BAT
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: multigpu-create-close
>   * Description: Verify basic functionality of gem_create and gem_close on multi-GPU.
>   * Feature: gem_core, multigpu
>   * Run type: FULL
> + * Test category: MultiGPU
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests basic gem_create and gem_close IOCTLs");
> diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
> index acc1adc165f3..4cd1fb3e1b62 100644
> --- a/tests/i915/gem_blits.c
> +++ b/tests/i915/gem_blits.c
> @@ -30,8 +30,12 @@
>  #include "i915/i915_blt.h"
>  /**
>   * TEST: gem blits
> + * Category: Desktop client
>   * Feature: blitter
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
>   */
> diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
> index 38d66f8f292a..42d50f7ef1d5 100644
> --- a/tests/i915/gem_busy.c
> +++ b/tests/i915/gem_busy.c
> @@ -32,19 +32,25 @@
>  #include "igt_vgem.h"
>  /**
>   * TEST: gem busy
> + * Category: Desktop client
>   * Description: Basic check of busy-ioctl ABI.
>   * Feature: cmd_submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: busy
>   * Description: Basic test to check busyness of each engine.
> + * Functionality: semaphore
>   * Run type: FULL
>   *
>   * SUBTEST: close-race
>   * Description: Test to check race condition by randomly closing the handle using gem_close.
> + * Functionality: semaphore
>   * Run type: FULL
>   *
>   * SUBTEST: extended
>   * Description: Extended test to check busyness of dwstore-capable engines.
> + * Functionality: semaphore
>   * Run type: FULL
>   *
>   * SUBTEST: hang
> @@ -61,6 +67,7 @@
>   * Description:
>   *   Extended test to check busyness of dwstore-capable engines while doing parallel
>   *   execution.
> + * Functionality: data coherency
>   * Run type: FULL
>   *
>   * SUBTEST: semaphore
> diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
> index d24e6cce059b..33c4b02921e4 100644
> --- a/tests/i915/gem_caching.c
> +++ b/tests/i915/gem_caching.c
> @@ -45,12 +45,20 @@
>   * Description: Test snoop consistency when touching partial cachelines.
>   * Feature: caching
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: read-writes
> + * Category: Desktop client
> + * Functionality: data coherency
>   *
>   * SUBTEST: reads
> + * Category: Desktop client
> + * Functionality: data coherency
>   *
>   * SUBTEST: writes
> + * Category: Infrastructure
> + * Functionality: driver handler
>   */
>  
>  IGT_TEST_DESCRIPTION("Test snoop consistency when touching partial"
> diff --git a/tests/i915/gem_close.c b/tests/i915/gem_close.c
> index 212fd8e9062a..20aff600d595 100644
> --- a/tests/i915/gem_close.c
> +++ b/tests/i915/gem_close.c
> @@ -27,8 +27,12 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem close
> + * Category: Infrastructure
>   * Feature: mapping
> + * Functionality: driver handler
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
>   *
> diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> index 2b90a98258e7..360c138a430c 100644
> --- a/tests/i915/gem_close_race.c
> +++ b/tests/i915/gem_close_race.c
> @@ -50,19 +50,25 @@
>  #include "igt_device_scan.h"
>  /**
>   * TEST: gem close race
> + * Category: Infrastructure
>   * Description: Test try to race gem_close against workload submission.
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-process
>   * Description: Basic workload submission.
>   * Feature: synchronization
> + * Functionality: driver handler
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-threads
>   * Description:
>   *   Share buffer handle across different drm fd's and trying to race gem_close against
>   *   continuous workload with minimum timeout.
>   * Feature: synchronization
> + * Functionality: Buffer Management
>   * Run type: BAT
> + * Test category: USM
>   *
>   * SUBTEST: contexts
>   * Description:
> @@ -82,11 +88,13 @@
>   * Description: Basic workload submission on multi-GPU machine.
>   * Feature: multigpu, synchronization
>   * Run type: FULL
> + * Test category: MultiGPU
>   *
>   * SUBTEST: multigpu-basic-threads
>   * Description: Run basic-threads race on multi-GPU machine.
>   * Feature: multigpu, synchronization
>   * Run type: FULL
> + * Test category: MultiGPU
>   *
>   * SUBTEST: process-exit
>   * Description: Test try to race gem_close against submission of continuous workload.
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index fc99189499b8..2d3ba5c0357f 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -67,50 +67,89 @@
>   * Description:
>   *   Ensure that basic gem_create and gem_create_ext works and that invalid input combinations
>   *   are rejected.
> - * Feature: mapping
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: busy-create
> + * Category: Server
>   * Description: Create buffer objects while GPU is busy.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-clear
> + * Category: Infrastructure
>   * Description: Verify that all new objects are clear.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-ext-cpu-access-big
>   * Description:
>   *   Verify the extreme cases with very large objects and.
----------------------------------------------------------- ^

>   *   I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
> + * Feature: mapping
>   *
>   * SUBTEST: create-ext-cpu-access-sanity-check
>   * Description:
>   *   Verify the basic functionally and expected ABI contract around.
--------------------------------------------------------------------- ^

>   *   I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
> + * Feature: mapping
>   *
>   * SUBTEST: create-ext-placement-all
> + * Category: Infrastructure
>   * Description: Create objects in every memory region using create_ext.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-ext-placement-each
> + * Category: Infrastructure
>   * Description: Create one object with memory pieces in each memory region using create_ext.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-ext-placement-sanity-check
> + * Category: Infrastructure
>   * Description: Exercise create_ext placements extension.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-invalid-size
> + * Category: Infrastructure
>   * Description: Try to create a gem object of invalid size 0 and check if ioctl returns error.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-massive
> + * Category: Infrastructure
>   * Description: Exercise creation of buffer object with impossible size and check for the expected error.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-size-update
> + * Category: Infrastructure
>   * Description: Try to create a gem object with size 15 and check actual created size.
> + * Feature: mapping
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: create-valid-nonaligned
> + * Category: Infrastructure
>   * Description:
>   *   Try to create an object with non-aligned size, check we got one with size aligned up to page
>   *   size and test we can write into the padded extra memory.
> + * Feature: mapping
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: hog-create
>   * Description: Create buffer objects while GPU is busy.
> + * Feature: mapping
>   */
>  
>  IGT_TEST_DESCRIPTION("Ensure that basic gem_create and gem_create_ext works"
> diff --git a/tests/i915/gem_cs_tlb.c b/tests/i915/gem_cs_tlb.c
> index ab09efa251b3..db168fe74805 100644
> --- a/tests/i915/gem_cs_tlb.c
> +++ b/tests/i915/gem_cs_tlb.c
> @@ -54,9 +54,13 @@
>  #include "igt.h"
>  /**
>   * TEST: gem cs tlb
> + * Category: Infrastructure
>   * Description: Check whether we correctly invalidate the cs tlb.
>   * Feature: mapping
> + * Functionality: context management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines
>   */
> diff --git a/tests/i915/gem_ctx_bad_destroy.c b/tests/i915/gem_ctx_bad_destroy.c
> index 90495da8ab2e..8c47e7c1cb67 100644
> --- a/tests/i915/gem_ctx_bad_destroy.c
> +++ b/tests/i915/gem_ctx_bad_destroy.c
> @@ -36,9 +36,13 @@
>  
>  /**
>   * TEST: gem ctx bad destroy
> + * Category: Infrastructure
>   * Description: Negative test cases for destroy contexts.
>   * Feature: context
> + * Functionality: context management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: double-destroy
>   *
> diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
> index 14991a671938..c4c0328d390e 100644
> --- a/tests/i915/gem_ctx_create.c
> +++ b/tests/i915/gem_ctx_create.c
> @@ -51,12 +51,20 @@
>   * Run type: FULL
>   *
>   * SUBTEST: basic
> + * Category: Infrastructure
>   * Description: Test random context creation
> + * Functionality: context management
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-files
> + * Category: Infrastructure
>   * Description: Exercise implicit per-fd context creation
> + * Functionality: command submission
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: ext-param
>   * Description: Verify valid and invalid context extensions
> diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> index d15a7b7e5f67..8b40e333e848 100644
> --- a/tests/i915/gem_ctx_engines.c
> +++ b/tests/i915/gem_ctx_engines.c
> @@ -45,20 +45,29 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem ctx engines
> + * Category: Infrastructure
>   * Feature: context
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: execute-allforone
> + * Functionality: context management
>   *
>   * SUBTEST: execute-one
> + * Functionality: context management
>   *
>   * SUBTEST: execute-oneforall
> + * Functionality: context management
>   *
>   * SUBTEST: independent
> + * Functionality: context management
>   *
>   * SUBTEST: invalid-engines
> + * Functionality: context management
>   *
>   * SUBTEST: none
> + * Functionality: command submission
>   */
>  
>  #define engine_class(e, n) ((e)->engines[(n)].engine_class)
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> index 4e37b2642085..00687aa16ba9 100644
> --- a/tests/i915/gem_ctx_exec.c
> +++ b/tests/i915/gem_ctx_exec.c
> @@ -53,24 +53,44 @@
>   * Feature: context
>   *
>   * SUBTEST: basic
> + * Category: Infrastructure
>   * Description: Check the basic context batch buffer execution.
> + * Functionality: command submission
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-close-race
> + * Category: Infrastructure
>   * Description: Race the execution and interrupt handlers along a context, while closing it at a random time.
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-invalid-context
> + * Category: Server
>   * Description: Verify that execbuf with invalid context fails.
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-nohangcheck
> + * Category: Server
>   * Description: Verify that contexts are automatically shotdown on close, if hangchecking is disabled.
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-norecovery
> + * Category: Server
>   * Description: Check the status of context after a hang by setting and unsetting the RECOVERABLE.
> + * Functionality: frequency management
>   * Run type: FULL
> + * Sub-category: Performance
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: eviction
>   * Description: Check maximum number of buffers it can evict for a context.
> diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
> index 8e432cbdf8f5..4d7f142de132 100644
> --- a/tests/i915/gem_ctx_freq.c
> +++ b/tests/i915/gem_ctx_freq.c
> @@ -36,8 +36,12 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem ctx freq
> + * Category: Infrastructure
>   * Feature: context
> + * Functionality: security
>   * Run type: FULL
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sysfs
>   */
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> index 2c2da296d301..ceafed305156 100644
> --- a/tests/i915/gem_ctx_isolation.c
> +++ b/tests/i915/gem_ctx_isolation.c
> @@ -28,26 +28,56 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem ctx isolation
> - * Feature: context
> + * Category: Infrastructure
>   * Run type: FULL
>   *
>   * SUBTEST: clean
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: dirty-create
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: dirty-switch
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: nonpriv
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: nonpriv-switch
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: preservation
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: preservation-S3
> + * Feature: context
>   *
>   * SUBTEST: preservation-S4
> + * Feature: context
>   *
>   * SUBTEST: preservation-reset
> + * Feature: context
> + * Functionality: security
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   */
>  
>  /* MAX_REG must be greater than the maximum register address. */
> diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
> index ae52ee2fa1e6..c37150ba8bcc 100644
> --- a/tests/i915/gem_ctx_param.c
> +++ b/tests/i915/gem_ctx_param.c
> @@ -35,73 +35,125 @@
>   * TEST: gem ctx param
>   * Description: Basic test for context set/get param input validation.
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> + * Category: Infrastructure
>   * Description: Basic test for context get/set param ioctls using valid context
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-default
> + * Category: Infrastructure
>   * Description: Basic test for context get/set param ioctls using default context
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: get-priority-new-ctx
> + * Category: Infrastructure
>   * Description:
>   *   Test performed with context param set to priority.
>   *   Verify that priority is default for newly created context
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: invalid-ctx-get
> + * Category: Infrastructure
>   * Description: Verify that context get param ioctl using invalid context returns relevant error
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: invalid-ctx-set
> + * Category: Infrastructure
>   * Description: Verify that context set param ioctl using invalid context returns relevant error
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: invalid-get-engines
> + * Category: Infrastructure
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: invalid-get-no-zeromap
> + * Category: Infrastructure
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: invalid-get-ringsize
> + * Category: Infrastructure
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: invalid-param-get
> + * Category: Infrastructure
>   * Description: Checks that fetching context parameters using an unused param value is erroneous
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: invalid-param-set
> + * Category: Infrastructure
>   * Description: Checks that setting context parameters using an unused param value is erroneous
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: invalid-set-no-zeromap
> + * Category: Infrastructure
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: invalid-set-ringsize
> + * Category: Infrastructure
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: invalid-size-get
> + * Category: Infrastructure
>   * Description: Verify that context get param ioctl returns valid size for valid context
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: invalid-size-set
> + * Category: Infrastructure
>   * Description: Verify that context set param ioctl using invalid size returns relevant error
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: non-root-set
> + * Category: Infrastructure
>   * Description: Verify that context set param ioctl returns relevant error in non root mode
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: root-set
> + * Category: Infrastructure
>   * Description: Verify that context set param ioctl works fine in root mode
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: set-priority-invalid-size
> + * Category: Infrastructure
>   * Description:
>   *   Test performed with context param set to priority.
>   *   Verify that relevant error is returned on setting invalid ctx size with default priority
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: set-priority-not-supported
>   * Description:
> @@ -110,14 +162,20 @@
>   * Feature: context, no-set-priority
>   *
>   * SUBTEST: set-priority-range
> + * Category: Infrastructure
>   * Description:
>   *   Test performed with context param set to priority.
>   *   Change priority range to test value overflow
>   * Feature: context
> + * Functionality: context management
> + * Sub-category: i915
>   *
>   * SUBTEST: vm
> + * Category: Server
>   * Description: Tests that multiple contexts can share the same VMA
>   * Feature: context
> + * Functionality: security
> + * Sub-category: Compute
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic test for context set/get param input validation.");
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index 40281ef4209e..745db19fd370 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -49,70 +49,155 @@
>   * TEST: gem ctx persistence
>   * Feature: context
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines-cleanup
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: engines-hang
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: engines-hostile
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: engines-hostile-preempt
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: engines-mixed
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: engines-mixed-process
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: engines-persistence
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: engines-queued
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: file
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: hang
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: heartbeat-close
>   *
>   * SUBTEST: heartbeat-hang
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: heartbeat-hostile
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: heartbeat-many
>   *
>   * SUBTEST: heartbeat-stop
>   *
>   * SUBTEST: hostile
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: idempotent
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: legacy-engines-cleanup
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: legacy-engines-hang
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: legacy-engines-hostile
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: legacy-engines-hostile-preempt
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: legacy-engines-mixed
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: legacy-engines-mixed-process
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: legacy-engines-persistence
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: legacy-engines-queued
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: many-contexts
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: process
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: processes
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: saturated-hostile
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: saturated-hostile-nopreempt
>   *
>   * SUBTEST: smoketest
> + * Category: Server
> + * Functionality: security
> + * Sub-category: Compute
>   *
>   * SUBTEST: userptr
> + * Category: Desktop client
> + * Functionality: context management
> + * Sub-category: Media
>   */
>  
>  #define RESET_TIMEOUT_MS 2 * MSEC_PER_SEC; /* default: 640ms */
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index 078557bd1234..71c2b44a0b8a 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -66,20 +66,42 @@
>   * SUBTEST: Q-smoketest-all
>   *
>   * SUBTEST: create-shared-gtt
> + * Category: Desktop client
> + * Functionality: context management
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: detached-shared-gtt
> + * Category: Desktop client
> + * Functionality: context management
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: disjoint-timelines
> + * Category: Desktop client
> + * Functionality: context management
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: exec-shared-gtt
> + * Category: Infrastructure
> + * Functionality: reset
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: exec-single-timeline
> + * Category: Desktop client
> + * Functionality: context management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: exhaust-shared-gtt
>   *
>   * SUBTEST: exhaust-shared-gtt-lrc
>   *
>   * SUBTEST: single-timeline
> + * Category: Infrastructure
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   */
>  
>  #define LO 0
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index 370d40b39e1c..0aaf4a5fb489 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -56,94 +56,179 @@
>   * TEST: gem eio
>   * Description: Test that specific ioctls report a wedged GPU (EIO).
>   * Run type: FULL
> + * Sub-category: i915
>   *
>   * SUBTEST: banned
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: context-create
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create
> + * Category: Infrastructure
>   * Description: Validate i915_gem_create_ioctl, while gpu is wedged for fb scanout.
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-ext
> + * Category: Infrastructure
>   * Description:
>   *   Validate i915_gem_create_ext_ioctl and checks if returns clear backing store while gpu is
>   *   wedged for fb scanout.
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: execbuf
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hibernate
> - * Feature: hibernate, reset
> + * Feature:
> + *   hibernate, reset
> + *   suspend

imho better:

 * Feature: hibernate, reset, suspend

or is it tool error ?

> + * Functionality: Verify Softpin functionality during S3 state
> + * Test category: suspend
>   *
>   * SUBTEST: in-flight-10ms
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-1us
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-contexts-10ms
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-contexts-1us
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-contexts-immediate
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-external
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-immediate
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-internal-10ms
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-internal-1us
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-internal-immediate
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: in-flight-suspend
> - * Feature: reset
> + * Feature:
> + *   reset
> + *   suspend
> + * Functionality: Test that specific ioctls report a wedged GPU (EIO) during suspend
> + * Test category: suspend
>   *
>   * SUBTEST: kms
>   * Feature: kms_gem_interop, reset
>   *
>   * SUBTEST: reset-stress
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: suspend
> - * Feature: reset, suspend
> + * Feature:
> + *   reset, suspend
> + *   suspend
> + * Functionality: Test that specific ioctls report a wedged GPU (EIO) during suspend
> + * Test category: suspend
>   *
>   * SUBTEST: throttle
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: unwedge-stress
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-10ms
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-1us
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-immediate
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-wedge-10ms
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-wedge-1us
> + * Category: Infrastructure
>   * Feature: reset
> + * Functionality: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-wedge-immediate
> + * Category: Desktop client
>   * Feature: reset
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Test that specific ioctls report a wedged GPU (EIO).");
> diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
> index 32db9840a344..217b06bb7cdc 100644
> --- a/tests/i915/gem_exec_alignment.c
> +++ b/tests/i915/gem_exec_alignment.c
> @@ -49,19 +49,28 @@
>   * TEST: gem exec alignment
>   * Description: Exercises the basic execbuffer using object alignments
>   * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: forked
> + * Category: Desktop client
>   *
>   * SUBTEST: many
> + * Category: Desktop client
>   *
>   * SUBTEST: pi
> + * Category: Desktop client
>   *
>   * SUBTEST: pi-isolated
> + * Category: Desktop client
>   *
>   * SUBTEST: pi-shared
> + * Category: Desktop client
>   *
>   * SUBTEST: single
> + * Category: Infrastructure
>   */
>  
>  IGT_TEST_DESCRIPTION("Exercises the basic execbuffer using object alignments");
> diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
> index 1153c0bf2e30..f3c2f671f6ec 100644
> --- a/tests/i915/gem_exec_async.c
> +++ b/tests/i915/gem_exec_async.c
> @@ -26,9 +26,13 @@
>  #include "igt.h"
>  /**
>   * TEST: gem exec async
> + * Category: Infrastructure
>   * Description: Check that we can issue concurrent writes across the engines.
>   * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: concurrent-writes
>   *
> diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
> index c7f949c9cd2b..6b8cca5b011d 100644
> --- a/tests/i915/gem_exec_await.c
> +++ b/tests/i915/gem_exec_await.c
> @@ -35,10 +35,17 @@
>   * TEST: gem exec await
>   * Feature: cmd_submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wide-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: wide-contexts
> + * Category: Desktop \ Server
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
>   */
>  
>  static double elapsed(const struct timespec *start, const struct timespec *end)
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index d1d92e6ba689..73b06bc26605 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -65,95 +65,196 @@
>   * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: busy
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: fairslice
>   * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: full
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: full-late
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: full-late-pulse
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: full-pulse
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hang
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hog
>   * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: indices
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: individual
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-balancer
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-bonds
>   * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: nohangcheck
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: noheartbeat
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: nop
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-balancer
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-bb-first
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-contexts
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-dmabuf-import-out-fence
>   * Description: Regression test to check that dmabuf imported sync file can handle fence array
>   * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: parallel-keep-in-fence
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-keep-submit-fence
> + * Category: Desktop client
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-ordering
> + * Category: Desktop client
> + * Description: Command Submission
>   * Feature: cmd_submission, media_scalability
> + * Functionality: unbind & rebind
> + * Sub-category: Media
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: parallel-out-fence
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: persistence
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: semaphore
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability, multictx
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sequential
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sliced
>   * Feature: cmd_submission, media_scalability
>   *
>   * SUBTEST: smoke
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, media_scalability
> + * Functionality: load balancing
> + * Sub-category: Media & Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: waits
> + * Category: Infrastructure
>   * Feature: cmd_submission, media_scalability
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Exercise in-kernel load-balancing");
> diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
> index 437ce0954557..491f4e9e4374 100644
> --- a/tests/i915/gem_exec_basic.c
> +++ b/tests/i915/gem_exec_basic.c
> @@ -27,14 +27,19 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem exec basic
> + * Category: Infrastructure
>   * Description: Basic sanity check of execbuf-ioctl rings.
>   * Feature: cmd_submission
> - * Run type: BAT
> + * Functionality: buffer management
> + * Sub-category: i915
>   *
>   * SUBTEST: basic
>   * Description:
>   *   Check basic functionality of GEM_EXECBUFFER2 ioctl on every ring and iterating over memory
>   *   regions.
> + *   Command Submission
> + * Run type: BAT
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl rings.");
> diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
> index 7f07cf6c69db..e86500f408b3 100644
> --- a/tests/i915/gem_exec_big.c
> +++ b/tests/i915/gem_exec_big.c
> @@ -57,6 +57,10 @@
>   * SUBTEST: exhaustive
>   *
>   * SUBTEST: single
> + * Category: Server
> + * Functionality: offline debugging
> + * Sub-category: debugger
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Run a large nop batch to stress test the error capture"
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index faa997ca8af1..3d4a160f7edb 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -36,8 +36,12 @@
>   * Description: Check that we capture the user specified objects on a hang
>   * Feature: cmd_submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: capture
> + * Category: Server
> + * Functionality: offline debugging
> + * Sub-category: debugger
>   *
>   * SUBTEST: capture-invisible
>   * Description:
> @@ -58,8 +62,14 @@
>   * SUBTEST: many-4K-zero
>   *
>   * SUBTEST: pi
> + * Category: Server
> + * Functionality: offline debugging
> + * Sub-category: debugger
>   *
>   * SUBTEST: userptr
> + * Category: Infrastructure
> + * Functionality: buffer management
> + * Sub-category: i915
>   */
>  
>  #define MAX_RESET_TIME	600
> diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
> index 89e9a8ec8ad3..e1eaf687fa6e 100644
> --- a/tests/i915/gem_exec_create.c
> +++ b/tests/i915/gem_exec_create.c
> @@ -55,22 +55,40 @@
>   * Feature: cmd_submission
>   *
>   * SUBTEST: basic
> - * Description: Check if we kill system by overloading it with active objects iterating over all engines.
> + * Category: Infrastructure
> + * Description:
> + *   Check if we kill system by overloading it with active objects iterating over all engines.
> + *   Buffer Management
------- ^
Seems out of place ?

> + * Functionality: semaphore
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: forked
> + * Category: Infrastructure
>   * Description: Concurrently overloads system with active objects and checks if we kill system.
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy
> + * Category: Infrastructure
>   * Description:
>   *   Check if we kill the system by overloading it with active objects iterating over legacy
>   *   engines.
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: madvise
> + * Category: Server
>   * Description: This test does a forced reclaim, behaving like a bad application leaking its bo cache.
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("This test overloads the driver with transient active objects"
> diff --git a/tests/i915/gem_exec_endless.c b/tests/i915/gem_exec_endless.c
> index 25ad16898761..f118a8de3f66 100644
> --- a/tests/i915/gem_exec_endless.c
> +++ b/tests/i915/gem_exec_endless.c
> @@ -32,8 +32,12 @@
>  #include "sw_sync.h"
>  /**
>   * TEST: gem exec endless
> + * Category: Infrastructure
>   * Feature: cmd_submission
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: MultiTile
>   *
>   * SUBTEST: dispatch
>   */
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index ede9b5a6e698..39f5a1982dfe 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -45,29 +45,48 @@
>   * Run type: FULL
>   *
>   * SUBTEST: basic-await
> - * Description: Basic check for explicit fence with async wait on each engine.
> + * Description:
> + *   Basic check for explicit fence with async wait on each engine.
> + *   Basic check for explicit fence on each busy engine.

Two slightly different descriptions ? There are two tests:
basic-wait
basic-await

>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: semaphore
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-busy
> - * Description: Basic check for explicit fence on each busy engine.
> + * Description:
> + *   Basic check for explicit fence on each busy engine.
> + *   Basic check for composite fence on all busy engines.
------- ^
Taken from below, do not belong here.

>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: semaphore
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-busy-all
>   * Description: Basic check for composite fence on all busy engines.
>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: Basic check for explicit fence with additional wait time on each busy engine.
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-wait
> - * Description: Basic check for explicit fence with additinal wait time on each busy engine.
> + * Description:
> + *   Basic check for explicit fence with additinal wait time on each busy engine.
> + *   Basic check of ring to ring write, store synchronisation

Same here.

>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: semaphore
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-wait-all
> - * Description: Basic check for composite fence with additional wait on all busy engines.
> + * Category: Infrastructure
> + * Description:
> + *   Basic check for composite fence with additional wait on all busy engines.
> + *   Test spamming ring with contexts

Same here.

>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: busy-hang
>   * Description: Check for explicit fence on each busy engine with a pending gpu hang.
> @@ -85,36 +104,61 @@
>   * Run type: FULL
>   *
>   * SUBTEST: expired-history
> + * Category: Infrastructure
>   * Description: Verifies long history of fences are expired.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-fence-array
> + * Category: Infrastructure
>   * Description: Verifies invalid fence-array pointers are rejected.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-timeline-fence-array
> + * Category: Infrastructure
>   * Description:
>   *   Verifies invalid execbuf parameters in drm_i915_gem_execbuffer_ext_timeline_fences
>   *   are rejected
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: MultiTile
>   *
>   * SUBTEST: keep-in-fence
> - * Description: Check in-fence is not overwritten with out-fence on each engine.
> + * Category: Infrastructure
> + * Description:
> + *   Check in-fence is not overwritten with out-fence on each engine.
> + *   Check for explicit fence with non-blocking wait on each

Same here.

>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: long-history
> + * Category: Infrastructure
>   * Description: Verifies accumulation of long history of fences.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: MultiTile
>   *
>   * SUBTEST: nb-await
> - * Description: Check for explicit fence with non-blocking wait on each engine.
> + * Description:
> + *   Check for explicit fence with non-blocking wait on each engine.
> + *   Check for EXEC_FENCE_SUBMIT in parallel execution scenarios

Same here.

>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: command submission
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: nb-await-hang
>   * Description: Check for explicit fence with non-blocking async wait on each engine with a pending gpu hang.
> @@ -122,9 +166,14 @@
>   * Run type: FULL
>   *
>   * SUBTEST: parallel
> - * Description: Check for EXEC_FENCE_SUBMIT in parallel execution scenarios on each engine.
> + * Category: Infrastructure
> + * Description:
> + *   Check for EXEC_FENCE_SUBMIT in parallel execution scenarios on each engine.
> + *   Tile meta data validation

Same here.

>   * Feature: cmd_submission, multitile, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: submit
>   * Description: Check timeslicing on submit-fence.
> @@ -149,117 +198,197 @@
>   * Run type: FULL
>   *
>   * SUBTEST: syncobj-backward-timeline-chain-engines
> + * Category: Infrastructure
>   * Description:
>   *   Engine chaining tests to verify ordering of timeline syncobjs with backward timeline
>   *   points.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-channel
> + * Category: Infrastructure
>   * Description: Verifies two clients racing for syncobj using channel.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-export
> + * Category: Infrastructure
>   * Description: Verify exporting of fence-array syncobj signaled by i915.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-import
> + * Category: Infrastructure
>   * Description: Verifies creating of a syncobj from explicit fence.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-invalid-flags
> + * Category: Infrastructure
>   * Description: Verifies that invalid fence flags in fence-array are rejected.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-invalid-wait
> + * Category: Infrastructure
>   * Description: Verifies that submitting an execbuf with a wait on a syncobj that doesn't exists is rejected.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-repeat
> + * Category: Infrastructure
>   * Description: Verifies that waiting & signaling a same fence-array syncobj within the same execbuf works.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-signal
> + * Category: Infrastructure
>   * Description: Verifies proper signaling of a fence-array syncobj through execbuf.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-stationary-timeline-chain-engines
> + * Category: Infrastructure
>   * Description:
>   *   Engine chaining tests to verify ordering of timeline syncobj with stationary timeline
>   *   points.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-chain-engines
> + * Category: Infrastructure
>   * Description: Engine chaining tests to verify ordering of timeline syncobjs through execbuf.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-export
> + * Category: Infrastructure
>   * Description: Verify exporting of timeline syncobj signaled by i915
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-invalid-flags
> + * Category: Infrastructure
>   * Description:
>   *   Verifies that invalid fence flags in drm_i915_gem_execbuffer_ext_timeline_fences are
>   *   rejected
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-invalid-wait
> + * Category: Infrastructure
>   * Description:
>   *   Verifies that submitting an execbuf with a wait on a timeline syncobj point that does not
>   *   exists is rejected
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-multiple-ext-nodes
> + * Category: Infrastructure
>   * Description: Verify that passing multiple execbuffer_ext nodes works
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-repeat
> + * Category: Infrastructure
>   * Description:
>   *   Verifies that waiting & signaling a same timeline syncobj point within the same execbuf
>   *   fworks
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-signal
> + * Category: Infrastructure
>   * Description: Verifies proper signaling of a timeline syncobj through execbuf
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-unused-fence
> + * Category: Infrastructure
>   * Description:
>   *   Verifies that a timeline syncobj passed into
>   *   drm_i915_gem_execbuffer_ext_timeline_fences but with no signal/wait flag is left
>   *   untouched
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-timeline-wait
> + * Category: Infrastructure
>   * Description: Verifies that waiting on a timeline syncobj point between engines works
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-unused-fence
> + * Category: Infrastructure
>   * Description: Verifies that a syncobj passed into execbuf but with no signal/wait flag is left untouched.
>   * Feature: cmd_submission, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: syncobj-wait
> + * Category: Infrastructure
>   * Description: Verifies that waiting on a timeline syncobj point between engines works.
>   * Feature: cmd_submission, synchronization
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: wait-hang
>   * Description:
> diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> index 496ad6e8bb16..400e3d1d0545 100644
> --- a/tests/i915/gem_exec_gttfill.c
> +++ b/tests/i915/gem_exec_gttfill.c
> @@ -28,26 +28,38 @@
>  #include "igt_rand.h"
>  /**
>   * TEST: gem exec gttfill
> + * Category: Infrastructure
>   * Description: Fill the GTT with batches.
> + * Sub-category: i915
>   *
>   * SUBTEST: all-engines
>   * Description: Stress test check behaviour/correctness of handling batches to fill gtt
>   * Feature: cmd_submission, gtt
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> - * Description: Checks if it can handle enough batches to fill gtt
> + * Description:
> + *   Checks if it can handle enough batches to fill gtt.
> + *   Command Submission
>   * Feature: cmd_submission, gtt
> + * Functionality: D3 state entry-exit
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines
>   * Description: Checks the correctness of handling enough batches to fill gtt for each engine
>   * Feature: cmd_submission, gtt
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: multigpu-basic
>   * Feature: cmd_submission, gtt, multigpu
> + * Functionality: Used for shared handle on two GPUs in series and in parallel to verify multigpu functionality , skips in absence of other fd card
>   * Run type: FULL
> + * Test category: MultiGPU
>   */
>  
>  IGT_TEST_DESCRIPTION("Fill the GTT with batches.");
> diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> index 1d44456d06fa..edc5d63b8e6c 100644
> --- a/tests/i915/gem_exec_nop.c
> +++ b/tests/i915/gem_exec_nop.c
> @@ -50,16 +50,24 @@
>  
>  /**
>   * TEST: gem exec nop
> + * Category: Infrastructure
>   * Run type: FULL
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-parallel
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-sequential
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-series
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: context-sequential
>   * Feature: cmd_submission
> diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
> index 0e42aa364ca7..4829b0c39c72 100644
> --- a/tests/i915/gem_exec_parallel.c
> +++ b/tests/i915/gem_exec_parallel.c
> @@ -37,26 +37,44 @@
>   * TEST: gem exec parallel
>   * Description: Exercise filling buffers by many clients working in parallel.
>   * Feature: cmd_submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic
> + * Category: Infrastructure
>   * Description: Check basic functionality per engine.
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: contexts
> + * Category: Infrastructure
>   * Description: Check with many contexts.
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines
> - * Description: Check with engines working in parallel.
> + * Category: Infrastructure
> + * Description:
> + *   Check with engines working in parallel.
> + *   Command Submission
> + * Functionality: coherency
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: fds
> + * Category: Infrastructure
>   * Description: Check with many fds.
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: userptr
> + * Category: Desktop client
>   * Description: Check basic userptr thrashing.
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Exercise filling buffers by many clients working in parallel.");
> diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
> index bd7ec2cd1f39..3cfd1d7cb768 100644
> --- a/tests/i915/gem_exec_params.c
> +++ b/tests/i915/gem_exec_params.c
> @@ -55,22 +55,46 @@
>   * Feature: cmd_submission
>   *
>   * SUBTEST: batch-first
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: cliprects-invalid
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: cliprects_ptr-dirt
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-batch-start-offset
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-bsd-ring
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-bsd1-flag-on-blt
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-bsd1-flag-on-render
>   * Feature: cmd_submission
> @@ -79,7 +103,11 @@
>   * Feature: cmd_submission
>   *
>   * SUBTEST: invalid-bsd2-flag-on-blt
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-bsd2-flag-on-render
>   * Feature: cmd_submission
> @@ -88,25 +116,53 @@
>   * Feature: cmd_submission
>   *
>   * SUBTEST: invalid-fence-in
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-fence-in-submit
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-flag
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-ring
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-ring2
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: larger-than-life-batch
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: mmapped
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: no-blt
>   * Feature: cmd_submission
> @@ -118,19 +174,35 @@
>   * Feature: cmd_submission
>   *
>   * SUBTEST: readonly
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: rel-constants-invalid
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: rel-constants-invalid-rel-gen5
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: rel-constants-invalid-ring
>   * Feature: cmd_submission
>   *
>   * SUBTEST: rs-invalid
> + * Category: Desktop client
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: rsvd2-dirt
>   * Feature: cmd_submission
> @@ -145,7 +217,11 @@
>   * Feature: cmd_submission
>   *
>   * SUBTEST: sol-reset-not-gen7
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   */
>  
>  #define ALIGNMENT (1 << 22)
> diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> index d17d07893f07..d3de0371ee80 100644
> --- a/tests/i915/gem_exec_schedule.c
> +++ b/tests/i915/gem_exec_schedule.c
> @@ -48,84 +48,157 @@
>   * TEST: gem exec schedule
>   * Description: Check that we can control the order of execution
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: deep
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: fairslice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: fairslice-all
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: fifo
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: implicit-boths
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: implicit-read-write
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: implicit-write-read
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: in-order
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: independent
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: lateslice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: manyslice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: noreorder
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: noreorder-corked
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: noreorder-priority
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: out-order
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: pi-common
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: pi-distinct-iova
>   * Feature: cmd_submission
>   *
>   * SUBTEST: pi-ringfull
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: pi-shared-iova
>   * Feature: cmd_submission
>   *
>   * SUBTEST: pi-userfault
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: preempt
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: preempt-contexts
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: preempt-engines
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: preempt-hang
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: preempt-other
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: preempt-other-chain
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: preempt-queue
>   * Feature: cmd_submission, multictx
> @@ -140,91 +213,172 @@
>   * Feature: cmd_submission, multictx
>   *
>   * SUBTEST: preempt-self
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: preempt-user
> + * Category: Desktop \ Server
>   * Feature: cmd_submission, multictx
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: preemptive-hang
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: promotion
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: reorder-wide
>   * Feature: cmd_submission
>   *
>   * SUBTEST: semaphore-codependency
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: semaphore-noskip
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: semaphore-power
>   * Feature: cmd_submission
>   *
>   * SUBTEST: semaphore-resolve
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: semaphore-user
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: smoketest
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: smoketest-all
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: submit-early-slice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: submit-golden-slice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: submit-late-slice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: thriceslice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: timeslicing
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: u-fairslice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: u-fairslice-all
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: u-independent
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: u-lateslice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: u-semaphore-codependency
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: u-semaphore-noskip
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: u-semaphore-resolve
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: u-semaphore-user
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: u-submit-early-slice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: u-submit-golden-slice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: u-submit-late-slice
> + * Category: Desktop \ Server
>   * Feature: cmd_submission
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: wide
> + * Category: Infrastructure
>   * Feature: cmd_submission
> + * Functionality: coherency
> + * Sub-category: HW
>   */
>  
>  #define LO 0
> diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
> index 19c1a060e3b0..378691d35953 100644
> --- a/tests/i915/gem_exec_store.c
> +++ b/tests/i915/gem_exec_store.c
> @@ -36,24 +36,36 @@
>  #include "igt_gt.h"
>  /**
>   * TEST: gem exec store
> + * Category: Infrastructure
>   * Description: Exercise store dword functionality using execbuf-ioctl
>   * Feature: cmd_submission
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> - * Description: Verify that all capable engines can store dwords to a common buffer object
> + * Description:
> + *   Verify that all capable engines can store dwords to a common buffer object.
> + *   Coherency
> + * Functionality: buffer management
>   * Run type: BAT
> + * Sub-category: HW
>   *
>   * SUBTEST: cachelines
>   * Description: Verify that each capable engine can store a dword to different cachelines of a buffer object
> + * Functionality: coherency
>   * Run type: FULL
> + * Sub-category: HW
>   *
>   * SUBTEST: dword
>   * Description: Verify that each capable engine can store a dword to a buffer object
> + * Functionality: coherency
>   * Run type: FULL
> + * Sub-category: HW
>   *
>   * SUBTEST: pages
>   * Description: Verify that each capable engine can store a dword to various page-sized buffer objects
> + * Functionality: security
>   * Run type: FULL
> + * Sub-category: i915
>   */
>  
>  IGT_TEST_DESCRIPTION("Exercise store dword functionality using execbuf-ioctl");
> diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
> index 3a1ca995c9c5..c88147a44ce9 100644
> --- a/tests/i915/gem_exec_whisper.c
> +++ b/tests/i915/gem_exec_whisper.c
> @@ -41,54 +41,121 @@
>   * TEST: gem exec whisper
>   * Feature: cmd_submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-contexts
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-contexts-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-contexts-forked
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-contexts-forked-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-contexts-priority
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-contexts-priority-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-fds
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-fds-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-fds-forked
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-fds-forked-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-fds-priority
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-fds-priority-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-forked
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-forked-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-normal
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-normal-all
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-queues
> + * Category: Infrastructure
> + * Functionality: command submission
>   *
>   * SUBTEST: basic-queues-all
> + * Category: Infrastructure
> + * Functionality: command submission
>   *
>   * SUBTEST: basic-queues-forked
> + * Category: Infrastructure
> + * Functionality: command submission
>   *
>   * SUBTEST: basic-queues-forked-all
> + * Category: Infrastructure
> + * Functionality: command submission
>   *
>   * SUBTEST: basic-queues-priority
> + * Category: Infrastructure
> + * Functionality: command submission
>   *
>   * SUBTEST: basic-queues-priority-all
> + * Category: Infrastructure
> + * Functionality: command submission
>   *
>   * SUBTEST: basic-sync
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-sync-all
> + * Category: Desktop client
> + * Functionality: buffer management
> + * Sub-category: DRM
>   *
>   * SUBTEST: chain
>   *
> diff --git a/tests/i915/gem_exercise_blt.c b/tests/i915/gem_exercise_blt.c
> index af86d5edc2ab..336bcdbfa1aa 100644
> --- a/tests/i915/gem_exercise_blt.c
> +++ b/tests/i915/gem_exercise_blt.c
> @@ -15,12 +15,17 @@
>   * Description: Exercise blitter commands
>   * Feature: blitter
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: fast-copy
> - * Description: Check fast-copy blit
> + * Description:
> + *   Check fast-copy blit
> + *   blitter
>   *
>   * SUBTEST: fast-copy-emit
> + * Category: Desktop client
>   * Description: Check multiple fast-copy in one batch
> + * Functionality: buffer management
>   */
>  
>  IGT_TEST_DESCRIPTION("Exercise blitter commands");
> diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
> index 7feabf61a303..56daf4b1019d 100644
> --- a/tests/i915/gem_flink_basic.c
> +++ b/tests/i915/gem_flink_basic.c
> @@ -40,24 +40,42 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem flink basic
> + * Category: Desktop client
>   * Description: Tests for flink - a way to export a gem object by name
>   * Feature: xorg_dri2
> - * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: bad-flink
>   * Description: Verify that GEM_FLINK ioctl with invalid gem object fails.
> + * Functionality: buffer management
> + * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: bad-open
>   * Description: Verify that GEM_OPEN ioctl with invalid flink name fails.
> + * Functionality: buffer management
> + * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
>   * Description: Check if gem object can be exported to global namespace and then opened.
> + * Functionality: buffer management
> + * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: double-flink
>   * Description: Tests that multiple flinks for the same gem object share the same name.
> + * Functionality: buffer management
> + * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: flink-lifetime
> - * Description: Tests flink lifetime by referencing from multiple descriptors.
> + * Description:
> + *   Tests flink lifetime by referencing from multiple descriptors.
> + *   Buffer Management
> + * Functionality: command submission
> + * Run type: BAT
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests for flink - a way to export a gem object by name");
> diff --git a/tests/i915/gem_flink_race.c b/tests/i915/gem_flink_race.c
> index 5ebf1969b992..7199283b90d8 100644
> --- a/tests/i915/gem_flink_race.c
> +++ b/tests/i915/gem_flink_race.c
> @@ -40,10 +40,17 @@
>   * Description: Check for flink/open vs. gem close races.
>   * Feature: xorg_dri2
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: flink_close
> + * Category: Desktop client
> + * Functionality: buffer management
> + * Sub-category: DRM
>   *
>   * SUBTEST: flink_name
> + * Category: Server
> + * Functionality: command submission
> + * Sub-category: Compute
>   */
>  
>  IGT_TEST_DESCRIPTION("Check for flink/open vs. gem close races.");
> diff --git a/tests/i915/gem_gpgpu_fill.c b/tests/i915/gem_gpgpu_fill.c
> index f350e9fbb6d0..6145f43a79ff 100644
> --- a/tests/i915/gem_gpgpu_fill.c
> +++ b/tests/i915/gem_gpgpu_fill.c
> @@ -52,8 +52,12 @@
>   * TEST: gem gpgpu fill
>   * Feature: compute
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> + * Category: Server
> + * Functionality: command submission
> + * Sub-category: Compute
>   */
>  
>  #define WIDTH 64
> diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
> index 4c3576503ca3..3159dc9f60f5 100644
> --- a/tests/i915/gem_linear_blits.c
> +++ b/tests/i915/gem_linear_blits.c
> @@ -51,20 +51,28 @@
>  #include "i915/i915_blt.h"
>  /**
>   * TEST: gem linear blits
> + * Category: Infrastructure
>   * Description: Test doing many blits with a working set larger than the aperture size.
>   * Feature: blitter
> + * Sub-category: i915
>   *
>   * SUBTEST: basic
>   * Description: Basic blitter functionality check with 2 buffers
> + * Functionality: command submission
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: interruptible
>   * Description: Test with interrupts in between the parent process
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: normal
>   * Description: The intent is to push beyond the working GTT size to force the driver to rebind the buffers
> + * Functionality: Memory Management
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Test doing many blits with a working set larger than the"
> diff --git a/tests/i915/gem_lmem_evict.c b/tests/i915/gem_lmem_evict.c
> index 9a8974b3ce09..7eabd6332ceb 100644
> --- a/tests/i915/gem_lmem_evict.c
> +++ b/tests/i915/gem_lmem_evict.c
> @@ -12,6 +12,7 @@
>   * Description: Force tiny lmem size for easily testing eviction scenarios.
>   * Feature: local_memory
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: dontneed-evict-race
>   * Description: Regression test to verify that madvise will sync against busy dma-resv object for lmem
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index c3be8c53f20f..3206f784d414 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -28,21 +28,31 @@
>   * TEST: gem lmem swapping
>   * Description: Exercise local memory swapping.
>   * Feature: local_memory
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Functionality: buffer management
>   * Run type: BAT
>   *
>   * SUBTEST: heavy-multi
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Functionality: buffer management
>   * Run type: FULL
>   *
>   * SUBTEST: heavy-random
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Functionality: buffer management
>   * Run type: FULL
>   *
>   * SUBTEST: heavy-verify-multi
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Functionality: buffer management
>   * Run type: FULL
>   *
>   * SUBTEST: heavy-verify-multi-ccs
> @@ -50,7 +60,9 @@
>   * Run type: FULL
>   *
>   * SUBTEST: heavy-verify-random
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Functionality: buffer management
>   * Run type: FULL
>   *
>   * SUBTEST: heavy-verify-random-ccs
> @@ -66,19 +78,27 @@
>   * Run type: FULL
>   *
>   * SUBTEST: parallel-multi
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Functionality: buffer management
>   * Run type: FULL
>   *
>   * SUBTEST: parallel-random
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Functionality: buffer management
>   * Run type: FULL
>   *
>   * SUBTEST: parallel-random-engines
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Functionality: buffer management
>   * Run type: BAT
>   *
>   * SUBTEST: parallel-random-verify
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Functionality: buffer management
>   * Run type: FULL
>   *
>   * SUBTEST: parallel-random-verify-ccs
> @@ -86,19 +106,27 @@
>   * Run type: FULL
>   *
>   * SUBTEST: random
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Functionality: buffer management
>   * Run type: FULL
>   *
>   * SUBTEST: random-engines
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Functionality: buffer management
>   * Run type: BAT
>   *
>   * SUBTEST: smem-oom
> + * Category: Server
>   * Description: Exercise local memory swapping during exhausting system memory
> + * Functionality: buffer management
>   * Run type: FULL
>   *
>   * SUBTEST: verify
> + * Category: Server
>   * Description: Exercise local memory swapping to system memory
> + * Functionality: buffer management
>   * Run type: FULL
>   *
>   * SUBTEST: verify-ccs
> @@ -106,7 +134,11 @@
>   * Run type: FULL
>   *
>   * SUBTEST: verify-random
> - * Description: Exercise local memory swapping to system memory
> + * Category: Server
> + * Description:
> + *   Exercise local memory swapping to system memory.
> + *   Buffer Management
> + * Functionality: device management
>   * Run type: BAT
>   *
>   * SUBTEST: verify-random-ccs
> diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
> index 17653cc4ad53..6825240d7a95 100644
> --- a/tests/i915/gem_madvise.c
> +++ b/tests/i915/gem_madvise.c
> @@ -42,22 +42,28 @@
>   * TEST: gem madvise
>   * Description: Checks that the kernel reports EFAULT when trying to use purged bo.
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: dontneed-after-mmap
> + * Category: Desktop client
>   * Description:
>   *   Check signal for Segmentation Fault and bus error after obtaining a purgeable object and
>   *   calling for sighandler.
>   * Feature: caching, mapping
> + * Functionality: buffer management
>   *
>   * SUBTEST: dontneed-before-exec
>   * Description: Check if EXECBUFFER2 reports EFAULT when trying to submit purged bo for GPU.
>   * Feature: caching, gtt, mapping
>   *
>   * SUBTEST: dontneed-before-mmap
> + * Category: Infrastructure
>   * Description:
>   *   Check signal for Segmentation Fault and bus error before obtaining a purgeable object and
>   *   calling for sighandler.
>   * Feature: caching, mapping
> + * Functionality: memory management
>   *
>   * SUBTEST: dontneed-before-pwrite
>   * Description: Check if PWRITE reports EFAULT when trying to use purged bo for write operation.
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index c02ee70e3298..4220660f39be 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -43,36 +43,76 @@
>   * Description: Basic MMAP_OFFSET IOCTL tests for mem regions
>   * Feature: mapping
>   * Run type: FULL
> + * Sub-category: i915
>   *
>   * SUBTEST: bad-extensions
> + * Category: Infrastructure
> + * Functionality: memory management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: bad-flags
> + * Category: Infrastructure
> + * Functionality: memory management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: bad-object
> + * Category: Infrastructure
>   * Description: Verify mapping to invalid gem objects won't be created
> + * Functionality: memory management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-uaf
> + * Category: Infrastructure
>   * Description: Check buffer object mapping persists after gem_close
> + * Functionality: memory management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: blt-coherency
> + * Category: Infrastructure
> + * Functionality: memory management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: clear
> + * Category: Infrastructure
> + * Functionality: memory management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: close-race
> + * Category: Infrastructure
>   * Description: Check race between close and mmap offset between threads
> + * Functionality: memory management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: isolation
> + * Category: Infrastructure
> + * Functionality: memory management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: oob-read
> + * Category: Infrastructure
>   * Description: Check for out-of-bound access in vm_access
> + * Functionality: memory management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: open-flood
> + * Category: Infrastructure
> + * Functionality: memory management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: perf
> + * Category: Infrastructure
> + * Functionality: memory management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: pf-nonblock
> + * Category: Infrastructure
> + * Functionality: memory management
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: ptrace
> + * Category: Infrastructure
> + * Functionality: memory management
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic MMAP_OFFSET IOCTL tests for mem regions\n");
> diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
> index 5e6ef049085b..860fcd2f5cb8 100644
> --- a/tests/i915/gem_pipe_control_store_loop.c
> +++ b/tests/i915/gem_pipe_control_store_loop.c
> @@ -45,15 +45,20 @@
>  #include "igt.h"
>  /**
>   * TEST: gem pipe control store loop
> + * Category: Desktop client
>   * Description: Test (TLB-)Coherency of pipe_control QW writes.
>   * Feature: cmd_submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: fresh-buffer
>   * Description: Checks tlb consistency of the pipe_control with fresh buffer.
> + * Functionality: command submission
>   *
>   * SUBTEST: reused-buffer
>   * Description: Checks tlb consistency of the pipe_control with reused buffer.
> + * Functionality: buffer management
>   */
>  
>  IGT_TEST_DESCRIPTION("Test (TLB-)Coherency of pipe_control QW writes.");
> diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
> index 368f8b17db75..952f00b377e5 100644
> --- a/tests/i915/gem_ppgtt.c
> +++ b/tests/i915/gem_ppgtt.c
> @@ -50,15 +50,23 @@
>   * Feature: mapping
>   *
>   * SUBTEST: flink-and-close-vma-leak
> + * Category: Infrastructure
>   * Feature: mapping, xorg_dri2
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: shrink-vs-evict-any
>   * Description: Regression test to verify GTT eviction can't randomly fail due to object lock contention
>   * Feature: mapping
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: shrink-vs-evict-pinned
> + * Category: Infrastructure
>   * Description: Regression test to verify GTT eviction can't randomly fail due to object lock contention
>   * Feature: mapping
> + * Functionality: command submission
> + * Test category: GEM_Legacy
>   */
>  
>  #define WIDTH 512
> diff --git a/tests/i915/gem_request_retire.c b/tests/i915/gem_request_retire.c
> index 9e074706d259..9814b435d937 100644
> --- a/tests/i915/gem_request_retire.c
> +++ b/tests/i915/gem_request_retire.c
> @@ -51,9 +51,13 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem request retire
> + * Category: Infrastructure
>   * Description: Collection of tests targeting request retirement code paths.
>   * Feature: cmd_submission
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: retire-vma-not-inactive
>   */
> diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> index 576e35ea84a0..80d3f5bbc266 100644
> --- a/tests/i915/gem_ringfill.c
> +++ b/tests/i915/gem_ringfill.c
> @@ -43,14 +43,20 @@
>  #include <sys/ioctl.h>
>  /**
>   * TEST: gem ringfill
> + * Category: Desktop client
>   * Description:
>   *   Exercise many tiny batchbuffer operations, in the hope of catching failure to manage the ring
>   *   properly near full.
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-all
> - * Description: Basic check to fill the ring upto maximum on all engines simultaneously.
> + * Description:
> + *   Basic check to fill the ring upto maximum on all engines simultaneously.
> + *   Buffer Management
>   * Feature: cmd_submission
> + * Functionality: semaphore
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: engines-S3
>   * Description: Handle a full ring across suspend cycle.
> @@ -65,7 +71,9 @@
>   * SUBTEST: engines-basic
>   * Description: Basic check how the driver handles a full ring.
>   * Feature: cmd_submission, multitile
> + * Functionality: Test spamming ring with contexts - legacy path
>   * Run type: FULL
> + * Test category: MultiTile
>   *
>   * SUBTEST: engines-bomb
>   * Description:
> @@ -112,9 +120,13 @@
>   * Run type: FULL
>   *
>   * SUBTEST: legacy-basic
> - * Description: Basic check how the driver handles a full ring - on legacy ring.
> + * Description:
> + *   Basic check how the driver handles a full ring - on legacy ring.
> + *   Exercise all physical engine selection and legacy rings
>   * Feature: cmd_submission, multitile
> + * Functionality: buffer management
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: legacy-bomb
>   * Description:
> diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
> index a65792c84137..83e7a709b119 100644
> --- a/tests/i915/gem_shrink.c
> +++ b/tests/i915/gem_shrink.c
> @@ -139,6 +139,10 @@
>   * SUBTEST: pwrite-userptr-dirty
>   *
>   * SUBTEST: reclaim
> + * Category: Infrastructure
> + * Functionality: command submission
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   */
>  
>  #ifndef MADV_FREE
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> index 8365c5c83644..fff7276ff994 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -33,116 +33,206 @@
>  #include "intel_allocator.h"
>  /**
>   * TEST: gem softpin
> + * Category: Infrastructure
>   * Description:
>   *   Tests softpin feature with normal usage, invalid inputs scenarios and couple of eviction
>   *   tests which copy buffers between CPU and GPU.
> - * Feature: mapping
>   *
>   * SUBTEST: 32b-excludes-last-page
>   * Description: Check the last 32b page is excluded.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-basic
>   * Description: Check that we can place objects at start/end of the GTT using the allocator.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-basic-reserve
> - * Description: Check that if we can reserve a space for an object starting from a given offset.
> + * Description:
> + *   Check that if we can reserve a space for an object starting from a given offset.
> + *   Command Submission
------- ^
> + * Feature: mapping
> + * Functionality: s2idle w/o i915
-------------------- ^
?

>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-evict
>   * Description: Exercise eviction with softpinning.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-fork
>   * Description: Check if multiple processes can use alloctor.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-nopin
>   * Description: Check that we can combine manual placement with automatic GTT placement.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: allocator-nopin-reserve
>   * Description:
>   *   Check that we can combine manual placement with automatic GTT placement and
>   *   reserves/unreserves space for objects.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-active
>   * Description: Check eviction with active bo.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-active-interruptible
>   * Description: Check eviction with active bo with interrupts.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-hang
>   * Description: Check eviction of softpinned bo with hung batch.
> + * Feature: mapping
>   * Run type: FULL
>   *
>   * SUBTEST: evict-prime
>   * Description: Check eviction of vma on importing prime fd in reopened drm fds
> + * Feature: mapping
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-prime-sanity-check
>   * Description: Check eviction of vma on importing prime fd in reopened drm fd in single thread
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-single-offset
>   * Description: Use same offset for all engines and for different handles.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: evict-snoop
>   * Description: Check eviction against snooping.
> + * Feature: mapping
>   * Run type: FULL
>   *
>   * SUBTEST: evict-snoop-interruptible
>   * Description: Check eviction against snooping with interrupts.
> + * Feature: mapping
>   * Run type: FULL
>   *
>   * SUBTEST: full
>   * Description: Check the total occupancy by using pad-to-size to fill the entire GTT.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid
>   * Description: Check that invalid inputs are handled correctly.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: noreloc
>   * Description: Check that noreloc support works.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: noreloc-S3
>   * Description: Check noreloc survives after suspend to RAM/resume cycle.
> + * Feature: mapping
>   * Run type: FULL
>   *
>   * SUBTEST: noreloc-S4
>   * Description: Check noreloc survives after suspend to disk/resume cycle.
> + * Feature: mapping
>   * Run type: FULL
>   *
>   * SUBTEST: noreloc-interruptible
>   * Description: Check noreloc support with interruptible.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: overlap
>   * Description: Check all the possible pages aligned overlaps.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: reverse
>   * Description: Check that if the user demands the vma will be swapped.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: safe-alignment
> - * Description: Check start offset and alignment detection.
> + * Description:
> + *   Check start offset and alignment detection.
> + *   Command Submission
> + * Feature: mapping
> + * Functionality: pagefault
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: softpin
>   * Description: Check softpinning of a gem buffer object.
> + * Feature: mapping
> + * Functionality: command submission
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: zero
>   * Description: Check full placement control under full-ppGTT.
> + * Feature: mapping
> + * Functionality: dummy workload
>   * Run type: FULL
> + * Sub-category: IGT Lib
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests softpin feature with normal usage, invalid inputs"
> diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
> index 0a6c088da630..1ca4bd865a9c 100644
> --- a/tests/i915/gem_spin_batch.c
> +++ b/tests/i915/gem_spin_batch.c
> @@ -27,43 +27,69 @@
>  #include "igt.h"
>  /**
>   * TEST: gem spin batch
> + * Category: Infrastructure
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines
>   * Feature: context, igt_core
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: legacy
>   * Feature: context, igt_core
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: legacy-resubmit
>   * Feature: context, igt_core
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: legacy-resubmit-new
>   * Feature: context, igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: resubmit
>   * Feature: context, igt_core
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: resubmit-all
>   * Feature: context, igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: resubmit-new
>   * Feature: context, igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: resubmit-new-all
>   * Feature: context, igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: spin-all
>   * Feature: igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: spin-all-new
>   * Feature: igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: spin-each
>   * Feature: igt_core, multictx
> + * Functionality: dummy workload
> + * Sub-category: IGT Lib
>   *
>   * SUBTEST: user-each
>   * Feature: igt_core, multictx
> + * Functionality: semaphore
> + * Sub-category: i915
>   */
>  
>  #define MAX_ERROR 5 /* % */
> diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> index 1c7e51a92bfa..a2d225ab9679 100644
> --- a/tests/i915/gem_sync.c
> +++ b/tests/i915/gem_sync.c
> @@ -57,29 +57,51 @@
>   * Run type: FULL
>   *
>   * SUBTEST: basic-all
> + * Category: Infrastructure
>   * Description: Basic test to wait upon a batch on all rings.
>   * Feature: synchronization
> + * Functionality: semaphore
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-each
> - * Description: Check synchronisation of ring.
> + * Description:
> + *   Check synchronisation of ring.
> + *   Basic check of ring to ring write synchronisation
------- ^
Additional description line ?

>   * Feature: multitile, synchronization
> + * Functionality: semaphore
>   * Run type: BAT
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-many-each
> - * Description: Create race condition and see if we can catch interrupts.
> + * Category: Infrastructure
> + * Description:
> + *   Create race condition and see if we can catch interrupts.
> + *   Basic check for explicit fence with async wait on each engine.
------- ^
Same here.

>   * Feature: multitile, synchronization
> + * Functionality: semaphore
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-store-all
> + * Category: Infrastructure
>   * Description: Basic version of store synchronisation test.
>   * Feature: synchronization
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: i915
> + * Test category: MultiTile
>   *
>   * SUBTEST: basic-store-each
> - * Description: Check that store synchronisation works.
> + * Category: Infrastructure
> + * Description:
> + *   Check that store synchronisation works.
> + *   Check in-fence is not overwritten with out-fence on each engine
------- ^
Same here.

>   * Feature: multitile, synchronization
> + * Functionality: buffer management
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: default
>   * Description: Check synchronisation of rings on each engine.
> diff --git a/tests/i915/gem_unref_active_buffers.c b/tests/i915/gem_unref_active_buffers.c
> index 90a63e8f9acf..b2d9a96cdc97 100644
> --- a/tests/i915/gem_unref_active_buffers.c
> +++ b/tests/i915/gem_unref_active_buffers.c
> @@ -43,9 +43,13 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem unref active buffers
> + * Category: Server
>   * Description: Test unreferencing of active buffers.
>   * Feature: cmd_submission
> + * Functionality: buffer management
>   * Run type: FULL
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST:
>   */
> diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> index ad85c0d96c07..ce9098149a7e 100644
> --- a/tests/i915/gem_userptr_blits.c
> +++ b/tests/i915/gem_userptr_blits.c
> @@ -81,7 +81,11 @@
>   * Feature: userptr
>   *
>   * SUBTEST: create-destroy-sync
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: create-destroy-unsync
>   * Feature: userptr
> @@ -195,17 +199,29 @@
>   * Feature: userptr
>   *
>   * SUBTEST: huge-split
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: input-checking
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-mmap-offset-unsync
>   * Description: Verify unsynchronized userptr on mmap-offset mappings fails
>   * Feature: userptr
>   *
>   * SUBTEST: invalid-null-pointer
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: major-normal-sync
>   * Feature: userptr
> @@ -260,14 +276,26 @@
>   * Feature: userptr
>   *
>   * SUBTEST: mmap-offset-banned
> + * Category: Server
>   * Description: Verify mmap_offset to userptr is banned
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: nohangcheck
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: probe
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: process-exit
>   * Feature: userptr
> @@ -285,22 +313,46 @@
>   * Feature: userptr
>   *
>   * SUBTEST: sd-probe
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: set-cache-level
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: stress-mm
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: stress-mm-invalidate-close
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: stress-mm-invalidate-close-overlap
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: stress-purge
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: swapping-normal-sync
>   * Feature: userptr
> @@ -315,16 +367,32 @@
>   * Feature: userptr
>   *
>   * SUBTEST: sync-overlap
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sync-unmap
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sync-unmap-after-close
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sync-unmap-cycles
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: unsync-overlap
>   * Feature: userptr
> @@ -339,13 +407,21 @@
>   * Feature: userptr
>   *
>   * SUBTEST: usage-restrictions
> + * Category: Server
>   * Feature: userptr
> + * Functionality: buffer management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: userfault
>   * Feature: userptr
>   *
>   * SUBTEST: vma-merge
> + * Category: Server
>   * Feature: userptr
> + * Functionality: context management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   */
>  
>  #ifndef PAGE_SIZE
> diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
> index 9f36e405bff5..3c806482d0f5 100644
> --- a/tests/i915/gem_vm_create.c
> +++ b/tests/i915/gem_vm_create.c
> @@ -32,19 +32,39 @@
>   * Run type: FULL
>   *
>   * SUBTEST: create-ext
> + * Category: Server
>   * Feature: mapping
> + * Functionality: context management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: execbuf
> + * Category: Server
>   * Feature: cmd_submission, mapping
> + * Functionality: context management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-create
> + * Category: Server
>   * Feature: mapping
> + * Functionality: context management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-destroy
> + * Category: Server
>   * Feature: mapping
> + * Functionality: context management
> + * Sub-category: Compute
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: isolation
> + * Category: Infrastructure
>   * Feature: context, mapping
> + * Functionality: semaphore
> + * Sub-category: i915
> + * Test category: USM
>   */
>  
>  static int vm_create_ioctl(int i915, struct drm_i915_gem_vm_control *ctl)
> diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
> index 874ccd87eee3..37a6cbaa4720 100644
> --- a/tests/i915/gem_wait.c
> +++ b/tests/i915/gem_wait.c
> @@ -35,14 +35,21 @@
>   * TEST: gem wait
>   * Description: Tests the GEM_WAIT ioctl
>   * Feature: synchronization
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: await
> + * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in await mode.
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
>   *
>   * SUBTEST: busy
> + * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in busy mode.
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
>   *
>   * SUBTEST: hang-busy
>   * Description: Verify GEM_WAIT functionality in busy mode, when hang is allowed.
> @@ -61,24 +68,39 @@
>   * Run type: FULL
>   *
>   * SUBTEST: invalid-buf
> + * Category: Infrastructure
>   * Description: Verify that GEM_WAIT called with invalid buffer object will fail.
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
>   *
>   * SUBTEST: invalid-flags
> + * Category: Infrastructure
>   * Description: Verify that GEM_WAIT called with invalid flag will fail.
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
>   *
>   * SUBTEST: wait
> + * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in wait mode.
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
>   *
>   * SUBTEST: write-busy
> + * Category: Infrastructure
>   * Description: Verify GEM_WAIT functionality in write-busy mode.
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: i915
>   *
>   * SUBTEST: write-wait
> + * Category: Server
>   * Description: Verify GEM_WAIT functionality in write-wait mode.
> + * Functionality: semaphore
>   * Run type: FULL
> + * Sub-category: Compute
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests the GEM_WAIT ioctl");
> diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
> index fd3b83b5a7e6..b1a9a54da120 100644
> --- a/tests/i915/gem_workarounds.c
> +++ b/tests/i915/gem_workarounds.c
> @@ -34,16 +34,26 @@
>  #include "igt_types.h"
>  /**
>   * TEST: gem workarounds
> + * Category: Infrastructure
>   * Run type: FULL
>   *
>   * SUBTEST: basic-read
>   * Feature: workarounds
> + * Functionality: context management
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-read-context
>   * Feature: workarounds
> + * Functionality: context management
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-read-fd
>   * Feature: workarounds
> + * Functionality: context management
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hibernate-resume
>   * Feature: hibernate, workarounds
> @@ -56,21 +66,42 @@
>   *
>   * SUBTEST: reset
>   * Feature: workarounds
> + * Functionality: context management
> + * Sub-category: HW
> + * Test category: USM
>   *
>   * SUBTEST: reset-context
>   * Feature: workarounds
> + * Functionality: context management
> + * Sub-category: HW
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: reset-fd
>   * Feature: workarounds
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: suspend-resume
> - * Feature: suspend, workarounds
> + * Feature:
> + *   suspend, workarounds
> + *   suspend
------- ^
repeated

> + * Functionality: Test to verify gem WA registers during suspend-resume
> + * Test category: suspend
>   *
>   * SUBTEST: suspend-resume-context
> - * Feature: suspend, workarounds
> + * Feature:
> + *   suspend, workarounds
> + *   suspend
------- ^
Same here

> + * Functionality: Test to verify gem WA registers during suspend-resume
> + * Test category: suspend
>   *
>   * SUBTEST: suspend-resume-fd
> - * Feature: suspend, workarounds
> + * Feature:
> + *   suspend, workarounds
> + *   suspend
------- ^
Same here

> + * Functionality: Test debugfs behavior during suspend to idle
> + * Test category: suspend
>   */
>  
>  #define PAGE_SIZE 4096
> diff --git a/tests/i915/i915_getparams_basic.c b/tests/i915/i915_getparams_basic.c
> index e026aad565ff..26fa4ffff883 100644
> --- a/tests/i915/i915_getparams_basic.c
> +++ b/tests/i915/i915_getparams_basic.c
> @@ -35,12 +35,19 @@
>   * Description: Tests the export of parameters via DRM_IOCTL_I915_GETPARAM
>   * Feature: gem_core
>   * Run type: BAT
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-eu-total
> + * Category: Infrastructure
>   * Description: Examine the export of EU_TOTAL parameter
> + * Functionality: device topology
> + * Sub-category: i915
>   *
>   * SUBTEST: basic-subslice-total
> + * Category: Server
>   * Description: Examine the export of SUBSLICE_TOTAL parameter
> + * Functionality: error detection
> + * Sub-category: debugger
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests the export of parameters via DRM_IOCTL_I915_GETPARAM\n");
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index ef45b25adacd..11bab9e0fbd2 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -44,42 +44,84 @@
>   * TEST: i915 hangman
>   * Description: Tests for hang detection and recovery
>   * Feature: reset
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: detector
> - * Description: Check that hang detector works
> + * Category: Server
> + * Description:
> + *   Check that hang detector works.
> + *   Error Detection
------- ^
> + * Functionality: error handling
>   * Run type: FULL
> + * Sub-category: debugger
------------------- ^
Not sure but maybe "Error detection" is proper ?

>   *
>   * SUBTEST: engine-engine-error
> - * Description: Per engine hang recovery (invalid CS, engine reset)
> + * Category: Server
> + * Description:
> + *   Per engine hang recovery (invalid CS, engine reset).
> + *   Error Detection
> + * Functionality: error handling
>   * Run type: FULL
> + * Sub-category: debugger

Same here.

>   *
>   * SUBTEST: engine-engine-hang
> + * Category: Server
>   * Description: Per engine hang recovery (spin, engine reset)
> + * Functionality: error detection
>   * Run type: FULL
> + * Sub-category: debugger

Same here.

>   *
>   * SUBTEST: engine-error-state-capture
> - * Description: Per engine error capture (engine reset)
> + * Category: Server
> + * Description:
> + *   Per engine error capture (engine reset).
> + *   Error Detection
> + * Functionality: error handling
>   * Run type: FULL
> + * Sub-category: debugger
>   *
>   * SUBTEST: error-state-basic
> - * Description: Basic error capture
> + * Category: Server
> + * Description:
> + *   Basic error capture.
> + *   Error Detection
> + * Functionality: buffer management
>   * Run type: BAT
> + * Sub-category: debugger

Same here.

>   *
>   * SUBTEST: gt-engine-error
> - * Description: Per engine hang recovery (invalid CS, GT reset)
> + * Category: Server
> + * Description:
> + *   Per engine hang recovery (invalid CS, GT reset).
> + *   Error Detection
> + * Functionality: error handling
>   * Run type: FULL
> + * Sub-category: debugger

Same here.

>   *
>   * SUBTEST: gt-engine-hang
> - * Description: Per engine hang recovery (spin, GT reset)
> + * Category: Server
> + * Description:
> + *   Per engine hang recovery (spin, GT reset).
> + *   Error Detection
> + * Functionality: command submission
>   * Run type: FULL

Same here.

> + * Sub-category: debugger
>   *
>   * SUBTEST: gt-error-state-capture
> - * Description: Per engine error capture (GT reset)
> + * Category: Server
> + * Description:
> + *   Per engine error capture (GT reset).
> + *   Error Detection
> + * Functionality: error handling
>   * Run type: FULL
> + * Sub-category: debugger
>   *
>   * SUBTEST: hangcheck-unterminated
> + * Category: Infrastructure
>   * Description: Check that executing unintialised memory causes a hang
> + * Functionality: driver handler
>   * Run type: FULL
> + * Sub-category: i915
------------------- ^
Error detection ?

>   */
>  
>  #ifndef I915_PARAM_CMD_PARSER_VERSION
> diff --git a/tests/i915/i915_hwmon.c b/tests/i915/i915_hwmon.c
> index 6d1334172c40..279f6821b0da 100644
> --- a/tests/i915/i915_hwmon.c
> +++ b/tests/i915/i915_hwmon.c
> @@ -13,6 +13,7 @@
>   * Description: Tests for i915 hwmon
>   * Feature: hwmon
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hwmon-read
>   * Description: Verify we can read all hwmon attributes
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> index ae4e01ef18bc..85cf5c10e9e2 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -25,17 +25,25 @@
>  #include <sys/utsname.h>
>  /**
>   * TEST: i915 module load
> + * Category: Infrastructure
>   * Description: Tests the i915 module loading.
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: load
> - * Description: Check if i915 and friends are not yet loaded, then load them.
> + * Description:
> + *   Check if i915 and friends are not yet loaded, then load them.
> + *   Driver handler
------- ^

>   * Feature: core
> + * Functionality: error detection
-------------------- ^
"device management" from below ?

>   * Run type: BAT
> + * Sub-category: i915
>   *
>   * SUBTEST: reload
>   * Description: Verify the basic functionality of i915 driver after it's reloaded.
>   * Feature: core, sriov-core
> + * Functionality: device management
>   * Run type: BAT
> + * Sub-category: i915
>   *
>   * SUBTEST: reload-no-display
>   * Description: Verify that i915 driver can be successfully loaded with disabled display.
> @@ -45,7 +53,9 @@
>   * SUBTEST: reload-with-fault-injection
>   * Description: Verify that i915 driver can be successfully reloaded at least once with fault injection.
>   * Feature: core, sriov-core
> + * Functionality: device management
>   * Run type: FULL
> + * Sub-category: Sriov
>   *
>   * SUBTEST: resize-bar
>   * Description: Check whether lmem bar size can be resized to only supported sizes.
> diff --git a/tests/i915/i915_pciid.c b/tests/i915/i915_pciid.c
> index ae3d2a09d208..6ad96fe3e741 100644
> --- a/tests/i915/i915_pciid.c
> +++ b/tests/i915/i915_pciid.c
> @@ -30,11 +30,16 @@
>  #include "intel_chipset.h"
>  /**
>   * TEST: i915 pciid
> + * Category: Infrastructure
>   * Description: Check that igt/i915 know about this PCI-ID
>   * Feature: core
> + * Functionality: driver handler
>   * Run type: BAT
> + * Sub-category: i915
> + * Test category: frequency
-------------------- ^
?

>   *
>   * SUBTEST:
> + * Description: Device Topology
>   */
>  
>  IGT_TEST_DESCRIPTION("Check that igt/i915 know about this PCI-ID");
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index d9b4cbbfe615..a4bf5f915aec 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -42,9 +42,14 @@
>  #include <sys/stat.h>
>  /**
>   * TEST: i915 pm rpm
> + * Functionality: permission management for clients
> + * Test category: frequency
>   *
>   * SUBTEST: basic-pci-d3-state
> - * Feature: pm_rpm
> + * Description: frequency scale factor tests - verify GPU freq changes
> + * Feature:
> + *   pm_rpm
> + *   frequency
>   * Run type: BAT
>   *
>   * SUBTEST: basic-rte
> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
> index 050d68a16559..90d7253a31ee 100644
> --- a/tests/i915/i915_pm_rps.c
> +++ b/tests/i915/i915_pm_rps.c
> @@ -52,13 +52,21 @@
>   *
>   * SUBTEST: engine-order
>   * Description: Check if context reuse does not affect waitboosting
> - * Feature: pm_rps
> + * Feature:
> + *   pm_rps
> + *   pm_rps
> + * Functionality: Render P-States tests - verify GPU frequency changes
>   * Run type: FULL
> + * Test category: pm_rps
>   *
>   * SUBTEST: fence-order
>   * Description: Check if the order of fences does not affect waitboosting
> - * Feature: pm_rps, synchronization
> + * Feature:
> + *   pm_rps, synchronization
> + *   suspend
> + * Functionality: Verify context isolation preservation during S3
>   * Run type: FULL
> + * Test category: suspend
>   *
>   * SUBTEST: min-max-config-idle
>   * Feature: pm_rps
> diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
> index 383c212d2807..6a58751af8b0 100644
> --- a/tests/i915/i915_power.c
> +++ b/tests/i915/i915_power.c
> @@ -9,9 +9,12 @@
>  #include "igt_sysfs.h"
>  /**
>   * TEST: i915 power
> + * Category: Infrastructure
>   * Description: i915 power measurement tests
>   * Feature: hwmon
> + * Functionality: device topology
-------------------- ^
?

>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: sanity
>   * Description: Sanity check gpu power measurement
> diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
> index 10c6d43fa7fc..0cec8c8cada3 100644
> --- a/tests/i915/i915_query.c
> +++ b/tests/i915/i915_query.c
> @@ -33,28 +33,52 @@
>   * Run type: FULL
>   *
>   * SUBTEST: engine-info
> + * Category: Infrastructure
>   * Description: Positive tests for DRM_I915_QUERY_ENGINE_INFO
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: engine-info-invalid
> + * Category: Infrastructure
>   * Description: Negative tests for DRM_I915_QUERY_ENGINE_INFO
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: hwconfig_table
> + * Category: Infrastructure
>   * Description: Test DRM_I915_QUERY_HWCONFIG_BLOB query
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-garbage
> + * Category: Infrastructure
>   * Description: Test response to an invalid query call
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-regions-garbage-items
> + * Category: Infrastructure
>   * Description: Dodgy returned data tests for DRM_I915_QUERY_MEMORY_REGIONS
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-regions-sanity-check
> + * Category: Infrastructure
>   * Description: Basic tests for DRM_I915_QUERY_MEMORY_REGIONS
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-regions-unallocated
>   * Description: Sanity check the region unallocated tracking
> @@ -65,12 +89,22 @@
>   * Feature: gem_core
>   *
>   * SUBTEST: query-topology-garbage-items
> + * Category: Infrastructure
>   * Description: Test response to invalid DRM_I915_QUERY_TOPOLOGY_INFO query
>   * Feature: gem_core
> + * Functionality: device topology
> + * Sub-category: i915
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-topology-kernel-writes
> - * Description: Guardband test for DRM_I915_QUERY_TOPOLOGY_INFO query
> + * Category: Server
> + * Description:
> + *   Guardband test for DRM_I915_QUERY_TOPOLOGY_INFO query.
> + *   Offline error capture checks
>   * Feature: gem_core
> + * Functionality: offline debugging
> + * Sub-category: Debugger
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: query-topology-known-pci-ids
>   * Description:
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> index 1164d303e06c..a8356506e43f 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -48,18 +48,32 @@
>   * TEST: i915 suspend
>   *
>   * SUBTEST: basic-s2idle-without-i915
> - * Description: Validate suspend-to-idle without i915 module
> - * Feature: suspend
> + * Description:
> + *   Validate suspend-to-idle without i915 module.
> + *   Validate S3 state without i915 module
------- ^
Mixed from next subtest.

> + * Feature:
> + *   suspend
> + *   suspend
------- ^
Repeated from next one ?

> + * Functionality: s3 w/o i915
>   * Run type: BAT
> + * Test category: suspend
>   *
>   * SUBTEST: basic-s3-without-i915
>   * Description: Validate S3 without i915 module
> - * Feature: suspend
> + * Feature:
> + *   suspend
> + *   pm_rps
> + * Functionality: Render P-States tests - verify GPU frequency changes
-------------------- ^
Looks like description

>   * Run type: BAT
> + * Test category: pm_rps
>   *
>   * SUBTEST: debugfs-reader
> - * Feature: suspend
> + * Feature:
> + *   suspend
> + *   suspend

Same here.

> + * Functionality: Test to prevent GT from suspend by opening forcewake handle
>   * Run type: FULL
> + * Test category: suspend
>   *
>   * SUBTEST: debugfs-reader-hibernate
>   * Feature: suspend
> @@ -82,8 +96,12 @@
>   * Run type: FULL
>   *
>   * SUBTEST: forcewake
> - * Feature: suspend
> + * Feature:
> + *   suspend
> + *   suspend

Same here.

> + * Functionality: Test sysfs behavior during suspend to idle
-------------------- ^
Looks like description

>   * Run type: FULL
> + * Test category: suspend
>   *
>   * SUBTEST: forcewake-hibernate
>   * Feature: suspend
> @@ -94,8 +112,12 @@
>   * Run type: FULL
>   *
>   * SUBTEST: sysfs-reader
> - * Feature: suspend
> + * Feature:
> + *   suspend
> + *   rps, rc6
> + * Functionality: Basic i915 driver module selftests
-------------------- ^
Looks like description

>   * Run type: FULL
> + * Test category: rps, rc6
>   *
>   * SUBTEST: sysfs-reader-hibernate
>   * Feature: suspend
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 40decc9cf396..f34028d31266 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -51,21 +51,48 @@
>   * Run type: FULL
>   *
>   * SUBTEST: blocking
> - * Description: Test blocking read with default hrtimer frequency
> - * Feature: oa
> + * Description:
> + *   Test blocking read with default hrtimer frequency.
> + *   Test the i915 pmu perf interface
------- ^
?

> + * Feature:
> + *   oa
> + *   i915 pmu perf interface
> + * Functionality: Test blocking read with different hrtimer frequencies
-------------------- ^
Looks like description

> + * Test category: Perf
>   *
>   * SUBTEST: blocking-parameterized
> - * Description: Test blocking read with different hrtimer frequencies
> - * Feature: oa
> + * Description:
> + *   Test blocking read with different hrtimer frequencies.
> + *   Test polled read with different hrtimer frequencies
------- ^
?

> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test the i915 perf metrics streaming interface
> + * Test category: Perf
>   *
>   * SUBTEST: buffer-fill
> - * Feature: oa
> + * Description: Test blocking read with default hrtimer frequency

Maybe it should be checked by Ashutosh or Umesh ?

> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Unmap buffer, close fd and try to access
-------------------- ^
Looks like description, it looks like below description leaked into
functionality ?

> + * Test category: Perf
>   *
>   * SUBTEST: create-destroy-userspace-config
> - * Feature: oa
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test the i915 perf metrics streaming interface
> + * Test category: Perf
>   *
>   * SUBTEST: disabled-read-error
> - * Feature: oa
> + * Category: Verify blocking read of EU stall data during a workload run
> + * Description: Test OA TLB invalidate
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Verify blocking read of EU stall data during a workload run
> + * Test category: EU_Stall
>   *
>   * SUBTEST: enable-disable
>   * Feature: oa
> @@ -83,8 +110,14 @@
>   * Feature: oa
>   *
>   * SUBTEST: gen12-invalid-class-instance
> - * Description: Verify invalid class instance
> - * Feature: oa
> + * Description:
> + *   Verify invalid class instance.
> + *   Test to ensure gpu is busy when there a workload by reading engine busyness pmu counters
> + * Feature:
> + *   oa
> + *   i915 pmu perf interface
> + * Functionality: Test OA TLB invalidate
> + * Test category: Perf
>   *
>   * SUBTEST: gen12-mi-rpc
>   * Description: Test MI REPORT PERF COUNT for Gen 12
> @@ -92,7 +125,11 @@
>   *
>   * SUBTEST: gen12-oa-tlb-invalidate
>   * Description: Test OA TLB invalidate
> - * Feature: oa
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test the i915 perf metrics streaming interface
> + * Test category: Perf
>   *
>   * SUBTEST: gen12-unprivileged-single-ctx-counters
>   * Description: Measure performance for a specific context using OAR in Gen 12
> @@ -110,84 +147,169 @@
>   * Feature: oa
>   *
>   * SUBTEST: i915-ref-count
> - * Feature: oa
> + * Description: Test the i915 pmu perf interface
> + * Feature:
> + *   oa
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 perf metrics streaming interface
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-create-userspace-config
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Verify invalid mappings of oa buffer
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-oa-exponent
> - * Feature: oa
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test the i915 perf metrics streaming interface
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-oa-format-id
> - * Feature: oa
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test the i915 perf metrics streaming interface
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-oa-metric-set-id
> - * Feature: oa
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test the i915 perf metrics streaming interface
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-open-flags
> - * Feature: oa
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test the i915 perf metrics streaming interface
> + * Test category: Perf
>   *
>   * SUBTEST: invalid-remove-userspace-config
> - * Feature: oa
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test the i915 perf metrics streaming interface
> + * Test category: Perf
>   *
>   * SUBTEST: low-oa-exponent-permissions
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Verify mapping of oa buffer
> + * Test category: Perf
>   *
>   * SUBTEST: mi-rpc
>   * Feature: oa
>   *
>   * SUBTEST: missing-sample-flags
> - * Feature: oa
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test OA buffer for non power of 2 report sizes
> + * Test category: Perf
>   *
>   * SUBTEST: non-sampling-read-error
> - * Feature: oa
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test that reason field in OA reports is never 0 on Gen8+
> + * Test category: Perf
>   *
>   * SUBTEST: non-system-wide-paranoid
>   * Feature: oa
>   *
>   * SUBTEST: non-zero-reason
> - * Description: Test that reason field in OA reports is never 0 on Gen8+
> - * Feature: oa
> + * Description:
> + *   Test that reason field in OA reports is never 0 on Gen8+.
> + *   Setup workload on all engines,measure gt awake time via pmu
> + * Feature:
> + *   oa
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 perf metrics streaming interface
> + * Test category: Perf
>   *
>   * SUBTEST: oa-exponents
>   * Feature: oa
>   *
>   * SUBTEST: oa-formats
> - * Feature: oa
> + * Description: Test polled read with default hrtimer frequency
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Verify that OA registers are not whitelisted for paranoid 1
> + * Test category: Perf
>   *
>   * SUBTEST: per-context-mode-unprivileged
>   * Feature: oa, obsolete
>   *
>   * SUBTEST: polling
> - * Description: Test polled read with default hrtimer frequency
> - * Feature: oa
> + * Description:
> + *   Test polled read with default hrtimer frequency.
> + *   Test the i915 perf metrics streaming interface
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test polled read with different hrtimer frequencies
> + * Test category: Perf
>   *
>   * SUBTEST: polling-parameterized
>   * Description: Test polled read with different hrtimer frequencies
> - * Feature: oa
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test polled read with buffer size smaller than available data
> + * Test category: Perf
>   *
>   * SUBTEST: polling-small-buf
> - * Description: Test polled read with buffer size smaller than available data
> - * Feature: oa
> + * Description:
> + *   Test polled read with buffer size smaller than available data.
> + *   Verify invalid class instance
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Verify that forked access to mapped buffer fails
> + * Test category: Perf
>   *
>   * SUBTEST: rc6-disable
>   * Feature: oa
>   *
>   * SUBTEST: short-reads
> - * Feature: oa
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test the i915 perf metrics streaming interface
> + * Test category: Perf
>   *
>   * SUBTEST: stress-open-close
>   * Description: Stress tests opening & closing the i915-perf stream in a busy loop
>   * Feature: oa
>   *
>   * SUBTEST: sysctl-defaults
> - * Feature: oa
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: Test the i915 perf metrics streaming interface
> + * Test category: Perf
>   *
>   * SUBTEST: unprivileged-single-ctx-counters
>   * Feature: oa, obsolete
>   *
>   * SUBTEST: whitelisted-registers-userspace-config
> - * Feature: oa
> + * Category: Infrastructure
> + * Description: Test blocking read with different hrtimer frequencies
> + * Feature:
> + *   oa
> + *   i915 streaming interface
> + * Functionality: buffer management
> + * Test category: GEM_Legacy
>   */
>  
>  IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index bedadbe92797..4ade084ede45 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -53,54 +53,106 @@
>   * TEST: perf pmu
>   * Description: Test the i915 pmu perf interface
>   * Run type: FULL
> + * Test category: Perf
>   *
>   * SUBTEST: all-busy-check-all
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: all-busy-idle-check-all
> - * Feature: pmu
> + * Description: Read requested freq and actual frequency via PMU within specified time interval for any given workload changes
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test to ensure gpu is busy when there a workload by reading engine busyness pmu counters
>   *
>   * SUBTEST: busy
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: busy-accuracy-2
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: busy-accuracy-50
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: busy-accuracy-98
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test to ensure gpu all engines report busy when there is a workload by reading engine busyness pmu counters
>   *
>   * SUBTEST: busy-check-all
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: busy-double-start
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test to ensure there is no hanf when all engines are busy
>   *
>   * SUBTEST: busy-hang
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test to ensure gpu engine reports idle when there is no workload
>   *
>   * SUBTEST: busy-idle
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test to ensure gpu all engine reports idle when there is no workload
>   *
>   * SUBTEST: busy-idle-check-all
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test to verify gpu idle through engine business pmu counters
>   *
>   * SUBTEST: busy-idle-no-semaphores
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test to verify gpu busyness through engine business pmu counters
>   *
>   * SUBTEST: busy-no-semaphores
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test to verify gpu busyness through engine business pmu counters
>   *
>   * SUBTEST: busy-start
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: cpu-hotplug
> - * Feature: pmu
> + * Description: Test that reason field in OA reports is never 0 on Gen8+
> + * Feature:
> + *   pmu
> + *   i915 streaming interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: enable-race
> - * Feature: pmu
> + * Description: Test to ensure gpu is idle when there is no workload by reading engine busyness pmu counters
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Read requested freq and actual frequency via PMU within specified time interval for any given workload changes
>   *
>   * SUBTEST: event-wait
>   * Feature: obsolete, pmu
> @@ -109,56 +161,106 @@
>   * Feature: pmu
>   *
>   * SUBTEST: frequency
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Setup workload on all engines,measure gt awake time via pmu
>   *
>   * SUBTEST: frequency-idle
>   * Feature: pmu
>   *
>   * SUBTEST: gt-awake
> - * Feature: pmu
> + * Description: Test the i915 pmu perf interface
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test to ensure gpu is idle when there is no workload by reading engine busyness pmu counters
>   *
>   * SUBTEST: idle
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test to ensure gpu is idle when there is no workload by reading engine busyness pmu counters
>   *
>   * SUBTEST: idle-no-semaphores
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test to verify gpu busyness init through pmu perf interface
>   *
>   * SUBTEST: init-busy
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test to verify gpu busyness init through pmu perf interface
>   *
>   * SUBTEST: init-sema
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test to verify gpu busyness init through pmu perf interface
>   *
>   * SUBTEST: init-wait
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: interrupts
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: interrupts-sync
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Tests that i915 PMU corectly errors out in invalid initialization
>   *
>   * SUBTEST: invalid-init
> - * Feature: pmu
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature:
> + *   pmu
> + *   i915 streaming interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: invalid-open
> - * Feature: pmu
> + * Description: Test the i915 perf metrics streaming interface
> + * Feature:
> + *   pmu
> + *   i915 streaming interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: module-unload
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: most-busy-check-all
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: most-busy-idle-check-all
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: multi-client
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: pmu-read
>   * Description: Verify i915 pmu dir exists and read all events
>   * Feature: pmu
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: rc6
>   * Feature: pmu
> @@ -179,13 +281,23 @@
>   * Feature: pmu
>   *
>   * SUBTEST: semaphore-busy
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: semaphore-wait
> - * Feature: pmu
> + * Feature:
> + *   pmu
> + *   i915 pmu perf interface
> + * Functionality: Test the i915 pmu perf interface
>   *
>   * SUBTEST: semaphore-wait-idle
> - * Feature: pmu
> + * Description: Unmap buffer, close fd and try to access
> + * Feature:
> + *   pmu
> + *   i915 streaming interface
> + * Functionality: Test polled read with default hrtimer frequency
>   */
>  
>  IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
> diff --git a/tests/i915/sysfs_defaults.c b/tests/i915/sysfs_defaults.c
> index 73478559fcda..3c6ac7c5aac1 100644
> --- a/tests/i915/sysfs_defaults.c
> +++ b/tests/i915/sysfs_defaults.c
> @@ -35,8 +35,13 @@
>  #include "igt_sysfs.h"
>  /**
>   * TEST: sysfs defaults
> + * Category: Server
> + * Description: Error Management
>   * Feature: gem_core
> + * Functionality: error handling
>   * Run type: FULL
> + * Sub-category: debugger
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: readonly
>   */
> diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
> index 2971acb32811..4f9a0b8da96e 100644
> --- a/tests/i915/sysfs_heartbeat_interval.c
> +++ b/tests/i915/sysfs_heartbeat_interval.c
> @@ -45,20 +45,26 @@
>   * TEST: sysfs heartbeat interval
>   * Feature: SMI, cmd_submission
>   * Run type: FULL
> + * Test category: SysMan
>   *
>   * SUBTEST: idempotent
> + * Functionality: Test to check if heartbeat parameter rejects any unrepresentable intervals.
>   *
>   * SUBTEST: invalid
> + * Functionality: Run a mixed workload with non-preemptable hogs that exceed the heartbeat, and quicker innocents. Inspect the fence status of each to verify that only the hogs are reset.
>   *
>   * SUBTEST: long
>   *
>   * SUBTEST: mixed
> + * Functionality: Test heartbeats with forced preemption disabled.
>   *
>   * SUBTEST: nopreempt
> + * Functionality: Tests the heartbeats with preemption and heartbeat parameter enabled.
>   *
>   * SUBTEST: off
>   *
>   * SUBTEST: precise
> + * Functionality: Test to check whether the preempt_timeout parameter reports the values set.
>   */
>  
>  #define ATTR "heartbeat_interval_ms"
> diff --git a/tests/i915/sysfs_preempt_timeout.c b/tests/i915/sysfs_preempt_timeout.c
> index e7c09949930c..6381a69c0847 100644
> --- a/tests/i915/sysfs_preempt_timeout.c
> +++ b/tests/i915/sysfs_preempt_timeout.c
> @@ -44,14 +44,19 @@
>   * TEST: sysfs preempt timeout
>   * Feature: SMI, context
>   * Run type: FULL
> + * Test category: SysMan
>   *
>   * SUBTEST: idempotent
> + * Functionality: Test to check if preempt_timeout parameter rejects any unrepresentable intervals.
-------------------- ^
Looks like description

>   *
>   * SUBTEST: invalid
> + * Functionality: Test to measure the delay from requestion the preemption to its completion. Send down some non-preemptable workloads and then request a switch to a higher priority context. The HW will not be able to respond, so the kernel will be forced to reset the hog.
-------------------- ^
Looks like description

>   *
>   * SUBTEST: off
>   *
>   * SUBTEST: timeout
> + * Description: Test to measure the timeslice duration by watching the xCS_TIMESTAMP and recording its value every time we switch into the context, using a couple of semaphores to busyspin for the timeslice.
> + * Functionality: Test to check whether timeslice parameter reports the values set.
-------------------- ^
Looks like description

>   */
>  
>  #define ATTR "preempt_timeout_ms"
> diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
> index 0f4905d8b613..638d79e6b57a 100644
> --- a/tests/i915/sysfs_timeslice_duration.c
> +++ b/tests/i915/sysfs_timeslice_duration.c
> @@ -49,14 +49,23 @@
>   * Run type: FULL
>   *
>   * SUBTEST: duration
> + * Functionality: Test to check whether timeslice parameter reports the values set.
-------------------- ^
Looks like description

> + * Test category: SysMan
>   *
>   * SUBTEST: idempotent
> + * Functionality: Test to check if timeslice parameter rejects any unrepresentable intervals.
-------------------- ^
Looks like description

> + * Test category: SysMan
>   *
>   * SUBTEST: invalid
> + * Functionality: Couple a unpreemptable hog with a fast forced reset and measure the timeslice by how long it takes for the hog to be reset and the high priority context to complete.
-------------------- ^
Looks like description - last leaked.

> + * Test category: SysMan
>   *
>   * SUBTEST: off
>   *
>   * SUBTEST: timeout
> + * Category: Infrastructure
> + * Functionality: mock device
> + * Test category: GEM_Legacy
>   */
>  
>  #define ATTR "timeslice_duration_ms"
> diff --git a/tests/prime_busy.c b/tests/prime_busy.c
> index 4f7dba7d0e3c..01320db27e73 100644
> --- a/tests/prime_busy.c
> +++ b/tests/prime_busy.c
> @@ -28,21 +28,30 @@
>  #include "igt.h"
>  /**
>   * TEST: prime busy
> + * Category: Infrastructure
>   * Description: Basic check of polling for prime fences.
>   * Feature: prime
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: after
> + * Functionality: buffer management
>   *
>   * SUBTEST: after-wait
> + * Functionality: buffer management
>   *
>   * SUBTEST: before
> + * Functionality: buffer management
>   *
>   * SUBTEST: before-wait
> + * Functionality: buffer management
>   *
>   * SUBTEST: hang
> + * Functionality: buffer management
>   *
>   * SUBTEST: hang-wait
> + * Functionality: memory management
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic check of polling for prime fences.");
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
> index e50f52fdfdb0..03d588e47ece 100644
> --- a/tests/prime_mmap_coherency.c
> +++ b/tests/prime_mmap_coherency.c
> @@ -33,17 +33,23 @@
>  #include "igt.h"
>  /**
>   * TEST: prime mmap coherency
> + * Category: Infrastructure
>   * Description:
>   *   Test dma-buf mmap on !llc platforms mostly and provoke coherency bugs so we know for sure where
>   *   we need the sync ioctls.
>   * Feature: prime
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: ioctl-errors
> + * Functionality: memory management
>   *
>   * SUBTEST: read
> + * Functionality: memory management
>   *
>   * SUBTEST: write
> + * Functionality: buffer management
>   */
>  
>  IGT_TEST_DESCRIPTION("Test dma-buf mmap on !llc platforms mostly and provoke"
> diff --git a/tests/prime_self_import.c b/tests/prime_self_import.c
> index 7d423b8cd442..56b94465cb73 100644
> --- a/tests/prime_self_import.c
> +++ b/tests/prime_self_import.c
> @@ -47,39 +47,52 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: prime self import
> + * Category: Infrastructure
>   * Description: Check whether prime import/export works on the same device... but with different fds.
>   * Feature: prime
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-llseek-bad
>   * Description: Check dmabuf llseek support with invalid values.
> + * Functionality: buffer management
>   * Run type: BAT
>   *
>   * SUBTEST: basic-llseek-size
>   * Description: Check dmabuf llseek support.
> + * Functionality: buffer management
>   * Run type: BAT
>   *
>   * SUBTEST: basic-with_fd_dup
>   * Description: Check prime export with duplicate fd.
> + * Functionality: buffer management
>   * Run type: BAT
>   *
>   * SUBTEST: basic-with_one_bo
>   * Description: Check prime import/export with one buffer object.
> + * Functionality: buffer management
>   * Run type: BAT
>   *
>   * SUBTEST: basic-with_one_bo_two_files
>   * Description: Check prime/flink with one buffer object.
> + * Functionality: buffer management
>   * Run type: BAT
>   *
>   * SUBTEST: basic-with_two_bos
> - * Description: Check prime import/export with two buffer objects.
> + * Description:
> + *   Check prime import/export with two buffer objects.
> + *   Buffer Management
> + * Functionality: mock device
>   * Run type: BAT
>   *
>   * SUBTEST: export-vs-gem_close-race
>   * Description: Check race of gem close against prime export.
> + * Functionality: buffer management
>   * Run type: FULL
>   *
>   * SUBTEST: reimport-vs-gem_close-race
>   * Description: Check race of gem close against reimport.
> + * Functionality: mock device
>   * Run type: FULL
>   */
>  
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 59e79af2dd00..6167c82c726f 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -32,16 +32,21 @@
>  #include "intel_batchbuffer.h"	/* igt_blitter_src_copy() */
>  /**
>   * TEST: prime vgem
> + * Category: Infrastructure
>   * Description: Basic check of polling for prime/vgem fences.
> + * Sub-category: DRM
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: basic-blt
>   * Description: Examine blitter access path.
>   * Feature: prime
> + * Functionality: mock device
>   * Run type: FULL
>   *
>   * SUBTEST: basic-fence-blt
>   * Description: Examine blitter access path fencing.
>   * Feature: prime
> + * Functionality: mock device
>   * Run type: FULL
>   *
>   * SUBTEST: basic-fence-flip
> @@ -82,11 +87,13 @@
>   * SUBTEST: busy
>   * Description: Examine busy check of polling for vgem fence.
>   * Feature: prime
> + * Functionality: mock device
>   * Run type: FULL
>   *
>   * SUBTEST: coherency-blt
>   * Description: Examine blitter access path WC coherency.
>   * Feature: prime
> + * Functionality: mock device
>   * Run type: FULL
>   *
>   * SUBTEST: coherency-gtt
> @@ -107,6 +114,7 @@
>   * SUBTEST: fence-wait
>   * Description: Examine basic dma-buf fence interop.
>   * Feature: prime, synchronization
> + * Functionality: mock device
>   * Run type: FULL
>   *
>   * SUBTEST: fence-write-hang
> @@ -117,16 +125,19 @@
>   * SUBTEST: shrink
>   * Description: Examine link establishment between shrinker and vgem bo.
>   * Feature: prime
> + * Functionality: mock device
>   * Run type: FULL
>   *
>   * SUBTEST: sync
>   * Description: Examine sync on vgem fence.
>   * Feature: prime
> + * Functionality: mock device
>   * Run type: FULL
>   *
>   * SUBTEST: wait
>   * Description: Examine wait on vgem fence.
>   * Feature: prime
> + * Functionality: semaphore
>   * Run type: FULL
>   */
>  
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
> index 930096f6d10e..f5d4bae07701 100644
> --- a/tests/syncobj_wait.c
> +++ b/tests/syncobj_wait.c
> @@ -32,147 +32,287 @@
>  #include "drm.h"
>  /**
>   * TEST: syncobj wait
> + * Category: Infrastructure
>   * Description: Tests for the drm sync object wait API
>   * Feature: synchronization
>   * Run type: FULL
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: invalid-multi-wait-all-unsubmitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-multi-wait-all-unsubmitted-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-multi-wait-all-unsubmitted-submitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-multi-wait-all-unsubmitted-submitted-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-multi-wait-unsubmitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-multi-wait-unsubmitted-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-multi-wait-unsubmitted-submitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-multi-wait-unsubmitted-submitted-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-reset-bad-pad
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-reset-illegal-handle
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-reset-one-illegal-handle
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-reset-zero-handles
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-signal-bad-pad
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-signal-illegal-handle
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-signal-one-illegal-handle
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-signal-zero-handles
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-single-wait-all-unsubmitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-single-wait-unsubmitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-wait-bad-flags
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-wait-illegal-handle
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: invalid-wait-zero-handles
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-all-for-submit-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-all-for-submit-submitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-all-for-submit-submitted-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-all-for-submit-unsubmitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-all-for-submit-unsubmitted-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-all-for-submit-unsubmitted-submitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-all-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-all-submitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-all-submitted-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-for-submit-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-for-submit-submitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-for-submit-submitted-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-for-submit-unsubmitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-for-submit-unsubmitted-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-for-submit-unsubmitted-submitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-for-submit-unsubmitted-submitted-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-submitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: multi-wait-submitted-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: reset-during-wait-for-submit
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: reset-multiple-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: reset-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: reset-unsignaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: signal
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: single-wait-all-for-submit-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: single-wait-all-for-submit-submitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: single-wait-all-for-submit-unsubmitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: single-wait-all-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: single-wait-all-submitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: single-wait-for-submit-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: single-wait-for-submit-submitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: single-wait-for-submit-unsubmitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: single-wait-signaled
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: single-wait-submitted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-all-complex
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-all-delayed-signal
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-all-for-submit-complex
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-all-for-submit-delayed-submit
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-all-for-submit-snapshot
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-all-interrupted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-all-snapshot
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-any-complex
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-any-interrupted
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-any-snapshot
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-delayed-signal
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-for-submit-complex
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-for-submit-delayed-submit
> + * Functionality: semaphore
> + * Sub-category: DRM
>   *
>   * SUBTEST: wait-for-submit-snapshot
> + * Functionality: driver handler
> + * Sub-category: i915
>   */
>  
>  IGT_TEST_DESCRIPTION("Tests for the drm sync object wait API");
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index 2a5f6242e995..2cfbbde4f82b 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -33,87 +33,120 @@
>  #include <dirent.h>
>  /**
>   * TEST: vgem basic
> + * Category: Infrastructure
>   * Description: Basic sanity check of Virtual GEM module (vGEM).
> + * Test category: GEM_Legacy
>   *
>   * SUBTEST: bad-fence
>   * Description: Make sure a non-existent fence cannot be signaled.
>   * Feature: vgem
> + * Functionality: mock device
>   * Run type: FULL
>   *
>   * SUBTEST: bad-flag
>   * Description: Make sure a fence cannot be attached and signaled with invalid flags.
>   * Feature: vgem
> + * Functionality: mock device
>   * Run type: FULL
>   *
>   * SUBTEST: bad-handle
>   * Description: Make sure a fence cannot be attached to a invalid handle.
>   * Feature: vgem
> + * Functionality: mock device
>   * Run type: FULL
>   *
>   * SUBTEST: bad-pad
>   * Description: Make sure a non-zero pad is rejected.
>   * Feature: vgem
> + * Functionality: mock device
>   * Run type: FULL
>   *
>   * SUBTEST: busy-fence
>   * Description: Make sure a conflicting fence cannot be attached.
>   * Feature: vgem
> + * Functionality: mock device
>   * Run type: FULL
>   *
>   * SUBTEST: create
>   * Description: Check the basic working of vgem_create ioctl.
>   * Feature: vgem
> + * Functionality: mock device
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: debugfs
>   * Description: Check the basic access to debugfs and also try to read entries in the directory.
>   * Feature: vgem
> + * Functionality: mock device
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: dmabuf-export
>   * Description: Check whether it can export/import the vgem handle using prime.
>   * Feature: prime, vgem
> + * Functionality: mock device
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: dmabuf-fence
>   * Description: Check the working of dma-buf fence interop.
>   * Feature: prime, vgem
> + * Functionality: mock device
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: dmabuf-fence-before
>   * Description: Attach a fence before exporting a vgem handle and check the working of fence.
>   * Feature: prime, vgem
> + * Functionality: mock device
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: dmabuf-mmap
>   * Description: Export the vgem handle along with RDWR capabilities using prime and check if it can be mmaped.
>   * Feature: prime, vgem
> + * Functionality: mock device
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: mmap
>   * Description: Create a vgem handle and check if it can be mmaped.
>   * Feature: vgem
> + * Functionality: mock device
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: second-client
>   * Description: Check whether it can open multiple clients.
>   * Feature: vgem
> + * Functionality: mock device
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: setversion
>   * Description: Check the working of SET_VERSION ioctl.
>   * Feature: vgem
> + * Functionality: mock device
>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: sysfs
> - * Description: Check the basic access to sysfs and also try to read entries in the directory.
> + * Description:
> + *   Check the basic access to sysfs and also try to read entries in the directory.
> + *   Mock Device
------- ^
>   * Feature: vgem
> + * Functionality: rta basic
-------------------- ^
mock device ?

>   * Run type: BAT
> + * Sub-category: DRM
>   *
>   * SUBTEST: unload
> - * Description: Basic test for handling of module unload.
> + * Description:
> + *   Basic test for handling of module unload.
> + *   Mock Device
------- ^
?

>   * Feature: vgem
> + * Functionality: driver handler
-------------------- ^
mock device ?

Regards,
Kamil

>   * Run type: BAT
> + * Sub-category: DRM
>   */
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of Virtual GEM module (vGEM).");
> diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
> index d2a7effff115..e35728ed7c83 100644
> --- a/tests/vgem_slow.c
> +++ b/tests/vgem_slow.c
> @@ -32,11 +32,16 @@
>  #include <dirent.h>
>  /**
>   * TEST: vgem slow
> + * Category: Infrastructure
>   * Description: Extended sanity check of Virtual GEM module (vGEM).
>   * Feature: vgem
> + * Functionality: dma fence
>   * Run type: FULL
> + * Sub-category: DRM
> + * Test category: EUDebug
>   *
>   * SUBTEST: nohang
> + * Description: dma fence SW validation
>   */
>  
>  IGT_TEST_DESCRIPTION("Extended sanity check of Virtual GEM module (vGEM).");
> -- 
> 2.40.1
> 

