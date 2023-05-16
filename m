Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD76810E276
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 16:28:31 +0000 (UTC)
Date: Tue, 16 May 2023 18:28:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230516162826.fi7wdgqwvq6wkrkt@kamilkon-desk1>
References: <20230509090738.1157939-1-mauro.chehab@linux.intel.com>
 <20230509090738.1157939-6-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230509090738.1157939-6-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 5/6] tests/i915: Improve test
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

On 2023-05-09 at 11:07:37 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Currently, test documentation inside IGT describe macros and testlists.
> 
> There is also some internal documentation mapping features into
> buckets, which is used by some Intel CI scripts.
> 
> Place them inside i915 comments.

Some subtest names are dynamicaly generated with
engine_name + engine_number, may we adjust it and shorten them ?
For example see gem_ctx_switch.

With or without that it looks correct, though I only skimmed
over all descriptions,

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  tests/core_auth.c                           |   21 +
>  tests/core_getclient.c                      |    8 +
>  tests/core_getstats.c                       |    8 +
>  tests/core_getversion.c                     |    8 +
>  tests/core_hotunplug.c                      |   39 +
>  tests/core_setmaster.c                      |   15 +
>  tests/core_setmaster_vs_auth.c              |    8 +
>  tests/debugfs_test.c                        |   25 +
>  tests/device_reset.c                        |   21 +
>  tests/dmabuf.c                              |    8 +
>  tests/drm_mm.c                              |    8 +
>  tests/dumb_buffer.c                         |   18 +
>  tests/i915/api_intel_allocator.c            |   41 +
>  tests/i915/api_intel_bb.c                   |   63 +
>  tests/i915/drm_fdinfo.c                     |   44 +
>  tests/i915/gem_bad_reloc.c                  |   19 +
>  tests/i915/gem_barrier_race.c               |   11 +
>  tests/i915/gem_basic.c                      |   24 +
>  tests/i915/gem_blits.c                      |    7 +
>  tests/i915/gem_busy.c                       |   39 +
>  tests/i915/gem_caching.c                    |   12 +
>  tests/i915/gem_ccs.c                        |   33 +
>  tests/i915/gem_close.c                      |    9 +
>  tests/i915/gem_close_race.c                 |   45 +
>  tests/i915/gem_create.c                     |   50 +
>  tests/i915/gem_cs_tlb.c                     |    8 +
>  tests/i915/gem_ctx_bad_destroy.c            |   14 +
>  tests/i915/gem_ctx_create.c                 |   69 +
>  tests/i915/gem_ctx_engines.c                |   17 +
>  tests/i915/gem_ctx_exec.c                   |   33 +
>  tests/i915/gem_ctx_freq.c                   |    7 +
>  tests/i915/gem_ctx_isolation.c              |   23 +
>  tests/i915/gem_ctx_param.c                  |   88 ++
>  tests/i915/gem_ctx_persistence.c            |   69 +
>  tests/i915/gem_ctx_shared.c                 |   34 +
>  tests/i915/gem_ctx_sseu.c                   |   14 +
>  tests/i915/gem_ctx_switch.c                 |  365 +++++
>  tests/i915/gem_eio.c                        |   93 ++
>  tests/i915/gem_evict_alignment.c            |   17 +
>  tests/i915/gem_evict_everything.c           |   61 +
>  tests/i915/gem_exec_alignment.c             |   18 +
>  tests/i915/gem_exec_async.c                 |   10 +
>  tests/i915/gem_exec_await.c                 |    9 +
>  tests/i915/gem_exec_balancer.c              |  117 ++
>  tests/i915/gem_exec_basic.c                 |   11 +
>  tests/i915/gem_exec_big.c                   |   10 +
>  tests/i915/gem_exec_capture.c               |   30 +
>  tests/i915/gem_exec_create.c                |   26 +
>  tests/i915/gem_exec_endless.c               |    7 +
>  tests/i915/gem_exec_fair.c                  |   92 ++
>  tests/i915/gem_exec_fence.c                 |  240 +++
>  tests/i915/gem_exec_flush.c                 | 1496 +++++++++++++++++++
>  tests/i915/gem_exec_gttfill.c               |   23 +
>  tests/i915/gem_exec_latency.c               |   30 +
>  tests/i915/gem_exec_lut_handle.c            |    7 +
>  tests/i915/gem_exec_nop.c                   |   55 +
>  tests/i915/gem_exec_parallel.c              |   25 +
>  tests/i915/gem_exec_params.c                |  103 ++
>  tests/i915/gem_exec_reloc.c                 |  593 ++++++++
>  tests/i915/gem_exec_schedule.c              |  182 +++
>  tests/i915/gem_exec_store.c                 |   21 +
>  tests/i915/gem_exec_suspend.c               |   81 +
>  tests/i915/gem_exec_whisper.c               |  189 +++
>  tests/i915/gem_exercise_blt.c               |   12 +
>  tests/i915/gem_fd_exhaustion.c              |    6 +
>  tests/i915/gem_fence_thrash.c               |   19 +
>  tests/i915/gem_fence_upload.c               |   16 +
>  tests/i915/gem_fenced_exec_thrash.c         |   18 +
>  tests/i915/gem_flink_basic.c                |   21 +
>  tests/i915/gem_flink_race.c                 |   10 +
>  tests/i915/gem_gpgpu_fill.c                 |    7 +
>  tests/i915/gem_gtt_cpu_tlb.c                |    8 +
>  tests/i915/gem_gtt_hog.c                    |    6 +
>  tests/i915/gem_gtt_speed.c                  |    6 +
>  tests/i915/gem_huc_copy.c                   |   11 +
>  tests/i915/gem_linear_blits.c               |   17 +
>  tests/i915/gem_lmem_evict.c                 |    9 +
>  tests/i915/gem_lmem_swapping.c              |   89 ++
>  tests/i915/gem_lut_handle.c                 |    7 +
>  tests/i915/gem_madvise.c                    |   25 +
>  tests/i915/gem_media_fill.c                 |    8 +
>  tests/i915/gem_media_vme.c                  |    8 +
>  tests/i915/gem_mmap.c                       |   57 +
>  tests/i915/gem_mmap_gtt.c                   |  488 ++++++
>  tests/i915/gem_mmap_offset.c                |   36 +
>  tests/i915/gem_mmap_wc.c                    |   67 +
>  tests/i915/gem_partial_pwrite_pread.c       |   62 +
>  tests/i915/gem_pipe_control_store_loop.c    |   12 +
>  tests/i915/gem_ppgtt.c                      |   21 +
>  tests/i915/gem_pread.c                      |   17 +
>  tests/i915/gem_pread_after_blit.c           |   29 +
>  tests/i915/gem_pwrite.c                     |   67 +
>  tests/i915/gem_pwrite_snooped.c             |    8 +
>  tests/i915/gem_pxp.c                        |   79 +
>  tests/i915/gem_read_read_speed.c            |   61 +
>  tests/i915/gem_readwrite.c                  |   15 +
>  tests/i915/gem_reg_read.c                   |   11 +
>  tests/i915/gem_render_copy.c                |  120 ++
>  tests/i915/gem_render_copy_redux.c          |   17 +
>  tests/i915/gem_render_linear_blits.c        |   16 +
>  tests/i915/gem_render_tiled_blits.c         |   27 +
>  tests/i915/gem_request_retire.c             |    8 +
>  tests/i915/gem_reset_stats.c                |  178 +++
>  tests/i915/gem_ringfill.c                   |  111 ++
>  tests/i915/gem_set_tiling_vs_blt.c          |   15 +
>  tests/i915/gem_set_tiling_vs_gtt.c          |    8 +
>  tests/i915/gem_set_tiling_vs_pwrite.c       |    8 +
>  tests/i915/gem_shrink.c                     |  107 ++
>  tests/i915/gem_softpin.c                    |  113 ++
>  tests/i915/gem_spin_batch.c                 |   40 +
>  tests/i915/gem_streaming_writes.c           |   29 +
>  tests/i915/gem_stress.c                     |    7 +
>  tests/i915/gem_sync.c                       |  225 +++
>  tests/i915/gem_tiled_blits.c                |   17 +
>  tests/i915/gem_tiled_fence_blits.c          |   15 +
>  tests/i915/gem_tiled_partial_pwrite_pread.c |   12 +
>  tests/i915/gem_tiled_pread_basic.c          |    8 +
>  tests/i915/gem_tiled_pread_pwrite.c         |    8 +
>  tests/i915/gem_tiled_swapping.c             |   10 +
>  tests/i915/gem_tiled_wb.c                   |   10 +
>  tests/i915/gem_tiled_wc.c                   |    7 +
>  tests/i915/gem_tiling_max_stride.c          |    8 +
>  tests/i915/gem_unfence_active_buffers.c     |    8 +
>  tests/i915/gem_unref_active_buffers.c       |    8 +
>  tests/i915/gem_userptr_blits.c              |  280 ++++
>  tests/i915/gem_vm_create.c                  |   19 +
>  tests/i915/gem_wait.c                       |   49 +
>  tests/i915/gem_watchdog.c                   |   11 +
>  tests/i915/gem_workarounds.c                |   40 +
>  tests/i915/gen3_mixed_blits.c               |    7 +
>  tests/i915/gen3_render_linear_blits.c       |    7 +
>  tests/i915/gen3_render_mixed_blits.c        |    7 +
>  tests/i915/gen3_render_tiledx_blits.c       |    7 +
>  tests/i915/gen3_render_tiledy_blits.c       |    7 +
>  tests/i915/gen7_exec_parse.c                |   31 +
>  tests/i915/gen9_exec_parse.c                |   47 +
>  tests/i915/i915_fb_tiling.c                 |    8 +
>  tests/i915/i915_getparams_basic.c           |   12 +
>  tests/i915/i915_hangman.c                   |   41 +
>  tests/i915/i915_hwmon.c                     |   12 +
>  tests/i915/i915_module_load.c               |   30 +
>  tests/i915/i915_pciid.c                     |    8 +
>  tests/i915/i915_pipe_stress.c               |   17 +
>  tests/i915/i915_pm_backlight.c              |   25 +
>  tests/i915/i915_pm_dc.c                     |   41 +
>  tests/i915/i915_pm_freq_api.c               |   11 +
>  tests/i915/i915_pm_freq_mult.c              |   10 +
>  tests/i915/i915_pm_lpsp.c                   |   12 +
>  tests/i915/i915_pm_rc6_residency.c          |   16 +
>  tests/i915/i915_pm_rpm.c                    |  185 +++
>  tests/i915/i915_pm_rps.c                    |   34 +
>  tests/i915/i915_pm_sseu.c                   |    8 +
>  tests/i915/i915_power.c                     |    9 +
>  tests/i915/i915_query.c                     |   63 +
>  tests/i915/i915_selftest.c                  |   16 +
>  tests/i915/i915_suspend.c                   |   57 +
>  tests/i915/perf.c                           |  144 ++
>  tests/i915/perf_pmu.c                       |  138 ++
>  tests/i915/sysfs_defaults.c                 |    7 +
>  tests/i915/sysfs_heartbeat_interval.c       |   19 +
>  tests/i915/sysfs_preempt_timeout.c          |   13 +
>  tests/i915/sysfs_timeslice_duration.c       |   15 +
>  tests/prime_busy.c                          |   18 +
>  tests/prime_mmap.c                          |   29 +
>  tests/prime_mmap_coherency.c                |   14 +
>  tests/prime_self_import.c                   |   37 +
>  tests/prime_vgem.c                          |   99 ++
>  tests/sw_sync.c                             |   42 +
>  tests/syncobj_basic.c                       |   30 +
>  tests/syncobj_timeline.c                    |  394 +++++
>  tests/syncobj_wait.c                        |  144 ++
>  tests/vgem_basic.c                          |   84 ++
>  tests/vgem_slow.c                           |    8 +
>  173 files changed, 9706 insertions(+)
> 
> diff --git a/tests/core_auth.c b/tests/core_auth.c
> index 257f124820a4..ee7fbaabfa92 100644
> --- a/tests/core_auth.c
> +++ b/tests/core_auth.c
> @@ -42,6 +42,27 @@
>  #include <sys/poll.h>
>  #include <sys/resource.h>
>  #include "drm.h"
> +/**
> + * TEST: core auth
> + * Description: Call drmGetMagic() and drmAuthMagic() and see if it behaves.
> + * Feature: core
> + *
> + * SUBTEST: basic-auth
> + * Description: Test magic numbers for master and slave.
> + * Run type: BAT
> + *
> + * SUBTEST: getclient-master-drop
> + * Description: Use 2 clients, check second is authenticated even when first dropped.
> + * Run type: FULL
> + *
> + * SUBTEST: getclient-simple
> + * Description: Check drm client is always authenticated.
> + * Run type: FULL
> + *
> + * SUBTEST: many-magics
> + * Description: Test authentication and magic numbers uniqness for rlimit slaves.
> + * Run type: FULL
> + */
>  
>  #ifndef __linux__
>  # include <pthread.h>
> diff --git a/tests/core_getclient.c b/tests/core_getclient.c
> index 40a1c194de19..1ab56e9f304c 100644
> --- a/tests/core_getclient.c
> +++ b/tests/core_getclient.c
> @@ -31,6 +31,14 @@
>  #include <stdlib.h>
>  #include <errno.h>
>  
> +/**
> + * TEST: core getclient
> + * Description: Tests the DRM_IOCTL_GET_CLIENT ioctl.
> + * Feature: core
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_CLIENT ioctl.");
>  
> diff --git a/tests/core_getstats.c b/tests/core_getstats.c
> index fde27cdc6485..f2b1abac738e 100644
> --- a/tests/core_getstats.c
> +++ b/tests/core_getstats.c
> @@ -32,6 +32,14 @@
>  
>  #include <drm.h>
>  
> +/**
> + * TEST: core getstats
> + * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
> + * Feature: core
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  /**
>   * Checks DRM_IOCTL_GET_STATS.
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index f6953b313cac..ae6fc8f8d7d9 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -28,6 +28,14 @@
>  #include "igt.h"
>  #include <string.h>
>  #include <sys/ioctl.h>
> +/**
> + * TEST: core getversion
> + * Description: Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's drmGetVersion() interface to it.
> + * Feature: core
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests the DRM_IOCTL_GET_VERSION ioctl and libdrm's "
>  		     "drmGetVersion() interface to it.");
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index e79eb1ed4c23..472e9237ddc2 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -39,6 +39,45 @@
>  #include "igt_kmod.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: core hotunplug
> + * Description: Examine behavior of a driver on device hot unplug
> + * Feature: SMI, core
> + *
> + * SUBTEST: hotrebind
> + * Description:
> + *   Check if the driver can be cleanly rebound to a device with a still open hot unbound driver
> + *   instance
> + * Run type: FULL
> + *
> + * SUBTEST: hotrebind-lateclose
> + * Description: Check if a hot unbound driver instance still open after hot rebind can be cleanly released
> + * Run type: FULL
> + *
> + * SUBTEST: hotreplug
> + * Description: Check if a hot unplugged and still open device can be cleanly restored
> + * Run type: FULL
> + *
> + * SUBTEST: hotreplug-lateclose
> + * Description: Check if an instance of a still open while hot replugged device can be cleanly released
> + * Run type: FULL
> + *
> + * SUBTEST: hotunbind-rebind
> + * Description: Check if the driver can be cleanly unbound from an open device, then released and rebound
> + * Run type: FULL
> + *
> + * SUBTEST: hotunplug-rescan
> + * Description: Check if an open device can be cleanly unplugged, then released and restored
> + * Run type: FULL
> + *
> + * SUBTEST: unbind-rebind
> + * Description: Check if the driver can be cleanly unbound from a device believed to be closed, then rebound
> + * Run type: BAT
> + *
> + * SUBTEST: unplug-rescan
> + * Description: Check if a device believed to be closed can be cleanly unplugged, then restored
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Examine behavior of a driver on device hot unplug");
>  
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 470f9441dd69..95a131a4d3c9 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -38,6 +38,21 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include <sys/stat.h>
> +/**
> + * TEST: core setmaster
> + * Description: Check that Drop/SetMaster behaves correctly wrt root/user access
> + * Feature: core
> + * Run type: FULL
> + *
> + * SUBTEST: master-drop-set-root
> + * Description: Ensure that root can Set/DropMaster
> + *
> + * SUBTEST: master-drop-set-shared-fd
> + * Description: Check the Set/DropMaster behaviour on shared fd
> + *
> + * SUBTEST: master-drop-set-user
> + * Description: Ensure first normal user can Set/DropMaster
> + */
>  
>  IGT_TEST_DESCRIPTION("Check that Drop/SetMaster behaves correctly wrt root/user"
>  		     " access");
> diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
> index 0b4b8613c6f6..37bb378ab011 100644
> --- a/tests/core_setmaster_vs_auth.c
> +++ b/tests/core_setmaster_vs_auth.c
> @@ -40,6 +40,14 @@
>  #include <string.h>
>  
>  #include "igt_device.h"
> +/**
> + * TEST: core setmaster vs auth
> + * Description: Check that drop/setMaster correctly transfer master state
> + * Feature: core
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Check that drop/setMaster correctly transfer master "
>  		     "state");
> diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
> index 8c775158f157..39b001671bcc 100644
> --- a/tests/debugfs_test.c
> +++ b/tests/debugfs_test.c
> @@ -29,6 +29,31 @@
>  #include <fcntl.h>
>  #include <sys/types.h>
>  #include <dirent.h>
> +/**
> + * TEST: debugfs test
> + * Description: Read entries from debugfs, hwmon and sysfs paths.
> + * Feature: core
> + *
> + * SUBTEST: basic-hwmon
> + * Description: Read all entries from hwmon path
> + * Run type: BAT
> + *
> + * SUBTEST: read_all_entries
> + * Description: Read all entries from debugfs path.
> + * Run type: BAT
> + *
> + * SUBTEST: read_all_entries_display_off
> + * Description: Read all debugfs entries with display on/off.
> + * Run type: FULL
> + *
> + * SUBTEST: read_all_entries_display_on
> + * Description: Read all debugfs entries with display on/off.
> + * Run type: FULL
> + *
> + * SUBTEST: sysfs
> + * Description: Read all entries from sysfs path.
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Read entries from debugfs, hwmon and sysfs paths.");
>  
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 39ee8dca9fa2..0c23aecff595 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -14,6 +14,27 @@
>  #include "igt_pci.h"
>  #include "igt_sysfs.h"
>  #include "igt_kmod.h"
> +/**
> + * TEST: device reset
> + * Description: Examine behavior of a driver on device sysfs reset
> + * Run type: FULL
> + *
> + * SUBTEST: cold-reset-bound
> + * Description: Cold Resets device with bound driver
> + * Feature: reset
> + *
> + * SUBTEST: reset-bound
> + * Description: Resets device with bound driver
> + * Feature: reset
> + *
> + * SUBTEST: unbind-cold-reset-rebind
> + * Description: Unbinds driver from device, initiates cold reset then rebinds driver to device
> + * Feature: reset
> + *
> + * SUBTEST: unbind-reset-rebind
> + * Description: Unbinds driver from device, initiates reset then rebinds driver to device
> + * Feature: reset, sriov-reset
> + */
>  
>  IGT_TEST_DESCRIPTION("Examine behavior of a driver on device sysfs reset");
>  
> diff --git a/tests/dmabuf.c b/tests/dmabuf.c
> index a72cf3be1377..4bc9b35b619d 100644
> --- a/tests/dmabuf.c
> +++ b/tests/dmabuf.c
> @@ -23,6 +23,14 @@
>  
>  #include "igt.h"
>  #include "igt_kmod.h"
> +/**
> + * TEST: dmabuf
> + * Description: Kernel selftests for the dmabuf API
> + * Feature: mapping, prime
> + * Run type: BAT
> + *
> + * SUBTEST: all-tests
> + */
>  
>  IGT_TEST_DESCRIPTION("Kernel selftests for the dmabuf API");
>  
> diff --git a/tests/drm_mm.c b/tests/drm_mm.c
> index 2052b115cb98..4cc2891ee129 100644
> --- a/tests/drm_mm.c
> +++ b/tests/drm_mm.c
> @@ -23,6 +23,14 @@
>  
>  #include "igt.h"
>  #include "igt_kmod.h"
> +/**
> + * TEST: drm mm
> + * Description: Basic sanity check of DRM's range manager (struct drm_mm)
> + * Feature: mapping
> + * Run type: FULL
> + *
> + * SUBTEST: all-tests
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of DRM's range manager (struct drm_mm)");
>  
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index ded6b809c262..0c7ce714eb6c 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -49,6 +49,24 @@
>  #include "drmtest.h"
>  #include "igt_aux.h"
>  #include "ioctl_wrappers.h"
> +/**
> + * TEST: dumb buffer
> + * Description: This is a test for the generic dumb buffer interface.
> + * Feature: prime
> + * Run type: FULL
> + *
> + * SUBTEST: create-clear
> + *
> + * SUBTEST: create-valid-dumb
> + *
> + * SUBTEST: invalid-bpp
> + *
> + * SUBTEST: map-invalid-size
> + *
> + * SUBTEST: map-uaf
> + *
> + * SUBTEST: map-valid
> + */
>  
>  IGT_TEST_DESCRIPTION("This is a test for the generic dumb buffer interface.");
>  
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index e9039a214903..f0144821c911 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -9,6 +9,47 @@
>  #include "igt.h"
>  #include "igt_aux.h"
>  #include "intel_allocator.h"
> +/**
> + * TEST: api intel allocator
> + * Feature: igt_core
> + * Run type: FULL
> + *
> + * SUBTEST: alloc-simple
> + *
> + * SUBTEST: default-alignment
> + * Description:
> + *   For simple allocator check does default alignment is properly handled in open and alloc
> + *   functions
> + *
> + * SUBTEST: execbuf-with-allocator
> + *
> + * SUBTEST: fork-simple-once
> + *
> + * SUBTEST: fork-simple-stress
> + *
> + * SUBTEST: fork-simple-stress-signal
> + *
> + * SUBTEST: gem-pool
> + * Description: Verifies creating and executing bb from gem pool
> + *
> + * SUBTEST: open-vm
> + *
> + * SUBTEST: reloc-allocator
> + *
> + * SUBTEST: reopen
> + *
> + * SUBTEST: reopen-fork
> + *
> + * SUBTEST: reserve-simple
> + *
> + * SUBTEST: simple-allocator
> + *
> + * SUBTEST: standalone
> + *
> + * SUBTEST: two-level-inception
> + *
> + * SUBTEST: two-level-inception-interruptible
> + */
>  
>  #define OBJ_SIZE 1024
>  
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index 46633b0385e1..198a29eb4f26 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -41,6 +41,69 @@
>  #include "i915/gem_vm.h"
>  #include "i915/i915_crc.h"
>  #include "i915/i915_blt.h"
> +/**
> + * TEST: api intel bb
> + * Description: intel_bb API check.
> + * Feature: igt_core
> + * Run type: FULL
> + *
> + * SUBTEST: add-remove-objects
> + *
> + * SUBTEST: bb-with-allocator
> + *
> + * SUBTEST: blit-noreloc-keep-cache
> + *
> + * SUBTEST: blit-noreloc-purge-cache
> + *
> + * SUBTEST: blit-reloc-keep-cache
> + *
> + * SUBTEST: blit-reloc-purge-cache
> + *
> + * SUBTEST: crc32
> + * Description: Compare cpu and gpu crc32 sums on input object
> + *
> + * SUBTEST: delta-check
> + *
> + * SUBTEST: destroy-bb
> + *
> + * SUBTEST: full-batch
> + *
> + * SUBTEST: intel-bb-blit-none
> + *
> + * SUBTEST: intel-bb-blit-x
> + *
> + * SUBTEST: intel-bb-blit-y
> + *
> + * SUBTEST: lot-of-buffers
> + *
> + * SUBTEST: misplaced-blitter
> + * Description: Execute intel_bb with set of engines provided by userspace
> + *
> + * SUBTEST: object-noreloc-keep-cache-simple
> + *
> + * SUBTEST: object-noreloc-purge-cache-simple
> + *
> + * SUBTEST: object-reloc-keep-cache
> + *
> + * SUBTEST: object-reloc-purge-cache
> + *
> + * SUBTEST: offset-control
> + *
> + * SUBTEST: purge-bb
> + *
> + * SUBTEST: render
> + *
> + * SUBTEST: render-ccs
> + *
> + * SUBTEST: reset-bb
> + * Description: Ensure reset is possible on fresh bb
> + *
> + * SUBTEST: reset-flags
> + *
> + * SUBTEST: simple-bb
> + *
> + * SUBTEST: simple-bb-ctx
> + */
>  
>  #define PAGE_SIZE 4096
>  
> diff --git a/tests/i915/drm_fdinfo.c b/tests/i915/drm_fdinfo.c
> index 1b1247553a32..be1d62a35988 100644
> --- a/tests/i915/drm_fdinfo.c
> +++ b/tests/i915/drm_fdinfo.c
> @@ -29,6 +29,50 @@
>  #include "i915/gem.h"
>  #include "i915/gem_vm.h"
>  #include "intel_ctx.h"
> +/**
> + * TEST: drm fdinfo
> + * Description: Test the i915 drm fdinfo data
> + * Feature: client_busyness
> + * Run type: FULL
> + *
> + * SUBTEST: all-busy-check-all
> + *
> + * SUBTEST: all-busy-idle-check-all
> + *
> + * SUBTEST: basics
> + *
> + * SUBTEST: busy
> + *
> + * SUBTEST: busy-check-all
> + *
> + * SUBTEST: busy-hang
> + *
> + * SUBTEST: busy-idle
> + *
> + * SUBTEST: busy-idle-check-all
> + *
> + * SUBTEST: idle
> + *
> + * SUBTEST: isolation
> + *
> + * SUBTEST: most-busy-check-all
> + *
> + * SUBTEST: most-busy-idle-check-all
> + *
> + * SUBTEST: virtual-busy
> + *
> + * SUBTEST: virtual-busy-all
> + *
> + * SUBTEST: virtual-busy-hang
> + *
> + * SUBTEST: virtual-busy-hang-all
> + *
> + * SUBTEST: virtual-busy-idle
> + *
> + * SUBTEST: virtual-busy-idle-all
> + *
> + * SUBTEST: virtual-idle
> + */
>  
>  IGT_TEST_DESCRIPTION("Test the i915 drm fdinfo data");
>  
> diff --git a/tests/i915/gem_bad_reloc.c b/tests/i915/gem_bad_reloc.c
> index 478e78a6660e..d5336b62d37b 100644
> --- a/tests/i915/gem_bad_reloc.c
> +++ b/tests/i915/gem_bad_reloc.c
> @@ -41,6 +41,25 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +/**
> + * TEST: gem bad reloc
> + * Description:
> + *   Simulates SNA behaviour using negative self-relocations for STATE_BASE_ADDRESS command
> + *   packets.
> + * Feature: cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST: negative-reloc
> + * Description:
> + *   SNA behaviour is compressing batch buffer which leads to negative relocation deltas.
> + *   Negative self-relocation happening with real offset 0.
> + *
> + * SUBTEST: negative-reloc-bltcopy
> + * Description: Exercising blitter operation with negative reloc.
> + *
> + * SUBTEST: negative-reloc-lut
> + * Description: Similar to previous test with flags for lut_based_execbuffer.
> + */
>  
>  IGT_TEST_DESCRIPTION("Simulates SNA behaviour using negative self-relocations"
>  		     " for STATE_BASE_ADDRESS command packets.");
> diff --git a/tests/i915/gem_barrier_race.c b/tests/i915/gem_barrier_race.c
> index f446aab62263..0b1da7713520 100644
> --- a/tests/i915/gem_barrier_race.c
> +++ b/tests/i915/gem_barrier_race.c
> @@ -17,6 +17,17 @@
>  #include "i915/gem_create.h"
>  #include "i915/gem_engine_topology.h"
>  #include "i915/perf.h"
> +/**
> + * TEST: gem barrier race
> + * Description: Exercise engine barriers and their interaction with other subsystems
> + * Feature: core
> + * Run type: FULL
> + *
> + * SUBTEST: remote-request
> + * Description:
> + *   Race intel_context_prepare_remote_request against
> + *   intel_context_active_acquire/release
> + */
>  
>  IGT_TEST_DESCRIPTION("Exercise engine barriers and their interaction with other subsystems");
>  
> diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
> index 3dd790c6c1ac..8605429799aa 100644
> --- a/tests/i915/gem_basic.c
> +++ b/tests/i915/gem_basic.c
> @@ -41,6 +41,30 @@
>  #include "igt.h"
>  #include "igt_types.h"
>  #include "lib/igt_device_scan.h"
> +/**
> + * TEST: gem basic
> + * Description: Tests basic gem_create and gem_close IOCTLs
> + *
> + * SUBTEST: bad-close
> + * Description: Verify that gem_close fails with bad params.
> + * Feature: gem_core
> + * Run type: BAT
> + *
> + * SUBTEST: create-close
> + * Description: Verify basic functionality of gem_create and gem_close.
> + * Feature: gem_core
> + * Run type: BAT
> + *
> + * SUBTEST: create-fd-close
> + * Description: Verify that closing drm driver is possible with opened gem object.
> + * Feature: gem_core
> + * Run type: BAT
> + *
> + * SUBTEST: multigpu-create-close
> + * Description: Verify basic functionality of gem_create and gem_close on multi-GPU.
> + * Feature: gem_core, multigpu
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests basic gem_create and gem_close IOCTLs");
>  
> diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
> index 5fbb384dbe2e..acc1adc165f3 100644
> --- a/tests/i915/gem_blits.c
> +++ b/tests/i915/gem_blits.c
> @@ -28,6 +28,13 @@
>  #include "igt.h"
>  #include "igt_x86.h"
>  #include "i915/i915_blt.h"
> +/**
> + * TEST: gem blits
> + * Feature: blitter
> + * Run type: FULL
> + *
> + * SUBTEST: basic
> + */
>  
>  #define BCS_SWCTRL 0x22200
>  #define BCS_SRC_Y (1 << 0)
> diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
> index 08a500a9ec7a..38d66f8f292a 100644
> --- a/tests/i915/gem_busy.c
> +++ b/tests/i915/gem_busy.c
> @@ -30,6 +30,45 @@
>  #include "igt.h"
>  #include "igt_rand.h"
>  #include "igt_vgem.h"
> +/**
> + * TEST: gem busy
> + * Description: Basic check of busy-ioctl ABI.
> + * Feature: cmd_submission
> + *
> + * SUBTEST: busy
> + * Description: Basic test to check busyness of each engine.
> + * Run type: FULL
> + *
> + * SUBTEST: close-race
> + * Description: Test to check race condition by randomly closing the handle using gem_close.
> + * Run type: FULL
> + *
> + * SUBTEST: extended
> + * Description: Extended test to check busyness of dwstore-capable engines.
> + * Run type: FULL
> + *
> + * SUBTEST: hang
> + * Description: Basic test to check hang state behaviour of engines with increased timeout.
> + * Run type: FULL
> + *
> + * SUBTEST: hang-extended
> + * Description:
> + *   Extended test to check hang state behaviour of dwstore-capable engines with increased
> + *   timeout.
> + * Run type: FULL
> + *
> + * SUBTEST: parallel
> + * Description:
> + *   Extended test to check busyness of dwstore-capable engines while doing parallel
> + *   execution.
> + * Run type: FULL
> + *
> + * SUBTEST: semaphore
> + * Description:
> + *   Test to check busyness of engine on submitting a new batch while engine is busy in executing
> + *   previous batch.
> + * Run type: FULL
> + */
>  
>  #define PAGE_ALIGN(x) ALIGN(x, 4096)
>  
> diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
> index 6e944f0acb7b..d24e6cce059b 100644
> --- a/tests/i915/gem_caching.c
> +++ b/tests/i915/gem_caching.c
> @@ -40,6 +40,18 @@
>  #include "i915/gem.h"
>  #include "igt.h"
>  #include "i915/i915_blt.h"
> +/**
> + * TEST: gem caching
> + * Description: Test snoop consistency when touching partial cachelines.
> + * Feature: caching
> + * Run type: FULL
> + *
> + * SUBTEST: read-writes
> + *
> + * SUBTEST: reads
> + *
> + * SUBTEST: writes
> + */
>  
>  IGT_TEST_DESCRIPTION("Test snoop consistency when touching partial"
>  		     " cachelines.");
> diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> index d25e00fc89f3..ff6504b3c1da 100644
> --- a/tests/i915/gem_ccs.c
> +++ b/tests/i915/gem_ccs.c
> @@ -15,6 +15,39 @@
>  #include "lib/intel_chipset.h"
>  #include "i915/i915_blt.h"
>  #include "i915/intel_mocs.h"
> +/**
> + * TEST: gem ccs
> + * Description: Exercise gen12 blitter with and without flatccs compression
> + * Run type: FULL
> + *
> + * SUBTEST: block-copy-compressed
> + * Description: Check block-copy flatccs compressed blit
> + * Feature: flat_ccs_mapping
> + *
> + * SUBTEST: block-copy-uncompressed
> + * Description: Check block-copy uncompressed blit
> + * Feature: ccs_uncompressed, flat_ccs_mapping
> + *
> + * SUBTEST: block-multicopy-compressed
> + * Description: Check block-multicopy flatccs compressed blit
> + * Feature: flat_ccs_mapping
> + *
> + * SUBTEST: block-multicopy-inplace
> + * Description: Check block-multicopy flatccs inplace decompression blit
> + * Feature: flat_ccs_mapping
> + *
> + * SUBTEST: ctrl-surf-copy
> + * Description: Check flatccs data can be copied from/to surface
> + * Feature: flat_ccs_mapping
> + *
> + * SUBTEST: ctrl-surf-copy-new-ctx
> + * Description: Check flatccs data are physically tagged and visible in different contexts
> + * Feature: flat_ccs_mapping
> + *
> + * SUBTEST: suspend-resume
> + * Description: Check flatccs data persists after suspend / resume (S0)
> + * Feature: flat_ccs_mapping, suspend
> + */
>  
>  IGT_TEST_DESCRIPTION("Exercise gen12 blitter with and without flatccs compression");
>  
> diff --git a/tests/i915/gem_close.c b/tests/i915/gem_close.c
> index e1ae701c17a1..212fd8e9062a 100644
> --- a/tests/i915/gem_close.c
> +++ b/tests/i915/gem_close.c
> @@ -25,6 +25,15 @@
>  #include "i915/gem_create.h"
>  #include "igt.h"
>  #include "igt_types.h"
> +/**
> + * TEST: gem close
> + * Feature: mapping
> + * Run type: FULL
> + *
> + * SUBTEST: basic
> + *
> + * SUBTEST: many-handles-one-vma
> + */
>  
>  static int batch_create(int fd)
>  {
> diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> index 9c646f4267af..2b90a98258e7 100644
> --- a/tests/i915/gem_close_race.c
> +++ b/tests/i915/gem_close_race.c
> @@ -48,6 +48,51 @@
>  #include "igt.h"
>  #include "igt_aux.h"
>  #include "igt_device_scan.h"
> +/**
> + * TEST: gem close race
> + * Description: Test try to race gem_close against workload submission.
> + *
> + * SUBTEST: basic-process
> + * Description: Basic workload submission.
> + * Feature: synchronization
> + * Run type: BAT
> + *
> + * SUBTEST: basic-threads
> + * Description:
> + *   Share buffer handle across different drm fd's and trying to race gem_close against
> + *   continuous workload with minimum timeout.
> + * Feature: synchronization
> + * Run type: BAT
> + *
> + * SUBTEST: contexts
> + * Description:
> + *   Share buffer handle across different drm fd's and trying to race gem_close against
> + *   continuous workload in other contexts.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: gem-close-race
> + * Description:
> + *   Share buffer handle across different drm fd's and trying to race of gem_close against
> + *   continuous workload.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: multigpu-basic-process
> + * Description: Basic workload submission on multi-GPU machine.
> + * Feature: multigpu, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: multigpu-basic-threads
> + * Description: Run basic-threads race on multi-GPU machine.
> + * Feature: multigpu, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: process-exit
> + * Description: Test try to race gem_close against submission of continuous workload.
> + * Feature: synchronization
> + * Run type: FULL
> + */
>  
>  #define OBJECT_SIZE (256 * 1024)
>  
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index c719ab6c7761..fc99189499b8 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -62,6 +62,56 @@
>  #include "i915/gem_mman.h"
>  #include "i915/intel_memory_region.h"
>  #include "i915_drm.h"
> +/**
> + * TEST: gem create
> + * Description:
> + *   Ensure that basic gem_create and gem_create_ext works and that invalid input combinations
> + *   are rejected.
> + * Feature: mapping
> + * Run type: FULL
> + *
> + * SUBTEST: busy-create
> + * Description: Create buffer objects while GPU is busy.
> + *
> + * SUBTEST: create-clear
> + * Description: Verify that all new objects are clear.
> + *
> + * SUBTEST: create-ext-cpu-access-big
> + * Description:
> + *   Verify the extreme cases with very large objects and.
> + *   I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
> + *
> + * SUBTEST: create-ext-cpu-access-sanity-check
> + * Description:
> + *   Verify the basic functionally and expected ABI contract around.
> + *   I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS
> + *
> + * SUBTEST: create-ext-placement-all
> + * Description: Create objects in every memory region using create_ext.
> + *
> + * SUBTEST: create-ext-placement-each
> + * Description: Create one object with memory pieces in each memory region using create_ext.
> + *
> + * SUBTEST: create-ext-placement-sanity-check
> + * Description: Exercise create_ext placements extension.
> + *
> + * SUBTEST: create-invalid-size
> + * Description: Try to create a gem object of invalid size 0 and check if ioctl returns error.
> + *
> + * SUBTEST: create-massive
> + * Description: Exercise creation of buffer object with impossible size and check for the expected error.
> + *
> + * SUBTEST: create-size-update
> + * Description: Try to create a gem object with size 15 and check actual created size.
> + *
> + * SUBTEST: create-valid-nonaligned
> + * Description:
> + *   Try to create an object with non-aligned size, check we got one with size aligned up to page
> + *   size and test we can write into the padded extra memory.
> + *
> + * SUBTEST: hog-create
> + * Description: Create buffer objects while GPU is busy.
> + */
>  
>  IGT_TEST_DESCRIPTION("Ensure that basic gem_create and gem_create_ext works"
>  		     " and that invalid input combinations are rejected.");
> diff --git a/tests/i915/gem_cs_tlb.c b/tests/i915/gem_cs_tlb.c
> index 2117b41e47c1..ab09efa251b3 100644
> --- a/tests/i915/gem_cs_tlb.c
> +++ b/tests/i915/gem_cs_tlb.c
> @@ -52,6 +52,14 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +/**
> + * TEST: gem cs tlb
> + * Description: Check whether we correctly invalidate the cs tlb.
> + * Feature: mapping
> + * Run type: FULL
> + *
> + * SUBTEST: engines
> + */
>  
>  IGT_TEST_DESCRIPTION("Check whether we correctly invalidate the cs tlb.");
>  
> diff --git a/tests/i915/gem_ctx_bad_destroy.c b/tests/i915/gem_ctx_bad_destroy.c
> index 50bb9aa07066..90495da8ab2e 100644
> --- a/tests/i915/gem_ctx_bad_destroy.c
> +++ b/tests/i915/gem_ctx_bad_destroy.c
> @@ -34,6 +34,20 @@
>  #include <string.h>
>  #include <errno.h>
>  
> +/**
> + * TEST: gem ctx bad destroy
> + * Description: Negative test cases for destroy contexts.
> + * Feature: context
> + * Run type: FULL
> + *
> + * SUBTEST: double-destroy
> + *
> + * SUBTEST: invalid-ctx
> + *
> + * SUBTEST: invalid-default-ctx
> + *
> + * SUBTEST: invalid-pad
> + */
>  
>  IGT_TEST_DESCRIPTION("Negative test cases for destroy contexts.");
>  
> diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
> index 39f070af9439..14991a671938 100644
> --- a/tests/i915/gem_ctx_create.c
> +++ b/tests/i915/gem_ctx_create.c
> @@ -35,6 +35,75 @@
>  #include "igt.h"
>  #include "igt_rand.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem ctx create
> + * Description: Test the context create ioctls
> + * Feature: context
> + *
> + * SUBTEST: active
> + * Description:
> + *   For each engine calculate the average performance of context creation execution and
> + *   exercise context reclaim
> + * Run type: FULL
> + *
> + * SUBTEST: active-all
> + * Description: Calculate the average performance of context creation and it's execution using all engines
> + * Run type: FULL
> + *
> + * SUBTEST: basic
> + * Description: Test random context creation
> + * Run type: BAT
> + *
> + * SUBTEST: basic-files
> + * Description: Exercise implicit per-fd context creation
> + * Run type: BAT
> + *
> + * SUBTEST: ext-param
> + * Description: Verify valid and invalid context extensions
> + * Run type: FULL
> + *
> + * SUBTEST: files
> + * Description: Exercise implicit per-fd context creation on 1 CPU for long duration
> + * Run type: FULL
> + *
> + * SUBTEST: forked-active
> + * Description:
> + *   For each engine calculate the average performance of context creation and execution on
> + *   multiple parallel processes
> + * Run type: FULL
> + *
> + * SUBTEST: forked-active-all
> + * Description:
> + *   Calculate the average performance of context creation and it's execution using all engines
> + *   on multiple parallel processes
> + * Run type: FULL
> + *
> + * SUBTEST: forked-files
> + * Description: Exercise implicit per-fd context creation on all CPUs for long duration
> + * Run type: FULL
> + *
> + * SUBTEST: hog
> + * Description:
> + *   For each engine calculate the average performance of context creation and execution while
> + *   all other engines are hogging the resources
> + * Run type: FULL
> + *
> + * SUBTEST: iris-pipeline
> + * Description: Set, validate and execute particular context params
> + * Run type: FULL
> + *
> + * SUBTEST: maximum-mem
> + * Description:
> + *   Create contexts upto available RAM size, calculate the average performance of their
> + *   execution on multiple parallel processes
> + * Run type: FULL
> + *
> + * SUBTEST: maximum-swap
> + * Description:
> + *   Create contexts upto available RAM+SWAP size, calculate the average performance of their
> + *   execution on multiple parallel processes
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Test the context create ioctls");
>  
> diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> index b87a21fa4e58..d15a7b7e5f67 100644
> --- a/tests/i915/gem_ctx_engines.c
> +++ b/tests/i915/gem_ctx_engines.c
> @@ -43,6 +43,23 @@
>  #include "igt.h"
>  #include "igt_types.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem ctx engines
> + * Feature: context
> + * Run type: FULL
> + *
> + * SUBTEST: execute-allforone
> + *
> + * SUBTEST: execute-one
> + *
> + * SUBTEST: execute-oneforall
> + *
> + * SUBTEST: independent
> + *
> + * SUBTEST: invalid-engines
> + *
> + * SUBTEST: none
> + */
>  
>  #define engine_class(e, n) ((e)->engines[(n)].engine_class)
>  #define engine_instance(e, n) ((e)->engines[(n)].engine_instance)
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> index 3d94f01db914..4e37b2642085 100644
> --- a/tests/i915/gem_ctx_exec.c
> +++ b/tests/i915/gem_ctx_exec.c
> @@ -47,6 +47,39 @@
>  #include "igt_rand.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem ctx exec
> + * Description: Test context batch buffer execution.
> + * Feature: context
> + *
> + * SUBTEST: basic
> + * Description: Check the basic context batch buffer execution.
> + * Run type: BAT
> + *
> + * SUBTEST: basic-close-race
> + * Description: Race the execution and interrupt handlers along a context, while closing it at a random time.
> + * Run type: FULL
> + *
> + * SUBTEST: basic-invalid-context
> + * Description: Verify that execbuf with invalid context fails.
> + * Run type: FULL
> + *
> + * SUBTEST: basic-nohangcheck
> + * Description: Verify that contexts are automatically shotdown on close, if hangchecking is disabled.
> + * Run type: FULL
> + *
> + * SUBTEST: basic-norecovery
> + * Description: Check the status of context after a hang by setting and unsetting the RECOVERABLE.
> + * Run type: FULL
> + *
> + * SUBTEST: eviction
> + * Description: Check maximum number of buffers it can evict for a context.
> + * Run type: FULL
> + *
> + * SUBTEST: reset-pin-leak
> + * Description: Check if the kernel doesn't leak the vma pin_count for the last context on reset.
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Test context batch buffer execution.");
>  
> diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
> index 18e736c73da1..8e432cbdf8f5 100644
> --- a/tests/i915/gem_ctx_freq.c
> +++ b/tests/i915/gem_ctx_freq.c
> @@ -34,6 +34,13 @@
>  #include "igt_perf.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem ctx freq
> + * Feature: context
> + * Run type: FULL
> + *
> + * SUBTEST: sysfs
> + */
>  
>  #define SAMPLE_PERIOD (USEC_PER_SEC / 10)
>  #define PMU_TOLERANCE 100
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> index 2def529ac3b2..2c2da296d301 100644
> --- a/tests/i915/gem_ctx_isolation.c
> +++ b/tests/i915/gem_ctx_isolation.c
> @@ -26,6 +26,29 @@
>  #include "igt.h"
>  #include "igt_dummyload.h"
>  #include "igt_types.h"
> +/**
> + * TEST: gem ctx isolation
> + * Feature: context
> + * Run type: FULL
> + *
> + * SUBTEST: clean
> + *
> + * SUBTEST: dirty-create
> + *
> + * SUBTEST: dirty-switch
> + *
> + * SUBTEST: nonpriv
> + *
> + * SUBTEST: nonpriv-switch
> + *
> + * SUBTEST: preservation
> + *
> + * SUBTEST: preservation-S3
> + *
> + * SUBTEST: preservation-S4
> + *
> + * SUBTEST: preservation-reset
> + */
>  
>  /* MAX_REG must be greater than the maximum register address. */
>  #define MAX_REG 0x400000
> diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
> index d119ea74e0a4..ae52ee2fa1e6 100644
> --- a/tests/i915/gem_ctx_param.c
> +++ b/tests/i915/gem_ctx_param.c
> @@ -31,6 +31,94 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "i915/gem_vm.h"
> +/**
> + * TEST: gem ctx param
> + * Description: Basic test for context set/get param input validation.
> + * Run type: FULL
> + *
> + * SUBTEST: basic
> + * Description: Basic test for context get/set param ioctls using valid context
> + * Feature: context
> + *
> + * SUBTEST: basic-default
> + * Description: Basic test for context get/set param ioctls using default context
> + * Feature: context
> + *
> + * SUBTEST: get-priority-new-ctx
> + * Description:
> + *   Test performed with context param set to priority.
> + *   Verify that priority is default for newly created context
> + * Feature: context
> + *
> + * SUBTEST: invalid-ctx-get
> + * Description: Verify that context get param ioctl using invalid context returns relevant error
> + * Feature: context
> + *
> + * SUBTEST: invalid-ctx-set
> + * Description: Verify that context set param ioctl using invalid context returns relevant error
> + * Feature: context
> + *
> + * SUBTEST: invalid-get-engines
> + * Feature: context
> + *
> + * SUBTEST: invalid-get-no-zeromap
> + * Feature: context
> + *
> + * SUBTEST: invalid-get-ringsize
> + * Feature: context
> + *
> + * SUBTEST: invalid-param-get
> + * Description: Checks that fetching context parameters using an unused param value is erroneous
> + * Feature: context
> + *
> + * SUBTEST: invalid-param-set
> + * Description: Checks that setting context parameters using an unused param value is erroneous
> + * Feature: context
> + *
> + * SUBTEST: invalid-set-no-zeromap
> + * Feature: context
> + *
> + * SUBTEST: invalid-set-ringsize
> + * Feature: context
> + *
> + * SUBTEST: invalid-size-get
> + * Description: Verify that context get param ioctl returns valid size for valid context
> + * Feature: context
> + *
> + * SUBTEST: invalid-size-set
> + * Description: Verify that context set param ioctl using invalid size returns relevant error
> + * Feature: context
> + *
> + * SUBTEST: non-root-set
> + * Description: Verify that context set param ioctl returns relevant error in non root mode
> + * Feature: context
> + *
> + * SUBTEST: root-set
> + * Description: Verify that context set param ioctl works fine in root mode
> + * Feature: context
> + *
> + * SUBTEST: set-priority-invalid-size
> + * Description:
> + *   Test performed with context param set to priority.
> + *   Verify that relevant error is returned on setting invalid ctx size with default priority
> + * Feature: context
> + *
> + * SUBTEST: set-priority-not-supported
> + * Description:
> + *   Verify that context set param ioctl returns relevant error if driver doesn't supports
> + *   assigning custom priorities from userspace
> + * Feature: context, no-set-priority
> + *
> + * SUBTEST: set-priority-range
> + * Description:
> + *   Test performed with context param set to priority.
> + *   Change priority range to test value overflow
> + * Feature: context
> + *
> + * SUBTEST: vm
> + * Description: Tests that multiple contexts can share the same VMA
> + * Feature: context
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic test for context set/get param input validation.");
>  
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index 9fb528186162..40281ef4209e 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -45,6 +45,75 @@
>  #include "ioctl_wrappers.h" /* gem_wait()! */
>  #include "intel_allocator.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem ctx persistence
> + * Feature: context
> + * Run type: FULL
> + *
> + * SUBTEST: engines-cleanup
> + *
> + * SUBTEST: engines-hang
> + *
> + * SUBTEST: engines-hostile
> + *
> + * SUBTEST: engines-hostile-preempt
> + *
> + * SUBTEST: engines-mixed
> + *
> + * SUBTEST: engines-mixed-process
> + *
> + * SUBTEST: engines-persistence
> + *
> + * SUBTEST: engines-queued
> + *
> + * SUBTEST: file
> + *
> + * SUBTEST: hang
> + *
> + * SUBTEST: heartbeat-close
> + *
> + * SUBTEST: heartbeat-hang
> + *
> + * SUBTEST: heartbeat-hostile
> + *
> + * SUBTEST: heartbeat-many
> + *
> + * SUBTEST: heartbeat-stop
> + *
> + * SUBTEST: hostile
> + *
> + * SUBTEST: idempotent
> + *
> + * SUBTEST: legacy-engines-cleanup
> + *
> + * SUBTEST: legacy-engines-hang
> + *
> + * SUBTEST: legacy-engines-hostile
> + *
> + * SUBTEST: legacy-engines-hostile-preempt
> + *
> + * SUBTEST: legacy-engines-mixed
> + *
> + * SUBTEST: legacy-engines-mixed-process
> + *
> + * SUBTEST: legacy-engines-persistence
> + *
> + * SUBTEST: legacy-engines-queued
> + *
> + * SUBTEST: many-contexts
> + *
> + * SUBTEST: process
> + *
> + * SUBTEST: processes
> + *
> + * SUBTEST: saturated-hostile
> + *
> + * SUBTEST: saturated-hostile-nopreempt
> + *
> + * SUBTEST: smoketest
> + *
> + * SUBTEST: userptr
> + */
>  
>  #define RESET_TIMEOUT_MS 2 * MSEC_PER_SEC; /* default: 640ms */
>  static unsigned long reset_timeout_ms = RESET_TIMEOUT_MS;
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index 3d73db581c4e..078557bd1234 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -47,6 +47,40 @@
>  #include "igt_vgem.h"
>  #include "sw_sync.h"
>  #include "sync_file.h"
> +/**
> + * TEST: gem ctx shared
> + * Description: Test shared contexts.
> + * Feature: context
> + * Run type: FULL
> + *
> + * SUBTEST: Q-in-order
> + *
> + * SUBTEST: Q-independent
> + *
> + * SUBTEST: Q-out-order
> + *
> + * SUBTEST: Q-promotion
> + *
> + * SUBTEST: Q-smoketest
> + *
> + * SUBTEST: Q-smoketest-all
> + *
> + * SUBTEST: create-shared-gtt
> + *
> + * SUBTEST: detached-shared-gtt
> + *
> + * SUBTEST: disjoint-timelines
> + *
> + * SUBTEST: exec-shared-gtt
> + *
> + * SUBTEST: exec-single-timeline
> + *
> + * SUBTEST: exhaust-shared-gtt
> + *
> + * SUBTEST: exhaust-shared-gtt-lrc
> + *
> + * SUBTEST: single-timeline
> + */
>  
>  #define LO 0
>  #define HI 1
> diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
> index 7685511f0734..78748c24d055 100644
> --- a/tests/i915/gem_ctx_sseu.c
> +++ b/tests/i915/gem_ctx_sseu.c
> @@ -44,6 +44,20 @@
>  #include "igt_perf.h"
>  #include "igt_sysfs.h"
>  #include "ioctl_wrappers.h"
> +/**
> + * TEST: gem ctx sseu
> + * Description: Test context render powergating programming.
> + * Feature: pm_sseu
> + * Run type: FULL
> + *
> + * SUBTEST: engines
> + *
> + * SUBTEST: invalid-args
> + *
> + * SUBTEST: invalid-sseu
> + *
> + * SUBTEST: mmap-args
> + */
>  
>  IGT_TEST_DESCRIPTION("Test context render powergating programming.");
>  
> diff --git a/tests/i915/gem_ctx_switch.c b/tests/i915/gem_ctx_switch.c
> index 4e46b7634858..b0066ab27abd 100644
> --- a/tests/i915/gem_ctx_switch.c
> +++ b/tests/i915/gem_ctx_switch.c
> @@ -45,6 +45,371 @@
>  #include "i915/gem_ring.h"
>  #include "i915/gem_vm.h"
>  #include "igt.h"
> +/**
> + * TEST: gem ctx switch
> + * Feature: context
> + * Run type: FULL
> + *
> + * SUBTEST: all-heavy
> + *
> + * SUBTEST: all-light
> + *
> + * SUBTEST: bcs0
> + *
> + * SUBTEST: bcs0-forked
> + *
> + * SUBTEST: bcs0-forked-heavy
> + *
> + * SUBTEST: bcs0-forked-heavy-interruptible
> + *
> + * SUBTEST: bcs0-forked-heavy-queue
> + *
> + * SUBTEST: bcs0-forked-heavy-queue-interruptible
> + *
> + * SUBTEST: bcs0-forked-interruptible
> + *
> + * SUBTEST: bcs0-forked-queue
> + *
> + * SUBTEST: bcs0-forked-queue-interruptible
> + *
> + * SUBTEST: bcs0-heavy
> + *
> + * SUBTEST: bcs0-heavy-interruptible
> + *
> + * SUBTEST: bcs0-heavy-queue
> + *
> + * SUBTEST: bcs0-heavy-queue-interruptible
> + *
> + * SUBTEST: bcs0-interruptible
> + *
> + * SUBTEST: bcs0-queue
> + *
> + * SUBTEST: bcs0-queue-interruptible
> + *
> + * SUBTEST: legacy-blt
> + *
> + * SUBTEST: legacy-blt-forked
> + *
> + * SUBTEST: legacy-blt-forked-heavy
> + *
> + * SUBTEST: legacy-blt-forked-heavy-interruptible
> + *
> + * SUBTEST: legacy-blt-forked-heavy-queue
> + *
> + * SUBTEST: legacy-blt-forked-heavy-queue-interruptible
> + *
> + * SUBTEST: legacy-blt-forked-interruptible
> + *
> + * SUBTEST: legacy-blt-forked-queue
> + *
> + * SUBTEST: legacy-blt-forked-queue-interruptible
> + *
> + * SUBTEST: legacy-blt-heavy
> + *
> + * SUBTEST: legacy-blt-heavy-interruptible
> + *
> + * SUBTEST: legacy-blt-heavy-queue
> + *
> + * SUBTEST: legacy-blt-heavy-queue-interruptible
> + *
> + * SUBTEST: legacy-blt-interruptible
> + *
> + * SUBTEST: legacy-blt-queue
> + *
> + * SUBTEST: legacy-blt-queue-interruptible
> + *
> + * SUBTEST: legacy-bsd1
> + *
> + * SUBTEST: legacy-bsd1-forked
> + *
> + * SUBTEST: legacy-bsd1-forked-heavy
> + *
> + * SUBTEST: legacy-bsd1-forked-heavy-interruptible
> + *
> + * SUBTEST: legacy-bsd1-forked-heavy-queue
> + *
> + * SUBTEST: legacy-bsd1-forked-heavy-queue-interruptible
> + *
> + * SUBTEST: legacy-bsd1-forked-interruptible
> + *
> + * SUBTEST: legacy-bsd1-forked-queue
> + *
> + * SUBTEST: legacy-bsd1-forked-queue-interruptible
> + *
> + * SUBTEST: legacy-bsd1-heavy
> + *
> + * SUBTEST: legacy-bsd1-heavy-interruptible
> + *
> + * SUBTEST: legacy-bsd1-heavy-queue
> + *
> + * SUBTEST: legacy-bsd1-heavy-queue-interruptible
> + *
> + * SUBTEST: legacy-bsd1-interruptible
> + *
> + * SUBTEST: legacy-bsd1-queue
> + *
> + * SUBTEST: legacy-bsd1-queue-interruptible
> + *
> + * SUBTEST: legacy-bsd2
> + *
> + * SUBTEST: legacy-bsd2-forked
> + *
> + * SUBTEST: legacy-bsd2-forked-heavy
> + *
> + * SUBTEST: legacy-bsd2-forked-heavy-interruptible
> + *
> + * SUBTEST: legacy-bsd2-forked-heavy-queue
> + *
> + * SUBTEST: legacy-bsd2-forked-heavy-queue-interruptible
> + *
> + * SUBTEST: legacy-bsd2-forked-interruptible
> + *
> + * SUBTEST: legacy-bsd2-forked-queue
> + *
> + * SUBTEST: legacy-bsd2-forked-queue-interruptible
> + *
> + * SUBTEST: legacy-bsd2-heavy
> + *
> + * SUBTEST: legacy-bsd2-heavy-interruptible
> + *
> + * SUBTEST: legacy-bsd2-heavy-queue
> + *
> + * SUBTEST: legacy-bsd2-heavy-queue-interruptible
> + *
> + * SUBTEST: legacy-bsd2-interruptible
> + *
> + * SUBTEST: legacy-bsd2-queue
> + *
> + * SUBTEST: legacy-bsd2-queue-interruptible
> + *
> + * SUBTEST: legacy-default
> + *
> + * SUBTEST: legacy-default-forked
> + *
> + * SUBTEST: legacy-default-forked-heavy
> + *
> + * SUBTEST: legacy-default-forked-heavy-interruptible
> + *
> + * SUBTEST: legacy-default-forked-heavy-queue
> + *
> + * SUBTEST: legacy-default-forked-heavy-queue-interruptible
> + *
> + * SUBTEST: legacy-default-forked-interruptible
> + *
> + * SUBTEST: legacy-default-forked-queue
> + *
> + * SUBTEST: legacy-default-forked-queue-interruptible
> + *
> + * SUBTEST: legacy-default-heavy
> + *
> + * SUBTEST: legacy-default-heavy-interruptible
> + *
> + * SUBTEST: legacy-default-heavy-queue
> + *
> + * SUBTEST: legacy-default-heavy-queue-interruptible
> + *
> + * SUBTEST: legacy-default-interruptible
> + *
> + * SUBTEST: legacy-default-queue
> + *
> + * SUBTEST: legacy-default-queue-interruptible
> + *
> + * SUBTEST: legacy-render
> + *
> + * SUBTEST: legacy-render-forked
> + *
> + * SUBTEST: legacy-render-forked-heavy
> + *
> + * SUBTEST: legacy-render-forked-heavy-interruptible
> + *
> + * SUBTEST: legacy-render-forked-heavy-queue
> + *
> + * SUBTEST: legacy-render-forked-heavy-queue-interruptible
> + *
> + * SUBTEST: legacy-render-forked-interruptible
> + *
> + * SUBTEST: legacy-render-forked-queue
> + *
> + * SUBTEST: legacy-render-forked-queue-interruptible
> + *
> + * SUBTEST: legacy-render-heavy
> + *
> + * SUBTEST: legacy-render-heavy-interruptible
> + *
> + * SUBTEST: legacy-render-heavy-queue
> + *
> + * SUBTEST: legacy-render-heavy-queue-interruptible
> + *
> + * SUBTEST: legacy-render-interruptible
> + *
> + * SUBTEST: legacy-render-queue
> + *
> + * SUBTEST: legacy-render-queue-interruptible
> + *
> + * SUBTEST: legacy-vebox
> + *
> + * SUBTEST: legacy-vebox-forked
> + *
> + * SUBTEST: legacy-vebox-forked-heavy
> + *
> + * SUBTEST: legacy-vebox-forked-heavy-interruptible
> + *
> + * SUBTEST: legacy-vebox-forked-heavy-queue
> + *
> + * SUBTEST: legacy-vebox-forked-heavy-queue-interruptible
> + *
> + * SUBTEST: legacy-vebox-forked-interruptible
> + *
> + * SUBTEST: legacy-vebox-forked-queue
> + *
> + * SUBTEST: legacy-vebox-forked-queue-interruptible
> + *
> + * SUBTEST: legacy-vebox-heavy
> + *
> + * SUBTEST: legacy-vebox-heavy-interruptible
> + *
> + * SUBTEST: legacy-vebox-heavy-queue
> + *
> + * SUBTEST: legacy-vebox-heavy-queue-interruptible
> + *
> + * SUBTEST: legacy-vebox-interruptible
> + *
> + * SUBTEST: legacy-vebox-queue
> + *
> + * SUBTEST: legacy-vebox-queue-interruptible
> + *
> + * SUBTEST: queue-heavy
> + *
> + * SUBTEST: queue-light
> + *
> + * SUBTEST: rcs0
> + *
> + * SUBTEST: rcs0-forked
> + *
> + * SUBTEST: rcs0-forked-heavy
> + *
> + * SUBTEST: rcs0-forked-heavy-interruptible
> + *
> + * SUBTEST: rcs0-forked-heavy-queue
> + *
> + * SUBTEST: rcs0-forked-heavy-queue-interruptible
> + *
> + * SUBTEST: rcs0-forked-interruptible
> + *
> + * SUBTEST: rcs0-forked-queue
> + *
> + * SUBTEST: rcs0-forked-queue-interruptible
> + *
> + * SUBTEST: rcs0-heavy
> + *
> + * SUBTEST: rcs0-heavy-interruptible
> + *
> + * SUBTEST: rcs0-heavy-queue
> + *
> + * SUBTEST: rcs0-heavy-queue-interruptible
> + *
> + * SUBTEST: rcs0-interruptible
> + *
> + * SUBTEST: rcs0-queue
> + *
> + * SUBTEST: rcs0-queue-interruptible
> + *
> + * SUBTEST: vcs0
> + *
> + * SUBTEST: vcs0-forked
> + *
> + * SUBTEST: vcs0-forked-heavy
> + *
> + * SUBTEST: vcs0-forked-heavy-interruptible
> + *
> + * SUBTEST: vcs0-forked-heavy-queue
> + *
> + * SUBTEST: vcs0-forked-heavy-queue-interruptible
> + *
> + * SUBTEST: vcs0-forked-interruptible
> + *
> + * SUBTEST: vcs0-forked-queue
> + *
> + * SUBTEST: vcs0-forked-queue-interruptible
> + *
> + * SUBTEST: vcs0-heavy
> + *
> + * SUBTEST: vcs0-heavy-interruptible
> + *
> + * SUBTEST: vcs0-heavy-queue
> + *
> + * SUBTEST: vcs0-heavy-queue-interruptible
> + *
> + * SUBTEST: vcs0-interruptible
> + *
> + * SUBTEST: vcs0-queue
> + *
> + * SUBTEST: vcs0-queue-interruptible
> + *
> + * SUBTEST: vcs1
> + *
> + * SUBTEST: vcs1-forked
> + *
> + * SUBTEST: vcs1-forked-heavy
> + *
> + * SUBTEST: vcs1-forked-heavy-interruptible
> + *
> + * SUBTEST: vcs1-forked-heavy-queue
> + *
> + * SUBTEST: vcs1-forked-heavy-queue-interruptible
> + *
> + * SUBTEST: vcs1-forked-interruptible
> + *
> + * SUBTEST: vcs1-forked-queue
> + *
> + * SUBTEST: vcs1-forked-queue-interruptible
> + *
> + * SUBTEST: vcs1-heavy
> + *
> + * SUBTEST: vcs1-heavy-interruptible
> + *
> + * SUBTEST: vcs1-heavy-queue
> + *
> + * SUBTEST: vcs1-heavy-queue-interruptible
> + *
> + * SUBTEST: vcs1-interruptible
> + *
> + * SUBTEST: vcs1-queue
> + *
> + * SUBTEST: vcs1-queue-interruptible
> + *
> + * SUBTEST: vecs0
> + *
> + * SUBTEST: vecs0-forked
> + *
> + * SUBTEST: vecs0-forked-heavy
> + *
> + * SUBTEST: vecs0-forked-heavy-interruptible
> + *
> + * SUBTEST: vecs0-forked-heavy-queue
> + *
> + * SUBTEST: vecs0-forked-heavy-queue-interruptible
> + *
> + * SUBTEST: vecs0-forked-interruptible
> + *
> + * SUBTEST: vecs0-forked-queue
> + *
> + * SUBTEST: vecs0-forked-queue-interruptible
> + *
> + * SUBTEST: vecs0-heavy
> + *
> + * SUBTEST: vecs0-heavy-interruptible
> + *
> + * SUBTEST: vecs0-heavy-queue
> + *
> + * SUBTEST: vecs0-heavy-queue-interruptible
> + *
> + * SUBTEST: vecs0-interruptible
> + *
> + * SUBTEST: vecs0-queue
> + *
> + * SUBTEST: vecs0-queue-interruptible
> + */
>  
>  #define INTERRUPTIBLE 0x1
>  #define QUEUE 0x2
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index 8dbaa7a75903..370d40b39e1c 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -52,6 +52,99 @@
>  #include "igt_stats.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem eio
> + * Description: Test that specific ioctls report a wedged GPU (EIO).
> + * Run type: FULL
> + *
> + * SUBTEST: banned
> + * Feature: reset
> + *
> + * SUBTEST: context-create
> + * Feature: reset
> + *
> + * SUBTEST: create
> + * Description: Validate i915_gem_create_ioctl, while gpu is wedged for fb scanout.
> + * Feature: reset
> + *
> + * SUBTEST: create-ext
> + * Description:
> + *   Validate i915_gem_create_ext_ioctl and checks if returns clear backing store while gpu is
> + *   wedged for fb scanout.
> + * Feature: reset
> + *
> + * SUBTEST: execbuf
> + * Feature: reset
> + *
> + * SUBTEST: hibernate
> + * Feature: hibernate, reset
> + *
> + * SUBTEST: in-flight-10ms
> + * Feature: reset
> + *
> + * SUBTEST: in-flight-1us
> + * Feature: reset
> + *
> + * SUBTEST: in-flight-contexts-10ms
> + * Feature: reset
> + *
> + * SUBTEST: in-flight-contexts-1us
> + * Feature: reset
> + *
> + * SUBTEST: in-flight-contexts-immediate
> + * Feature: reset
> + *
> + * SUBTEST: in-flight-external
> + * Feature: reset
> + *
> + * SUBTEST: in-flight-immediate
> + * Feature: reset
> + *
> + * SUBTEST: in-flight-internal-10ms
> + * Feature: reset
> + *
> + * SUBTEST: in-flight-internal-1us
> + * Feature: reset
> + *
> + * SUBTEST: in-flight-internal-immediate
> + * Feature: reset
> + *
> + * SUBTEST: in-flight-suspend
> + * Feature: reset
> + *
> + * SUBTEST: kms
> + * Feature: kms_gem_interop, reset
> + *
> + * SUBTEST: reset-stress
> + * Feature: reset
> + *
> + * SUBTEST: suspend
> + * Feature: reset, suspend
> + *
> + * SUBTEST: throttle
> + * Feature: reset
> + *
> + * SUBTEST: unwedge-stress
> + * Feature: reset
> + *
> + * SUBTEST: wait-10ms
> + * Feature: reset
> + *
> + * SUBTEST: wait-1us
> + * Feature: reset
> + *
> + * SUBTEST: wait-immediate
> + * Feature: reset
> + *
> + * SUBTEST: wait-wedge-10ms
> + * Feature: reset
> + *
> + * SUBTEST: wait-wedge-1us
> + * Feature: reset
> + *
> + * SUBTEST: wait-wedge-immediate
> + * Feature: reset
> + */
>  
>  IGT_TEST_DESCRIPTION("Test that specific ioctls report a wedged GPU (EIO).");
>  
> diff --git a/tests/i915/gem_evict_alignment.c b/tests/i915/gem_evict_alignment.c
> index 0b560ab03ccf..f04f24972eb7 100644
> --- a/tests/i915/gem_evict_alignment.c
> +++ b/tests/i915/gem_evict_alignment.c
> @@ -47,6 +47,23 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +/**
> + * TEST: gem evict alignment
> + * Description: Run a couple of big batches to force the unbind on misalignment code.
> + * Run type: FULL
> + *
> + * SUBTEST: major-hang
> + *
> + * SUBTEST: major-interruptible
> + *
> + * SUBTEST: major-normal
> + *
> + * SUBTEST: minor-hang
> + *
> + * SUBTEST: minor-interruptible
> + *
> + * SUBTEST: minor-normal
> + */
>  
>  IGT_TEST_DESCRIPTION("Run a couple of big batches to force the unbind on"
>  		     " misalignment code.");
> diff --git a/tests/i915/gem_evict_everything.c b/tests/i915/gem_evict_everything.c
> index 120f890728df..87f854bf88cf 100644
> --- a/tests/i915/gem_evict_everything.c
> +++ b/tests/i915/gem_evict_everything.c
> @@ -48,6 +48,67 @@
>  #include "igt.h"
>  
>  #include "eviction_common.c"
> +/**
> + * TEST: gem evict everything
> + * Description: Run a couple of big batches to force the eviction code.
> + * Run type: FULL
> + *
> + * SUBTEST: forked-interruptible
> + *
> + * SUBTEST: forked-mempressure-interruptible
> + *
> + * SUBTEST: forked-mempressure-normal
> + *
> + * SUBTEST: forked-multifd-interruptible
> + *
> + * SUBTEST: forked-multifd-mempressure-interruptible
> + *
> + * SUBTEST: forked-multifd-mempressure-normal
> + *
> + * SUBTEST: forked-multifd-normal
> + *
> + * SUBTEST: forked-normal
> + *
> + * SUBTEST: forked-swapping-interruptible
> + *
> + * SUBTEST: forked-swapping-mempressure-interruptible
> + *
> + * SUBTEST: forked-swapping-mempressure-normal
> + *
> + * SUBTEST: forked-swapping-multifd-interruptible
> + *
> + * SUBTEST: forked-swapping-multifd-mempressure-interruptible
> + *
> + * SUBTEST: forked-swapping-multifd-mempressure-normal
> + *
> + * SUBTEST: forked-swapping-multifd-normal
> + *
> + * SUBTEST: forked-swapping-normal
> + *
> + * SUBTEST: major-hang
> + *
> + * SUBTEST: major-interruptible
> + *
> + * SUBTEST: major-normal
> + *
> + * SUBTEST: minor-hang
> + *
> + * SUBTEST: minor-interruptible
> + *
> + * SUBTEST: minor-normal
> + *
> + * SUBTEST: mlocked-hang
> + *
> + * SUBTEST: mlocked-interruptible
> + *
> + * SUBTEST: mlocked-normal
> + *
> + * SUBTEST: swapping-hang
> + *
> + * SUBTEST: swapping-interruptible
> + *
> + * SUBTEST: swapping-normal
> + */
>  
>  IGT_TEST_DESCRIPTION("Run a couple of big batches to force the eviction"
>  		     " code.");
> diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
> index a9fcd2a747d1..32db9840a344 100644
> --- a/tests/i915/gem_exec_alignment.c
> +++ b/tests/i915/gem_exec_alignment.c
> @@ -45,6 +45,24 @@
>  #include "i915/gem_create.h"
>  #include "igt.h"
>  #include "igt_types.h"
> +/**
> + * TEST: gem exec alignment
> + * Description: Exercises the basic execbuffer using object alignments
> + * Feature: cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST: forked
> + *
> + * SUBTEST: many
> + *
> + * SUBTEST: pi
> + *
> + * SUBTEST: pi-isolated
> + *
> + * SUBTEST: pi-shared
> + *
> + * SUBTEST: single
> + */
>  
>  IGT_TEST_DESCRIPTION("Exercises the basic execbuffer using object alignments");
>  
> diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
> index 173bc4648a5a..1153c0bf2e30 100644
> --- a/tests/i915/gem_exec_async.c
> +++ b/tests/i915/gem_exec_async.c
> @@ -24,6 +24,16 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +/**
> + * TEST: gem exec async
> + * Description: Check that we can issue concurrent writes across the engines.
> + * Feature: cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST: concurrent-writes
> + *
> + * SUBTEST: forked-writes
> + */
>  
>  IGT_TEST_DESCRIPTION("Check that we can issue concurrent writes across the engines.");
>  
> diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
> index 4935cf395b2e..c7f949c9cd2b 100644
> --- a/tests/i915/gem_exec_await.c
> +++ b/tests/i915/gem_exec_await.c
> @@ -31,6 +31,15 @@
>  #include "igt_rand.h"
>  #include "igt_sysfs.h"
>  #include "igt_vgem.h"
> +/**
> + * TEST: gem exec await
> + * Feature: cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST: wide-all
> + *
> + * SUBTEST: wide-contexts
> + */
>  
>  static double elapsed(const struct timespec *start, const struct timespec *end)
>  {
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index 1c655e583c51..d1d92e6ba689 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -38,6 +38,123 @@
>  #include "igt_sysfs.h"
>  #include "igt_types.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem exec balancer
> + * Description: Exercise in-kernel load-balancing
> + * Run type: FULL
> + *
> + * SUBTEST: bonded-chain
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: bonded-dual
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: bonded-false-hang
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: bonded-pair
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: bonded-semaphore
> + * Feature: cmd_submission, media_scalability, multictx
> + *
> + * SUBTEST: bonded-sync
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: bonded-true-hang
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: busy
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: fairslice
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: full
> + * Feature: cmd_submission, media_scalability, multictx
> + *
> + * SUBTEST: full-late
> + * Feature: cmd_submission, media_scalability, multictx
> + *
> + * SUBTEST: full-late-pulse
> + * Feature: cmd_submission, media_scalability, multictx
> + *
> + * SUBTEST: full-pulse
> + * Feature: cmd_submission, media_scalability, multictx
> + *
> + * SUBTEST: hang
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: hog
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: indices
> + * Feature: cmd_submission, media_scalability, multictx
> + *
> + * SUBTEST: individual
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: invalid-balancer
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: invalid-bonds
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: nohangcheck
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: noheartbeat
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: nop
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: parallel
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: parallel-balancer
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: parallel-bb-first
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: parallel-contexts
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: parallel-dmabuf-import-out-fence
> + * Description: Regression test to check that dmabuf imported sync file can handle fence array
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: parallel-keep-in-fence
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: parallel-keep-submit-fence
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: parallel-ordering
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: parallel-out-fence
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: persistence
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: semaphore
> + * Feature: cmd_submission, media_scalability, multictx
> + *
> + * SUBTEST: sequential
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: sliced
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: smoke
> + * Feature: cmd_submission, media_scalability
> + *
> + * SUBTEST: waits
> + * Feature: cmd_submission, media_scalability
> + */
>  
>  IGT_TEST_DESCRIPTION("Exercise in-kernel load-balancing");
>  
> diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
> index ca4fc7b961df..437ce0954557 100644
> --- a/tests/i915/gem_exec_basic.c
> +++ b/tests/i915/gem_exec_basic.c
> @@ -25,6 +25,17 @@
>  #include "igt_collection.h"
>  
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem exec basic
> + * Description: Basic sanity check of execbuf-ioctl rings.
> + * Feature: cmd_submission
> + * Run type: BAT
> + *
> + * SUBTEST: basic
> + * Description:
> + *   Check basic functionality of GEM_EXECBUFFER2 ioctl on every ring and iterating over memory
> + *   regions.
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl rings.");
>  
> diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
> index 4619bda81981..7f07cf6c69db 100644
> --- a/tests/i915/gem_exec_big.c
> +++ b/tests/i915/gem_exec_big.c
> @@ -48,6 +48,16 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +/**
> + * TEST: gem exec big
> + * Description: Run a large nop batch to stress test the error capture code.
> + * Feature: cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST: exhaustive
> + *
> + * SUBTEST: single
> + */
>  
>  IGT_TEST_DESCRIPTION("Run a large nop batch to stress test the error capture"
>  		     " code.");
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index 9c391192d952..faa997ca8af1 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -31,6 +31,36 @@
>  #include "igt_device.h"
>  #include "igt_rand.h"
>  #include "igt_sysfs.h"
> +/**
> + * TEST: gem exec capture
> + * Description: Check that we capture the user specified objects on a hang
> + * Feature: cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST: capture
> + *
> + * SUBTEST: capture-invisible
> + * Description:
> + *   Check that the kernel doesn't crash if the pages can't be copied from the CPU during error
> + *   capture.
> + *
> + * SUBTEST: capture-recoverable
> + * Description: Verify that the kernel rejects EXEC_OBJECT_CAPTURE with recoverable contexts.
> + *
> + * SUBTEST: many-256M-incremental
> + *
> + * SUBTEST: many-2M-incremental
> + *
> + * SUBTEST: many-2M-zero
> + *
> + * SUBTEST: many-4K-incremental
> + *
> + * SUBTEST: many-4K-zero
> + *
> + * SUBTEST: pi
> + *
> + * SUBTEST: userptr
> + */
>  
>  #define MAX_RESET_TIME	600
>  
> diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
> index 449aa5b2e905..89e9a8ec8ad3 100644
> --- a/tests/i915/gem_exec_create.c
> +++ b/tests/i915/gem_exec_create.c
> @@ -46,6 +46,32 @@
>  
>  #include "i915_drm.h"
>  #include "i915/intel_memory_region.h"
> +/**
> + * TEST: gem exec create
> + * Description:
> + *   This test overloads the driver with transient active objects and checks if we don't kill the
> + *   system under the memory pressure some of the symptoms this test look for include mysterious
> + *   hangs.
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic
> + * Description: Check if we kill system by overloading it with active objects iterating over all engines.
> + * Run type: BAT
> + *
> + * SUBTEST: forked
> + * Description: Concurrently overloads system with active objects and checks if we kill system.
> + * Run type: FULL
> + *
> + * SUBTEST: legacy
> + * Description:
> + *   Check if we kill the system by overloading it with active objects iterating over legacy
> + *   engines.
> + * Run type: FULL
> + *
> + * SUBTEST: madvise
> + * Description: This test does a forced reclaim, behaving like a bad application leaking its bo cache.
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("This test overloads the driver with transient active objects"
>  		     " and checks if we don't kill the system under the memory pressure"
> diff --git a/tests/i915/gem_exec_endless.c b/tests/i915/gem_exec_endless.c
> index 77719de83b67..25ad16898761 100644
> --- a/tests/i915/gem_exec_endless.c
> +++ b/tests/i915/gem_exec_endless.c
> @@ -30,6 +30,13 @@
>  #include "igt_sysfs.h"
>  #include "igt_types.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem exec endless
> + * Feature: cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST: dispatch
> + */
>  
>  #define MAX_ENGINES 64
>  
> diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
> index 8208ab404e80..5268efdc8ce2 100644
> --- a/tests/i915/gem_exec_fair.c
> +++ b/tests/i915/gem_exec_fair.c
> @@ -26,6 +26,98 @@
>  #include "igt_vgem.h"
>  #include "ioctl_wrappers.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem exec fair
> + * Description: Check that GPU time and execution order is fairly distributed across clients
> + * Feature: cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST: basic-deadline
> + *
> + * SUBTEST: basic-flow
> + *
> + * SUBTEST: basic-none
> + *
> + * SUBTEST: basic-none-rrul
> + *
> + * SUBTEST: basic-none-share
> + *
> + * SUBTEST: basic-none-solo
> + *
> + * SUBTEST: basic-none-vip
> + *
> + * SUBTEST: basic-pace
> + *
> + * SUBTEST: basic-pace-share
> + *
> + * SUBTEST: basic-pace-solo
> + *
> + * SUBTEST: basic-sync
> + *
> + * SUBTEST: basic-throttle
> + *
> + * SUBTEST: deadline-prio
> + *
> + * SUBTEST: fair-flow
> + *
> + * SUBTEST: fair-flow-ping
> + *
> + * SUBTEST: fair-flow-share
> + *
> + * SUBTEST: fair-flow-solo
> + *
> + * SUBTEST: fair-half
> + *
> + * SUBTEST: fair-half-solo
> + *
> + * SUBTEST: fair-next
> + *
> + * SUBTEST: fair-next-ping
> + *
> + * SUBTEST: fair-next-share
> + *
> + * SUBTEST: fair-next-solo
> + *
> + * SUBTEST: fair-none
> + *
> + * SUBTEST: fair-none-ping
> + *
> + * SUBTEST: fair-none-rrul
> + *
> + * SUBTEST: fair-none-share
> + *
> + * SUBTEST: fair-none-solo
> + *
> + * SUBTEST: fair-none-vip
> + *
> + * SUBTEST: fair-pace
> + *
> + * SUBTEST: fair-pace-ping
> + *
> + * SUBTEST: fair-pace-share
> + *
> + * SUBTEST: fair-pace-solo
> + *
> + * SUBTEST: fair-spare
> + *
> + * SUBTEST: fair-spare-solo
> + *
> + * SUBTEST: fair-sync
> + *
> + * SUBTEST: fair-sync-solo
> + *
> + * SUBTEST: fair-sync-vip
> + *
> + * SUBTEST: fair-throttle
> + *
> + * SUBTEST: fair-throttle-rrul
> + *
> + * SUBTEST: fair-throttle-share
> + *
> + * SUBTEST: fair-throttle-solo
> + *
> + * SUBTEST: fair-throttle-vip
> + */
>  
>  IGT_TEST_DESCRIPTION("Check that GPU time and execution order is fairly distributed across clients");
>  
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index c2d874f84b91..ede9b5a6e698 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -35,6 +35,246 @@
>  #include "igt_vgem.h"
>  #include "intel_ctx.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem exec fence
> + * Description: Check that execbuf waits for explicit fences
> + *
> + * SUBTEST: await-hang
> + * Description: Check for explicit fence with async wait on each engine with a pending gpu hang.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: basic-await
> + * Description: Basic check for explicit fence with async wait on each engine.
> + * Feature: cmd_submission, multitile, synchronization
> + * Run type: BAT
> + *
> + * SUBTEST: basic-busy
> + * Description: Basic check for explicit fence on each busy engine.
> + * Feature: cmd_submission, multitile, synchronization
> + * Run type: BAT
> + *
> + * SUBTEST: basic-busy-all
> + * Description: Basic check for composite fence on all busy engines.
> + * Feature: cmd_submission, multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: basic-wait
> + * Description: Basic check for explicit fence with additinal wait time on each busy engine.
> + * Feature: cmd_submission, multitile, synchronization
> + * Run type: BAT
> + *
> + * SUBTEST: basic-wait-all
> + * Description: Basic check for composite fence with additional wait on all busy engines.
> + * Feature: cmd_submission, multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: busy-hang
> + * Description: Check for explicit fence on each busy engine with a pending gpu hang.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: busy-hang-all
> + * Description: Check for composite fence on all busy engines with a pending gpu hang.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: concurrent
> + * Description: Check blocking bonded fences on each engine.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: expired-history
> + * Description: Verifies long history of fences are expired.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: invalid-fence-array
> + * Description: Verifies invalid fence-array pointers are rejected.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: invalid-timeline-fence-array
> + * Description:
> + *   Verifies invalid execbuf parameters in drm_i915_gem_execbuffer_ext_timeline_fences
> + *   are rejected
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: keep-in-fence
> + * Description: Check in-fence is not overwritten with out-fence on each engine.
> + * Feature: cmd_submission, multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: long-history
> + * Description: Verifies accumulation of long history of fences.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: nb-await
> + * Description: Check for explicit fence with non-blocking wait on each engine.
> + * Feature: cmd_submission, multitile, synchronization
> + * Run type: BAT
> + *
> + * SUBTEST: nb-await-hang
> + * Description: Check for explicit fence with non-blocking async wait on each engine with a pending gpu hang.
> + * Feature: cmd_submission, multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: parallel
> + * Description: Check for EXEC_FENCE_SUBMIT in parallel execution scenarios on each engine.
> + * Feature: cmd_submission, multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: submit
> + * Description: Check timeslicing on submit-fence.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: submit-chain
> + * Description: Check launching a chain of spinners across all engines using submit-fence.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: submit3
> + * Description: Check timeslicing on submit-fence by submitting coupled batches.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: submit67
> + * Description:
> + *   Check timeslicing on submit-fence by submitting more coupled batches than can possibly fit
> + *   into the ELSP.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-backward-timeline-chain-engines
> + * Description:
> + *   Engine chaining tests to verify ordering of timeline syncobjs with backward timeline
> + *   points.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-channel
> + * Description: Verifies two clients racing for syncobj using channel.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-export
> + * Description: Verify exporting of fence-array syncobj signaled by i915.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-import
> + * Description: Verifies creating of a syncobj from explicit fence.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-invalid-flags
> + * Description: Verifies that invalid fence flags in fence-array are rejected.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-invalid-wait
> + * Description: Verifies that submitting an execbuf with a wait on a syncobj that doesn't exists is rejected.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-repeat
> + * Description: Verifies that waiting & signaling a same fence-array syncobj within the same execbuf works.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-signal
> + * Description: Verifies proper signaling of a fence-array syncobj through execbuf.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-stationary-timeline-chain-engines
> + * Description:
> + *   Engine chaining tests to verify ordering of timeline syncobj with stationary timeline
> + *   points.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-timeline-chain-engines
> + * Description: Engine chaining tests to verify ordering of timeline syncobjs through execbuf.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-timeline-export
> + * Description: Verify exporting of timeline syncobj signaled by i915
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-timeline-invalid-flags
> + * Description:
> + *   Verifies that invalid fence flags in drm_i915_gem_execbuffer_ext_timeline_fences are
> + *   rejected
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-timeline-invalid-wait
> + * Description:
> + *   Verifies that submitting an execbuf with a wait on a timeline syncobj point that does not
> + *   exists is rejected
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-timeline-multiple-ext-nodes
> + * Description: Verify that passing multiple execbuffer_ext nodes works
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-timeline-repeat
> + * Description:
> + *   Verifies that waiting & signaling a same timeline syncobj point within the same execbuf
> + *   fworks
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-timeline-signal
> + * Description: Verifies proper signaling of a timeline syncobj through execbuf
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-timeline-unused-fence
> + * Description:
> + *   Verifies that a timeline syncobj passed into
> + *   drm_i915_gem_execbuffer_ext_timeline_fences but with no signal/wait flag is left
> + *   untouched
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-timeline-wait
> + * Description: Verifies that waiting on a timeline syncobj point between engines works
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-unused-fence
> + * Description: Verifies that a syncobj passed into execbuf but with no signal/wait flag is left untouched.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: syncobj-wait
> + * Description: Verifies that waiting on a timeline syncobj point between engines works.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: wait-hang
> + * Description:
> + *   Check for explicit fence with additional wait time on each busy engine with a pending gpu
> + *   hang.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: wait-hang-all
> + * Description:
> + *   Check for composite fence with additional wait on all busy engines and with a pending gpu
> + *   hang.
> + * Feature: cmd_submission, synchronization
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Check that execbuf waits for explicit fences");
>  
> diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
> index 42ddbc529ec6..e213bda5edb3 100644
> --- a/tests/i915/gem_exec_flush.c
> +++ b/tests/i915/gem_exec_flush.c
> @@ -28,6 +28,1502 @@
>  #include "i915/gem_ring.h"
>  #include "igt.h"
>  #include "igt_x86.h"
> +/**
> + * TEST: gem exec flush
> + * Description: Basic check of flushing after batches
> + * Run type: FULL
> + *
> + * SUBTEST: basic-batch-kernel-default-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: basic-batch-kernel-default-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-batch-kernel-default-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-uc-pro-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-uc-prw-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-uc-ro-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-uc-rw-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-uc-set-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wb-pro-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wb-prw-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wb-ro-before-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wb-ro-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wb-rw-before-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wb-rw-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wb-set-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-blt-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-cpu-blt-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-blt-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-bsd-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-cpu-bsd-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-bsd-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-bsd1-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-cpu-bsd1-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-bsd1-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-bsd2-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-cpu-bsd2-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-bsd2-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-default-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-cpu-default-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-default-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-render-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-cpu-render-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-render-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-vebox-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-cpu-vebox-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-cpu-vebox-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-blt-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-gtt-blt-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-blt-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-bsd-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-gtt-bsd-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-bsd-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-bsd1-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-gtt-bsd1-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-bsd1-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-bsd2-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-gtt-bsd2-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-bsd2-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-default-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-gtt-default-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-default-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-render-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-gtt-render-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-render-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-vebox-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-gtt-vebox-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-gtt-vebox-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-kernel-blt-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-kernel-blt-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-kernel-blt-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-kernel-bsd-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-kernel-bsd-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-kernel-bsd-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-kernel-bsd1-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-kernel-bsd1-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-kernel-bsd1-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-kernel-bsd2-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-kernel-bsd2-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-kernel-bsd2-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-kernel-render-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-kernel-render-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-kernel-render-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-kernel-vebox-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-kernel-vebox-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-kernel-vebox-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-blt-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-user-blt-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-blt-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-bsd-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-user-bsd-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-bsd-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-bsd1-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-user-bsd1-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-bsd1-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-bsd2-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-user-bsd2-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-bsd2-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-default-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-user-default-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-default-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-render-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-user-render-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-render-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-vebox-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-user-vebox-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-user-vebox-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-blt-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-wc-blt-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-blt-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-bsd-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-wc-bsd-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-bsd-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-bsd1-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-wc-bsd1-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-bsd1-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-bsd2-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-wc-bsd2-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-bsd2-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-default-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-wc-default-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-default-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-render-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-wc-render-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-render-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-vebox-cmd
> + * Feature: cmd_submission, command_parser
> + *
> + * SUBTEST: batch-wc-vebox-uc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-wc-vebox-wb
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-pro-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-prw-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-before-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-ro-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-before-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-rw-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: stream-set-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-pro-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-pro-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-pro-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-pro-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-pro-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-pro-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-pro-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-pro-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-pro-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-pro-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-pro-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-pro-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-pro-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-prw-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-prw-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-prw-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-prw-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-prw-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-prw-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-prw-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-prw-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-prw-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-prw-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-prw-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-prw-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-prw-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-before-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-ro-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-before-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-rw-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-set-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-set-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-set-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-set-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-set-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-set-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-set-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-set-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-set-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-set-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-set-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-set-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: uc-set-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-pro-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-pro-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-pro-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-pro-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-pro-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-pro-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-pro-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-pro-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-pro-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-pro-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-pro-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-pro-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-pro-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-prw-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-prw-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-prw-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-prw-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-prw-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-prw-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-prw-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-prw-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-prw-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-prw-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-prw-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-prw-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-prw-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-before-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-before-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-before-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-before-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-before-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-before-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-before-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-before-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-before-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-before-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-before-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-before-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-before-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-ro-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-before-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-before-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-before-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-before-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-before-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-before-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-before-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-before-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-before-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-before-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-before-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-before-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-before-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-rw-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-set-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-set-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-set-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-set-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-set-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-set-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-set-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-set-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-set-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-set-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-set-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-set-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wb-set-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-pro-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-prw-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-before-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-ro-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-before-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-rw-vebox-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-blt-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-bsd-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-bsd1
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-bsd1-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-bsd2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-bsd2-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-default
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-default-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-render-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-set-vebox-interruptible
> + * Feature: cmd_submission
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic check of flushing after batches");
>  
> diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> index d6c8f21920a6..496ad6e8bb16 100644
> --- a/tests/i915/gem_exec_gttfill.c
> +++ b/tests/i915/gem_exec_gttfill.c
> @@ -26,6 +26,29 @@
>  #include "igt.h"
>  #include "igt_device_scan.h"
>  #include "igt_rand.h"
> +/**
> + * TEST: gem exec gttfill
> + * Description: Fill the GTT with batches.
> + *
> + * SUBTEST: all-engines
> + * Description: Stress test check behaviour/correctness of handling batches to fill gtt
> + * Feature: cmd_submission, gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic
> + * Description: Checks if it can handle enough batches to fill gtt
> + * Feature: cmd_submission, gtt
> + * Run type: BAT
> + *
> + * SUBTEST: engines
> + * Description: Checks the correctness of handling enough batches to fill gtt for each engine
> + * Feature: cmd_submission, gtt
> + * Run type: FULL
> + *
> + * SUBTEST: multigpu-basic
> + * Feature: cmd_submission, gtt, multigpu
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Fill the GTT with batches.");
>  
> diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
> index 4838a70820a3..9a9e43babe4d 100644
> --- a/tests/i915/gem_exec_latency.c
> +++ b/tests/i915/gem_exec_latency.c
> @@ -48,6 +48,36 @@
>  
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem exec latency
> + * Run type: FULL
> + *
> + * SUBTEST: context-preempt
> + *
> + * SUBTEST: context-switch
> + *
> + * SUBTEST: dispatch
> + *
> + * SUBTEST: dispatch-queued
> + *
> + * SUBTEST: execution-latency
> + *
> + * SUBTEST: live-dispatch
> + *
> + * SUBTEST: live-dispatch-queued
> + *
> + * SUBTEST: poll
> + *
> + * SUBTEST: preemption
> + *
> + * SUBTEST: rthog-submit
> + *
> + * SUBTEST: synchronisation
> + *
> + * SUBTEST: synchronisation-queued
> + *
> + * SUBTEST: wakeup-latency
> + */
>  
>  #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
>  
> diff --git a/tests/i915/gem_exec_lut_handle.c b/tests/i915/gem_exec_lut_handle.c
> index 064308666773..c5e8f1d72fd8 100644
> --- a/tests/i915/gem_exec_lut_handle.c
> +++ b/tests/i915/gem_exec_lut_handle.c
> @@ -40,6 +40,13 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +/**
> + * TEST: gem exec lut handle
> + * Description: Exercises the basic execbuffer using the handle LUT interface.
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Exercises the basic execbuffer using the handle LUT"
>  		     " interface.");
> diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> index 497f57f0827b..1d44456d06fa 100644
> --- a/tests/i915/gem_exec_nop.c
> +++ b/tests/i915/gem_exec_nop.c
> @@ -48,6 +48,61 @@
>  #include "igt_sysfs.h"
>  #include "intel_ctx.h"
>  
> +/**
> + * TEST: gem exec nop
> + * Run type: FULL
> + *
> + * SUBTEST: basic-parallel
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-sequential
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-series
> + * Feature: cmd_submission
> + *
> + * SUBTEST: context-sequential
> + * Feature: cmd_submission
> + *
> + * SUBTEST: forked-sequential
> + * Feature: cmd_submission
> + *
> + * SUBTEST: headless
> + * Feature: cmd_submission
> + *
> + * SUBTEST: independent
> + * Feature: cmd_submission
> + *
> + * SUBTEST: multiple
> + * Feature: cmd_submission
> + *
> + * SUBTEST: parallel
> + * Feature: cmd_submission
> + *
> + * SUBTEST: poll
> + * Feature: cmd_submission
> + *
> + * SUBTEST: poll-sequential
> + * Feature: cmd_submission
> + *
> + * SUBTEST: preempt
> + * Feature: cmd_submission, multitile
> + *
> + * SUBTEST: sequential
> + * Feature: cmd_submission
> + *
> + * SUBTEST: series
> + * Feature: cmd_submission
> + *
> + * SUBTEST: signal
> + * Feature: cmd_submission, multitile
> + *
> + * SUBTEST: signal-all
> + * Feature: cmd_submission, multitile
> + *
> + * SUBTEST: single
> + * Feature: cmd_submission
> + */
>  
>  #define ENGINE_FLAGS  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
>  
> diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
> index 705b22cb9f8f..0e42aa364ca7 100644
> --- a/tests/i915/gem_exec_parallel.c
> +++ b/tests/i915/gem_exec_parallel.c
> @@ -33,6 +33,31 @@
>  #include "i915/gem_create.h"
>  #include "igt.h"
>  #include "igt_gt.h"
> +/**
> + * TEST: gem exec parallel
> + * Description: Exercise filling buffers by many clients working in parallel.
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic
> + * Description: Check basic functionality per engine.
> + * Run type: FULL
> + *
> + * SUBTEST: contexts
> + * Description: Check with many contexts.
> + * Run type: FULL
> + *
> + * SUBTEST: engines
> + * Description: Check with engines working in parallel.
> + * Run type: BAT
> + *
> + * SUBTEST: fds
> + * Description: Check with many fds.
> + * Run type: FULL
> + *
> + * SUBTEST: userptr
> + * Description: Check basic userptr thrashing.
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Exercise filling buffers by many clients working in parallel.");
>  
> diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
> index d0805d330f7a..bd7ec2cd1f39 100644
> --- a/tests/i915/gem_exec_params.c
> +++ b/tests/i915/gem_exec_params.c
> @@ -44,6 +44,109 @@
>  #include "igt.h"
>  #include "igt_device.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem exec params
> + * Run type: FULL
> + *
> + * SUBTEST: DR1-dirt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: DR4-dirt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: batch-first
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cliprects-invalid
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cliprects_ptr-dirt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: invalid-batch-start-offset
> + * Feature: cmd_submission
> + *
> + * SUBTEST: invalid-bsd-ring
> + * Feature: cmd_submission
> + *
> + * SUBTEST: invalid-bsd1-flag-on-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: invalid-bsd1-flag-on-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: invalid-bsd1-flag-on-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: invalid-bsd2-flag-on-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: invalid-bsd2-flag-on-render
> + * Feature: cmd_submission
> + *
> + * SUBTEST: invalid-bsd2-flag-on-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: invalid-fence-in
> + * Feature: cmd_submission
> + *
> + * SUBTEST: invalid-fence-in-submit
> + * Feature: cmd_submission
> + *
> + * SUBTEST: invalid-flag
> + * Feature: cmd_submission
> + *
> + * SUBTEST: invalid-ring
> + * Feature: cmd_submission
> + *
> + * SUBTEST: invalid-ring2
> + * Feature: cmd_submission
> + *
> + * SUBTEST: larger-than-life-batch
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmapped
> + * Feature: cmd_submission
> + *
> + * SUBTEST: no-blt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: no-bsd
> + * Feature: cmd_submission
> + *
> + * SUBTEST: no-vebox
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly
> + * Feature: cmd_submission
> + *
> + * SUBTEST: rel-constants-invalid
> + * Feature: cmd_submission
> + *
> + * SUBTEST: rel-constants-invalid-rel-gen5
> + * Feature: cmd_submission
> + *
> + * SUBTEST: rel-constants-invalid-ring
> + * Feature: cmd_submission
> + *
> + * SUBTEST: rs-invalid
> + * Feature: cmd_submission
> + *
> + * SUBTEST: rsvd2-dirt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: secure-non-master
> + * Feature: cmd_submission, obsolete
> + *
> + * SUBTEST: secure-non-root
> + * Feature: cmd_submission, obsolete
> + *
> + * SUBTEST: sol-reset-invalid
> + * Feature: cmd_submission
> + *
> + * SUBTEST: sol-reset-not-gen7
> + * Feature: cmd_submission
> + */
>  
>  #define ALIGNMENT (1 << 22)
>  
> diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> index 3ce89ca64962..c591f374dff2 100644
> --- a/tests/i915/gem_exec_reloc.c
> +++ b/tests/i915/gem_exec_reloc.c
> @@ -31,6 +31,599 @@
>  #include "igt_dummyload.h"
>  #include "igt_kms.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem exec reloc
> + * Description: Basic sanity check of execbuf-ioctl relocations.
> + * Run type: FULL
> + *
> + * SUBTEST: basic-active
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-concurrent0
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-concurrent16
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-cpu
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-cpu-active
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-cpu-gtt
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-cpu-gtt-active
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-cpu-gtt-noreloc
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-cpu-noreloc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-cpu-read
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-cpu-read-active
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-cpu-read-noreloc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-cpu-wc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-cpu-wc-active
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-cpu-wc-noreloc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-gtt
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-gtt-active
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-gtt-cpu
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-gtt-cpu-active
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-gtt-cpu-noreloc
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-gtt-noreloc
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-gtt-read
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-gtt-read-active
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-gtt-read-noreloc
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-gtt-wc
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-gtt-wc-active
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-gtt-wc-noreloc
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-range
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-range-active
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-scanout
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-softpin
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wc-active
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wc-cpu
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wc-cpu-active
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wc-cpu-noreloc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wc-gtt
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-wc-gtt-active
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-wc-gtt-noreloc
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-wc-noreloc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wc-read
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wc-read-active
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-wc-read-noreloc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-write-cpu
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-write-cpu-active
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-write-cpu-noreloc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-write-gtt
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-write-gtt-active
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-write-gtt-noreloc
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: basic-write-read
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-write-read-active
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-write-read-noreloc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-write-wc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-write-wc-active
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic-write-wc-noreloc
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-12
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-13
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-14
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-15
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-16
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-17
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-18
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-19
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-20
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-21
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-22
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-23
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-24
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-25
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-26
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-27
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-28
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-29
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-30
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-31
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-32
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-gtt-hang
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: cpu-gtt-interruptible
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: cpu-hang
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-read-hang
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-read-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-wc-hang
> + * Feature: cmd_submission
> + *
> + * SUBTEST: cpu-wc-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: gpu
> + * Feature: cmd_submission
> + *
> + * SUBTEST: gtt-12
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-13
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-14
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-15
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-16
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-17
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-18
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-19
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-20
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-21
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-22
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-23
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-24
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-25
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-26
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-27
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-28
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-29
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-30
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-31
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-32
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-cpu-hang
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-cpu-interruptible
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-hang
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-interruptible
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-read-hang
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-read-interruptible
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-wc-hang
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: gtt-wc-interruptible
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: invalid-domains
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-12
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-13
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-14
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-15
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-16
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-17
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-18
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-19
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-20
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-21
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-22
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-23
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-24
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-25
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-26
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-27
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-28
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-29
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-30
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-31
> + * Feature: cmd_submission
> + *
> + * SUBTEST: mmap-32
> + * Feature: cmd_submission
> + *
> + * SUBTEST: range-hang
> + * Feature: cmd_submission
> + *
> + * SUBTEST: range-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-12
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-13
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-14
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-15
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-16
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-17
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-18
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-19
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-20
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-21
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-22
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-23
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-24
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-25
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-26
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-27
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-28
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-29
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-30
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-31
> + * Feature: cmd_submission
> + *
> + * SUBTEST: readonly-32
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-12
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-13
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-14
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-15
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-16
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-17
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-18
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-19
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-20
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-21
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-22
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-23
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-24
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-25
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-26
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-27
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-28
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-29
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-30
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-31
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-32
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-cpu-hang
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-cpu-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-gtt-hang
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: wc-gtt-interruptible
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: wc-hang
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-read-hang
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wc-read-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: write-cpu-hang
> + * Feature: cmd_submission
> + *
> + * SUBTEST: write-cpu-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: write-gtt-hang
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: write-gtt-interruptible
> + * Feature: cmd_submission, gtt
> + *
> + * SUBTEST: write-read-hang
> + * Feature: cmd_submission
> + *
> + * SUBTEST: write-read-interruptible
> + * Feature: cmd_submission
> + *
> + * SUBTEST: write-wc-hang
> + * Feature: cmd_submission
> + *
> + * SUBTEST: write-wc-interruptible
> + * Feature: cmd_submission
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl relocations.");
>  
> diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> index ab1dd7749baf..d17d07893f07 100644
> --- a/tests/i915/gem_exec_schedule.c
> +++ b/tests/i915/gem_exec_schedule.c
> @@ -44,6 +44,188 @@
>  #include "igt_vgem.h"
>  #include "intel_ctx.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem exec schedule
> + * Description: Check that we can control the order of execution
> + * Run type: FULL
> + *
> + * SUBTEST: deep
> + * Feature: cmd_submission
> + *
> + * SUBTEST: fairslice
> + * Feature: cmd_submission
> + *
> + * SUBTEST: fairslice-all
> + * Feature: cmd_submission
> + *
> + * SUBTEST: fifo
> + * Feature: cmd_submission
> + *
> + * SUBTEST: implicit-boths
> + * Feature: cmd_submission
> + *
> + * SUBTEST: implicit-read-write
> + * Feature: cmd_submission
> + *
> + * SUBTEST: implicit-write-read
> + * Feature: cmd_submission
> + *
> + * SUBTEST: in-order
> + * Feature: cmd_submission
> + *
> + * SUBTEST: independent
> + * Feature: cmd_submission
> + *
> + * SUBTEST: lateslice
> + * Feature: cmd_submission
> + *
> + * SUBTEST: manyslice
> + * Feature: cmd_submission
> + *
> + * SUBTEST: noreorder
> + * Feature: cmd_submission
> + *
> + * SUBTEST: noreorder-corked
> + * Feature: cmd_submission
> + *
> + * SUBTEST: noreorder-priority
> + * Feature: cmd_submission
> + *
> + * SUBTEST: out-order
> + * Feature: cmd_submission
> + *
> + * SUBTEST: pi-common
> + * Feature: cmd_submission
> + *
> + * SUBTEST: pi-distinct-iova
> + * Feature: cmd_submission
> + *
> + * SUBTEST: pi-ringfull
> + * Feature: cmd_submission
> + *
> + * SUBTEST: pi-shared-iova
> + * Feature: cmd_submission
> + *
> + * SUBTEST: pi-userfault
> + * Feature: cmd_submission
> + *
> + * SUBTEST: preempt
> + * Feature: cmd_submission
> + *
> + * SUBTEST: preempt-contexts
> + * Feature: cmd_submission, multictx
> + *
> + * SUBTEST: preempt-engines
> + * Feature: cmd_submission, multictx
> + *
> + * SUBTEST: preempt-hang
> + * Feature: cmd_submission, multictx
> + *
> + * SUBTEST: preempt-other
> + * Feature: cmd_submission, multictx
> + *
> + * SUBTEST: preempt-other-chain
> + * Feature: cmd_submission, multictx
> + *
> + * SUBTEST: preempt-queue
> + * Feature: cmd_submission, multictx
> + *
> + * SUBTEST: preempt-queue-chain
> + * Feature: cmd_submission, multictx
> + *
> + * SUBTEST: preempt-queue-contexts
> + * Feature: cmd_submission, multictx
> + *
> + * SUBTEST: preempt-queue-contexts-chain
> + * Feature: cmd_submission, multictx
> + *
> + * SUBTEST: preempt-self
> + * Feature: cmd_submission, multictx
> + *
> + * SUBTEST: preempt-user
> + * Feature: cmd_submission, multictx
> + *
> + * SUBTEST: preemptive-hang
> + * Feature: cmd_submission
> + *
> + * SUBTEST: promotion
> + * Feature: cmd_submission
> + *
> + * SUBTEST: reorder-wide
> + * Feature: cmd_submission
> + *
> + * SUBTEST: semaphore-codependency
> + * Feature: cmd_submission
> + *
> + * SUBTEST: semaphore-noskip
> + * Feature: cmd_submission
> + *
> + * SUBTEST: semaphore-power
> + * Feature: cmd_submission
> + *
> + * SUBTEST: semaphore-resolve
> + * Feature: cmd_submission
> + *
> + * SUBTEST: semaphore-user
> + * Feature: cmd_submission
> + *
> + * SUBTEST: smoketest
> + * Feature: cmd_submission
> + *
> + * SUBTEST: smoketest-all
> + * Feature: cmd_submission
> + *
> + * SUBTEST: submit-early-slice
> + * Feature: cmd_submission
> + *
> + * SUBTEST: submit-golden-slice
> + * Feature: cmd_submission
> + *
> + * SUBTEST: submit-late-slice
> + * Feature: cmd_submission
> + *
> + * SUBTEST: thriceslice
> + * Feature: cmd_submission
> + *
> + * SUBTEST: timeslicing
> + * Feature: cmd_submission
> + *
> + * SUBTEST: u-fairslice
> + * Feature: cmd_submission
> + *
> + * SUBTEST: u-fairslice-all
> + * Feature: cmd_submission
> + *
> + * SUBTEST: u-independent
> + * Feature: cmd_submission
> + *
> + * SUBTEST: u-lateslice
> + * Feature: cmd_submission
> + *
> + * SUBTEST: u-semaphore-codependency
> + * Feature: cmd_submission
> + *
> + * SUBTEST: u-semaphore-noskip
> + * Feature: cmd_submission
> + *
> + * SUBTEST: u-semaphore-resolve
> + * Feature: cmd_submission
> + *
> + * SUBTEST: u-semaphore-user
> + * Feature: cmd_submission
> + *
> + * SUBTEST: u-submit-early-slice
> + * Feature: cmd_submission
> + *
> + * SUBTEST: u-submit-golden-slice
> + * Feature: cmd_submission
> + *
> + * SUBTEST: u-submit-late-slice
> + * Feature: cmd_submission
> + *
> + * SUBTEST: wide
> + * Feature: cmd_submission
> + */
>  
>  #define LO 0
>  #define HI 1
> diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
> index 7d23bcd5b420..19c1a060e3b0 100644
> --- a/tests/i915/gem_exec_store.c
> +++ b/tests/i915/gem_exec_store.c
> @@ -34,6 +34,27 @@
>  #include "igt.h"
>  #include "igt_device.h"
>  #include "igt_gt.h"
> +/**
> + * TEST: gem exec store
> + * Description: Exercise store dword functionality using execbuf-ioctl
> + * Feature: cmd_submission
> + *
> + * SUBTEST: basic
> + * Description: Verify that all capable engines can store dwords to a common buffer object
> + * Run type: BAT
> + *
> + * SUBTEST: cachelines
> + * Description: Verify that each capable engine can store a dword to different cachelines of a buffer object
> + * Run type: FULL
> + *
> + * SUBTEST: dword
> + * Description: Verify that each capable engine can store a dword to a buffer object
> + * Run type: FULL
> + *
> + * SUBTEST: pages
> + * Description: Verify that each capable engine can store a dword to various page-sized buffer objects
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Exercise store dword functionality using execbuf-ioctl");
>  
> diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
> index 8d56093faa00..de1864224438 100644
> --- a/tests/i915/gem_exec_suspend.c
> +++ b/tests/i915/gem_exec_suspend.c
> @@ -36,6 +36,87 @@
>  #include "igt_dummyload.h"
>  #include "igt_gt.h"
>  #include "igt_sysfs.h"
> +/**
> + * TEST: gem exec suspend
> + * Description: Exercise simple execbufs runs across various suspend/resume cycles.
> + * Feature: cmd_submission, suspend
> + *
> + * SUBTEST: basic
> + * Description: Check basic functionality without any suspend/resume cycle.
> + * Run type: FULL
> + *
> + * SUBTEST: basic-S0
> + * Description: Check with suspend-to-idle target state.
> + * Run type: FULL
> + *
> + * SUBTEST: basic-S3
> + * Description: Check full cycle of suspend-to-mem.
> + * Run type: FULL
> + *
> + * SUBTEST: basic-S3-devices
> + * Description: Check with suspend-to-mem with devices only.
> + * Run type: FULL
> + *
> + * SUBTEST: basic-S4
> + * Description: Check full cycle of suspend-to-disk.
> + * Run type: FULL
> + *
> + * SUBTEST: basic-S4-devices
> + * Description: Check with suspend-to-disk with devices only.
> + * Run type: FULL
> + *
> + * SUBTEST: cached
> + * Description: Check without suspend/resume cycle state with cached object.
> + * Run type: FULL
> + *
> + * SUBTEST: cached-S3
> + * Description: Check suspend-to-mem state with cached object.
> + * Run type: FULL
> + *
> + * SUBTEST: cached-S4
> + * Description: Check suspend-to-disk state with cached object.
> + * Run type: FULL
> + *
> + * SUBTEST: fixed
> + * Description: Check without suspend/resume cycle state with fixed object.
> + * Run type: FULL
> + *
> + * SUBTEST: fixed-S3
> + * Description: Check suspend-to-mem state with fixed object.
> + * Run type: FULL
> + *
> + * SUBTEST: fixed-S4
> + * Description: Check suspend-to-disk state with fixed object.
> + * Run type: FULL
> + *
> + * SUBTEST: hang-S3
> + * Description: Check full cycle of suspend-to-mem with a pending GPU hang.
> + * Run type: FULL
> + *
> + * SUBTEST: hang-S4
> + * Description: Check full cycle of suspend-to-disk with a pending GPU hang.
> + * Run type: FULL
> + *
> + * SUBTEST: power-S0
> + * Description: Check power consumption during idle state.
> + * Run type: FULL
> + *
> + * SUBTEST: power-S3
> + * Description: Check power consumption during suspend-to-mem state.
> + * Run type: FULL
> + *
> + * SUBTEST: uncached
> + * Description: Check without suspend/resume cycle state with uncached object.
> + * Run type: FULL
> + *
> + * SUBTEST: uncached-S3
> + * Description: Check suspend-to-mem state with uncached object.
> + * Run type: FULL
> + *
> + * SUBTEST: uncached-S4
> + * Description: Check suspend-to-disk state with uncached object.
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Exercise simple execbufs runs across various suspend/resume cycles.");
>  
> diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
> index 29d96cdcaa8e..3a1ca995c9c5 100644
> --- a/tests/i915/gem_exec_whisper.c
> +++ b/tests/i915/gem_exec_whisper.c
> @@ -37,6 +37,195 @@
>  #include "igt_rand.h"
>  #include "igt_sysfs.h"
>  #include "intel_ctx.h"
> +/**
> + * TEST: gem exec whisper
> + * Feature: cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST: basic-contexts
> + *
> + * SUBTEST: basic-contexts-all
> + *
> + * SUBTEST: basic-contexts-forked
> + *
> + * SUBTEST: basic-contexts-forked-all
> + *
> + * SUBTEST: basic-contexts-priority
> + *
> + * SUBTEST: basic-contexts-priority-all
> + *
> + * SUBTEST: basic-fds
> + *
> + * SUBTEST: basic-fds-all
> + *
> + * SUBTEST: basic-fds-forked
> + *
> + * SUBTEST: basic-fds-forked-all
> + *
> + * SUBTEST: basic-fds-priority
> + *
> + * SUBTEST: basic-fds-priority-all
> + *
> + * SUBTEST: basic-forked
> + *
> + * SUBTEST: basic-forked-all
> + *
> + * SUBTEST: basic-normal
> + *
> + * SUBTEST: basic-normal-all
> + *
> + * SUBTEST: basic-queues
> + *
> + * SUBTEST: basic-queues-all
> + *
> + * SUBTEST: basic-queues-forked
> + *
> + * SUBTEST: basic-queues-forked-all
> + *
> + * SUBTEST: basic-queues-priority
> + *
> + * SUBTEST: basic-queues-priority-all
> + *
> + * SUBTEST: basic-sync
> + *
> + * SUBTEST: basic-sync-all
> + *
> + * SUBTEST: chain
> + *
> + * SUBTEST: chain-all
> + *
> + * SUBTEST: chain-forked
> + *
> + * SUBTEST: chain-forked-all
> + *
> + * SUBTEST: chain-interruptible
> + *
> + * SUBTEST: chain-interruptible-all
> + *
> + * SUBTEST: chain-sync
> + *
> + * SUBTEST: chain-sync-all
> + *
> + * SUBTEST: contexts-chain
> + *
> + * SUBTEST: contexts-chain-all
> + *
> + * SUBTEST: contexts-engine
> + *
> + * SUBTEST: contexts-forked-engine
> + *
> + * SUBTEST: contexts-interruptible
> + *
> + * SUBTEST: contexts-interruptible-all
> + *
> + * SUBTEST: contexts-interruptible-engine
> + *
> + * SUBTEST: contexts-priority-engine
> + *
> + * SUBTEST: contexts-sync
> + *
> + * SUBTEST: contexts-sync-all
> + *
> + * SUBTEST: contexts-sync-engine
> + *
> + * SUBTEST: fds-chain
> + *
> + * SUBTEST: fds-chain-all
> + *
> + * SUBTEST: fds-engine
> + *
> + * SUBTEST: fds-forked-engine
> + *
> + * SUBTEST: fds-interruptible
> + *
> + * SUBTEST: fds-interruptible-all
> + *
> + * SUBTEST: fds-interruptible-engine
> + *
> + * SUBTEST: fds-priority-engine
> + *
> + * SUBTEST: fds-sync
> + *
> + * SUBTEST: fds-sync-all
> + *
> + * SUBTEST: fds-sync-engine
> + *
> + * SUBTEST: forked-engine
> + *
> + * SUBTEST: hang-chain
> + *
> + * SUBTEST: hang-chain-forked
> + *
> + * SUBTEST: hang-chain-sync
> + *
> + * SUBTEST: hang-contexts
> + *
> + * SUBTEST: hang-contexts-chain
> + *
> + * SUBTEST: hang-contexts-forked
> + *
> + * SUBTEST: hang-contexts-priority
> + *
> + * SUBTEST: hang-contexts-sync
> + *
> + * SUBTEST: hang-fds
> + *
> + * SUBTEST: hang-fds-chain
> + *
> + * SUBTEST: hang-fds-forked
> + *
> + * SUBTEST: hang-fds-priority
> + *
> + * SUBTEST: hang-fds-sync
> + *
> + * SUBTEST: hang-forked
> + *
> + * SUBTEST: hang-normal
> + *
> + * SUBTEST: hang-queues
> + *
> + * SUBTEST: hang-queues-chain
> + *
> + * SUBTEST: hang-queues-forked
> + *
> + * SUBTEST: hang-queues-priority
> + *
> + * SUBTEST: hang-queues-sync
> + *
> + * SUBTEST: hang-sync
> + *
> + * SUBTEST: interruptible
> + *
> + * SUBTEST: interruptible-all
> + *
> + * SUBTEST: interruptible-engine
> + *
> + * SUBTEST: normal-engine
> + *
> + * SUBTEST: queues-chain
> + *
> + * SUBTEST: queues-chain-all
> + *
> + * SUBTEST: queues-engine
> + *
> + * SUBTEST: queues-forked-engine
> + *
> + * SUBTEST: queues-interruptible
> + *
> + * SUBTEST: queues-interruptible-all
> + *
> + * SUBTEST: queues-interruptible-engine
> + *
> + * SUBTEST: queues-priority-engine
> + *
> + * SUBTEST: queues-sync
> + *
> + * SUBTEST: queues-sync-all
> + *
> + * SUBTEST: queues-sync-engine
> + *
> + * SUBTEST: sync-engine
> + */
>  
>  #define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
>  
> diff --git a/tests/i915/gem_exercise_blt.c b/tests/i915/gem_exercise_blt.c
> index fb11fb925c17..af86d5edc2ab 100644
> --- a/tests/i915/gem_exercise_blt.c
> +++ b/tests/i915/gem_exercise_blt.c
> @@ -10,6 +10,18 @@
>  #include "lib/intel_chipset.h"
>  #include "i915/i915_blt.h"
>  #include "i915/intel_mocs.h"
> +/**
> + * TEST: gem exercise blt
> + * Description: Exercise blitter commands
> + * Feature: blitter
> + * Run type: FULL
> + *
> + * SUBTEST: fast-copy
> + * Description: Check fast-copy blit
> + *
> + * SUBTEST: fast-copy-emit
> + * Description: Check multiple fast-copy in one batch
> + */
>  
>  IGT_TEST_DESCRIPTION("Exercise blitter commands");
>  
> diff --git a/tests/i915/gem_fd_exhaustion.c b/tests/i915/gem_fd_exhaustion.c
> index a6463685e1c7..75485c1cbef3 100644
> --- a/tests/i915/gem_fd_exhaustion.c
> +++ b/tests/i915/gem_fd_exhaustion.c
> @@ -34,6 +34,12 @@
>  #include <limits.h>
>  
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem fd exhaustion
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  igt_simple_main
>  {
> diff --git a/tests/i915/gem_fence_thrash.c b/tests/i915/gem_fence_thrash.c
> index 89a5ae29d295..f8ac29dd78f7 100644
> --- a/tests/i915/gem_fence_thrash.c
> +++ b/tests/i915/gem_fence_thrash.c
> @@ -43,6 +43,25 @@
>  #include "i915/gem_create.h"
>  #include "igt.h"
>  #include "igt_x86.h"
> +/**
> + * TEST: gem fence thrash
> + * Feature: gtt, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: bo-copy
> + *
> + * SUBTEST: bo-write-verify-none
> + *
> + * SUBTEST: bo-write-verify-threaded-none
> + *
> + * SUBTEST: bo-write-verify-threaded-x
> + *
> + * SUBTEST: bo-write-verify-threaded-y
> + *
> + * SUBTEST: bo-write-verify-x
> + *
> + * SUBTEST: bo-write-verify-y
> + */
>  
>  #define PAGE_SIZE 4096
>  #define CACHELINE 64
> diff --git a/tests/i915/gem_fence_upload.c b/tests/i915/gem_fence_upload.c
> index 67487d671970..b239c0e7872d 100644
> --- a/tests/i915/gem_fence_upload.c
> +++ b/tests/i915/gem_fence_upload.c
> @@ -41,6 +41,22 @@
>  #include "drm.h"
>  #include "i915_drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem fence upload
> + * Run type: FULL
> + *
> + * SUBTEST: performance
> + *
> + * SUBTEST: thread-contention
> + *
> + * SUBTEST: thread-performance-both
> + *
> + * SUBTEST: thread-performance-read
> + *
> + * SUBTEST: thread-performance-write
> + *
> + * SUBTEST: wc-contention
> + */
>  
>  #define OBJECT_SIZE (1024*1024) /* restricted to 1MiB alignment on i915 fences */
>  
> diff --git a/tests/i915/gem_fenced_exec_thrash.c b/tests/i915/gem_fenced_exec_thrash.c
> index a9597d801505..f22f16f683cb 100644
> --- a/tests/i915/gem_fenced_exec_thrash.c
> +++ b/tests/i915/gem_fenced_exec_thrash.c
> @@ -33,6 +33,24 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +/**
> + * TEST: gem fenced exec thrash
> + * Description: Test execbuf fence accounting.
> + * Feature: gtt, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: 2-spare-fences
> + *
> + * SUBTEST: no-spare-fences
> + *
> + * SUBTEST: no-spare-fences-busy
> + *
> + * SUBTEST: no-spare-fences-busy-interruptible
> + *
> + * SUBTEST: no-spare-fences-interruptible
> + *
> + * SUBTEST: too-many-fences
> + */
>  
>  IGT_TEST_DESCRIPTION("Test execbuf fence accounting.");
>  
> diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
> index 2620bc55daf0..7feabf61a303 100644
> --- a/tests/i915/gem_flink_basic.c
> +++ b/tests/i915/gem_flink_basic.c
> @@ -38,6 +38,27 @@
>  
>  #include "igt.h"
>  #include "igt_types.h"
> +/**
> + * TEST: gem flink basic
> + * Description: Tests for flink - a way to export a gem object by name
> + * Feature: xorg_dri2
> + * Run type: BAT
> + *
> + * SUBTEST: bad-flink
> + * Description: Verify that GEM_FLINK ioctl with invalid gem object fails.
> + *
> + * SUBTEST: bad-open
> + * Description: Verify that GEM_OPEN ioctl with invalid flink name fails.
> + *
> + * SUBTEST: basic
> + * Description: Check if gem object can be exported to global namespace and then opened.
> + *
> + * SUBTEST: double-flink
> + * Description: Tests that multiple flinks for the same gem object share the same name.
> + *
> + * SUBTEST: flink-lifetime
> + * Description: Tests flink lifetime by referencing from multiple descriptors.
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests for flink - a way to export a gem object by name");
>  
> diff --git a/tests/i915/gem_flink_race.c b/tests/i915/gem_flink_race.c
> index 70e133d708c0..5ebf1969b992 100644
> --- a/tests/i915/gem_flink_race.c
> +++ b/tests/i915/gem_flink_race.c
> @@ -35,6 +35,16 @@
>  #include "i915/gem_create.h"
>  #include "igt.h"
>  #include "igt_stats.h"
> +/**
> + * TEST: gem flink race
> + * Description: Check for flink/open vs. gem close races.
> + * Feature: xorg_dri2
> + * Run type: FULL
> + *
> + * SUBTEST: flink_close
> + *
> + * SUBTEST: flink_name
> + */
>  
>  IGT_TEST_DESCRIPTION("Check for flink/open vs. gem close races.");
>  
> diff --git a/tests/i915/gem_gpgpu_fill.c b/tests/i915/gem_gpgpu_fill.c
> index 74a227f678e7..f350e9fbb6d0 100644
> --- a/tests/i915/gem_gpgpu_fill.c
> +++ b/tests/i915/gem_gpgpu_fill.c
> @@ -48,6 +48,13 @@
>  #include "igt_collection.h"
>  #include "intel_bufops.h"
>  #include "i915/intel_memory_region.h"
> +/**
> + * TEST: gem gpgpu fill
> + * Feature: compute
> + * Run type: FULL
> + *
> + * SUBTEST: basic
> + */
>  
>  #define WIDTH 64
>  #define HEIGHT 64
> diff --git a/tests/i915/gem_gtt_cpu_tlb.c b/tests/i915/gem_gtt_cpu_tlb.c
> index 8000e58cc5d3..4f4af6a7b9b5 100644
> --- a/tests/i915/gem_gtt_cpu_tlb.c
> +++ b/tests/i915/gem_gtt_cpu_tlb.c
> @@ -43,6 +43,14 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem gtt cpu tlb
> + * Description: Check whether gtt tlbs for cpu access are correctly invalidated.
> + * Feature: gtt, mapping
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Check whether gtt tlbs for cpu access are correctly"
>  		     " invalidated.");
> diff --git a/tests/i915/gem_gtt_hog.c b/tests/i915/gem_gtt_hog.c
> index 15a6139ea152..4c8158c6d85a 100644
> --- a/tests/i915/gem_gtt_hog.c
> +++ b/tests/i915/gem_gtt_hog.c
> @@ -42,6 +42,12 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +/**
> + * TEST: gem gtt hog
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  static const uint32_t canary = 0xdeadbeef;
>  
> diff --git a/tests/i915/gem_gtt_speed.c b/tests/i915/gem_gtt_speed.c
> index 272091fdbf31..a0e37b19e6ad 100644
> --- a/tests/i915/gem_gtt_speed.c
> +++ b/tests/i915/gem_gtt_speed.c
> @@ -42,6 +42,12 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem gtt speed
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  #define OBJECT_SIZE 16384
>  
> diff --git a/tests/i915/gem_huc_copy.c b/tests/i915/gem_huc_copy.c
> index ea32b705ab7c..5a217c9840ea 100644
> --- a/tests/i915/gem_huc_copy.c
> +++ b/tests/i915/gem_huc_copy.c
> @@ -35,6 +35,17 @@
>  #include "drm.h"
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem huc copy
> + * Description: A very simple workload for the HuC.
> + * Feature: huc
> + * Run type: BAT
> + *
> + * SUBTEST: huc-copy
> + * Description:
> + *   Make sure that Huc firmware worksby copying a char array using Hucand verifying the copied
> + *   result
> + */
>  
>  IGT_TEST_DESCRIPTION("A very simple workload for the HuC.");
>  
> diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
> index 4899af585355..4c3576503ca3 100644
> --- a/tests/i915/gem_linear_blits.c
> +++ b/tests/i915/gem_linear_blits.c
> @@ -49,6 +49,23 @@
>  #include "igt.h"
>  #include "igt_types.h"
>  #include "i915/i915_blt.h"
> +/**
> + * TEST: gem linear blits
> + * Description: Test doing many blits with a working set larger than the aperture size.
> + * Feature: blitter
> + *
> + * SUBTEST: basic
> + * Description: Basic blitter functionality check with 2 buffers
> + * Run type: BAT
> + *
> + * SUBTEST: interruptible
> + * Description: Test with interrupts in between the parent process
> + * Run type: FULL
> + *
> + * SUBTEST: normal
> + * Description: The intent is to push beyond the working GTT size to force the driver to rebind the buffers
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Test doing many blits with a working set larger than the"
>  		     " aperture size.");
> diff --git a/tests/i915/gem_lmem_evict.c b/tests/i915/gem_lmem_evict.c
> index 71a066de3104..9a8974b3ce09 100644
> --- a/tests/i915/gem_lmem_evict.c
> +++ b/tests/i915/gem_lmem_evict.c
> @@ -7,6 +7,15 @@
>  #include "igt_kmod.h"
>  #include "i915/gem_create.h"
>  #include "i915/gem.h"
> +/**
> + * TEST: gem lmem evict
> + * Description: Force tiny lmem size for easily testing eviction scenarios.
> + * Feature: local_memory
> + * Run type: FULL
> + *
> + * SUBTEST: dontneed-evict-race
> + * Description: Regression test to verify that madvise will sync against busy dma-resv object for lmem
> + */
>  
>  IGT_TEST_DESCRIPTION("Force tiny lmem size for easily testing eviction scenarios.");
>  
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index 55b044ecdd63..c3be8c53f20f 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -24,6 +24,95 @@
>  #include "drm.h"
>  #include "i915/i915_blt.h"
>  #include "i915/intel_mocs.h"
> +/**
> + * TEST: gem lmem swapping
> + * Description: Exercise local memory swapping.
> + * Feature: local_memory
> + *
> + * SUBTEST: basic
> + * Description: Exercise local memory swapping to system memory
> + * Run type: BAT
> + *
> + * SUBTEST: heavy-multi
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: heavy-random
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: heavy-verify-multi
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: heavy-verify-multi-ccs
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: heavy-verify-random
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: heavy-verify-random-ccs
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: massive
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: massive-random
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: parallel-multi
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: parallel-random
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: parallel-random-engines
> + * Description: Exercise local memory swapping to system memory
> + * Run type: BAT
> + *
> + * SUBTEST: parallel-random-verify
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: parallel-random-verify-ccs
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: random
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: random-engines
> + * Description: Exercise local memory swapping to system memory
> + * Run type: BAT
> + *
> + * SUBTEST: smem-oom
> + * Description: Exercise local memory swapping during exhausting system memory
> + * Run type: FULL
> + *
> + * SUBTEST: verify
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: verify-ccs
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + *
> + * SUBTEST: verify-random
> + * Description: Exercise local memory swapping to system memory
> + * Run type: BAT
> + *
> + * SUBTEST: verify-random-ccs
> + * Description: Exercise local memory swapping to system memory
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Exercise local memory swapping.");
>  
> diff --git a/tests/i915/gem_lut_handle.c b/tests/i915/gem_lut_handle.c
> index 32f76aaa07f2..cdd56a5d842a 100644
> --- a/tests/i915/gem_lut_handle.c
> +++ b/tests/i915/gem_lut_handle.c
> @@ -39,6 +39,13 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem lut handle
> + * Description: Exercises the basic execbuffer using the handle LUT interface.
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Exercises the basic execbuffer using the handle LUT"
>  		     " interface.");
> diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
> index 2502d84c7738..17653cc4ad53 100644
> --- a/tests/i915/gem_madvise.c
> +++ b/tests/i915/gem_madvise.c
> @@ -38,6 +38,31 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem madvise
> + * Description: Checks that the kernel reports EFAULT when trying to use purged bo.
> + * Run type: FULL
> + *
> + * SUBTEST: dontneed-after-mmap
> + * Description:
> + *   Check signal for Segmentation Fault and bus error after obtaining a purgeable object and
> + *   calling for sighandler.
> + * Feature: caching, mapping
> + *
> + * SUBTEST: dontneed-before-exec
> + * Description: Check if EXECBUFFER2 reports EFAULT when trying to submit purged bo for GPU.
> + * Feature: caching, gtt, mapping
> + *
> + * SUBTEST: dontneed-before-mmap
> + * Description:
> + *   Check signal for Segmentation Fault and bus error before obtaining a purgeable object and
> + *   calling for sighandler.
> + * Feature: caching, mapping
> + *
> + * SUBTEST: dontneed-before-pwrite
> + * Description: Check if PWRITE reports EFAULT when trying to use purged bo for write operation.
> + * Feature: caching, gtt, mapping
> + */
>  
>  IGT_TEST_DESCRIPTION("Checks that the kernel reports EFAULT when trying to use"
>  		     " purged bo.");
> diff --git a/tests/i915/gem_media_fill.c b/tests/i915/gem_media_fill.c
> index e418047c2e74..07e7b3ccba63 100644
> --- a/tests/i915/gem_media_fill.c
> +++ b/tests/i915/gem_media_fill.c
> @@ -45,6 +45,14 @@
>  #include "drm.h"
>  #include "i915/gem.h"
>  #include "igt.h"
> +/**
> + * TEST: gem media fill
> + * Description: Basic test for the media_fill() function, a very simple workload for the Media pipeline.
> + * Feature: media
> + * Run type: FULL
> + *
> + * SUBTEST: media-fill
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic test for the media_fill() function, a very simple"
>  		     " workload for the Media pipeline.");
> diff --git a/tests/i915/gem_media_vme.c b/tests/i915/gem_media_vme.c
> index 3ea70386cfea..38ebd157d9fd 100644
> --- a/tests/i915/gem_media_vme.c
> +++ b/tests/i915/gem_media_vme.c
> @@ -35,6 +35,14 @@
>  #include "drm.h"
>  #include "i915/gem.h"
>  #include "igt.h"
> +/**
> + * TEST: gem media vme
> + * Description: A very simple workload for the VME media block.
> + * Feature: media
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("A very simple workload for the VME media block.");
>  
> diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
> index 61f862a8e275..421c6f859f02 100644
> --- a/tests/i915/gem_mmap.c
> +++ b/tests/i915/gem_mmap.c
> @@ -38,6 +38,63 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem mmap
> + * Description: Basic MMAP IOCTL tests for memory regions.
> + * Feature: mapping
> + *
> + * SUBTEST: bad-object
> + * Description: Verify mapping to invalid gem objects won't be created.
> + * Run type: FULL
> + *
> + * SUBTEST: bad-offset
> + * Description: Verify mapping to gem object with invalid offset won't be created.
> + * Run type: FULL
> + *
> + * SUBTEST: bad-size
> + * Description: Verify mapping to gem object with invalid size won't be created.
> + * Run type: FULL
> + *
> + * SUBTEST: basic
> + * Description:
> + *   Test basics of newly mapped gem object like default content, write and read coherency,
> + *   mapping existence after gem_close and unmapping.
> + * Run type: BAT
> + *
> + * SUBTEST: basic-small-bo
> + * Description:
> + *   Test the write read coherency and simultaneous access of different pages of a small buffer
> + *   object.
> + * Run type: FULL
> + *
> + * SUBTEST: big-bo
> + * Description:
> + *   Test the write read coherency and simultaneous access of different pages of a big buffer
> + *   object.
> + * Run type: FULL
> + *
> + * SUBTEST: huge-bo
> + * Description:
> + *   Test the write read coherency and simultaneous access of different pages of a huge buffer
> + *   object.
> + * Run type: FULL
> + *
> + * SUBTEST: pf-nonblock
> + * Description:
> + *   Verify that GTT page faults are asynchronous to GPU rendering and completes within a
> + *   specific time.
> + * Run type: FULL
> + *
> + * SUBTEST: short-mmap
> + * Description: Map small buffer object though direct CPU access, bypassing GPU.
> + * Run type: FULL
> + *
> + * SUBTEST: swap-bo
> + * Description:
> + *   Test the write read coherency and simultaneous access of different pages while swapping
> + *   buffer object.
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic MMAP IOCTL tests for memory regions.");
>  
> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> index c14ab50eeee7..f053302ebc48 100644
> --- a/tests/i915/gem_mmap_gtt.c
> +++ b/tests/i915/gem_mmap_gtt.c
> @@ -47,6 +47,494 @@
>  #include "igt_sysfs.h"
>  #include "igt_x86.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem mmap gtt
> + * Description: Ensure that all operations around MMAP_GTT ioctl works.
> + *
> + * SUBTEST: bad-object
> + * Description: Verify mapping to invalid gem objects fails.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic
> + * Description: Basic checks of GEM_MMAP_GTT ioctl.
> + * Feature: gtt
> + * Run type: BAT
> + *
> + * SUBTEST: basic-copy
> + * Description: Test copy between two GTT mmappings.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-read
> + * Description: Test to read content from GTT mmapped object.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-read-write
> + * Description: Check basic read->write order of a GTT mmapped bo.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-read-write-distinct
> + * Description: Check distinct read->write order of a GTT mmapped bo.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-short
> + * Description: Test mmaping less than the full object.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-small-bo
> + * Description: Check mmap access to a small buffer object by CPU directly and through GTT in sequence.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-small-bo-tiledX
> + * Description:
> + *   Check mmap access to a small X-tiled buffer object by CPU directly and through GTT in
> + *   sequence.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-small-bo-tiledY
> + * Description:
> + *   Check mmap access to a small Y-tiled buffer object by CPU directly and through GTT in
> + *   sequence.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-small-copy
> + * Description: Check page by page copying between two GTT mmapped normal-small bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-small-copy-XY
> + * Description: Check page by page copying between two GTT mmapped tiled-small bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-small-copy-odd
> + * Description: Check page by page copying between two GTT mmapped odd tiled-small bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-wc
> + * Description:
> + *   Check the performance of WC writes with WC reads of GTT and WC writes of GTT with WB writes of.
> + *   CPU.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-write
> + * Description: Test to write content to GTT mmapped object.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-write-cpu-read-gtt
> + * Description: Check coherency between GTT and CPU mmappings with LLC.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-write-gtt
> + * Description: Test creates a prefault object into GTT and writes into it from another GTT mmapped.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-write-read
> + * Description: Check basic write->read order of a GTT mmapped bo.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: basic-write-read-distinct
> + * Description: Check distinct write->read order of a GTT mmapped bo.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: big-bo
> + * Description: Check mmap access to a big buffer object by CPU directly and through GTT in sequence.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: big-bo-tiledX
> + * Description: Check mmap access to a big X-tiled buffer object by CPU directly and through GTT in sequence.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: big-bo-tiledY
> + * Description: Check mmap access to a big Y-tiled buffer object by CPU directly and through GTT in sequence.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: big-copy
> + * Description: Check page by page copying between two GTT mmapped normal-big bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: big-copy-XY
> + * Description: Check page by page copying between two GTT mmapped tiled-big bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: big-copy-odd
> + * Description: Check page by page copying between two GTT mmapped odd tiled-big bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: clflush
> + * Description: Check the userspace clflushing of the GTT mmap.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: close-race
> + * Description:
> + *   Test to check that a few threads opening and closing handles cause explosion in other threads
> + *   in the process of mmaping that handle.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: coherency
> + * Description: Check whether a write through the GTT is immediately visible to the CPU.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-basic-small-copy
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped normal-small bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-basic-small-copy-XY
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped tiled-small bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-basic-small-copy-odd
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped odd tiled-small bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-big-copy
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped normal-big bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-big-copy-XY
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped tiled-big bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-big-copy-odd
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped odd tiled-big bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-huge-copy
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped normal-huge bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-huge-copy-XY
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped tiled-huge bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-huge-copy-odd
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped odd tiled-huge bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-medium-copy
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped normal-medium bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-medium-copy-XY
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped tiled-medium bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-medium-copy-odd
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped odd tiled-medium bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-swap-copy
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped normal-huge bo's larger than physical memory and resulting in
> + *   thrashing of swap space.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-swap-copy-XY
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped tiled-huge bo's larger than physical memory and resulting in
> + *   thrashing of swap space.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: cpuset-swap-copy-odd
> + * Description:
> + *   Add forked contention with lighter variant (single cpu) and check page by page copying
> + *   between two GTT mmapped odd tiled-huge bo's larger than physical memory and resulting in
> + *   thrashing of swap space.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: fault-concurrent
> + * Description: Excercise concurrent pagefaulting of a GTT mmaped bo.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: fault-concurrent-X
> + * Description: Excercise concurrent pagefaulting of a X-tiled GTT mmaped bo.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: fault-concurrent-Y
> + * Description: Excercise concurrent pagefaulting of a Y-tiled GTT mmaped bo.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: flink-race
> + * Description:
> + *   Test to check that a few threads opening and closing flink handles cause explosion in other
> + *   threads in the process of mmaping that handle.
> + * Feature: gtt, xorg_dri2
> + * Run type: FULL
> + *
> + * SUBTEST: forked-basic-small-copy
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped normal-small
> + *   bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-basic-small-copy-XY
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped tiled-small
> + *   bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-basic-small-copy-odd
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped odd tiled-small
> + *   bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-big-copy
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped normal-big
> + *   bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-big-copy-XY
> + * Description: Add forked contention and check page by page copying between two GTT mmapped tiled-big bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-big-copy-odd
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped odd tiled-big
> + *   bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-huge-copy
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped normal-huge
> + *   bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-huge-copy-XY
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped tiled-huge
> + *   bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-huge-copy-odd
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped odd tiled-huge
> + *   bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-medium-copy
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped normal-medium
> + *   bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-medium-copy-XY
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped tiled-medium
> + *   bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-medium-copy-odd
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped odd
> + *   tiled-medium bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-swap-copy
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped normal-huge
> + *   bo's larger than physical memory and resulting in thrashing of swap space.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-swap-copy-XY
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped tiled-huge bo's
> + *   larger than physical memory and resulting in thrashing of swap space.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: forked-swap-copy-odd
> + * Description:
> + *   Add forked contention and check page by page copying between two GTT mmapped odd tiled-huge
> + *   bo's larger than physical memory and resulting in thrashing of swap space.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: hang
> + * Description: Check read/writes across a GPU reset.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: hang-busy
> + * Description: Exercise the GTT mmap revocation for a reset on a busy object.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: hang-user
> + * Description: Mix a busy hang with GTT and userptr.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: huge-bo
> + * Description: Check mmap access to a huge buffer object by CPU directly and through GTT in sequence.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: huge-bo-tiledX
> + * Description: Check mmap access to a huge X-tiled buffer object by CPU directly and through GTT in sequence.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: huge-bo-tiledY
> + * Description: Check mmap access to a huge Y-tiled buffer object by CPU directly and through GTT in sequence.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: huge-copy
> + * Description: Check page by page copying between two GTT mmapped normal-huge bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: huge-copy-XY
> + * Description: Check page by page copying between two GTT mmapped tiled-huge bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: huge-copy-odd
> + * Description: Check page by page copying between two GTT mmapped odd tiled-huge bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: isolation
> + * Description:
> + *   Test mmap_offset lifetime, closing the object on another file should not affect the local
> + *   mmap_offset.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: medium-copy
> + * Description: Check page by page copying between two GTT mmapped normal-medium bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: medium-copy-XY
> + * Description: Check page by page copying between two GTT mmapped tiled-medium bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: medium-copy-odd
> + * Description: Check page by page copying between two GTT mmapped odd tiled-medium bo's.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: pf-nonblock
> + * Description: Check that the initial pagefault is non-blocking.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: ptrace
> + * Description: Inspect a GTT mmap using ptrace().
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: swap-copy
> + * Description:
> + *   Check page by page copying between two GTT mmapped normal-huge bo's larger than physical
> + *   memory and resulting in thrashing of swap space.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: swap-copy-XY
> + * Description:
> + *   Check page by page copying between two GTT mmapped tiled-huge bo's larger than physical
> + *   memory and resulting in thrashing of swap space.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: swap-copy-odd
> + * Description:
> + *   Check page by page copying between two GTT mmapped odd tiled-huge bo's larger than physical
> + *   memory and resulting in thrashing of swap space.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST: zero-extend
> + * Description: Test MMAP_GTT extension validity.
> + * Feature: gtt
> + * Run type: FULL
> + */
>  
>  #ifndef PAGE_SIZE
>  #define PAGE_SIZE 4096
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index 962fc1b739ea..c02ee70e3298 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -38,6 +38,42 @@
>  #include "i915/intel_memory_region.h"
>  #include "igt.h"
>  #include "igt_x86.h"
> +/**
> + * TEST: gem mmap offset
> + * Description: Basic MMAP_OFFSET IOCTL tests for mem regions
> + * Feature: mapping
> + * Run type: FULL
> + *
> + * SUBTEST: bad-extensions
> + *
> + * SUBTEST: bad-flags
> + *
> + * SUBTEST: bad-object
> + * Description: Verify mapping to invalid gem objects won't be created
> + *
> + * SUBTEST: basic-uaf
> + * Description: Check buffer object mapping persists after gem_close
> + *
> + * SUBTEST: blt-coherency
> + *
> + * SUBTEST: clear
> + *
> + * SUBTEST: close-race
> + * Description: Check race between close and mmap offset between threads
> + *
> + * SUBTEST: isolation
> + *
> + * SUBTEST: oob-read
> + * Description: Check for out-of-bound access in vm_access
> + *
> + * SUBTEST: open-flood
> + *
> + * SUBTEST: perf
> + *
> + * SUBTEST: pf-nonblock
> + *
> + * SUBTEST: ptrace
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic MMAP_OFFSET IOCTL tests for mem regions\n");
>  
> diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
> index 6dc7bae49548..ce1c190838af 100644
> --- a/tests/i915/gem_mmap_wc.c
> +++ b/tests/i915/gem_mmap_wc.c
> @@ -39,6 +39,73 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem mmap wc
> + * Run type: FULL
> + *
> + * SUBTEST: bad-object
> + * Feature: caching, mapping
> + *
> + * SUBTEST: bad-offset
> + * Feature: caching, mapping
> + *
> + * SUBTEST: bad-size
> + * Feature: caching, mapping
> + *
> + * SUBTEST: close
> + * Feature: caching, mapping
> + *
> + * SUBTEST: coherency
> + * Feature: caching, mapping
> + *
> + * SUBTEST: copy
> + * Feature: caching, mapping
> + *
> + * SUBTEST: fault-concurrent
> + * Feature: caching, mapping
> + *
> + * SUBTEST: invalid-flags
> + * Feature: caching, mapping
> + *
> + * SUBTEST: pf-nonblock
> + * Feature: caching, mapping
> + *
> + * SUBTEST: read
> + * Feature: caching, mapping
> + *
> + * SUBTEST: read-write
> + * Feature: caching, mapping
> + *
> + * SUBTEST: read-write-distinct
> + * Feature: caching, mapping
> + *
> + * SUBTEST: set-cache-level
> + * Feature: caching, mapping
> + *
> + * SUBTEST: write
> + * Feature: caching, mapping
> + *
> + * SUBTEST: write-cpu-read-wc
> + * Feature: caching, mapping
> + *
> + * SUBTEST: write-cpu-read-wc-unflushed
> + * Feature: caching, mapping
> + *
> + * SUBTEST: write-gtt-read-wc
> + * Feature: caching, gtt, mapping
> + *
> + * SUBTEST: write-prefaulted
> + * Feature: caching, mapping
> + *
> + * SUBTEST: write-read
> + * Feature: caching, mapping
> + *
> + * SUBTEST: write-read-distinct
> + * Feature: caching, mapping
> + *
> + * SUBTEST: write-wc-read-gtt
> + * Feature: caching, gtt, mapping
> + */
>  
>  static int OBJECT_SIZE = 16*1024*1024;
>  
> diff --git a/tests/i915/gem_partial_pwrite_pread.c b/tests/i915/gem_partial_pwrite_pread.c
> index 474149d48f42..1b533ef3097c 100644
> --- a/tests/i915/gem_partial_pwrite_pread.c
> +++ b/tests/i915/gem_partial_pwrite_pread.c
> @@ -38,6 +38,68 @@
>  
>  #include "i915/gem.h"
>  #include "igt.h"
> +/**
> + * TEST: gem partial pwrite pread
> + * Description: Test pwrite/pread consistency when touching partial cachelines.
> + * Feature: caching, mapping
> + * Run type: FULL
> + *
> + * SUBTEST: reads
> + * Description:
> + *   Verify if pread is consistent while accessing partial cachelines with default caching
> + *   level
> + *
> + * SUBTEST: reads-display
> + * Description:
> + *   Verify if pread is consistent while accessing partial cachelines with display caching
> + *   level
> + *
> + * SUBTEST: reads-snoop
> + * Description: Verify if pread is consistent while accessing partial cachelines with snoop caching level
> + *
> + * SUBTEST: reads-uncached
> + * Description:
> + *   Verify if pread is consistent while accessing partial cachelines with uncached caching
> + *   level
> + *
> + * SUBTEST: write
> + * Description:
> + *   Verify if pwrite is consistent while accessing partial cachelines with default caching
> + *   level
> + *
> + * SUBTEST: write-display
> + * Description:
> + *   Verify if pwrite is consistent while accessing partial cachelines with display caching
> + *   level
> + *
> + * SUBTEST: write-snoop
> + * Description: Verify if pwrite is consistent while accessing partial cachelines with snoop caching level
> + *
> + * SUBTEST: write-uncached
> + * Description:
> + *   Verify if pwrite is consistent while accessing partial cachelines with uncached caching
> + *   level
> + *
> + * SUBTEST: writes-after-reads
> + * Description:
> + *   Verify if both pread, pwrite are consistent while accessing partial cachelines with
> + *   default caching level
> + *
> + * SUBTEST: writes-after-reads-display
> + * Description:
> + *   Verify if both pread, pwrite are consistent while accessing partial cachelines with
> + *   display caching level
> + *
> + * SUBTEST: writes-after-reads-snoop
> + * Description:
> + *   Verify if both pread, pwrite are consistent while accessing partial cachelines with snoop
> + *   caching level
> + *
> + * SUBTEST: writes-after-reads-uncached
> + * Description:
> + *   Verify if both pread, pwrite are consistent while accessing partial cachelines with
> + *   uncached caching level
> + */
>  
>  IGT_TEST_DESCRIPTION("Test pwrite/pread consistency when touching partial"
>  		     " cachelines.");
> diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
> index 59959a3742d5..5e6ef049085b 100644
> --- a/tests/i915/gem_pipe_control_store_loop.c
> +++ b/tests/i915/gem_pipe_control_store_loop.c
> @@ -43,6 +43,18 @@
>  #include "drm.h"
>  #include "i915/gem.h"
>  #include "igt.h"
> +/**
> + * TEST: gem pipe control store loop
> + * Description: Test (TLB-)Coherency of pipe_control QW writes.
> + * Feature: cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST: fresh-buffer
> + * Description: Checks tlb consistency of the pipe_control with fresh buffer.
> + *
> + * SUBTEST: reused-buffer
> + * Description: Checks tlb consistency of the pipe_control with reused buffer.
> + */
>  
>  IGT_TEST_DESCRIPTION("Test (TLB-)Coherency of pipe_control QW writes.");
>  
> diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
> index c3102857a203..368f8b17db75 100644
> --- a/tests/i915/gem_ppgtt.c
> +++ b/tests/i915/gem_ppgtt.c
> @@ -39,6 +39,27 @@
>  #include "i915/gem_create.h"
>  #include "igt.h"
>  #include "igt_debugfs.h"
> +/**
> + * TEST: gem ppgtt
> + * Run type: FULL
> + *
> + * SUBTEST: blt-vs-render-ctx0
> + * Feature: mapping
> + *
> + * SUBTEST: blt-vs-render-ctxN
> + * Feature: mapping
> + *
> + * SUBTEST: flink-and-close-vma-leak
> + * Feature: mapping, xorg_dri2
> + *
> + * SUBTEST: shrink-vs-evict-any
> + * Description: Regression test to verify GTT eviction can't randomly fail due to object lock contention
> + * Feature: mapping
> + *
> + * SUBTEST: shrink-vs-evict-pinned
> + * Description: Regression test to verify GTT eviction can't randomly fail due to object lock contention
> + * Feature: mapping
> + */
>  
>  #define WIDTH 512
>  #define STRIDE (WIDTH*4)
> diff --git a/tests/i915/gem_pread.c b/tests/i915/gem_pread.c
> index a8bf2b0540d7..1dbded440125 100644
> --- a/tests/i915/gem_pread.c
> +++ b/tests/i915/gem_pread.c
> @@ -45,6 +45,23 @@
>  #include "drm.h"
>  #include "i915/gem_create.h"
>  #include "igt_vgem.h"
> +/**
> + * TEST: gem pread
> + * Feature: mapping
> + * Run type: FULL
> + *
> + * SUBTEST: bench
> + *
> + * SUBTEST: display
> + *
> + * SUBTEST: exhaustion
> + *
> + * SUBTEST: self
> + *
> + * SUBTEST: snoop
> + *
> + * SUBTEST: uncached
> + */
>  
>  #define MiB(x) ((x) * 1024 * 1024)
>  
> diff --git a/tests/i915/gem_pread_after_blit.c b/tests/i915/gem_pread_after_blit.c
> index 3b56f787aa3f..fc6ee4408539 100644
> --- a/tests/i915/gem_pread_after_blit.c
> +++ b/tests/i915/gem_pread_after_blit.c
> @@ -47,6 +47,35 @@
>  
>  #include "i915/gem.h"
>  #include "igt.h"
> +/**
> + * TEST: gem pread after blit
> + * Description: Test pread behavior when getting values out of just-drawn-to buffers.
> + * Run type: FULL
> + *
> + * SUBTEST: default-hang
> + *
> + * SUBTEST: default-interruptible
> + *
> + * SUBTEST: default-normal
> + *
> + * SUBTEST: display-hang
> + *
> + * SUBTEST: display-interruptible
> + *
> + * SUBTEST: display-normal
> + *
> + * SUBTEST: snooped-hang
> + *
> + * SUBTEST: snooped-interruptible
> + *
> + * SUBTEST: snooped-normal
> + *
> + * SUBTEST: uncached-hang
> + *
> + * SUBTEST: uncached-interruptible
> + *
> + * SUBTEST: uncached-normal
> + */
>  
>  IGT_TEST_DESCRIPTION("Test pread behavior when getting values out of"
>  		     " just-drawn-to buffers.");
> diff --git a/tests/i915/gem_pwrite.c b/tests/i915/gem_pwrite.c
> index 6e3f833cd88c..8471f963df0b 100644
> --- a/tests/i915/gem_pwrite.c
> +++ b/tests/i915/gem_pwrite.c
> @@ -46,6 +46,73 @@
>  #include "igt.h"
>  #include "igt_rand.h"
>  #include "igt_vgem.h"
> +/**
> + * TEST: gem pwrite
> + * Feature: mapping
> + * Run type: FULL
> + *
> + * SUBTEST: basic-exhaustion
> + *
> + * SUBTEST: basic-random
> + *
> + * SUBTEST: basic-self
> + *
> + * SUBTEST: bench
> + *
> + * SUBTEST: big-cpu-backwards
> + *
> + * SUBTEST: big-cpu-fbr
> + *
> + * SUBTEST: big-cpu-forwards
> + *
> + * SUBTEST: big-cpu-random
> + *
> + * SUBTEST: big-gtt-backwards
> + *
> + * SUBTEST: big-gtt-fbr
> + *
> + * SUBTEST: big-gtt-forwards
> + *
> + * SUBTEST: big-gtt-random
> + *
> + * SUBTEST: display
> + *
> + * SUBTEST: huge-cpu-backwards
> + *
> + * SUBTEST: huge-cpu-fbr
> + *
> + * SUBTEST: huge-cpu-forwards
> + *
> + * SUBTEST: huge-cpu-random
> + *
> + * SUBTEST: huge-gtt-backwards
> + *
> + * SUBTEST: huge-gtt-fbr
> + *
> + * SUBTEST: huge-gtt-forwards
> + *
> + * SUBTEST: huge-gtt-random
> + *
> + * SUBTEST: small-cpu-backwards
> + *
> + * SUBTEST: small-cpu-fbr
> + *
> + * SUBTEST: small-cpu-forwards
> + *
> + * SUBTEST: small-cpu-random
> + *
> + * SUBTEST: small-gtt-backwards
> + *
> + * SUBTEST: small-gtt-fbr
> + *
> + * SUBTEST: small-gtt-forwards
> + *
> + * SUBTEST: small-gtt-random
> + *
> + * SUBTEST: snoop
> + *
> + * SUBTEST: uncached
> + */
>  
>  #define MiB(x) ((x) * 1024 * 1024)
>  
> diff --git a/tests/i915/gem_pwrite_snooped.c b/tests/i915/gem_pwrite_snooped.c
> index e6a10747d5cb..7135dca57cbc 100644
> --- a/tests/i915/gem_pwrite_snooped.c
> +++ b/tests/i915/gem_pwrite_snooped.c
> @@ -37,6 +37,14 @@
>  #include "drm.h"
>  #include "i915/gem.h"
>  #include "igt.h"
> +/**
> + * TEST: gem pwrite snooped
> + * Description: pwrite to a snooped bo then make it uncached and check that the GPU sees the data.
> + * Feature: gtt, mapping
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION(
>     "pwrite to a snooped bo then make it uncached and check that the GPU sees the data.");
> diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> index 2f27abd582e3..7668834dbf10 100644
> --- a/tests/i915/gem_pxp.c
> +++ b/tests/i915/gem_pxp.c
> @@ -7,6 +7,85 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include <fcntl.h>
> +/**
> + * TEST: gem pxp
> + * Description: Test PXP that manages protected content through arbitrated HW-PXP-session
> + * Run type: FULL
> + *
> + * SUBTEST: create-protected-buffer
> + * Feature: PXP
> + *
> + * SUBTEST: create-regular-buffer
> + * Description: Verify protected buffer on supported hw:
> + * Feature: PXP
> + *
> + * SUBTEST: create-regular-context-1
> + * Description: Verify protected context on supported hw:
> + * Feature: PXP
> + *
> + * SUBTEST: create-regular-context-2
> + * Feature: PXP
> + *
> + * SUBTEST: create-valid-protected-context
> + * Feature: PXP
> + *
> + * SUBTEST: display-protected-crc
> + * Description: Test the display CRC
> + * Feature: PXP
> + *
> + * SUBTEST: dmabuf-shared-protected-dst-is-context-refcounted
> + * Feature: PXP, prime
> + *
> + * SUBTEST: fail-invalid-protected-context
> + * Feature: PXP
> + *
> + * SUBTEST: hw-rejects-pxp-buffer
> + * Description: Verify protected buffer on unsupported hw:
> + * Feature: PXP
> + *
> + * SUBTEST: hw-rejects-pxp-context
> + * Description: Verify protected context on unsupported hw:
> + * Feature: PXP
> + *
> + * SUBTEST: protected-encrypted-src-copy-not-readible
> + * Feature: PXP
> + *
> + * SUBTEST: protected-raw-src-copy-not-readible
> + * Feature: PXP
> + *
> + * SUBTEST: regular-baseline-src-copy-readible
> + * Description: Verify protected render operations:
> + * Feature: PXP
> + *
> + * SUBTEST: reject-modify-context-protection-off-1
> + * Feature: PXP
> + *
> + * SUBTEST: reject-modify-context-protection-off-2
> + * Feature: PXP
> + *
> + * SUBTEST: reject-modify-context-protection-off-3
> + * Feature: PXP
> + *
> + * SUBTEST: reject-modify-context-protection-on
> + * Description: Verify protected context integrity:
> + * Feature: PXP
> + *
> + * SUBTEST: verify-pxp-execution-after-suspend-resume
> + * Feature: PXP
> + *
> + * SUBTEST: verify-pxp-key-change-after-suspend-resume
> + * Description: Verify suspend-resume teardown management:
> + * Feature: PXP
> + *
> + * SUBTEST: verify-pxp-stale-buf-execution
> + * Feature: PXP
> + *
> + * SUBTEST: verify-pxp-stale-buf-optout-execution
> + * Feature: PXP
> + *
> + * SUBTEST: verify-pxp-stale-ctx-execution
> + * Feature: PXP
> + */
>  
>  IGT_TEST_DESCRIPTION("Test PXP that manages protected content through arbitrated HW-PXP-session");
>  /* Note: PXP = "Protected Xe Path" */
> diff --git a/tests/i915/gem_read_read_speed.c b/tests/i915/gem_read_read_speed.c
> index 7c5c90f79356..7eeba7c6ae42 100644
> --- a/tests/i915/gem_read_read_speed.c
> +++ b/tests/i915/gem_read_read_speed.c
> @@ -42,6 +42,67 @@
>  #include "i915/gem.h"
>  #include "igt.h"
>  #include "igt_sysfs.h"
> +/**
> + * TEST: gem read read speed
> + * Description: Test speed of concurrent reads between engines.
> + * Run type: FULL
> + *
> + * SUBTEST: read-read-1024x1024
> + *
> + * SUBTEST: read-read-128x128
> + *
> + * SUBTEST: read-read-2048x2048
> + *
> + * SUBTEST: read-read-256x256
> + *
> + * SUBTEST: read-read-4096x4096
> + *
> + * SUBTEST: read-read-512x512
> + *
> + * SUBTEST: read-read-8192x8192
> + *
> + * SUBTEST: read-write-1024x1024
> + *
> + * SUBTEST: read-write-128x128
> + *
> + * SUBTEST: read-write-2048x2048
> + *
> + * SUBTEST: read-write-256x256
> + *
> + * SUBTEST: read-write-4096x4096
> + *
> + * SUBTEST: read-write-512x512
> + *
> + * SUBTEST: read-write-8192x8192
> + *
> + * SUBTEST: write-read-1024x1024
> + *
> + * SUBTEST: write-read-128x128
> + *
> + * SUBTEST: write-read-2048x2048
> + *
> + * SUBTEST: write-read-256x256
> + *
> + * SUBTEST: write-read-4096x4096
> + *
> + * SUBTEST: write-read-512x512
> + *
> + * SUBTEST: write-read-8192x8192
> + *
> + * SUBTEST: write-write-1024x1024
> + *
> + * SUBTEST: write-write-128x128
> + *
> + * SUBTEST: write-write-2048x2048
> + *
> + * SUBTEST: write-write-256x256
> + *
> + * SUBTEST: write-write-4096x4096
> + *
> + * SUBTEST: write-write-512x512
> + *
> + * SUBTEST: write-write-8192x8192
> + */
>  
>  IGT_TEST_DESCRIPTION("Test speed of concurrent reads between engines.");
>  
> diff --git a/tests/i915/gem_readwrite.c b/tests/i915/gem_readwrite.c
> index 2d437dec3a7b..fdc68e315ba2 100644
> --- a/tests/i915/gem_readwrite.c
> +++ b/tests/i915/gem_readwrite.c
> @@ -38,6 +38,21 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem readwrite
> + * Feature: mapping
> + * Run type: FULL
> + *
> + * SUBTEST: beyond-EOB
> + *
> + * SUBTEST: new-obj
> + *
> + * SUBTEST: read-bad-handle
> + *
> + * SUBTEST: read-write
> + *
> + * SUBTEST: write-bad-handle
> + */
>  
>  #define OBJECT_SIZE 16384
>  
> diff --git a/tests/i915/gem_reg_read.c b/tests/i915/gem_reg_read.c
> index 79facc1f29cf..5f63c02f749e 100644
> --- a/tests/i915/gem_reg_read.c
> +++ b/tests/i915/gem_reg_read.c
> @@ -32,6 +32,17 @@
>  #include <sys/utsname.h>
>  #include <time.h>
>  
> +/**
> + * TEST: gem reg read
> + * Feature: gem_core
> + * Run type: FULL
> + *
> + * SUBTEST: bad-register
> + *
> + * SUBTEST: timestamp-monotonic
> + *
> + * SUBTEST: timestamp-moving
> + */
>  
>  static bool is_x86_64;
>  static bool has_proper_timestamp;
> diff --git a/tests/i915/gem_render_copy.c b/tests/i915/gem_render_copy.c
> index 2c150b2b065c..657509647078 100644
> --- a/tests/i915/gem_render_copy.c
> +++ b/tests/i915/gem_render_copy.c
> @@ -48,6 +48,126 @@
>  #include "igt.h"
>  #include "igt_x86.h"
>  #include "intel_bufops.h"
> +/**
> + * TEST: gem render copy
> + * Description: Basic test for the render_copy() function.
> + * Feature: mapping
> + * Run type: FULL
> + *
> + * SUBTEST: linear
> + * Description: Test render_copy() from a mixed-tiled to a linear buffer.
> + *
> + * SUBTEST: linear-to-vebox-y-tiled
> + * Description: Test vebox_copy() from a linear to a y-tiled buffer.
> + *
> + * SUBTEST: linear-to-vebox-yf-tiled
> + * Description: Test vebox_copy() from a linear to a yf-tiled buffer.
> + *
> + * SUBTEST: mixed-tiled-to-y-tiled-ccs
> + * Description: Test render_copy() from a mixed-tiled to a y-tiled-ccs buffer.
> + *
> + * SUBTEST: mixed-tiled-to-yf-tiled-ccs
> + * Description: Test render_copy() from a mixed-tiled to a yf-tiled-ccs buffer.
> + *
> + * SUBTEST: x-tiled
> + * Description: Test render_copy() from a mixed-tiled to a x-tiled buffer.
> + *
> + * SUBTEST: x-tiled-to-vebox-y-tiled
> + * Description: Test vebox_copy() from a x-tiled to a y-tiled buffer.
> + *
> + * SUBTEST: x-tiled-to-vebox-yf-tiled
> + * Description: Test vebox_copy() from a x-tiled to a yf-tiled buffer.
> + *
> + * SUBTEST: y-tiled
> + * Description: Test render_copy() from a mixed-tiled to a y-tiled buffer.
> + *
> + * SUBTEST: y-tiled-ccs-to-linear
> + * Description: Test render_copy() from a y-tiled-ccs to a linear buffer.
> + *
> + * SUBTEST: y-tiled-ccs-to-x-tiled
> + * Description: Test render_copy() from a y-tiled-ccs to a x-tiled buffer.
> + *
> + * SUBTEST: y-tiled-ccs-to-y-tiled
> + * Description: Test render_copy() from a y-tiled-ccs to a y-tiled buffer.
> + *
> + * SUBTEST: y-tiled-ccs-to-y-tiled-ccs
> + * Description: Test render_copy() from a y-tiled-ccs to a y-tiled-ccs buffer.
> + *
> + * SUBTEST: y-tiled-ccs-to-y-tiled-mc-ccs
> + * Description: Test render_copy() and vebox_copy() from a y-tiled-ccs to a y-tiled-mc-ccs buffer.
> + *
> + * SUBTEST: y-tiled-ccs-to-yf-tiled
> + * Description: Test render_copy() from a y-tiled-ccs to a yf-tiled buffer.
> + *
> + * SUBTEST: y-tiled-ccs-to-yf-tiled-ccs
> + * Description: Test render_copy() from a y-tiled-ccs to a yf-tiled-ccs buffer.
> + *
> + * SUBTEST: y-tiled-ccs-to-yf-tiled-mc-ccs
> + * Description: Test render_copy() and vebox_copy() from a y-tiled-ccs to a yf-tiled-mc-ccs buffer.
> + *
> + * SUBTEST: y-tiled-mc-ccs-to-vebox-y-tiled
> + * Description: Test vebox_copy() from a y-tiled-mc-ccs to a y-tiled buffer.
> + *
> + * SUBTEST: y-tiled-mc-ccs-to-vebox-yf-tiled
> + * Description: Test vebox_copy() from a y-tiled-mc-ccs to a yf-tiled buffer.
> + *
> + * SUBTEST: y-tiled-mc-ccs-to-y-tiled-ccs
> + * Description: Test render_copy() and vebox_copy() from a y-tiled-mc-ccs to a y-tiled-ccs buffer.
> + *
> + * SUBTEST: y-tiled-mc-ccs-to-yf-tiled-ccs
> + * Description: Test render_copy() and vebox_copy() from a y-tiled-mc-ccs to a yf-tiled-ccs buffer.
> + *
> + * SUBTEST: y-tiled-to-vebox-linear
> + * Description: Test vebox_copy() from a y-tiled to a linear buffer.
> + *
> + * SUBTEST: y-tiled-to-vebox-x-tiled
> + * Description: Test vebox_copy() from a y-tiled to a x-tiled buffer.
> + *
> + * SUBTEST: y-tiled-to-vebox-y-tiled
> + * Description: Test vebox_copy() from a y-tiled to a y-tiled buffer.
> + *
> + * SUBTEST: y-tiled-to-vebox-yf-tiled
> + * Description: Test vebox_copy() from a y-tiled to a yf-tiled buffer.
> + *
> + * SUBTEST: yf-tiled
> + * Description: Test render_copy() from a mixed-tiled to a yf-tiled buffer.
> + *
> + * SUBTEST: yf-tiled-ccs-to-linear
> + * Description: Test render_copy() from a yf-tiled-ccs to a linear buffer.
> + *
> + * SUBTEST: yf-tiled-ccs-to-x-tiled
> + * Description: Test render_copy() from a yf-tiled-ccs to a x-tiled buffer.
> + *
> + * SUBTEST: yf-tiled-ccs-to-y-tiled
> + * Description: Test render_copy() from a yf-tiled-ccs to a y-tiled buffer.
> + *
> + * SUBTEST: yf-tiled-ccs-to-y-tiled-ccs
> + * Description: Test render_copy() from a yf-tiled-ccs to a y-tiled-ccs buffer.
> + *
> + * SUBTEST: yf-tiled-ccs-to-yf-tiled
> + * Description: Test render_copy() from a yf-tiled-ccs to a yf-tiled buffer.
> + *
> + * SUBTEST: yf-tiled-ccs-to-yf-tiled-ccs
> + * Description: Test render_copy() from a yf-tiled-ccs to a yf-tiled-ccs buffer.
> + *
> + * SUBTEST: yf-tiled-mc-ccs-to-vebox-y-tiled
> + * Description: Test vebox_copy() from a yf-tiled-mc-ccs to a y-tiled buffer.
> + *
> + * SUBTEST: yf-tiled-mc-ccs-to-vebox-yf-tiled
> + * Description: Test vebox_copy() from a yf-tiled-mc-ccs to a yf-tiled buffer.
> + *
> + * SUBTEST: yf-tiled-to-vebox-linear
> + * Description: Test vebox_copy() from a yf-tiled to a linear buffer.
> + *
> + * SUBTEST: yf-tiled-to-vebox-x-tiled
> + * Description: Test vebox_copy() from a yf-tiled to a x-tiled buffer.
> + *
> + * SUBTEST: yf-tiled-to-vebox-y-tiled
> + * Description: Test vebox_copy() from a yf-tiled to a y-tiled buffer.
> + *
> + * SUBTEST: yf-tiled-to-vebox-yf-tiled
> + * Description: Test vebox_copy() from a yf-tiled to a yf-tiled buffer.
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic test for the render_copy() function.");
>  
> diff --git a/tests/i915/gem_render_copy_redux.c b/tests/i915/gem_render_copy_redux.c
> index 5e1daccf1801..0cb2936d383e 100644
> --- a/tests/i915/gem_render_copy_redux.c
> +++ b/tests/i915/gem_render_copy_redux.c
> @@ -48,6 +48,23 @@
>  
>  #include "i915/gem.h"
>  #include "igt.h"
> +/**
> + * TEST: gem render copy redux
> + * Description: Advanced test for the render_copy() function.
> + * Run type: FULL
> + *
> + * SUBTEST: flink
> + * Feature: mapping, xorg_dri2
> + *
> + * SUBTEST: flink-interruptible
> + * Feature: mapping, xorg_dri2
> + *
> + * SUBTEST: interruptible
> + * Feature: mapping
> + *
> + * SUBTEST: normal
> + * Feature: mapping
> + */
>  
>  IGT_TEST_DESCRIPTION("Advanced test for the render_copy() function.");
>  
> diff --git a/tests/i915/gem_render_linear_blits.c b/tests/i915/gem_render_linear_blits.c
> index c2f2c0788ef9..1fcfb019b426 100644
> --- a/tests/i915/gem_render_linear_blits.c
> +++ b/tests/i915/gem_render_linear_blits.c
> @@ -49,6 +49,22 @@
>  
>  #include "i915/gem.h"
>  #include "igt.h"
> +/**
> + * TEST: gem render linear blits
> + * Feature: mapping
> + *
> + * SUBTEST: aperture-shrink
> + * Run type: FULL
> + *
> + * SUBTEST: aperture-thrash
> + * Run type: FULL
> + *
> + * SUBTEST: basic
> + * Run type: BAT
> + *
> + * SUBTEST: swap-thrash
> + * Run type: FULL
> + */
>  
>  #define WIDTH 512
>  #define STRIDE (WIDTH*4)
> diff --git a/tests/i915/gem_render_tiled_blits.c b/tests/i915/gem_render_tiled_blits.c
> index 3becf576fef5..ba9e62a2565d 100644
> --- a/tests/i915/gem_render_tiled_blits.c
> +++ b/tests/i915/gem_render_tiled_blits.c
> @@ -48,6 +48,33 @@
>  
>  #include "i915/gem.h"
>  #include "igt.h"
> +/**
> + * TEST: gem render tiled blits
> + * Description:
> + *   Tests performs cyclic forward, backward and random blits on tiled buffer objects using render
> + *   engine with various working set sizes and compares outputs with expected ones.
> + * Feature: mapping
> + *
> + * SUBTEST: aperture-shrink
> + * Description:
> + *   Check with working set size larger than aperture size and a helper process to shrink buffer
> + *   object caches.
> + * Run type: FULL
> + *
> + * SUBTEST: aperture-thrash
> + * Description: Check with working set size larger than aperture size.
> + * Run type: FULL
> + *
> + * SUBTEST: basic
> + * Description: Check basic functionality.
> + * Run type: BAT
> + *
> + * SUBTEST: swap-thrash
> + * Description:
> + *   Check with working set size larger than system memory size resulting in usage and thrashing
> + *   of swap space.
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests performs cyclic forward, backward and random blits on tiled buffer "
>  		      "objects using render engine with various working set sizes and compares "
> diff --git a/tests/i915/gem_request_retire.c b/tests/i915/gem_request_retire.c
> index 9e163bd3af60..9e074706d259 100644
> --- a/tests/i915/gem_request_retire.c
> +++ b/tests/i915/gem_request_retire.c
> @@ -49,6 +49,14 @@
>  #include "i915/gem.h"
>  #include "igt.h"
>  #include "igt_types.h"
> +/**
> + * TEST: gem request retire
> + * Description: Collection of tests targeting request retirement code paths.
> + * Feature: cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST: retire-vma-not-inactive
> + */
>  
>  IGT_TEST_DESCRIPTION("Collection of tests targeting request retirement code"
>  		     " paths.");
> diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
> index 7b003d88b664..b58f49210eb4 100644
> --- a/tests/i915/gem_reset_stats.c
> +++ b/tests/i915/gem_reset_stats.c
> @@ -47,6 +47,184 @@
>  #include "igt.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem reset stats
> + * Run type: FULL
> + *
> + * SUBTEST: ban-blt
> + *
> + * SUBTEST: ban-bsd
> + *
> + * SUBTEST: ban-bsd1
> + *
> + * SUBTEST: ban-bsd2
> + *
> + * SUBTEST: ban-ctx-blt
> + *
> + * SUBTEST: ban-ctx-bsd
> + *
> + * SUBTEST: ban-ctx-bsd1
> + *
> + * SUBTEST: ban-ctx-bsd2
> + *
> + * SUBTEST: ban-ctx-default
> + *
> + * SUBTEST: ban-ctx-render
> + *
> + * SUBTEST: ban-ctx-vebox
> + *
> + * SUBTEST: ban-default
> + *
> + * SUBTEST: ban-render
> + *
> + * SUBTEST: ban-vebox
> + *
> + * SUBTEST: close-pending-blt
> + *
> + * SUBTEST: close-pending-bsd
> + *
> + * SUBTEST: close-pending-bsd1
> + *
> + * SUBTEST: close-pending-bsd2
> + *
> + * SUBTEST: close-pending-ctx-blt
> + *
> + * SUBTEST: close-pending-ctx-bsd
> + *
> + * SUBTEST: close-pending-ctx-bsd1
> + *
> + * SUBTEST: close-pending-ctx-bsd2
> + *
> + * SUBTEST: close-pending-ctx-default
> + *
> + * SUBTEST: close-pending-ctx-render
> + *
> + * SUBTEST: close-pending-ctx-vebox
> + *
> + * SUBTEST: close-pending-default
> + *
> + * SUBTEST: close-pending-fork-blt
> + *
> + * SUBTEST: close-pending-fork-bsd
> + *
> + * SUBTEST: close-pending-fork-bsd1
> + *
> + * SUBTEST: close-pending-fork-bsd2
> + *
> + * SUBTEST: close-pending-fork-default
> + *
> + * SUBTEST: close-pending-fork-render
> + *
> + * SUBTEST: close-pending-fork-reverse-blt
> + *
> + * SUBTEST: close-pending-fork-reverse-bsd
> + *
> + * SUBTEST: close-pending-fork-reverse-bsd1
> + *
> + * SUBTEST: close-pending-fork-reverse-bsd2
> + *
> + * SUBTEST: close-pending-fork-reverse-default
> + *
> + * SUBTEST: close-pending-fork-reverse-render
> + *
> + * SUBTEST: close-pending-fork-reverse-vebox
> + *
> + * SUBTEST: close-pending-fork-vebox
> + *
> + * SUBTEST: close-pending-render
> + *
> + * SUBTEST: close-pending-vebox
> + *
> + * SUBTEST: defer-hangcheck-blt
> + *
> + * SUBTEST: defer-hangcheck-bsd
> + *
> + * SUBTEST: defer-hangcheck-bsd1
> + *
> + * SUBTEST: defer-hangcheck-bsd2
> + *
> + * SUBTEST: defer-hangcheck-default
> + *
> + * SUBTEST: defer-hangcheck-render
> + *
> + * SUBTEST: defer-hangcheck-vebox
> + *
> + * SUBTEST: params
> + *
> + * SUBTEST: params-ctx
> + *
> + * SUBTEST: reset-count-blt
> + *
> + * SUBTEST: reset-count-bsd
> + *
> + * SUBTEST: reset-count-bsd1
> + *
> + * SUBTEST: reset-count-bsd2
> + *
> + * SUBTEST: reset-count-ctx-blt
> + *
> + * SUBTEST: reset-count-ctx-bsd
> + *
> + * SUBTEST: reset-count-ctx-bsd1
> + *
> + * SUBTEST: reset-count-ctx-bsd2
> + *
> + * SUBTEST: reset-count-ctx-default
> + *
> + * SUBTEST: reset-count-ctx-render
> + *
> + * SUBTEST: reset-count-ctx-vebox
> + *
> + * SUBTEST: reset-count-default
> + *
> + * SUBTEST: reset-count-render
> + *
> + * SUBTEST: reset-count-vebox
> + *
> + * SUBTEST: reset-stats-blt
> + *
> + * SUBTEST: reset-stats-bsd
> + *
> + * SUBTEST: reset-stats-bsd1
> + *
> + * SUBTEST: reset-stats-bsd2
> + *
> + * SUBTEST: reset-stats-ctx-blt
> + *
> + * SUBTEST: reset-stats-ctx-bsd
> + *
> + * SUBTEST: reset-stats-ctx-bsd1
> + *
> + * SUBTEST: reset-stats-ctx-bsd2
> + *
> + * SUBTEST: reset-stats-ctx-default
> + *
> + * SUBTEST: reset-stats-ctx-render
> + *
> + * SUBTEST: reset-stats-ctx-vebox
> + *
> + * SUBTEST: reset-stats-default
> + *
> + * SUBTEST: reset-stats-render
> + *
> + * SUBTEST: reset-stats-vebox
> + *
> + * SUBTEST: shared-reset-domain
> + *
> + * SUBTEST: unrelated-ctx-blt
> + *
> + * SUBTEST: unrelated-ctx-bsd
> + *
> + * SUBTEST: unrelated-ctx-bsd1
> + *
> + * SUBTEST: unrelated-ctx-bsd2
> + *
> + * SUBTEST: unrelated-ctx-default
> + *
> + * SUBTEST: unrelated-ctx-render
> + *
> + * SUBTEST: unrelated-ctx-vebox
> + */
>  
>  #define RS_NO_ERROR      0
>  #define RS_BATCH_ACTIVE  (1 << 0)
> diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> index afcd7b73ede2..576e35ea84a0 100644
> --- a/tests/i915/gem_ringfill.c
> +++ b/tests/i915/gem_ringfill.c
> @@ -41,6 +41,117 @@
>  
>  #include <signal.h>
>  #include <sys/ioctl.h>
> +/**
> + * TEST: gem ringfill
> + * Description:
> + *   Exercise many tiny batchbuffer operations, in the hope of catching failure to manage the ring
> + *   properly near full.
> + *
> + * SUBTEST: basic-all
> + * Description: Basic check to fill the ring upto maximum on all engines simultaneously.
> + * Feature: cmd_submission
> + * Run type: BAT
> + *
> + * SUBTEST: engines-S3
> + * Description: Handle a full ring across suspend cycle.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: engines-S4
> + * Description: Handle a full ring across hibernate cycle.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: engines-basic
> + * Description: Basic check how the driver handles a full ring.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: engines-bomb
> + * Description:
> + *   Fills the ring upto maximim parallely using fork with different fd's along with
> + *   interruptions.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: engines-child
> + * Description: Check to fill the ring parallely using fork.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: engines-fd
> + * Description: Fills the ring upto maximim parallely using fork with different fd's.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: engines-forked
> + * Description: Check to fill the ring parallely using fork.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: engines-hang
> + * Description: Exercise many batchbuffer operations along with a hang batch until ring is full.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: engines-interruptible
> + * Description:
> + *   Exercise all potential injection sites by using igt_sigiter interface to repeat the
> + *   ringfill testing.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-S3
> + * Description: Handle a full ring across suspend cycle - on legacy ring.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-S4
> + * Description: Handle a full ring across hibernate cycle - on legacy ring.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-basic
> + * Description: Basic check how the driver handles a full ring - on legacy ring.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-bomb
> + * Description:
> + *   Fills the ring upto maximim parallely using fork with different fd's along with
> + *   interruptions - on legacy ring.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-child
> + * Description: Check to fill the ring parallely using fork - on legacy ring.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-fd
> + * Description: Fills the ring upto maximim parallely using fork with different fd's - on legacy ring.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-forked
> + * Description: Check to fill the ring parallely using fork - on legacy ring.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-hang
> + * Description:
> + *   Exercise many batchbuffer operations along with a hang batch until ring is full - on legacy
> + *   ring.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-interruptible
> + * Description:
> + *   Exercise all potential injection sites by using igt_sigiter interface to repeat the
> + *   ringfill testing - on legacy ring.
> + * Feature: cmd_submission, multitile
> + * Run type: FULL
> + */
>  
>  #define INTERRUPTIBLE 0x1
>  #define HANG 0x2
> diff --git a/tests/i915/gem_set_tiling_vs_blt.c b/tests/i915/gem_set_tiling_vs_blt.c
> index 5e3bf6a12482..cee4591b8d08 100644
> --- a/tests/i915/gem_set_tiling_vs_blt.c
> +++ b/tests/i915/gem_set_tiling_vs_blt.c
> @@ -57,6 +57,21 @@
>  #include "drm.h"
>  #include "i915/gem.h"
>  #include "igt.h"
> +/**
> + * TEST: gem set tiling vs blt
> + * Description: Check for proper synchronization of tiling changes vs. tiled gpu access.
> + * Feature: blitter, gtt
> + * Run type: FULL
> + *
> + * SUBTEST: tiled-to-tiled
> + * Description: Check for proper synchronization of tiled->tiled transition.
> + *
> + * SUBTEST: tiled-to-untiled
> + * Description: Check for proper synchronization of tiled->untiled transition.
> + *
> + * SUBTEST: untiled-to-tiled
> + * Description: Check for proper synchronization of untiled->tiled transition.
> + */
>  
>  IGT_TEST_DESCRIPTION("Check for proper synchronization of tiling changes vs."
>  		     " tiled gpu access.");
> diff --git a/tests/i915/gem_set_tiling_vs_gtt.c b/tests/i915/gem_set_tiling_vs_gtt.c
> index 2f890e83bd90..30b69bb8b0ad 100644
> --- a/tests/i915/gem_set_tiling_vs_gtt.c
> +++ b/tests/i915/gem_set_tiling_vs_gtt.c
> @@ -38,6 +38,14 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem set tiling vs gtt
> + * Description: Check set_tiling vs gtt mmap coherency.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Check set_tiling vs gtt mmap coherency.");
>  
> diff --git a/tests/i915/gem_set_tiling_vs_pwrite.c b/tests/i915/gem_set_tiling_vs_pwrite.c
> index 6bec7f27ed6d..328682d945ae 100644
> --- a/tests/i915/gem_set_tiling_vs_pwrite.c
> +++ b/tests/i915/gem_set_tiling_vs_pwrite.c
> @@ -38,6 +38,14 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem set tiling vs pwrite
> + * Description: Check set_tiling vs pwrite coherency.
> + * Feature: gtt
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Check set_tiling vs pwrite coherency.");
>  
> diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
> index 380d2c846f83..a65792c84137 100644
> --- a/tests/i915/gem_shrink.c
> +++ b/tests/i915/gem_shrink.c
> @@ -33,6 +33,113 @@
>  #include "igt_gt.h"
>  #include "igt_debugfs.h"
>  #include "igt_sysfs.h"
> +/**
> + * TEST: gem shrink
> + * Feature: mapping
> + * Run type: FULL
> + *
> + * SUBTEST: execbuf1
> + *
> + * SUBTEST: execbuf1-oom
> + *
> + * SUBTEST: execbuf1-sanitycheck
> + *
> + * SUBTEST: execbuf1-userptr
> + *
> + * SUBTEST: execbuf1-userptr-dirty
> + *
> + * SUBTEST: execbufN
> + *
> + * SUBTEST: execbufN-oom
> + *
> + * SUBTEST: execbufN-sanitycheck
> + *
> + * SUBTEST: execbufN-userptr
> + *
> + * SUBTEST: execbufN-userptr-dirty
> + *
> + * SUBTEST: execbufX
> + *
> + * SUBTEST: execbufX-oom
> + *
> + * SUBTEST: execbufX-sanitycheck
> + *
> + * SUBTEST: execbufX-userptr
> + *
> + * SUBTEST: execbufX-userptr-dirty
> + *
> + * SUBTEST: get-pages
> + *
> + * SUBTEST: get-pages-dirty
> + *
> + * SUBTEST: get-pages-dirty-oom
> + *
> + * SUBTEST: get-pages-dirty-sanitycheck
> + *
> + * SUBTEST: get-pages-dirty-userptr
> + *
> + * SUBTEST: get-pages-dirty-userptr-dirty
> + *
> + * SUBTEST: get-pages-oom
> + *
> + * SUBTEST: get-pages-sanitycheck
> + *
> + * SUBTEST: get-pages-userptr
> + *
> + * SUBTEST: get-pages-userptr-dirty
> + *
> + * SUBTEST: hang
> + *
> + * SUBTEST: hang-oom
> + *
> + * SUBTEST: hang-sanitycheck
> + *
> + * SUBTEST: hang-userptr
> + *
> + * SUBTEST: hang-userptr-dirty
> + *
> + * SUBTEST: mmap-cpu
> + *
> + * SUBTEST: mmap-cpu-oom
> + *
> + * SUBTEST: mmap-cpu-sanitycheck
> + *
> + * SUBTEST: mmap-cpu-userptr
> + *
> + * SUBTEST: mmap-cpu-userptr-dirty
> + *
> + * SUBTEST: mmap-gtt
> + *
> + * SUBTEST: mmap-gtt-oom
> + *
> + * SUBTEST: mmap-gtt-sanitycheck
> + *
> + * SUBTEST: mmap-gtt-userptr
> + *
> + * SUBTEST: mmap-gtt-userptr-dirty
> + *
> + * SUBTEST: pread
> + *
> + * SUBTEST: pread-oom
> + *
> + * SUBTEST: pread-sanitycheck
> + *
> + * SUBTEST: pread-userptr
> + *
> + * SUBTEST: pread-userptr-dirty
> + *
> + * SUBTEST: pwrite
> + *
> + * SUBTEST: pwrite-oom
> + *
> + * SUBTEST: pwrite-sanitycheck
> + *
> + * SUBTEST: pwrite-userptr
> + *
> + * SUBTEST: pwrite-userptr-dirty
> + *
> + * SUBTEST: reclaim
> + */
>  
>  #ifndef MADV_FREE
>  #define MADV_FREE 8
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> index 8717860b2d11..8365c5c83644 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -31,6 +31,119 @@
>  #include "igt.h"
>  #include "igt_rand.h"
>  #include "intel_allocator.h"
> +/**
> + * TEST: gem softpin
> + * Description:
> + *   Tests softpin feature with normal usage, invalid inputs scenarios and couple of eviction
> + *   tests which copy buffers between CPU and GPU.
> + * Feature: mapping
> + *
> + * SUBTEST: 32b-excludes-last-page
> + * Description: Check the last 32b page is excluded.
> + * Run type: FULL
> + *
> + * SUBTEST: allocator-basic
> + * Description: Check that we can place objects at start/end of the GTT using the allocator.
> + * Run type: BAT
> + *
> + * SUBTEST: allocator-basic-reserve
> + * Description: Check that if we can reserve a space for an object starting from a given offset.
> + * Run type: BAT
> + *
> + * SUBTEST: allocator-evict
> + * Description: Exercise eviction with softpinning.
> + * Run type: FULL
> + *
> + * SUBTEST: allocator-fork
> + * Description: Check if multiple processes can use alloctor.
> + * Run type: FULL
> + *
> + * SUBTEST: allocator-nopin
> + * Description: Check that we can combine manual placement with automatic GTT placement.
> + * Run type: FULL
> + *
> + * SUBTEST: allocator-nopin-reserve
> + * Description:
> + *   Check that we can combine manual placement with automatic GTT placement and
> + *   reserves/unreserves space for objects.
> + * Run type: FULL
> + *
> + * SUBTEST: evict-active
> + * Description: Check eviction with active bo.
> + * Run type: FULL
> + *
> + * SUBTEST: evict-active-interruptible
> + * Description: Check eviction with active bo with interrupts.
> + * Run type: FULL
> + *
> + * SUBTEST: evict-hang
> + * Description: Check eviction of softpinned bo with hung batch.
> + * Run type: FULL
> + *
> + * SUBTEST: evict-prime
> + * Description: Check eviction of vma on importing prime fd in reopened drm fds
> + * Run type: FULL
> + *
> + * SUBTEST: evict-prime-sanity-check
> + * Description: Check eviction of vma on importing prime fd in reopened drm fd in single thread
> + * Run type: FULL
> + *
> + * SUBTEST: evict-single-offset
> + * Description: Use same offset for all engines and for different handles.
> + * Run type: FULL
> + *
> + * SUBTEST: evict-snoop
> + * Description: Check eviction against snooping.
> + * Run type: FULL
> + *
> + * SUBTEST: evict-snoop-interruptible
> + * Description: Check eviction against snooping with interrupts.
> + * Run type: FULL
> + *
> + * SUBTEST: full
> + * Description: Check the total occupancy by using pad-to-size to fill the entire GTT.
> + * Run type: FULL
> + *
> + * SUBTEST: invalid
> + * Description: Check that invalid inputs are handled correctly.
> + * Run type: FULL
> + *
> + * SUBTEST: noreloc
> + * Description: Check that noreloc support works.
> + * Run type: FULL
> + *
> + * SUBTEST: noreloc-S3
> + * Description: Check noreloc survives after suspend to RAM/resume cycle.
> + * Run type: FULL
> + *
> + * SUBTEST: noreloc-S4
> + * Description: Check noreloc survives after suspend to disk/resume cycle.
> + * Run type: FULL
> + *
> + * SUBTEST: noreloc-interruptible
> + * Description: Check noreloc support with interruptible.
> + * Run type: FULL
> + *
> + * SUBTEST: overlap
> + * Description: Check all the possible pages aligned overlaps.
> + * Run type: FULL
> + *
> + * SUBTEST: reverse
> + * Description: Check that if the user demands the vma will be swapped.
> + * Run type: FULL
> + *
> + * SUBTEST: safe-alignment
> + * Description: Check start offset and alignment detection.
> + * Run type: BAT
> + *
> + * SUBTEST: softpin
> + * Description: Check softpinning of a gem buffer object.
> + * Run type: FULL
> + *
> + * SUBTEST: zero
> + * Description: Check full placement control under full-ppGTT.
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests softpin feature with normal usage, invalid inputs"
>  		     " scenarios and couple of eviction tests which copy buffers"
> diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
> index 7dc68ebc73b1..0a6c088da630 100644
> --- a/tests/i915/gem_spin_batch.c
> +++ b/tests/i915/gem_spin_batch.c
> @@ -25,6 +25,46 @@
>  #include "i915/gem.h"
>  #include "i915/gem_ring.h"
>  #include "igt.h"
> +/**
> + * TEST: gem spin batch
> + * Run type: FULL
> + *
> + * SUBTEST: engines
> + * Feature: context, igt_core
> + *
> + * SUBTEST: legacy
> + * Feature: context, igt_core
> + *
> + * SUBTEST: legacy-resubmit
> + * Feature: context, igt_core
> + *
> + * SUBTEST: legacy-resubmit-new
> + * Feature: context, igt_core, multictx
> + *
> + * SUBTEST: resubmit
> + * Feature: context, igt_core
> + *
> + * SUBTEST: resubmit-all
> + * Feature: context, igt_core, multictx
> + *
> + * SUBTEST: resubmit-new
> + * Feature: context, igt_core, multictx
> + *
> + * SUBTEST: resubmit-new-all
> + * Feature: context, igt_core, multictx
> + *
> + * SUBTEST: spin-all
> + * Feature: igt_core, multictx
> + *
> + * SUBTEST: spin-all-new
> + * Feature: igt_core, multictx
> + *
> + * SUBTEST: spin-each
> + * Feature: igt_core, multictx
> + *
> + * SUBTEST: user-each
> + * Feature: igt_core, multictx
> + */
>  
>  #define MAX_ERROR 5 /* % */
>  
> diff --git a/tests/i915/gem_streaming_writes.c b/tests/i915/gem_streaming_writes.c
> index 883fe4293772..2c59c08f6c83 100644
> --- a/tests/i915/gem_streaming_writes.c
> +++ b/tests/i915/gem_streaming_writes.c
> @@ -40,6 +40,35 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +/**
> + * TEST: gem streaming writes
> + * Description: Test of streaming writes into active GPU sources
> + * Run type: FULL
> + *
> + * SUBTEST: batch-cpu
> + *
> + * SUBTEST: batch-gtt
> + *
> + * SUBTEST: batch-reverse-cpu
> + *
> + * SUBTEST: batch-reverse-gtt
> + *
> + * SUBTEST: batch-reverse-wc
> + *
> + * SUBTEST: batch-wc
> + *
> + * SUBTEST: cpu
> + *
> + * SUBTEST: cpu-sync
> + *
> + * SUBTEST: gtt
> + *
> + * SUBTEST: gtt-sync
> + *
> + * SUBTEST: wc
> + *
> + * SUBTEST: wc-sync
> + */
>  
>  #define OBJECT_SIZE 1024*1024
>  #define CHUNK_SIZE 32
> diff --git a/tests/i915/gem_stress.c b/tests/i915/gem_stress.c
> index 3765ab14bdba..625b0e915ff5 100644
> --- a/tests/i915/gem_stress.c
> +++ b/tests/i915/gem_stress.c
> @@ -61,6 +61,13 @@
>  #include <sys/time.h>
>  
>  #include <drm.h>
> +/**
> + * TEST: gem stress
> + * Description: General gem coherency test.
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("General gem coherency test.");
>  
> diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> index e7dc6637abc0..1c7e51a92bfa 100644
> --- a/tests/i915/gem_sync.c
> +++ b/tests/i915/gem_sync.c
> @@ -32,6 +32,231 @@
>  #include "igt_gt.h"
>  #include "igt.h"
>  #include "igt_sysfs.h"
> +/**
> + * TEST: gem sync
> + * Description: Basic check of ring<->ring write synchronisation.
> + *
> + * SUBTEST: active
> + * Description: Exercise waiting while keeping the GPU busy on each engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: active-each
> + * Description: Exercise waiting while keeping the GPU busy.
> + * Feature: multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: active-wakeup
> + * Description: Measure wakeup latency while also scheduling the next batch on each engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: active-wakeup-each
> + * Description: Measure wakeup latency while also scheduling the next batch.
> + * Feature: multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: basic-all
> + * Description: Basic test to wait upon a batch on all rings.
> + * Feature: synchronization
> + * Run type: BAT
> + *
> + * SUBTEST: basic-each
> + * Description: Check synchronisation of ring.
> + * Feature: multitile, synchronization
> + * Run type: BAT
> + *
> + * SUBTEST: basic-many-each
> + * Description: Create race condition and see if we can catch interrupts.
> + * Feature: multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: basic-store-all
> + * Description: Basic version of store synchronisation test.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: basic-store-each
> + * Description: Check that store synchronisation works.
> + * Feature: multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: default
> + * Description: Check synchronisation of rings on each engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: double-wakeup
> + * Description: Double stress test for nop + sync on each engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: double-wakeup-each
> + * Description: Double stress test for nop + sync.
> + * Feature: multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: forked
> + * Description: Check synchronisation of ring with parallel executions on each engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: forked-all
> + * Description: Parallel execution of batch on all rings and then wait.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: forked-each
> + * Description:
> + *   Forked variant of sync_ring, which checks synchronisation of ring with parallel
> + *   executions.
> + * Feature: multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: forked-store
> + * Description: Check store synchronisation works with parallel multiple executions on each engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: forked-store-all
> + * Description: Parallel execution of store synchronisation.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: forked-store-each
> + * Description: Forked variant of store_ring, check if parallel store synchronisation works.
> + * Feature: multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: forked-switch
> + * Description: Check sync after context switch parallelly on each engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: forked-switch-each
> + * Description: Check sync after context switch parallelly.
> + * Feature: multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: idle
> + * Description: Exercise and measure idle requests on each engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-active
> + * Description: Exercise waiting while keeping the GPU busy for each legacy engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-active-wakeup
> + * Description: Measure wakeup latency while also scheduling the next batch for each legacy engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-default
> + * Description: Check synchronisation of rings for each legacy engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-double-wakeup
> + * Description: Double stress test for nop + sync for each legacy engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-forked
> + * Description: Check synchronisation of ring with parallel executions for each legacy engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-forked-store
> + * Description:
> + *   Check store synchronisation works with parallel multiple executions for each legacy
> + *   engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-forked-switch
> + * Description: Check sync after context switch parallelly for each legacy engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-idle
> + * Description: Exercise and measure idle requests for each legacy engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-many
> + * Description: Create race condition and see if we can catch interrupts for each legacy engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-store
> + * Description: Check that store synchronisation works for each legacy engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-switch
> + * Description: Check sync after context switch for each legacy engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-wakeup
> + * Description: Stress for nop + sync for each legacy engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: many
> + * Description: Create race condition and see if we can catch interrupts on each engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: preempt
> + * Description: For each context engine check how priority of task are submitted when engine is already busy.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: preempt-all
> + * Description:
> + *   Check and measure how well we can submit a second high priority task when the engine is already
> + *   busy with a low priority task on all engines.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: store
> + * Description: Check that store synchronisation works on each engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: store-all
> + * Description: Extended version of existing basic-store-all test.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: switch
> + * Description: Check sync after context switch on each engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: switch-each
> + * Description: Check sync after context switch.
> + * Feature: multitile, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: wait-all
> + * Description: Extended version of existing basic-all test.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: wakeup
> + * Description: Stress for nop + sync on each engine.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: wakeup-each
> + * Description: Stress test for nop + sync.
> + * Feature: multitile, synchronization
> + * Run type: FULL
> + */
>  
>  #define MAX_PRIO I915_CONTEXT_MAX_USER_PRIORITY
>  #define MIN_PRIO I915_CONTEXT_MIN_USER_PRIORITY
> diff --git a/tests/i915/gem_tiled_blits.c b/tests/i915/gem_tiled_blits.c
> index 5e7ed0c4e062..8c3951c6fb0d 100644
> --- a/tests/i915/gem_tiled_blits.c
> +++ b/tests/i915/gem_tiled_blits.c
> @@ -54,6 +54,23 @@
>  
>  #include "i915/gem.h"
>  #include "igt.h"
> +/**
> + * TEST: gem tiled blits
> + * Description: Test doing many tiled blits, with a working set larger than the aperture size.
> + * Feature: gtt, mapping
> + *
> + * SUBTEST: basic
> + * Description: Check basic functionality.
> + * Run type: BAT
> + *
> + * SUBTEST: interruptible
> + * Description: Check with interrupts in parallel execution.
> + * Run type: FULL
> + *
> + * SUBTEST: normal
> + * Description: Check with parallel execution.
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Test doing many tiled blits, with a working set larger"
>  		     " than the aperture size.");
> diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
> index a3a0221d627f..539601e5af73 100644
> --- a/tests/i915/gem_tiled_fence_blits.c
> +++ b/tests/i915/gem_tiled_fence_blits.c
> @@ -45,6 +45,21 @@
>  #include "i915/gem_create.h"
>  #include "igt.h"
>  #include "igt_x86.h"
> +/**
> + * TEST: gem tiled fence blits
> + * Description:
> + *   Tests fence management problems related to tiled blits by performing many blits on tiled
> + *   buffer objects with fences enabled and with working set larger than the aperture size.
> + * Feature: gtt, mapping
> + *
> + * SUBTEST: basic
> + * Description: Check basic functionality.
> + * Run type: BAT
> + *
> + * SUBTEST: normal
> + * Description: Check with parallel execution.
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests fence management problems related to tiled blits by performing "
>  		     "many blits on tiled buffer objects with fences enabled and with working "
> diff --git a/tests/i915/gem_tiled_partial_pwrite_pread.c b/tests/i915/gem_tiled_partial_pwrite_pread.c
> index 95fb69c659cf..a7e845e32d1d 100644
> --- a/tests/i915/gem_tiled_partial_pwrite_pread.c
> +++ b/tests/i915/gem_tiled_partial_pwrite_pread.c
> @@ -38,6 +38,18 @@
>  
>  #include "i915/gem.h"
>  #include "igt.h"
> +/**
> + * TEST: gem tiled partial pwrite pread
> + * Description: Test pwrite/pread consistency when touching partial cachelines.
> + * Feature: gtt, mapping
> + * Run type: FULL
> + *
> + * SUBTEST: reads
> + *
> + * SUBTEST: writes
> + *
> + * SUBTEST: writes-after-reads
> + */
>  
>  IGT_TEST_DESCRIPTION("Test pwrite/pread consistency when touching partial"
>  		     " cachelines.");
> diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/i915/gem_tiled_pread_basic.c
> index 2b4cec6e7259..ddf9f0f56875 100644
> --- a/tests/i915/gem_tiled_pread_basic.c
> +++ b/tests/i915/gem_tiled_pread_basic.c
> @@ -48,6 +48,14 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem tiled pread basic
> + * Description: Test pread behavior on tiled objects with respect to the reported swizzling value.
> + * Feature: gtt, mapping
> + * Run type: BAT
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Test pread behavior on tiled objects with respect to the"
>  		     " reported swizzling value.");
> diff --git a/tests/i915/gem_tiled_pread_pwrite.c b/tests/i915/gem_tiled_pread_pwrite.c
> index 2d21dfb76a76..3331e61ad4d4 100644
> --- a/tests/i915/gem_tiled_pread_pwrite.c
> +++ b/tests/i915/gem_tiled_pread_pwrite.c
> @@ -58,6 +58,14 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem tiled pread pwrite
> + * Description: Test swizzling by testing pwrite does the inverse of pread.
> + * Feature: gtt, mapping
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Test swizzling by testing pwrite does the inverse of"
>  		     " pread.");
> diff --git a/tests/i915/gem_tiled_swapping.c b/tests/i915/gem_tiled_swapping.c
> index f4bdce738ebb..fb633ecabee3 100644
> --- a/tests/i915/gem_tiled_swapping.c
> +++ b/tests/i915/gem_tiled_swapping.c
> @@ -58,6 +58,16 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem tiled swapping
> + * Description: Exercise swizzle code for swapping.
> + * Feature: gtt, mapping
> + * Run type: FULL
> + *
> + * SUBTEST: non-threaded
> + *
> + * SUBTEST: threaded
> + */
>  
>  IGT_TEST_DESCRIPTION("Exercise swizzle code for swapping.");
>  
> diff --git a/tests/i915/gem_tiled_wb.c b/tests/i915/gem_tiled_wb.c
> index e9efbdf238c7..7f1afbc90b59 100644
> --- a/tests/i915/gem_tiled_wb.c
> +++ b/tests/i915/gem_tiled_wb.c
> @@ -45,6 +45,16 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem tiled wb
> + * Description:
> + *   This is a test of write-combining mmap's behavior on tiled objects with respect to the reported
> + *   swizzling value.
> + * Feature: caching, gtt
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("This is a test of write-combining mmap's behavior on"
>  		     " tiled objects with respect to the reported swizzling"
> diff --git a/tests/i915/gem_tiled_wc.c b/tests/i915/gem_tiled_wc.c
> index 1f245eb7d605..dc4e4d2d73ae 100644
> --- a/tests/i915/gem_tiled_wc.c
> +++ b/tests/i915/gem_tiled_wc.c
> @@ -45,6 +45,13 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem tiled wc
> + * Feature: caching, gtt
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  #define WIDTH 512
>  #define HEIGHT 512
> diff --git a/tests/i915/gem_tiling_max_stride.c b/tests/i915/gem_tiling_max_stride.c
> index 513d579d3381..6001f72be858 100644
> --- a/tests/i915/gem_tiling_max_stride.c
> +++ b/tests/i915/gem_tiling_max_stride.c
> @@ -39,6 +39,14 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem tiling max stride
> + * Description: Check that max fence stride works.
> + * Feature: gtt, mapping
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Check that max fence stride works.");
>  
> diff --git a/tests/i915/gem_unfence_active_buffers.c b/tests/i915/gem_unfence_active_buffers.c
> index a0a601de241d..1f25a81b16f6 100644
> --- a/tests/i915/gem_unfence_active_buffers.c
> +++ b/tests/i915/gem_unfence_active_buffers.c
> @@ -52,6 +52,14 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +/**
> + * TEST: gem unfence active buffers
> + * Description: Check for use-after-free in the fence stealing code.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Check for use-after-free in the fence stealing code.");
>  
> diff --git a/tests/i915/gem_unref_active_buffers.c b/tests/i915/gem_unref_active_buffers.c
> index 735c1472038a..90a63e8f9acf 100644
> --- a/tests/i915/gem_unref_active_buffers.c
> +++ b/tests/i915/gem_unref_active_buffers.c
> @@ -41,6 +41,14 @@
>  #include "igt.h"
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: gem unref active buffers
> + * Description: Test unreferencing of active buffers.
> + * Feature: cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Test unreferencing of active buffers.");
>  
> diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> index b00afc32c102..ad85c0d96c07 100644
> --- a/tests/i915/gem_userptr_blits.c
> +++ b/tests/i915/gem_userptr_blits.c
> @@ -67,6 +67,286 @@
>  
>  #include "eviction_common.c"
>  #include "i915/i915_blt.h"
> +/**
> + * TEST: gem userptr blits
> + * Run type: FULL
> + *
> + * SUBTEST: access-control
> + * Feature: userptr
> + *
> + * SUBTEST: coherency-sync
> + * Feature: userptr
> + *
> + * SUBTEST: coherency-unsync
> + * Feature: userptr
> + *
> + * SUBTEST: create-destroy-sync
> + * Feature: userptr
> + *
> + * SUBTEST: create-destroy-unsync
> + * Feature: userptr
> + *
> + * SUBTEST: dmabuf-sync
> + * Feature: prime, userptr
> + *
> + * SUBTEST: dmabuf-unsync
> + * Feature: prime, userptr
> + *
> + * SUBTEST: forbidden-operations
> + * Feature: userptr
> + *
> + * SUBTEST: forked-access
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-mempressure-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-mempressure-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-multifd-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-multifd-mempressure-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-multifd-mempressure-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-multifd-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-swapping-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-swapping-mempressure-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-swapping-mempressure-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-swapping-multifd-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-swapping-multifd-mempressure-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-swapping-multifd-mempressure-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-swapping-multifd-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-sync-swapping-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-mempressure-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-mempressure-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-multifd-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-multifd-mempressure-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-multifd-mempressure-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-multifd-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-swapping-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-swapping-mempressure-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-swapping-mempressure-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-swapping-multifd-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-swapping-multifd-mempressure-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-swapping-multifd-mempressure-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-swapping-multifd-normal
> + * Feature: userptr
> + *
> + * SUBTEST: forked-unsync-swapping-normal
> + * Feature: userptr
> + *
> + * SUBTEST: huge-split
> + * Feature: userptr
> + *
> + * SUBTEST: input-checking
> + * Feature: userptr
> + *
> + * SUBTEST: invalid-mmap-offset-unsync
> + * Description: Verify unsynchronized userptr on mmap-offset mappings fails
> + * Feature: userptr
> + *
> + * SUBTEST: invalid-null-pointer
> + * Feature: userptr
> + *
> + * SUBTEST: major-normal-sync
> + * Feature: userptr
> + *
> + * SUBTEST: major-sync-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: major-unsync-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: major-unsync-normal
> + * Feature: userptr
> + *
> + * SUBTEST: map-fixed-invalidate
> + * Description: Try to anger lockdep with MMU notifier still active after MAP_FIXED remap
> + * Feature: gtt, userptr
> + *
> + * SUBTEST: map-fixed-invalidate-busy
> + * Description: Try to anger lockdep with MMU notifier still active after MAP_FIXED remap
> + * Feature: gtt, userptr
> + *
> + * SUBTEST: map-fixed-invalidate-overlap
> + * Description: Try to anger lockdep with MMU notifier still active after MAP_FIXED remap
> + * Feature: gtt, userptr
> + *
> + * SUBTEST: map-fixed-invalidate-overlap-busy
> + * Description: Try to anger lockdep with MMU notifier still active after MAP_FIXED remap
> + * Feature: gtt, userptr
> + *
> + * SUBTEST: minor-normal-sync
> + * Feature: userptr
> + *
> + * SUBTEST: minor-sync-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: minor-unsync-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: minor-unsync-normal
> + * Feature: userptr
> + *
> + * SUBTEST: mlocked-normal-sync
> + * Feature: userptr
> + *
> + * SUBTEST: mlocked-sync-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: mlocked-unsync-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: mlocked-unsync-normal
> + * Feature: userptr
> + *
> + * SUBTEST: mmap-offset-banned
> + * Description: Verify mmap_offset to userptr is banned
> + * Feature: userptr
> + *
> + * SUBTEST: nohangcheck
> + * Feature: userptr
> + *
> + * SUBTEST: probe
> + * Feature: userptr
> + *
> + * SUBTEST: process-exit
> + * Feature: userptr
> + *
> + * SUBTEST: process-exit-busy
> + * Feature: userptr
> + *
> + * SUBTEST: readonly-pwrite-unsync
> + * Feature: userptr
> + *
> + * SUBTEST: readonly-unsync
> + * Feature: userptr
> + *
> + * SUBTEST: relocations
> + * Feature: userptr
> + *
> + * SUBTEST: sd-probe
> + * Feature: userptr
> + *
> + * SUBTEST: set-cache-level
> + * Feature: userptr
> + *
> + * SUBTEST: stress-mm
> + * Feature: userptr
> + *
> + * SUBTEST: stress-mm-invalidate-close
> + * Feature: userptr
> + *
> + * SUBTEST: stress-mm-invalidate-close-overlap
> + * Feature: userptr
> + *
> + * SUBTEST: stress-purge
> + * Feature: userptr
> + *
> + * SUBTEST: swapping-normal-sync
> + * Feature: userptr
> + *
> + * SUBTEST: swapping-sync-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: swapping-unsync-interruptible
> + * Feature: userptr
> + *
> + * SUBTEST: swapping-unsync-normal
> + * Feature: userptr
> + *
> + * SUBTEST: sync-overlap
> + * Feature: userptr
> + *
> + * SUBTEST: sync-unmap
> + * Feature: userptr
> + *
> + * SUBTEST: sync-unmap-after-close
> + * Feature: userptr
> + *
> + * SUBTEST: sync-unmap-cycles
> + * Feature: userptr
> + *
> + * SUBTEST: unsync-overlap
> + * Feature: userptr
> + *
> + * SUBTEST: unsync-unmap
> + * Feature: userptr
> + *
> + * SUBTEST: unsync-unmap-after-close
> + * Feature: userptr
> + *
> + * SUBTEST: unsync-unmap-cycles
> + * Feature: userptr
> + *
> + * SUBTEST: usage-restrictions
> + * Feature: userptr
> + *
> + * SUBTEST: userfault
> + * Feature: userptr
> + *
> + * SUBTEST: vma-merge
> + * Feature: userptr
> + */
>  
>  #ifndef PAGE_SIZE
>  #define PAGE_SIZE 4096
> diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
> index f47d8c55694d..9f36e405bff5 100644
> --- a/tests/i915/gem_vm_create.c
> +++ b/tests/i915/gem_vm_create.c
> @@ -27,6 +27,25 @@
>  #include "igt.h"
>  #include "igt_rand.h"
>  #include "igt_dummyload.h"
> +/**
> + * TEST: gem vm create
> + * Run type: FULL
> + *
> + * SUBTEST: create-ext
> + * Feature: mapping
> + *
> + * SUBTEST: execbuf
> + * Feature: cmd_submission, mapping
> + *
> + * SUBTEST: invalid-create
> + * Feature: mapping
> + *
> + * SUBTEST: invalid-destroy
> + * Feature: mapping
> + *
> + * SUBTEST: isolation
> + * Feature: context, mapping
> + */
>  
>  static int vm_create_ioctl(int i915, struct drm_i915_gem_vm_control *ctl)
>  {
> diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
> index 27d084afacdd..874ccd87eee3 100644
> --- a/tests/i915/gem_wait.c
> +++ b/tests/i915/gem_wait.c
> @@ -31,6 +31,55 @@
>  #include "i915/gem_create.h"
>  #include "igt.h"
>  #include "igt_vgem.h"
> +/**
> + * TEST: gem wait
> + * Description: Tests the GEM_WAIT ioctl
> + * Feature: synchronization
> + *
> + * SUBTEST: await
> + * Description: Verify GEM_WAIT functionality in await mode.
> + * Run type: FULL
> + *
> + * SUBTEST: busy
> + * Description: Verify GEM_WAIT functionality in busy mode.
> + * Run type: FULL
> + *
> + * SUBTEST: hang-busy
> + * Description: Verify GEM_WAIT functionality in busy mode, when hang is allowed.
> + * Run type: FULL
> + *
> + * SUBTEST: hang-busy-write
> + * Description: Verify GEM_WAIT functionality in busy-write mode, when hang is allowed.
> + * Run type: FULL
> + *
> + * SUBTEST: hang-wait
> + * Description: Verify GEM_WAIT functionality in wait mode, when hang is allowed.
> + * Run type: FULL
> + *
> + * SUBTEST: hang-wait-write
> + * Description: Verify GEM_WAIT functionality in wait-write mode, when hang is allowed.
> + * Run type: FULL
> + *
> + * SUBTEST: invalid-buf
> + * Description: Verify that GEM_WAIT called with invalid buffer object will fail.
> + * Run type: FULL
> + *
> + * SUBTEST: invalid-flags
> + * Description: Verify that GEM_WAIT called with invalid flag will fail.
> + * Run type: FULL
> + *
> + * SUBTEST: wait
> + * Description: Verify GEM_WAIT functionality in wait mode.
> + * Run type: FULL
> + *
> + * SUBTEST: write-busy
> + * Description: Verify GEM_WAIT functionality in write-busy mode.
> + * Run type: FULL
> + *
> + * SUBTEST: write-wait
> + * Description: Verify GEM_WAIT functionality in write-wait mode.
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests the GEM_WAIT ioctl");
>  
> diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
> index 27f3a2d7fd5c..df75d933c798 100644
> --- a/tests/i915/gem_watchdog.c
> +++ b/tests/i915/gem_watchdog.c
> @@ -35,6 +35,17 @@
>  #include "igt.h"
>  #include "igt_params.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gem watchdog
> + * Feature: gem_core
> + * Run type: FULL
> + *
> + * SUBTEST: default-physical
> + *
> + * SUBTEST: default-virtual
> + *
> + * SUBTEST: far-fence
> + */
>  
>  #define EWATCHDOG EINTR
>  
> diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
> index 7d1199625416..fd3b83b5a7e6 100644
> --- a/tests/i915/gem_workarounds.c
> +++ b/tests/i915/gem_workarounds.c
> @@ -32,6 +32,46 @@
>  #include "igt.h"
>  #include "igt_device.h"
>  #include "igt_types.h"
> +/**
> + * TEST: gem workarounds
> + * Run type: FULL
> + *
> + * SUBTEST: basic-read
> + * Feature: workarounds
> + *
> + * SUBTEST: basic-read-context
> + * Feature: workarounds
> + *
> + * SUBTEST: basic-read-fd
> + * Feature: workarounds
> + *
> + * SUBTEST: hibernate-resume
> + * Feature: hibernate, workarounds
> + *
> + * SUBTEST: hibernate-resume-context
> + * Feature: hibernate, workarounds
> + *
> + * SUBTEST: hibernate-resume-fd
> + * Feature: hibernate, workarounds
> + *
> + * SUBTEST: reset
> + * Feature: workarounds
> + *
> + * SUBTEST: reset-context
> + * Feature: workarounds
> + *
> + * SUBTEST: reset-fd
> + * Feature: workarounds
> + *
> + * SUBTEST: suspend-resume
> + * Feature: suspend, workarounds
> + *
> + * SUBTEST: suspend-resume-context
> + * Feature: suspend, workarounds
> + *
> + * SUBTEST: suspend-resume-fd
> + * Feature: suspend, workarounds
> + */
>  
>  #define PAGE_SIZE 4096
>  #define PAGE_ALIGN(x) ALIGN(x, PAGE_SIZE)
> diff --git a/tests/i915/gen3_mixed_blits.c b/tests/i915/gen3_mixed_blits.c
> index 242b99855d27..3c6fb141a9ee 100644
> --- a/tests/i915/gen3_mixed_blits.c
> +++ b/tests/i915/gen3_mixed_blits.c
> @@ -48,6 +48,13 @@
>  #include "i915/gem_create.h"
>  #include "i915_reg.h"
>  #include "igt.h"
> +/**
> + * TEST: gen3 mixed blits
> + * Feature: obsolete
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  #define WIDTH (512)
>  #define HEIGHT (512)
> diff --git a/tests/i915/gen3_render_linear_blits.c b/tests/i915/gen3_render_linear_blits.c
> index 9c6b4c7019a5..7dfb2709ad37 100644
> --- a/tests/i915/gen3_render_linear_blits.c
> +++ b/tests/i915/gen3_render_linear_blits.c
> @@ -47,6 +47,13 @@
>  #include "i915/gem_create.h"
>  #include "i915_reg.h"
>  #include "igt.h"
> +/**
> + * TEST: gen3 render linear blits
> + * Feature: obsolete
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  #define WIDTH 512
>  #define HEIGHT 512
> diff --git a/tests/i915/gen3_render_mixed_blits.c b/tests/i915/gen3_render_mixed_blits.c
> index 1393055f31a2..f8e1bdfbda12 100644
> --- a/tests/i915/gen3_render_mixed_blits.c
> +++ b/tests/i915/gen3_render_mixed_blits.c
> @@ -48,6 +48,13 @@
>  #include "i915/gem_create.h"
>  #include "i915_reg.h"
>  #include "igt.h"
> +/**
> + * TEST: gen3 render mixed blits
> + * Feature: obsolete
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  #define WIDTH 512
>  #define HEIGHT 512
> diff --git a/tests/i915/gen3_render_tiledx_blits.c b/tests/i915/gen3_render_tiledx_blits.c
> index ece86749358c..1abe5adbc553 100644
> --- a/tests/i915/gen3_render_tiledx_blits.c
> +++ b/tests/i915/gen3_render_tiledx_blits.c
> @@ -48,6 +48,13 @@
>  #include "i915/gem_create.h"
>  #include "i915_reg.h"
>  #include "igt.h"
> +/**
> + * TEST: gen3 render tiledx blits
> + * Feature: obsolete
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  #define WIDTH 512
>  #define HEIGHT 512
> diff --git a/tests/i915/gen3_render_tiledy_blits.c b/tests/i915/gen3_render_tiledy_blits.c
> index 30097be66744..b1f4b628a37c 100644
> --- a/tests/i915/gen3_render_tiledy_blits.c
> +++ b/tests/i915/gen3_render_tiledy_blits.c
> @@ -48,6 +48,13 @@
>  #include "i915/gem_create.h"
>  #include "i915_reg.h"
>  #include "igt.h"
> +/**
> + * TEST: gen3 render tiledy blits
> + * Feature: obsolete
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  #define WIDTH 512
>  #define HEIGHT 512
> diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
> index e9751ea73f44..81a5bb14f020 100644
> --- a/tests/i915/gen7_exec_parse.c
> +++ b/tests/i915/gen7_exec_parse.c
> @@ -34,6 +34,37 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gen7 exec parse
> + * Feature: cmd_submission, command_parser
> + * Run type: FULL
> + *
> + * SUBTEST: basic-allocation
> + *
> + * SUBTEST: basic-allowed
> + *
> + * SUBTEST: basic-offset
> + *
> + * SUBTEST: basic-rejected
> + *
> + * SUBTEST: batch-without-end
> + *
> + * SUBTEST: bitmasks
> + *
> + * SUBTEST: chained-batch
> + *
> + * SUBTEST: cmd-crossing-page
> + *
> + * SUBTEST: load-register-reg
> + *
> + * SUBTEST: oacontrol-tracking
> + *
> + * SUBTEST: test-lri-OACONTROL
> + *
> + * SUBTEST: test-lri-OASTATUS2
> + *
> + * SUBTEST: test-lri-SO_WRITE_OFFSET_0
> + */
>  
>  #define DERRMR 0x44050
>  #define OASTATUS2 0x2368
> diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
> index 26b1517053a0..a927bfacaf33 100644
> --- a/tests/i915/gen9_exec_parse.c
> +++ b/tests/i915/gen9_exec_parse.c
> @@ -33,6 +33,53 @@
>  #include "i915/gem_submission.h"
>  #include "igt.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: gen9 exec parse
> + * Feature: blitter, command_parser
> + * Run type: FULL
> + *
> + * SUBTEST: allowed-all
> + *
> + * SUBTEST: allowed-single
> + *
> + * SUBTEST: basic-rejected
> + *
> + * SUBTEST: basic-rejected-ctx-param
> + *
> + * SUBTEST: batch-invalid-length
> + *
> + * SUBTEST: batch-without-end
> + *
> + * SUBTEST: batch-zero-length
> + *
> + * SUBTEST: bb-chained
> + *
> + * SUBTEST: bb-large
> + *
> + * SUBTEST: bb-oversize
> + *
> + * SUBTEST: bb-secure
> + *
> + * SUBTEST: bb-start-cmd
> + *
> + * SUBTEST: bb-start-far
> + *
> + * SUBTEST: bb-start-out
> + *
> + * SUBTEST: bb-start-param
> + *
> + * SUBTEST: cmd-crossing-page
> + *
> + * SUBTEST: secure-batches
> + *
> + * SUBTEST: shadow-peek
> + *
> + * SUBTEST: unaligned-access
> + *
> + * SUBTEST: unaligned-jump
> + *
> + * SUBTEST: valid-registers
> + */
>  
>  /* To help craft commands known to be invalid across all engines */
>  #define INSTR_CLIENT_SHIFT	29
> diff --git a/tests/i915/i915_fb_tiling.c b/tests/i915/i915_fb_tiling.c
> index cafa5233c9d0..586950266708 100644
> --- a/tests/i915/i915_fb_tiling.c
> +++ b/tests/i915/i915_fb_tiling.c
> @@ -23,6 +23,14 @@
>   */
>  
>  #include "igt.h"
> +/**
> + * TEST: i915 fb tiling
> + * Description: Object tiling must be fixed after framebuffer creation.
> + * Feature: mapping
> + * Run type: FULL
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Object tiling must be fixed after framebuffer creation.");
>  
> diff --git a/tests/i915/i915_getparams_basic.c b/tests/i915/i915_getparams_basic.c
> index 5422d585ffb6..e026aad565ff 100644
> --- a/tests/i915/i915_getparams_basic.c
> +++ b/tests/i915/i915_getparams_basic.c
> @@ -30,6 +30,18 @@
>  #include <errno.h>
>  #include <xf86drm.h>
>  #include <i915_drm.h>
> +/**
> + * TEST: i915 getparams basic
> + * Description: Tests the export of parameters via DRM_IOCTL_I915_GETPARAM
> + * Feature: gem_core
> + * Run type: BAT
> + *
> + * SUBTEST: basic-eu-total
> + * Description: Examine the export of EU_TOTAL parameter
> + *
> + * SUBTEST: basic-subslice-total
> + * Description: Examine the export of SUBSLICE_TOTAL parameter
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests the export of parameters via DRM_IOCTL_I915_GETPARAM\n");
>  
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index dd396c4e9709..ef45b25adacd 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -40,6 +40,47 @@
>  #include "igt_sysfs.h"
>  #include "igt_debugfs.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: i915 hangman
> + * Description: Tests for hang detection and recovery
> + * Feature: reset
> + *
> + * SUBTEST: detector
> + * Description: Check that hang detector works
> + * Run type: FULL
> + *
> + * SUBTEST: engine-engine-error
> + * Description: Per engine hang recovery (invalid CS, engine reset)
> + * Run type: FULL
> + *
> + * SUBTEST: engine-engine-hang
> + * Description: Per engine hang recovery (spin, engine reset)
> + * Run type: FULL
> + *
> + * SUBTEST: engine-error-state-capture
> + * Description: Per engine error capture (engine reset)
> + * Run type: FULL
> + *
> + * SUBTEST: error-state-basic
> + * Description: Basic error capture
> + * Run type: BAT
> + *
> + * SUBTEST: gt-engine-error
> + * Description: Per engine hang recovery (invalid CS, GT reset)
> + * Run type: FULL
> + *
> + * SUBTEST: gt-engine-hang
> + * Description: Per engine hang recovery (spin, GT reset)
> + * Run type: FULL
> + *
> + * SUBTEST: gt-error-state-capture
> + * Description: Per engine error capture (GT reset)
> + * Run type: FULL
> + *
> + * SUBTEST: hangcheck-unterminated
> + * Description: Check that executing unintialised memory causes a hang
> + * Run type: FULL
> + */
>  
>  #ifndef I915_PARAM_CMD_PARSER_VERSION
>  #define I915_PARAM_CMD_PARSER_VERSION       28
> diff --git a/tests/i915/i915_hwmon.c b/tests/i915/i915_hwmon.c
> index 6d9937e99dc8..6d1334172c40 100644
> --- a/tests/i915/i915_hwmon.c
> +++ b/tests/i915/i915_hwmon.c
> @@ -8,6 +8,18 @@
>  #include "igt.h"
>  #include "igt_hwmon.h"
>  #include "igt_sysfs.h"
> +/**
> + * TEST: i915 hwmon
> + * Description: Tests for i915 hwmon
> + * Feature: hwmon
> + * Run type: FULL
> + *
> + * SUBTEST: hwmon-read
> + * Description: Verify we can read all hwmon attributes
> + *
> + * SUBTEST: hwmon-write
> + * Description: Verify writable hwmon attributes
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests for i915 hwmon");
>  
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> index 725687dab4f2..ae4e01ef18bc 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -23,6 +23,36 @@
>  #include "igt.h"
>  #include <dirent.h>
>  #include <sys/utsname.h>
> +/**
> + * TEST: i915 module load
> + * Description: Tests the i915 module loading.
> + *
> + * SUBTEST: load
> + * Description: Check if i915 and friends are not yet loaded, then load them.
> + * Feature: core
> + * Run type: BAT
> + *
> + * SUBTEST: reload
> + * Description: Verify the basic functionality of i915 driver after it's reloaded.
> + * Feature: core, sriov-core
> + * Run type: BAT
> + *
> + * SUBTEST: reload-no-display
> + * Description: Verify that i915 driver can be successfully loaded with disabled display.
> + * Feature: core, sriov-core
> + * Run type: FULL
> + *
> + * SUBTEST: reload-with-fault-injection
> + * Description: Verify that i915 driver can be successfully reloaded at least once with fault injection.
> + * Feature: core, sriov-core
> + * Run type: FULL
> + *
> + * SUBTEST: resize-bar
> + * Description: Check whether lmem bar size can be resized to only supported sizes.
> + * Feature: core
> + * Run type: FULL
> + */
> +
>  #ifdef __linux__
>  #include <linux/limits.h>
>  #endif
> diff --git a/tests/i915/i915_pciid.c b/tests/i915/i915_pciid.c
> index 377eec58cf13..ae3d2a09d208 100644
> --- a/tests/i915/i915_pciid.c
> +++ b/tests/i915/i915_pciid.c
> @@ -28,6 +28,14 @@
>  #include "drmtest.h"
>  #include "i915_drm.h"
>  #include "intel_chipset.h"
> +/**
> + * TEST: i915 pciid
> + * Description: Check that igt/i915 know about this PCI-ID
> + * Feature: core
> + * Run type: BAT
> + *
> + * SUBTEST:
> + */
>  
>  IGT_TEST_DESCRIPTION("Check that igt/i915 know about this PCI-ID");
>  
> diff --git a/tests/i915/i915_pipe_stress.c b/tests/i915/i915_pipe_stress.c
> index c06bc65d2c73..9ceb056a091b 100644
> --- a/tests/i915/i915_pipe_stress.c
> +++ b/tests/i915/i915_pipe_stress.c
> @@ -18,6 +18,23 @@
>  #include <pthread.h>
>  #include <semaphore.h>
>  #include "i915/gem.h"
> +/**
> + * TEST: i915 pipe stress
> + * Description:
> + *   Stress test how gpu and cpu behaves if maximum amount of planes, cpu and gpu utilization is
> + *   achieved in order to reveal possible bandwidth/watermark and similar problems.
> + * Run type: FULL
> + *
> + * SUBTEST: stress-xrgb8888-untiled
> + * Description:
> + *   Start pipe stress test, utilizing cpu and gpu simultaneously with maximum amount of planes
> + *   and resolution.
> + *
> + * SUBTEST: stress-xrgb8888-ytiled
> + * Description:
> + *   Start pipe stress test, utilizing cpu and gpu simultaneously with maximum amount of planes
> + *   and resolution.
> + */
>  
>  IGT_TEST_DESCRIPTION("Stress test how gpu and cpu behaves if maximum amount of planes, "
>  		     "cpu and gpu utilization is achieved in order to reveal possible "
> diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
> index 829606622d67..b633387bcfd9 100644
> --- a/tests/i915/i915_pm_backlight.c
> +++ b/tests/i915/i915_pm_backlight.c
> @@ -36,6 +36,31 @@
>  #include <time.h>
>  #include "igt_device.h"
>  #include "igt_device_scan.h"
> +/**
> + * TEST: i915 pm backlight
> + * Description: Basic backlight sysfs test
> + * Feature: backlight
> + *
> + * SUBTEST: bad-brightness
> + * Description: test the bad brightness.
> + * Run type: FULL
> + *
> + * SUBTEST: basic-brightness
> + * Description: test the basic brightness.
> + * Run type: BAT
> + *
> + * SUBTEST: fade
> + * Description: test basic fade.
> + * Run type: FULL
> + *
> + * SUBTEST: fade-with-dpms
> + * Description: test the fade with DPMS.
> + * Run type: FULL
> + *
> + * SUBTEST: fade-with-suspend
> + * Description: test the fade with suspend.
> + * Run type: FULL
> + */
>  
>  struct context {
>  	int max;
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 6f08cb3fc44e..2bb07ba8b25a 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -36,6 +36,47 @@
>  #include "limits.h"
>  #include "time.h"
>  #include "igt_pm.h"
> +/**
> + * TEST: i915 pm dc
> + * Description: Tests to validate display power DC states.
> + * Run type: FULL
> + *
> + * SUBTEST: dc3co-vpb-simulation
> + * Description:
> + *   In this test we make sure that system enters DC3CO when PSR2 is active and system is in SLEEP
> + *   state
> + * Feature: dc3co, pm_dc
> + *
> + * SUBTEST: dc5-dpms
> + * Description:
> + *   This test validates display engine entry to DC5 state while all connectors's DPMS property
> + *   set to OFF
> + * Feature: pm_dc
> + *
> + * SUBTEST: dc5-dpms-negative
> + * Description:
> + *   This test validates negative scenario of DC5 display engine entry to DC5 state while all
> + *   connectors's DPMS property set to ON
> + * Feature: pm_dc
> + *
> + * SUBTEST: dc5-psr
> + * Description: This test validates display engine entry to DC5 state while PSR is active
> + * Feature: pm_dc
> + *
> + * SUBTEST: dc6-dpms
> + * Description:
> + *   This test validates display engine entry to DC6 state while all connectors's DPMS property
> + *   set to OFF
> + * Feature: pm_dc
> + *
> + * SUBTEST: dc6-psr
> + * Description: This test validates display engine entry to DC6 state while PSR is active
> + * Feature: pm_dc
> + *
> + * SUBTEST: dc9-dpms
> + * Description: This test validates display engine entry to DC9 state
> + * Feature: pm_dc
> + */
>  
>  /* DC State Flags */
>  #define CHECK_DC5	(1 << 0)
> diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
> index 662d514a4ef6..9005cd220a49 100644
> --- a/tests/i915/i915_pm_freq_api.c
> +++ b/tests/i915/i915_pm_freq_api.c
> @@ -8,6 +8,17 @@
>  #include "i915/gem.h"
>  #include "igt_sysfs.h"
>  #include "igt.h"
> +/**
> + * TEST: i915 pm freq api
> + * Description: Test SLPC freq API
> + * Run type: FULL
> + *
> + * SUBTEST: freq-basic-api
> + * Description: Test basic API for controlling min/max GT frequency
> + *
> + * SUBTEST: freq-reset
> + * Description: Test basic freq API works after a reset
> + */
>  
>  IGT_TEST_DESCRIPTION("Test SLPC freq API");
>  /*
> diff --git a/tests/i915/i915_pm_freq_mult.c b/tests/i915/i915_pm_freq_mult.c
> index 894ae294c1f9..d75ec3f9e8de 100644
> --- a/tests/i915/i915_pm_freq_mult.c
> +++ b/tests/i915/i915_pm_freq_mult.c
> @@ -10,6 +10,16 @@
>  #include "i915/gem.h"
>  #include "igt.h"
>  #include "igt_sysfs.h"
> +/**
> + * TEST: i915 pm freq mult
> + * Description:
> + *   Tests for sysfs controls (or multipliers) for IP blocks which run at frequencies different
> + *   from the main GT frequency.
> + * Run type: FULL
> + *
> + * SUBTEST: media-freq
> + * Description: Tests for media frequency factor sysfs
> + */
>  
>  IGT_TEST_DESCRIPTION(
>  	"Tests for sysfs controls (or multipliers) for IP blocks which run at "
> diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
> index 3ad8b2603f90..cb01a6d9e1f6 100644
> --- a/tests/i915/i915_pm_lpsp.c
> +++ b/tests/i915/i915_pm_lpsp.c
> @@ -32,6 +32,18 @@
>  #include <sys/stat.h>
>  #include <fcntl.h>
>  #include <unistd.h>
> +/**
> + * TEST: i915 pm lpsp
> + * Description: These tests validates display Low Power Single Pipe configurations
> + * Feature: pm_lpsp
> + * Run type: FULL
> + *
> + * SUBTEST: kms-lpsp
> + * Description: This test validates lpsp on all connected outputs on low power PIPE_A
> + *
> + * SUBTEST: screens-disabled
> + * Description: This test validates lpsp while all crtc are disabled
> + */
>  
>  #define MAX_SINK_LPSP_INFO_BUF_LEN	4096
>  
> diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
> index 3554f5d7749a..ce81e668a2b1 100644
> --- a/tests/i915/i915_pm_rc6_residency.c
> +++ b/tests/i915/i915_pm_rc6_residency.c
> @@ -40,6 +40,22 @@
>  #include "igt_power.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: i915 pm rc6 residency
> + * Run type: FULL
> + *
> + * SUBTEST: media-rc6-accuracy
> + * Feature: pm_rc6
> + *
> + * SUBTEST: rc6-accuracy
> + * Feature: GuCRC, pm_rc6
> + *
> + * SUBTEST: rc6-fence
> + * Feature: GuCRC, pm_rc6
> + *
> + * SUBTEST: rc6-idle
> + * Feature: GuCRC, pm_rc6
> + */
>  
>  #define SLEEP_DURATION 3 /* in seconds */
>  
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index 9a6408dd3796..d9b4cbbfe615 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -40,6 +40,191 @@
>  #include <sys/mman.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>
> +/**
> + * TEST: i915 pm rpm
> + *
> + * SUBTEST: basic-pci-d3-state
> + * Feature: pm_rpm
> + * Run type: BAT
> + *
> + * SUBTEST: basic-rte
> + * Feature: pm_rpm
> + * Run type: BAT
> + *
> + * SUBTEST: cursor
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: cursor-dpms
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: debugfs-forcewake-user
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: debugfs-read
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: dpms-lpsp
> + * Feature: dpms, pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: dpms-mode-unset-lpsp
> + * Feature: dpms, pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: dpms-mode-unset-non-lpsp
> + * Feature: dpms, non-lpsp, pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: dpms-non-lpsp
> + * Feature: dpms, non-lpsp, pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: drm-resources-equal
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: fences
> + * Feature: gtt, pm_rpm, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: fences-dpms
> + * Feature: gtt, pm_rpm, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: gem-evict-pwrite
> + * Feature: gtt, pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: gem-execbuf
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: gem-execbuf-stress
> + * Description: Validate execbuf submission while exercising rpm suspend/resume cycles.
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: gem-execbuf-stress-pc8
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: gem-idle
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: gem-mmap-type
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: gem-pread
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: i2c
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-planes
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: legacy-planes-dpms
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: modeset-lpsp
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: modeset-lpsp-stress
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: modeset-lpsp-stress-no-wait
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: modeset-non-lpsp
> + * Feature: non-lpsp, pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: modeset-non-lpsp-stress
> + * Feature: non-lpsp, pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: modeset-non-lpsp-stress-no-wait
> + * Feature: non-lpsp, pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: modeset-pc8-residency-stress
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: modeset-stress-extra-wait
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: module-reload
> + * Feature: pm_rpm
> + * Run type: BAT
> + *
> + * SUBTEST: pc8-residency
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: pm-caching
> + * Feature: gtt, pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: pm-tiling
> + * Feature: gtt, pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: reg-read-ioctl
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: sysfs-read
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: system-hibernate
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: system-hibernate-devices
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: system-suspend
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: system-suspend-devices
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: system-suspend-execbuf
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: system-suspend-modeset
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: universal-planes
> + * Feature: pm_rpm
> + * Run type: FULL
> + *
> + * SUBTEST: universal-planes-dpms
> + * Feature: pm_rpm
> + * Run type: FULL
> + */
> +
>  #if defined(__linux__)
>  #include <linux/i2c.h>
>  #include <linux/i2c-dev.h>
> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
> index d4ee2d58abf2..050d68a16559 100644
> --- a/tests/i915/i915_pm_rps.c
> +++ b/tests/i915/i915_pm_rps.c
> @@ -42,6 +42,40 @@
>  #include "igt_dummyload.h"
>  #include "igt_perf.h"
>  #include "igt_sysfs.h"
> +/**
> + * TEST: i915 pm rps
> + * Description: Render P-States tests - verify GPU frequency changes
> + *
> + * SUBTEST: basic-api
> + * Feature: pm_rps
> + * Run type: BAT
> + *
> + * SUBTEST: engine-order
> + * Description: Check if context reuse does not affect waitboosting
> + * Feature: pm_rps
> + * Run type: FULL
> + *
> + * SUBTEST: fence-order
> + * Description: Check if the order of fences does not affect waitboosting
> + * Feature: pm_rps, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: min-max-config-idle
> + * Feature: pm_rps
> + * Run type: FULL
> + *
> + * SUBTEST: min-max-config-loaded
> + * Feature: pm_rps
> + * Run type: FULL
> + *
> + * SUBTEST: reset
> + * Feature: pm_rps
> + * Run type: FULL
> + *
> + * SUBTEST: waitboost
> + * Feature: pm_rps
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Render P-States tests - verify GPU frequency changes");
>  
> diff --git a/tests/i915/i915_pm_sseu.c b/tests/i915/i915_pm_sseu.c
> index 1b428c9ba7fd..39eecb8fecb2 100644
> --- a/tests/i915/i915_pm_sseu.c
> +++ b/tests/i915/i915_pm_sseu.c
> @@ -35,6 +35,14 @@
>  #include "i915/gem.h"
>  #include "igt.h"
>  #include "intel_bufops.h"
> +/**
> + * TEST: i915 pm sseu
> + * Description: Tests slice/subslice/EU power gating functionality.
> + * Feature: pm_sseu
> + * Run type: FULL
> + *
> + * SUBTEST: full-enable
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests slice/subslice/EU power gating functionality.\n");
>  
> diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
> index 51b412e3a6a4..383c212d2807 100644
> --- a/tests/i915/i915_power.c
> +++ b/tests/i915/i915_power.c
> @@ -7,6 +7,15 @@
>  #include "i915/gem.h"
>  #include "igt_power.h"
>  #include "igt_sysfs.h"
> +/**
> + * TEST: i915 power
> + * Description: i915 power measurement tests
> + * Feature: hwmon
> + * Run type: FULL
> + *
> + * SUBTEST: sanity
> + * Description: Sanity check gpu power measurement
> + */
>  
>  IGT_TEST_DESCRIPTION("i915 power measurement tests");
>  
> diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
> index e725e04e46c2..10c6d43fa7fc 100644
> --- a/tests/i915/i915_query.c
> +++ b/tests/i915/i915_query.c
> @@ -27,6 +27,69 @@
>  #include "i915/gem_create.h"
>  
>  #include <limits.h>
> +/**
> + * TEST: i915 query
> + * Description: Testing the i915 query uAPI.
> + * Run type: FULL
> + *
> + * SUBTEST: engine-info
> + * Description: Positive tests for DRM_I915_QUERY_ENGINE_INFO
> + * Feature: gem_core
> + *
> + * SUBTEST: engine-info-invalid
> + * Description: Negative tests for DRM_I915_QUERY_ENGINE_INFO
> + * Feature: gem_core
> + *
> + * SUBTEST: hwconfig_table
> + * Description: Test DRM_I915_QUERY_HWCONFIG_BLOB query
> + * Feature: gem_core
> + *
> + * SUBTEST: query-garbage
> + * Description: Test response to an invalid query call
> + * Feature: gem_core
> + *
> + * SUBTEST: query-regions-garbage-items
> + * Description: Dodgy returned data tests for DRM_I915_QUERY_MEMORY_REGIONS
> + * Feature: gem_core
> + *
> + * SUBTEST: query-regions-sanity-check
> + * Description: Basic tests for DRM_I915_QUERY_MEMORY_REGIONS
> + * Feature: gem_core
> + *
> + * SUBTEST: query-regions-unallocated
> + * Description: Sanity check the region unallocated tracking
> + * Feature: gem_core
> + *
> + * SUBTEST: query-topology-coherent-slice-mask
> + * Description: Compare new DRM_I915_QUERY_TOPOLOGY_INFO query with legacy (sub)slice getparams
> + * Feature: gem_core
> + *
> + * SUBTEST: query-topology-garbage-items
> + * Description: Test response to invalid DRM_I915_QUERY_TOPOLOGY_INFO query
> + * Feature: gem_core
> + *
> + * SUBTEST: query-topology-kernel-writes
> + * Description: Guardband test for DRM_I915_QUERY_TOPOLOGY_INFO query
> + * Feature: gem_core
> + *
> + * SUBTEST: query-topology-known-pci-ids
> + * Description:
> + *   Verify DRM_I915_QUERY_TOPOLOGY_INFO query against hardcoded known values for certain
> + *   platforms
> + * Feature: gem_core
> + *
> + * SUBTEST: query-topology-matches-eu-total
> + * Description: More compare new DRM_I915_QUERY_TOPOLOGY_INFO query with legacy (sub)slice getparams
> + * Feature: gem_core
> + *
> + * SUBTEST: query-topology-unsupported
> + * Description: Verify DRM_I915_QUERY_TOPOLOGY_INFO query fails when it is not supported
> + * Feature: gem_core, no-query-topology
> + *
> + * SUBTEST: test-query-geometry-subslices
> + * Description: Test DRM_I915_QUERY_GEOMETRY_SUBSLICES query
> + * Feature: gem_core
> + */
>  
>  IGT_TEST_DESCRIPTION("Testing the i915 query uAPI.");
>  
> diff --git a/tests/i915/i915_selftest.c b/tests/i915/i915_selftest.c
> index abc8c9c795d3..8863274405ba 100644
> --- a/tests/i915/i915_selftest.c
> +++ b/tests/i915/i915_selftest.c
> @@ -23,6 +23,22 @@
>  
>  #include "igt.h"
>  #include "igt_kmod.h"
> +/**
> + * TEST: i915 selftest
> + * Description: Basic unit tests for i915.ko
> + *
> + * SUBTEST: live
> + * Feature: gem_core
> + * Run type: BAT
> + *
> + * SUBTEST: mock
> + * Feature: gem_core
> + * Run type: FULL
> + *
> + * SUBTEST: perf
> + * Feature: oa
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic unit tests for i915.ko");
>  
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> index a9507964bc3a..1164d303e06c 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -44,6 +44,63 @@
>  #include "igt_kmod.h"
>  #include "igt_device.h"
>  #include "igt_device_scan.h"
> +/**
> + * TEST: i915 suspend
> + *
> + * SUBTEST: basic-s2idle-without-i915
> + * Description: Validate suspend-to-idle without i915 module
> + * Feature: suspend
> + * Run type: BAT
> + *
> + * SUBTEST: basic-s3-without-i915
> + * Description: Validate S3 without i915 module
> + * Feature: suspend
> + * Run type: BAT
> + *
> + * SUBTEST: debugfs-reader
> + * Feature: suspend
> + * Run type: FULL
> + *
> + * SUBTEST: debugfs-reader-hibernate
> + * Feature: suspend
> + * Run type: FULL
> + *
> + * SUBTEST: fence-restore-tiled2untiled
> + * Feature: gtt, suspend, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: fence-restore-tiled2untiled-hibernate
> + * Feature: gtt, suspend, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: fence-restore-untiled
> + * Feature: gtt, suspend, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: fence-restore-untiled-hibernate
> + * Feature: gtt, suspend, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: forcewake
> + * Feature: suspend
> + * Run type: FULL
> + *
> + * SUBTEST: forcewake-hibernate
> + * Feature: suspend
> + * Run type: FULL
> + *
> + * SUBTEST: shrink
> + * Feature: suspend
> + * Run type: FULL
> + *
> + * SUBTEST: sysfs-reader
> + * Feature: suspend
> + * Run type: FULL
> + *
> + * SUBTEST: sysfs-reader-hibernate
> + * Feature: suspend
> + * Run type: FULL
> + */
>  
>  #define OBJECT_SIZE (16*1024*1024)
>  
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 9ca4d34b6efb..40decc9cf396 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -45,6 +45,150 @@
>  #include "igt_perf.h"
>  #include "igt_sysfs.h"
>  #include "drm.h"
> +/**
> + * TEST: perf
> + * Description: Test the i915 perf metrics streaming interface
> + * Run type: FULL
> + *
> + * SUBTEST: blocking
> + * Description: Test blocking read with default hrtimer frequency
> + * Feature: oa
> + *
> + * SUBTEST: blocking-parameterized
> + * Description: Test blocking read with different hrtimer frequencies
> + * Feature: oa
> + *
> + * SUBTEST: buffer-fill
> + * Feature: oa
> + *
> + * SUBTEST: create-destroy-userspace-config
> + * Feature: oa
> + *
> + * SUBTEST: disabled-read-error
> + * Feature: oa
> + *
> + * SUBTEST: enable-disable
> + * Feature: oa
> + *
> + * SUBTEST: gen12-group-concurrent-oa-buffer-read
> + * Description: Verify concurrent reads from OA buffers in different groups
> + * Feature: oa
> + *
> + * SUBTEST: gen12-group-exclusive-stream-ctx-handle
> + * Description: Verify exclusivity of perf streams with ctx handle
> + * Feature: oa
> + *
> + * SUBTEST: gen12-group-exclusive-stream-sample-oa
> + * Description: Verify exclusivity of perf streams with sample oa option
> + * Feature: oa
> + *
> + * SUBTEST: gen12-invalid-class-instance
> + * Description: Verify invalid class instance
> + * Feature: oa
> + *
> + * SUBTEST: gen12-mi-rpc
> + * Description: Test MI REPORT PERF COUNT for Gen 12
> + * Feature: oa
> + *
> + * SUBTEST: gen12-oa-tlb-invalidate
> + * Description: Test OA TLB invalidate
> + * Feature: oa
> + *
> + * SUBTEST: gen12-unprivileged-single-ctx-counters
> + * Description: Measure performance for a specific context using OAR in Gen 12
> + * Feature: oa
> + *
> + * SUBTEST: gen8-unprivileged-single-ctx-counters
> + * Feature: oa, obsolete
> + *
> + * SUBTEST: global-sseu-config
> + * Description: Verify specifying SSEU opening parameters
> + * Feature: oa
> + *
> + * SUBTEST: global-sseu-config-invalid
> + * Description: Verify invalid SSEU opening parameters
> + * Feature: oa
> + *
> + * SUBTEST: i915-ref-count
> + * Feature: oa
> + *
> + * SUBTEST: invalid-create-userspace-config
> + * Feature: oa
> + *
> + * SUBTEST: invalid-oa-exponent
> + * Feature: oa
> + *
> + * SUBTEST: invalid-oa-format-id
> + * Feature: oa
> + *
> + * SUBTEST: invalid-oa-metric-set-id
> + * Feature: oa
> + *
> + * SUBTEST: invalid-open-flags
> + * Feature: oa
> + *
> + * SUBTEST: invalid-remove-userspace-config
> + * Feature: oa
> + *
> + * SUBTEST: low-oa-exponent-permissions
> + * Feature: oa
> + *
> + * SUBTEST: mi-rpc
> + * Feature: oa
> + *
> + * SUBTEST: missing-sample-flags
> + * Feature: oa
> + *
> + * SUBTEST: non-sampling-read-error
> + * Feature: oa
> + *
> + * SUBTEST: non-system-wide-paranoid
> + * Feature: oa
> + *
> + * SUBTEST: non-zero-reason
> + * Description: Test that reason field in OA reports is never 0 on Gen8+
> + * Feature: oa
> + *
> + * SUBTEST: oa-exponents
> + * Feature: oa
> + *
> + * SUBTEST: oa-formats
> + * Feature: oa
> + *
> + * SUBTEST: per-context-mode-unprivileged
> + * Feature: oa, obsolete
> + *
> + * SUBTEST: polling
> + * Description: Test polled read with default hrtimer frequency
> + * Feature: oa
> + *
> + * SUBTEST: polling-parameterized
> + * Description: Test polled read with different hrtimer frequencies
> + * Feature: oa
> + *
> + * SUBTEST: polling-small-buf
> + * Description: Test polled read with buffer size smaller than available data
> + * Feature: oa
> + *
> + * SUBTEST: rc6-disable
> + * Feature: oa
> + *
> + * SUBTEST: short-reads
> + * Feature: oa
> + *
> + * SUBTEST: stress-open-close
> + * Description: Stress tests opening & closing the i915-perf stream in a busy loop
> + * Feature: oa
> + *
> + * SUBTEST: sysctl-defaults
> + * Feature: oa
> + *
> + * SUBTEST: unprivileged-single-ctx-counters
> + * Feature: oa, obsolete
> + *
> + * SUBTEST: whitelisted-registers-userspace-config
> + * Feature: oa
> + */
>  
>  IGT_TEST_DESCRIPTION("Test the i915 perf metrics streaming interface");
>  
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index c5f083bbdbcc..bedadbe92797 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -49,6 +49,144 @@
>  #include "igt_pm.h"
>  #include "intel_ctx.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: perf pmu
> + * Description: Test the i915 pmu perf interface
> + * Run type: FULL
> + *
> + * SUBTEST: all-busy-check-all
> + * Feature: pmu
> + *
> + * SUBTEST: all-busy-idle-check-all
> + * Feature: pmu
> + *
> + * SUBTEST: busy
> + * Feature: pmu
> + *
> + * SUBTEST: busy-accuracy-2
> + * Feature: pmu
> + *
> + * SUBTEST: busy-accuracy-50
> + * Feature: pmu
> + *
> + * SUBTEST: busy-accuracy-98
> + * Feature: pmu
> + *
> + * SUBTEST: busy-check-all
> + * Feature: pmu
> + *
> + * SUBTEST: busy-double-start
> + * Feature: pmu
> + *
> + * SUBTEST: busy-hang
> + * Feature: pmu
> + *
> + * SUBTEST: busy-idle
> + * Feature: pmu
> + *
> + * SUBTEST: busy-idle-check-all
> + * Feature: pmu
> + *
> + * SUBTEST: busy-idle-no-semaphores
> + * Feature: pmu
> + *
> + * SUBTEST: busy-no-semaphores
> + * Feature: pmu
> + *
> + * SUBTEST: busy-start
> + * Feature: pmu
> + *
> + * SUBTEST: cpu-hotplug
> + * Feature: pmu
> + *
> + * SUBTEST: enable-race
> + * Feature: pmu
> + *
> + * SUBTEST: event-wait
> + * Feature: obsolete, pmu
> + *
> + * SUBTEST: faulting-read
> + * Feature: pmu
> + *
> + * SUBTEST: frequency
> + * Feature: pmu
> + *
> + * SUBTEST: frequency-idle
> + * Feature: pmu
> + *
> + * SUBTEST: gt-awake
> + * Feature: pmu
> + *
> + * SUBTEST: idle
> + * Feature: pmu
> + *
> + * SUBTEST: idle-no-semaphores
> + * Feature: pmu
> + *
> + * SUBTEST: init-busy
> + * Feature: pmu
> + *
> + * SUBTEST: init-sema
> + * Feature: pmu
> + *
> + * SUBTEST: init-wait
> + * Feature: pmu
> + *
> + * SUBTEST: interrupts
> + * Feature: pmu
> + *
> + * SUBTEST: interrupts-sync
> + * Feature: pmu
> + *
> + * SUBTEST: invalid-init
> + * Feature: pmu
> + *
> + * SUBTEST: invalid-open
> + * Feature: pmu
> + *
> + * SUBTEST: module-unload
> + * Feature: pmu
> + *
> + * SUBTEST: most-busy-check-all
> + * Feature: pmu
> + *
> + * SUBTEST: most-busy-idle-check-all
> + * Feature: pmu
> + *
> + * SUBTEST: multi-client
> + * Feature: pmu
> + *
> + * SUBTEST: pmu-read
> + * Description: Verify i915 pmu dir exists and read all events
> + * Feature: pmu
> + *
> + * SUBTEST: rc6
> + * Feature: pmu
> + *
> + * SUBTEST: rc6-runtime-pm
> + * Feature: pmu
> + *
> + * SUBTEST: rc6-runtime-pm-long
> + * Feature: pmu
> + *
> + * SUBTEST: rc6-suspend
> + * Feature: pmu
> + *
> + * SUBTEST: render-node-busy
> + * Feature: pmu
> + *
> + * SUBTEST: render-node-busy-idle
> + * Feature: pmu
> + *
> + * SUBTEST: semaphore-busy
> + * Feature: pmu
> + *
> + * SUBTEST: semaphore-wait
> + * Feature: pmu
> + *
> + * SUBTEST: semaphore-wait-idle
> + * Feature: pmu
> + */
>  
>  IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
>  
> diff --git a/tests/i915/sysfs_defaults.c b/tests/i915/sysfs_defaults.c
> index dda27a0af533..73478559fcda 100644
> --- a/tests/i915/sysfs_defaults.c
> +++ b/tests/i915/sysfs_defaults.c
> @@ -33,6 +33,13 @@
>  #include "i915/gem.h"
>  #include "i915/gem_engine_topology.h"
>  #include "igt_sysfs.h"
> +/**
> + * TEST: sysfs defaults
> + * Feature: gem_core
> + * Run type: FULL
> + *
> + * SUBTEST: readonly
> + */
>  
>  static bool may_write(int dir, const char *file)
>  {
> diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
> index 8a3dd3975832..2971acb32811 100644
> --- a/tests/i915/sysfs_heartbeat_interval.c
> +++ b/tests/i915/sysfs_heartbeat_interval.c
> @@ -41,6 +41,25 @@
>  #include "igt_dummyload.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: sysfs heartbeat interval
> + * Feature: SMI, cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST: idempotent
> + *
> + * SUBTEST: invalid
> + *
> + * SUBTEST: long
> + *
> + * SUBTEST: mixed
> + *
> + * SUBTEST: nopreempt
> + *
> + * SUBTEST: off
> + *
> + * SUBTEST: precise
> + */
>  
>  #define ATTR "heartbeat_interval_ms"
>  #define RESET_TIMEOUT 1000 /* milliseconds, long enough for error capture */
> diff --git a/tests/i915/sysfs_preempt_timeout.c b/tests/i915/sysfs_preempt_timeout.c
> index 5e0a7d96299f..e7c09949930c 100644
> --- a/tests/i915/sysfs_preempt_timeout.c
> +++ b/tests/i915/sysfs_preempt_timeout.c
> @@ -40,6 +40,19 @@
>  #include "igt_sysfs.h"
>  #include "intel_allocator.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: sysfs preempt timeout
> + * Feature: SMI, context
> + * Run type: FULL
> + *
> + * SUBTEST: idempotent
> + *
> + * SUBTEST: invalid
> + *
> + * SUBTEST: off
> + *
> + * SUBTEST: timeout
> + */
>  
>  #define ATTR "preempt_timeout_ms"
>  #define RESET_TIMEOUT 1000 /* milliseconds, at long enough for an error capture */
> diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
> index 92c4c5eae3d9..0f4905d8b613 100644
> --- a/tests/i915/sysfs_timeslice_duration.c
> +++ b/tests/i915/sysfs_timeslice_duration.c
> @@ -43,6 +43,21 @@
>  #include "intel_chipset.h"
>  #include "intel_reg.h"
>  #include "sw_sync.h"
> +/**
> + * TEST: sysfs timeslice duration
> + * Feature: SMI, cmd_submission
> + * Run type: FULL
> + *
> + * SUBTEST: duration
> + *
> + * SUBTEST: idempotent
> + *
> + * SUBTEST: invalid
> + *
> + * SUBTEST: off
> + *
> + * SUBTEST: timeout
> + */
>  
>  #define ATTR "timeslice_duration_ms"
>  #define RESET_TIMEOUT 1000 /* milliseconds, long enough for error capture */
> diff --git a/tests/prime_busy.c b/tests/prime_busy.c
> index 343020f13ea3..4f7dba7d0e3c 100644
> --- a/tests/prime_busy.c
> +++ b/tests/prime_busy.c
> @@ -26,6 +26,24 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +/**
> + * TEST: prime busy
> + * Description: Basic check of polling for prime fences.
> + * Feature: prime
> + * Run type: FULL
> + *
> + * SUBTEST: after
> + *
> + * SUBTEST: after-wait
> + *
> + * SUBTEST: before
> + *
> + * SUBTEST: before-wait
> + *
> + * SUBTEST: hang
> + *
> + * SUBTEST: hang-wait
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic check of polling for prime fences.");
>  
> diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
> index bc19f68c98b6..8ffe37fe199f 100644
> --- a/tests/prime_mmap.c
> +++ b/tests/prime_mmap.c
> @@ -50,6 +50,35 @@
>  #include "igt_debugfs.h"
>  #include "ioctl_wrappers.h"
>  #include "i915/intel_memory_region.h"
> +/**
> + * TEST: prime mmap
> + * Feature: prime
> + * Run type: FULL
> + *
> + * SUBTEST: test_aperture_limit
> + *
> + * SUBTEST: test_correct
> + *
> + * SUBTEST: test_correct_cpu_write
> + *
> + * SUBTEST: test_dup
> + *
> + * SUBTEST: test_errors
> + *
> + * SUBTEST: test_forked
> + *
> + * SUBTEST: test_forked_cpu_write
> + *
> + * SUBTEST: test_invalid_sync_flags
> + *
> + * SUBTEST: test_map_unmap
> + *
> + * SUBTEST: test_refcounting
> + *
> + * SUBTEST: test_reprime
> + *
> + * SUBTEST: test_userptr
> + */
>  
>  #define BO_SIZE (16*1024)
>  
> diff --git a/tests/prime_mmap_coherency.c b/tests/prime_mmap_coherency.c
> index b22fb35c1516..e50f52fdfdb0 100644
> --- a/tests/prime_mmap_coherency.c
> +++ b/tests/prime_mmap_coherency.c
> @@ -31,6 +31,20 @@
>  
>  #include "i915/gem.h"
>  #include "igt.h"
> +/**
> + * TEST: prime mmap coherency
> + * Description:
> + *   Test dma-buf mmap on !llc platforms mostly and provoke coherency bugs so we know for sure where
> + *   we need the sync ioctls.
> + * Feature: prime
> + * Run type: FULL
> + *
> + * SUBTEST: ioctl-errors
> + *
> + * SUBTEST: read
> + *
> + * SUBTEST: write
> + */
>  
>  IGT_TEST_DESCRIPTION("Test dma-buf mmap on !llc platforms mostly and provoke"
>  		" coherency bugs so we know for sure where we need the sync ioctls.");
> diff --git a/tests/prime_self_import.c b/tests/prime_self_import.c
> index bf548619453c..7d423b8cd442 100644
> --- a/tests/prime_self_import.c
> +++ b/tests/prime_self_import.c
> @@ -45,6 +45,43 @@
>  
>  #include "drm.h"
>  #include "i915/gem_create.h"
> +/**
> + * TEST: prime self import
> + * Description: Check whether prime import/export works on the same device... but with different fds.
> + * Feature: prime
> + *
> + * SUBTEST: basic-llseek-bad
> + * Description: Check dmabuf llseek support with invalid values.
> + * Run type: BAT
> + *
> + * SUBTEST: basic-llseek-size
> + * Description: Check dmabuf llseek support.
> + * Run type: BAT
> + *
> + * SUBTEST: basic-with_fd_dup
> + * Description: Check prime export with duplicate fd.
> + * Run type: BAT
> + *
> + * SUBTEST: basic-with_one_bo
> + * Description: Check prime import/export with one buffer object.
> + * Run type: BAT
> + *
> + * SUBTEST: basic-with_one_bo_two_files
> + * Description: Check prime/flink with one buffer object.
> + * Run type: BAT
> + *
> + * SUBTEST: basic-with_two_bos
> + * Description: Check prime import/export with two buffer objects.
> + * Run type: BAT
> + *
> + * SUBTEST: export-vs-gem_close-race
> + * Description: Check race of gem close against prime export.
> + * Run type: FULL
> + *
> + * SUBTEST: reimport-vs-gem_close-race
> + * Description: Check race of gem close against reimport.
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Check whether prime import/export works on the same"
>  		     " device... but with different fds.");
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 9aa767c9cdfd..59e79af2dd00 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -30,6 +30,105 @@
>  #include "igt.h"
>  #include "igt_vgem.h"
>  #include "intel_batchbuffer.h"	/* igt_blitter_src_copy() */
> +/**
> + * TEST: prime vgem
> + * Description: Basic check of polling for prime/vgem fences.
> + *
> + * SUBTEST: basic-blt
> + * Description: Examine blitter access path.
> + * Feature: prime
> + * Run type: FULL
> + *
> + * SUBTEST: basic-fence-blt
> + * Description: Examine blitter access path fencing.
> + * Feature: prime
> + * Run type: FULL
> + *
> + * SUBTEST: basic-fence-flip
> + * Description: Examine vgem bo front/back flip fencing.
> + * Feature: prime
> + * Run type: BAT
> + *
> + * SUBTEST: basic-fence-mmap
> + * Description: Examine GTT access path fencing.
> + * Feature: gtt, prime
> + * Run type: BAT
> + *
> + * SUBTEST: basic-fence-read
> + * Description: Examine read access path fencing.
> + * Feature: gtt, prime
> + * Run type: BAT
> + *
> + * SUBTEST: basic-gtt
> + * Description: Examine access path through GTT.
> + * Feature: gtt, prime
> + * Run type: BAT
> + *
> + * SUBTEST: basic-read
> + * Description: Examine read access path.
> + * Feature: gtt, prime
> + * Run type: BAT
> + *
> + * SUBTEST: basic-userptr
> + * Description: Check that we wrap the vgem mmap with userptr.
> + * Feature: prime
> + * Run type: BAT
> + *
> + * SUBTEST: basic-write
> + * Description: Examine write access path.
> + * Feature: gtt, prime
> + * Run type: BAT
> + *
> + * SUBTEST: busy
> + * Description: Examine busy check of polling for vgem fence.
> + * Feature: prime
> + * Run type: FULL
> + *
> + * SUBTEST: coherency-blt
> + * Description: Examine blitter access path WC coherency.
> + * Feature: prime
> + * Run type: FULL
> + *
> + * SUBTEST: coherency-gtt
> + * Description: Examine concurrent access of vgem bo.
> + * Feature: gtt, prime
> + * Run type: FULL
> + *
> + * SUBTEST: fence-flip-hang
> + * Description: Examine vgem bo front/back flip fencing with a pending gpu hang.
> + * Feature: blacklist, prime, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: fence-read-hang
> + * Description: Examine read access path fencing with a pending gpu hang.
> + * Feature: blacklist, prime, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: fence-wait
> + * Description: Examine basic dma-buf fence interop.
> + * Feature: prime, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: fence-write-hang
> + * Description: Examine write access path fencing with a pending gpu hang.
> + * Feature: blacklist, prime, synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: shrink
> + * Description: Examine link establishment between shrinker and vgem bo.
> + * Feature: prime
> + * Run type: FULL
> + *
> + * SUBTEST: sync
> + * Description: Examine sync on vgem fence.
> + * Feature: prime
> + * Run type: FULL
> + *
> + * SUBTEST: wait
> + * Description: Examine wait on vgem fence.
> + * Feature: prime
> + * Run type: FULL
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic check of polling for prime/vgem fences.");
>  
> diff --git a/tests/sw_sync.c b/tests/sw_sync.c
> index cbd773fcb97c..e626cd14cd28 100644
> --- a/tests/sw_sync.c
> +++ b/tests/sw_sync.c
> @@ -38,6 +38,48 @@
>  
>  #include "sw_sync.h"
>  
> +/**
> + * TEST: sw sync
> + * Description: Test SW Sync Framework
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: alloc_fence
> + *
> + * SUBTEST: alloc_fence_invalid_timeline
> + *
> + * SUBTEST: alloc_merge_fence
> + *
> + * SUBTEST: alloc_timeline
> + *
> + * SUBTEST: sync_busy
> + *
> + * SUBTEST: sync_busy_fork
> + *
> + * SUBTEST: sync_busy_fork_unixsocket
> + *
> + * SUBTEST: sync_expired_merge
> + *
> + * SUBTEST: sync_merge
> + *
> + * SUBTEST: sync_merge_invalid
> + *
> + * SUBTEST: sync_merge_same
> + *
> + * SUBTEST: sync_multi_consumer
> + *
> + * SUBTEST: sync_multi_consumer_producer
> + *
> + * SUBTEST: sync_multi_producer_single_consumer
> + *
> + * SUBTEST: sync_multi_timeline_wait
> + *
> + * SUBTEST: sync_random_merge
> + *
> + * SUBTEST: timeline_closed
> + *
> + * SUBTEST: timeline_closed_signaled
> + */
>  
>  IGT_TEST_DESCRIPTION("Test SW Sync Framework");
>  
> diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
> index 6e20c3411a87..8d98137e7bd6 100644
> --- a/tests/syncobj_basic.c
> +++ b/tests/syncobj_basic.c
> @@ -26,6 +26,36 @@
>  #include <unistd.h>
>  #include <sys/ioctl.h>
>  #include "drm.h"
> +/**
> + * TEST: syncobj basic
> + * Description: Basic check for drm sync objects.
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: bad-create-flags
> + *
> + * SUBTEST: bad-destroy
> + *
> + * SUBTEST: bad-destroy-pad
> + *
> + * SUBTEST: bad-fd-to-handle
> + *
> + * SUBTEST: bad-flags-fd-to-handle
> + *
> + * SUBTEST: bad-flags-handle-to-fd
> + *
> + * SUBTEST: bad-handle-to-fd
> + *
> + * SUBTEST: bad-pad-fd-to-handle
> + *
> + * SUBTEST: bad-pad-handle-to-fd
> + *
> + * SUBTEST: create-signaled
> + *
> + * SUBTEST: illegal-fd-to-handle
> + *
> + * SUBTEST: test-valid-cycle
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic check for drm sync objects.");
>  
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index 7f5ff6f6cad6..1158a99fe58f 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -30,6 +30,400 @@
>  #include <pthread.h>
>  #include <signal.h>
>  #include "drm.h"
> +/**
> + * TEST: syncobj timeline
> + * Description: Tests for the drm timeline sync object API
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: 32bits-limit
> + * Description:
> + *   Verifies that signaling around the int32_t limit. For compatibility reason, the handling
> + *   of seqnos in the dma-fences can consider a seqnoA is prior seqnoB even though seqnoA > seqnoB.
> + *
> + * SUBTEST: device-signal-unordered
> + * Description:
> + *   Verifies that a device signaling fences out of order on the timeline still increments the
> + *   timeline monotonically and that waits work properly.
> + *
> + * SUBTEST: device-submit-unordered
> + * Description: Verifies that submitting out of order doesn't break the timeline.
> + *
> + * SUBTEST: etime-multi-wait-all-for-submit-available-unsubmitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-all-for-submit-available-unsubmitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-all-for-submit-available-unsubmitted-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-all-for-submit-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-all-for-submit-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-all-for-submit-unsubmitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-all-for-submit-unsubmitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-all-for-submit-unsubmitted-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-all-for-submit-unsubmitted-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-all-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-all-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-for-submit-available-unsubmitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-for-submit-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-for-submit-unsubmitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-for-submit-unsubmitted-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-multi-wait-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: etime-single-wait-all-for-submit-available-unsubmitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: etime-single-wait-all-for-submit-submitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: etime-single-wait-all-for-submit-unsubmitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: etime-single-wait-all-submitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: etime-single-wait-for-submit-available-unsubmitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: etime-single-wait-for-submit-submitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: etime-single-wait-for-submit-unsubmitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: etime-single-wait-submitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: host-signal-ordered
> + * Description:
> + *   Verifies that the host signaling fences out of order on the timeline still increments the
> + *   timeline monotonically and that waits work properly.
> + *
> + * SUBTEST: host-signal-points
> + * Description:
> + *   Verifies that as we signal points from the host, the syncobj timeline value increments and
> + *   that waits for submits/signals works properly.
> + *
> + * SUBTEST: invalid-multi-wait-all-available-unsubmitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-all-available-unsubmitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-all-available-unsubmitted-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-all-available-unsubmitted-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-all-unsubmitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-all-unsubmitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-all-unsubmitted-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-all-unsubmitted-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-available-unsubmitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-available-unsubmitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-available-unsubmitted-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-available-unsubmitted-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-unsubmitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-unsubmitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-unsubmitted-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-multi-wait-unsubmitted-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: invalid-query-bad-pad
> + * Description:
> + *   Verify that querying a timeline syncobj with an invalid
> + *   drm_syncobj_timeline_array::flags field is rejected
> + *
> + * SUBTEST: invalid-query-illegal-handle
> + * Description: Verifies that querying an invalid syncobj handle is rejected
> + *
> + * SUBTEST: invalid-query-one-illegal-handle
> + * Description: Verifies that querying a list of invalid syncobj handle including an invalid one is rejected
> + *
> + * SUBTEST: invalid-query-zero-handles
> + * Description: Verifies that querying an empty list of syncobj handles is rejected
> + *
> + * SUBTEST: invalid-signal-bad-pad
> + * Description: Verifies that an invalid value in drm_syncobj_timeline_array.flags is rejected
> + *
> + * SUBTEST: invalid-signal-illegal-handle
> + * Description: Verify that signaling an invalid syncobj handle is rejected
> + *
> + * SUBTEST: invalid-signal-illegal-point
> + *
> + * SUBTEST: invalid-signal-one-illegal-handle
> + * Description:
> + *   Verify that an invalid syncobj handle in drm_syncobj_timeline_array is rejected for
> + *   signaling
> + *
> + * SUBTEST: invalid-signal-zero-handles
> + * Description: Verify that signaling an empty list of syncobj handles is rejected
> + *
> + * SUBTEST: invalid-single-wait-all-available-unsubmitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: invalid-single-wait-all-unsubmitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: invalid-single-wait-available-unsubmitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: invalid-single-wait-unsubmitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: invalid-transfer-bad-pad
> + * Description: Verifies that invalid drm_syncobj_transfer::pad field value is rejected
> + *
> + * SUBTEST: invalid-transfer-illegal-handle
> + * Description: Verifies that an invalid syncobj handle is rejected in drm_syncobj_transfer
> + *
> + * SUBTEST: invalid-transfer-non-existent-point
> + * Description:
> + *   Verifies that transfering a point from a syncobj timeline is to another point in the same
> + *   timeline works
> + *
> + * SUBTEST: invalid-wait-bad-flags
> + * Description: Verifies that an invalid value in drm_syncobj_timeline_wait::flags is rejected
> + *
> + * SUBTEST: invalid-wait-illegal-handle
> + * Description: Verifies that waiting on an invalid syncobj handle is rejected
> + *
> + * SUBTEST: invalid-wait-zero-handles
> + * Description: Verifies that waiting on an empty list of invalid syncobj handles is rejected
> + *
> + * SUBTEST: multi-wait-all-available-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-all-available-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-all-available-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-all-for-submit-available-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-all-for-submit-available-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-all-for-submit-available-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-all-for-submit-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-all-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-available-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-available-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-available-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-for-submit-available-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-for-submit-available-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-for-submit-available-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-for-submit-available-unsubmitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-for-submit-available-unsubmitted-submitted
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-for-submit-available-unsubmitted-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-for-submit-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-for-submit-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-for-submit-unsubmitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-for-submit-unsubmitted-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: multi-wait-submitted-signaled
> + * Description: Verifies waiting on a list of timeline syncobjs
> + *
> + * SUBTEST: reset-during-wait-for-submit
> + * Description: Verifies behavior of a reset operation on timeline syncobj while wait operation is ongoing
> + *
> + * SUBTEST: reset-multiple-signaled
> + * Description: Verifies behavior of a reset operation on a list of signaled timeline syncobjs
> + *
> + * SUBTEST: reset-signaled
> + * Description: Verifies behavior of a reset operation on a signaled timeline syncobj
> + *
> + * SUBTEST: reset-unsignaled
> + * Description: Verifies behavior of a reset operation on an unsignaled timeline syncobj
> + *
> + * SUBTEST: signal
> + * Description: Verifies basic signaling of a timeline syncobj
> + *
> + * SUBTEST: signal-array
> + * Description: Verifies the signaling of a list of timeline syncobj
> + *
> + * SUBTEST: signal-point-0
> + * Description:
> + *   Verifies that signaling point 0 of a timline syncobj works with both timeline & legacy wait
> + *   operations
> + *
> + * SUBTEST: single-wait-all-available-signaled
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: single-wait-all-available-submitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: single-wait-all-for-submit-available-signaled
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: single-wait-all-for-submit-available-submitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: single-wait-all-for-submit-signaled
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: single-wait-all-signaled
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: single-wait-available-signaled
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: single-wait-available-submitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: single-wait-for-submit-available-signaled
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: single-wait-for-submit-available-submitted
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: single-wait-for-submit-signaled
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: single-wait-signaled
> + * Description: Verifies wait behavior on a single timeline syncobj
> + *
> + * SUBTEST: transfer-timeline-point
> + * Description:
> + *   Verifies that transfering a point from a syncobj timeline is to another point in the same
> + *   timeline works for signal/wait operations
> + *
> + * SUBTEST: wait-all-complex
> + * Description:
> + *   Verifies timeline syncobj at different signal/operations stages & between different
> + *   threads.
> + *
> + * SUBTEST: wait-all-delayed-signal
> + * Description: Verifies wait behavior on a timeline syncobj with a delayed signal from a different thread
> + *
> + * SUBTEST: wait-all-for-submit-complex
> + * Description:
> + *   Verifies timeline syncobj at different signal/operations stages & between different
> + *   threads.
> + *
> + * SUBTEST: wait-all-for-submit-delayed-submit
> + * Description: Verifies wait behavior on a timeline syncobj with a delayed signal from a different thread
> + *
> + * SUBTEST: wait-all-for-submit-snapshot
> + * Description: Verifies waiting on a list of timeline syncobjs with different thread for wait/signal
> + *
> + * SUBTEST: wait-all-interrupted
> + * Description: Verifies timeline syncobj waits interaction with signals.
> + *
> + * SUBTEST: wait-all-snapshot
> + * Description: Verifies waiting on a list of timeline syncobjs with different thread for wait/signal
> + *
> + * SUBTEST: wait-any-complex
> + * Description:
> + *   Verifies timeline syncobj at different signal/operations stages & between different
> + *   threads.
> + *
> + * SUBTEST: wait-any-interrupted
> + * Description: Verifies timeline syncobj waits interaction with signals.
> + *
> + * SUBTEST: wait-any-snapshot
> + * Description: Verifies waiting on a list of timeline syncobjs with different thread for wait/signal
> + *
> + * SUBTEST: wait-delayed-signal
> + * Description: Verifies wait behavior on a timeline syncobj with a delayed signal from a different thread
> + *
> + * SUBTEST: wait-for-submit-complex
> + * Description:
> + *   Verifies timeline syncobj at different signal/operations stages & between different
> + *   threads.
> + *
> + * SUBTEST: wait-for-submit-delayed-submit
> + * Description: Verifies wait behavior on a timeline syncobj with a delayed signal from a different thread
> + *
> + * SUBTEST: wait-for-submit-snapshot
> + * Description: Verifies waiting on a list of timeline syncobjs with different thread for wait/signal
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests for the drm timeline sync object API");
>  
> diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
> index 427b6b1192ad..930096f6d10e 100644
> --- a/tests/syncobj_wait.c
> +++ b/tests/syncobj_wait.c
> @@ -30,6 +30,150 @@
>  #include <pthread.h>
>  #include <signal.h>
>  #include "drm.h"
> +/**
> + * TEST: syncobj wait
> + * Description: Tests for the drm sync object wait API
> + * Feature: synchronization
> + * Run type: FULL
> + *
> + * SUBTEST: invalid-multi-wait-all-unsubmitted
> + *
> + * SUBTEST: invalid-multi-wait-all-unsubmitted-signaled
> + *
> + * SUBTEST: invalid-multi-wait-all-unsubmitted-submitted
> + *
> + * SUBTEST: invalid-multi-wait-all-unsubmitted-submitted-signaled
> + *
> + * SUBTEST: invalid-multi-wait-unsubmitted
> + *
> + * SUBTEST: invalid-multi-wait-unsubmitted-signaled
> + *
> + * SUBTEST: invalid-multi-wait-unsubmitted-submitted
> + *
> + * SUBTEST: invalid-multi-wait-unsubmitted-submitted-signaled
> + *
> + * SUBTEST: invalid-reset-bad-pad
> + *
> + * SUBTEST: invalid-reset-illegal-handle
> + *
> + * SUBTEST: invalid-reset-one-illegal-handle
> + *
> + * SUBTEST: invalid-reset-zero-handles
> + *
> + * SUBTEST: invalid-signal-bad-pad
> + *
> + * SUBTEST: invalid-signal-illegal-handle
> + *
> + * SUBTEST: invalid-signal-one-illegal-handle
> + *
> + * SUBTEST: invalid-signal-zero-handles
> + *
> + * SUBTEST: invalid-single-wait-all-unsubmitted
> + *
> + * SUBTEST: invalid-single-wait-unsubmitted
> + *
> + * SUBTEST: invalid-wait-bad-flags
> + *
> + * SUBTEST: invalid-wait-illegal-handle
> + *
> + * SUBTEST: invalid-wait-zero-handles
> + *
> + * SUBTEST: multi-wait-all-for-submit-signaled
> + *
> + * SUBTEST: multi-wait-all-for-submit-submitted
> + *
> + * SUBTEST: multi-wait-all-for-submit-submitted-signaled
> + *
> + * SUBTEST: multi-wait-all-for-submit-unsubmitted
> + *
> + * SUBTEST: multi-wait-all-for-submit-unsubmitted-signaled
> + *
> + * SUBTEST: multi-wait-all-for-submit-unsubmitted-submitted
> + *
> + * SUBTEST: multi-wait-all-signaled
> + *
> + * SUBTEST: multi-wait-all-submitted
> + *
> + * SUBTEST: multi-wait-all-submitted-signaled
> + *
> + * SUBTEST: multi-wait-for-submit-signaled
> + *
> + * SUBTEST: multi-wait-for-submit-submitted
> + *
> + * SUBTEST: multi-wait-for-submit-submitted-signaled
> + *
> + * SUBTEST: multi-wait-for-submit-unsubmitted
> + *
> + * SUBTEST: multi-wait-for-submit-unsubmitted-signaled
> + *
> + * SUBTEST: multi-wait-for-submit-unsubmitted-submitted
> + *
> + * SUBTEST: multi-wait-for-submit-unsubmitted-submitted-signaled
> + *
> + * SUBTEST: multi-wait-signaled
> + *
> + * SUBTEST: multi-wait-submitted
> + *
> + * SUBTEST: multi-wait-submitted-signaled
> + *
> + * SUBTEST: reset-during-wait-for-submit
> + *
> + * SUBTEST: reset-multiple-signaled
> + *
> + * SUBTEST: reset-signaled
> + *
> + * SUBTEST: reset-unsignaled
> + *
> + * SUBTEST: signal
> + *
> + * SUBTEST: single-wait-all-for-submit-signaled
> + *
> + * SUBTEST: single-wait-all-for-submit-submitted
> + *
> + * SUBTEST: single-wait-all-for-submit-unsubmitted
> + *
> + * SUBTEST: single-wait-all-signaled
> + *
> + * SUBTEST: single-wait-all-submitted
> + *
> + * SUBTEST: single-wait-for-submit-signaled
> + *
> + * SUBTEST: single-wait-for-submit-submitted
> + *
> + * SUBTEST: single-wait-for-submit-unsubmitted
> + *
> + * SUBTEST: single-wait-signaled
> + *
> + * SUBTEST: single-wait-submitted
> + *
> + * SUBTEST: wait-all-complex
> + *
> + * SUBTEST: wait-all-delayed-signal
> + *
> + * SUBTEST: wait-all-for-submit-complex
> + *
> + * SUBTEST: wait-all-for-submit-delayed-submit
> + *
> + * SUBTEST: wait-all-for-submit-snapshot
> + *
> + * SUBTEST: wait-all-interrupted
> + *
> + * SUBTEST: wait-all-snapshot
> + *
> + * SUBTEST: wait-any-complex
> + *
> + * SUBTEST: wait-any-interrupted
> + *
> + * SUBTEST: wait-any-snapshot
> + *
> + * SUBTEST: wait-delayed-signal
> + *
> + * SUBTEST: wait-for-submit-complex
> + *
> + * SUBTEST: wait-for-submit-delayed-submit
> + *
> + * SUBTEST: wait-for-submit-snapshot
> + */
>  
>  IGT_TEST_DESCRIPTION("Tests for the drm sync object wait API");
>  
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index ada5518d7703..2a5f6242e995 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -31,6 +31,90 @@
>  #include <sys/poll.h>
>  #include <sys/stat.h>
>  #include <dirent.h>
> +/**
> + * TEST: vgem basic
> + * Description: Basic sanity check of Virtual GEM module (vGEM).
> + *
> + * SUBTEST: bad-fence
> + * Description: Make sure a non-existent fence cannot be signaled.
> + * Feature: vgem
> + * Run type: FULL
> + *
> + * SUBTEST: bad-flag
> + * Description: Make sure a fence cannot be attached and signaled with invalid flags.
> + * Feature: vgem
> + * Run type: FULL
> + *
> + * SUBTEST: bad-handle
> + * Description: Make sure a fence cannot be attached to a invalid handle.
> + * Feature: vgem
> + * Run type: FULL
> + *
> + * SUBTEST: bad-pad
> + * Description: Make sure a non-zero pad is rejected.
> + * Feature: vgem
> + * Run type: FULL
> + *
> + * SUBTEST: busy-fence
> + * Description: Make sure a conflicting fence cannot be attached.
> + * Feature: vgem
> + * Run type: FULL
> + *
> + * SUBTEST: create
> + * Description: Check the basic working of vgem_create ioctl.
> + * Feature: vgem
> + * Run type: BAT
> + *
> + * SUBTEST: debugfs
> + * Description: Check the basic access to debugfs and also try to read entries in the directory.
> + * Feature: vgem
> + * Run type: BAT
> + *
> + * SUBTEST: dmabuf-export
> + * Description: Check whether it can export/import the vgem handle using prime.
> + * Feature: prime, vgem
> + * Run type: BAT
> + *
> + * SUBTEST: dmabuf-fence
> + * Description: Check the working of dma-buf fence interop.
> + * Feature: prime, vgem
> + * Run type: BAT
> + *
> + * SUBTEST: dmabuf-fence-before
> + * Description: Attach a fence before exporting a vgem handle and check the working of fence.
> + * Feature: prime, vgem
> + * Run type: BAT
> + *
> + * SUBTEST: dmabuf-mmap
> + * Description: Export the vgem handle along with RDWR capabilities using prime and check if it can be mmaped.
> + * Feature: prime, vgem
> + * Run type: BAT
> + *
> + * SUBTEST: mmap
> + * Description: Create a vgem handle and check if it can be mmaped.
> + * Feature: vgem
> + * Run type: BAT
> + *
> + * SUBTEST: second-client
> + * Description: Check whether it can open multiple clients.
> + * Feature: vgem
> + * Run type: BAT
> + *
> + * SUBTEST: setversion
> + * Description: Check the working of SET_VERSION ioctl.
> + * Feature: vgem
> + * Run type: BAT
> + *
> + * SUBTEST: sysfs
> + * Description: Check the basic access to sysfs and also try to read entries in the directory.
> + * Feature: vgem
> + * Run type: BAT
> + *
> + * SUBTEST: unload
> + * Description: Basic test for handling of module unload.
> + * Feature: vgem
> + * Run type: BAT
> + */
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of Virtual GEM module (vGEM).");
>  
> diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
> index 58b09e421e65..d2a7effff115 100644
> --- a/tests/vgem_slow.c
> +++ b/tests/vgem_slow.c
> @@ -30,6 +30,14 @@
>  #include <sys/poll.h>
>  #include <sys/stat.h>
>  #include <dirent.h>
> +/**
> + * TEST: vgem slow
> + * Description: Extended sanity check of Virtual GEM module (vGEM).
> + * Feature: vgem
> + * Run type: FULL
> + *
> + * SUBTEST: nohang
> + */
>  
>  IGT_TEST_DESCRIPTION("Extended sanity check of Virtual GEM module (vGEM).");
>  
> -- 
> 2.40.1
> 

