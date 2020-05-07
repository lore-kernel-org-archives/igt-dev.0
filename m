Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BD26E0BE
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 09:40:38 +0000 (UTC)
Date: Thu, 7 May 2020 12:40:35 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200507094035.GW9497@platvala-desk.ger.corp.intel.com>
References: <20200507084550.656091-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507084550.656091-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Split igt_require_gem() into
 i915/
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 07, 2020 at 09:45:50AM +0100, Chris Wilson wrote:
> igt_require_gem() is a pecularity of i915/, move it out of the core.
> =

> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  lib/Makefile.sources                        |   2 +
>  lib/drmtest.c                               |  22 +---
>  lib/drmtest.h                               |   2 -
>  lib/i915/gem.c                              | 117 ++++++++++++++++++++
>  lib/i915/gem.h                              |  33 ++++++
>  lib/i915/gem_ring.c                         |   1 +
>  lib/i915/gem_submission.c                   |  22 +---
>  lib/i915/gem_submission.h                   |   2 -
>  lib/i915/gem_vm.h                           |   1 +
>  lib/igt_debugfs.c                           |   5 +-
>  lib/igt_dummyload.c                         |  11 +-
>  lib/igt_gt.c                                |   3 +-
>  lib/ioctl_wrappers.c                        |  49 --------
>  lib/ioctl_wrappers.h                        |   1 -
>  lib/meson.build                             |   1 +
>  tests/amdgpu/amd_prime.c                    |   7 +-
>  tests/core_hotunplug.c                      |   1 +
>  tests/debugfs_test.c                        |   2 +
>  tests/i915/gem_bad_blit.c                   |   4 +-
>  tests/i915/gem_bad_reloc.c                  |   4 +-
>  tests/i915/gem_blits.c                      |   1 +
>  tests/i915/gem_busy.c                       |   3 +-
>  tests/i915/gem_caching.c                    |   3 +-
>  tests/i915/gem_close.c                      |   1 +
>  tests/i915/gem_close_race.c                 |   4 +-
>  tests/i915/gem_concurrent_all.c             |   5 +-
>  tests/i915/gem_cs_prefetch.c                |   1 +
>  tests/i915/gem_cs_tlb.c                     |   4 +-
>  tests/i915/gem_ctx_clone.c                  |   5 +-
>  tests/i915/gem_ctx_create.c                 |   4 +-
>  tests/i915/gem_ctx_engines.c                |   4 +-
>  tests/i915/gem_ctx_exec.c                   |   3 +-
>  tests/i915/gem_ctx_freq.c                   |   1 +
>  tests/i915/gem_ctx_isolation.c              |   1 +
>  tests/i915/gem_ctx_param.c                  |   1 +
>  tests/i915/gem_ctx_persistence.c            |   1 +
>  tests/i915/gem_ctx_ringsize.c               |   1 +
>  tests/i915/gem_ctx_shared.c                 |   4 +-
>  tests/i915/gem_ctx_sseu.c                   |   4 +-
>  tests/i915/gem_ctx_switch.c                 |   4 +-
>  tests/i915/gem_ctx_thrash.c                 |   6 +-
>  tests/i915/gem_eio.c                        |   3 +-
>  tests/i915/gem_evict_alignment.c            |   3 +-
>  tests/i915/gem_evict_everything.c           |   4 +-
>  tests/i915/gem_exec_alignment.c             |   3 +-
>  tests/i915/gem_exec_async.c                 |   1 +
>  tests/i915/gem_exec_await.c                 |   9 +-
>  tests/i915/gem_exec_bad_domains.c           |   4 +-
>  tests/i915/gem_exec_balancer.c              |   3 +-
>  tests/i915/gem_exec_big.c                   |   4 +-
>  tests/i915/gem_exec_capture.c               |   1 +
>  tests/i915/gem_exec_create.c                |   4 +-
>  tests/i915/gem_exec_fence.c                 |  11 +-
>  tests/i915/gem_exec_flush.c                 |   1 +
>  tests/i915/gem_exec_gttfill.c               |   1 +
>  tests/i915/gem_exec_latency.c               |   3 +-
>  tests/i915/gem_exec_lut_handle.c            |   4 +-
>  tests/i915/gem_exec_nop.c                   |  12 +-
>  tests/i915/gem_exec_parallel.c              |   1 +
>  tests/i915/gem_exec_params.c                |   8 +-
>  tests/i915/gem_exec_reloc.c                 |   1 +
>  tests/i915/gem_exec_schedule.c              |   3 +-
>  tests/i915/gem_exec_store.c                 |   4 +-
>  tests/i915/gem_exec_suspend.c               |   1 +
>  tests/i915/gem_exec_whisper.c               |   1 +
>  tests/i915/gem_fenced_exec_thrash.c         |   1 +
>  tests/i915/gem_gpgpu_fill.c                 |   4 +-
>  tests/i915/gem_gtt_hog.c                    |   3 +-
>  tests/i915/gem_linear_blits.c               |   3 +-
>  tests/i915/gem_media_fill.c                 |   4 +-
>  tests/i915/gem_media_vme.c                  |   4 +-
>  tests/i915/gem_mmap_gtt.c                   |   1 +
>  tests/i915/gem_mmap_offset.c                |   1 +
>  tests/i915/gem_non_secure_batch.c           |   6 +-
>  tests/i915/gem_partial_pwrite_pread.c       |   3 +-
>  tests/i915/gem_pipe_control_store_loop.c    |   4 +-
>  tests/i915/gem_ppgtt.c                      |   5 +-
>  tests/i915/gem_pread_after_blit.c           |   3 +-
>  tests/i915/gem_pwrite_snooped.c             |   4 +-
>  tests/i915/gem_read_read_speed.c            |   5 +-
>  tests/i915/gem_render_copy.c                |   5 +-
>  tests/i915/gem_render_copy_redux.c          |   3 +-
>  tests/i915/gem_render_linear_blits.c        |   3 +-
>  tests/i915/gem_render_tiled_blits.c         |   3 +-
>  tests/i915/gem_request_retire.c             |   3 +-
>  tests/i915/gem_reset_stats.c                |   5 +-
>  tests/i915/gem_ringfill.c                   |   3 +-
>  tests/i915/gem_set_tiling_vs_blt.c          |   4 +-
>  tests/i915/gem_shrink.c                     |   1 +
>  tests/i915/gem_softpin.c                    |   1 +
>  tests/i915/gem_spin_batch.c                 |   1 +
>  tests/i915/gem_streaming_writes.c           |   4 +-
>  tests/i915/gem_sync.c                       |   1 +
>  tests/i915/gem_tiled_blits.c                |   3 +-
>  tests/i915/gem_tiled_fence_blits.c          |   1 +
>  tests/i915/gem_tiled_partial_pwrite_pread.c |   3 +-
>  tests/i915/gem_unfence_active_buffers.c     |   4 +-
>  tests/i915/gem_unref_active_buffers.c       |   4 +-
>  tests/i915/gem_userptr_blits.c              |   3 +-
>  tests/i915/gem_vm_create.c                  |   3 +-
>  tests/i915/gem_wait.c                       |   1 +
>  tests/i915/gem_workarounds.c                |   5 +-
>  tests/i915/gen3_mixed_blits.c               |   5 +-
>  tests/i915/gen3_render_linear_blits.c       |   5 +-
>  tests/i915/gen3_render_mixed_blits.c        |   5 +-
>  tests/i915/gen3_render_tiledx_blits.c       |   5 +-
>  tests/i915/gen3_render_tiledy_blits.c       |   3 +-
>  tests/i915/gen7_exec_parse.c                |   3 +-
>  tests/i915/gen9_exec_parse.c                |   3 +-
>  tests/i915/i915_hangman.c                   |   3 +-
>  tests/i915/i915_pm_rc6_residency.c          |   1 +
>  tests/i915/i915_pm_rpm.c                    |   1 +
>  tests/i915/i915_pm_rps.c                    |   1 +
>  tests/i915/i915_pm_sseu.c                   |   5 +-
>  tests/i915/i915_suspend.c                   |   3 +-
>  tests/i915/sysfs_heartbeat_interval.c       |   1 +
>  tests/i915/sysfs_preempt_timeout.c          |   4 +-
>  tests/i915/sysfs_timeslice_duration.c       |   3 +-
>  tests/kms_busy.c                            |   5 +-
>  tests/kms_cursor_legacy.c                   |   1 +
>  tests/kms_draw_crc.c                        |   1 +
>  tests/kms_fence_pin_leak.c                  |   3 +-
>  tests/kms_flip_tiling.c                     |   4 +-
>  tests/kms_frontbuffer_tracking.c            |   7 +-
>  tests/perf.c                                |   3 +-
>  tests/perf_pmu.c                            |   3 +-
>  tests/prime_busy.c                          |   5 +-
>  tests/prime_mmap_coherency.c                |   1 +
>  tests/prime_vgem.c                          |   6 +-
>  129 files changed, 422 insertions(+), 224 deletions(-)
>  create mode 100644 lib/i915/gem.c
>  create mode 100644 lib/i915/gem.h
> =

> diff --git a/lib/Makefile.sources b/lib/Makefile.sources
> index 1e2c88aea..6449574ce 100644
> --- a/lib/Makefile.sources
> +++ b/lib/Makefile.sources
> @@ -3,6 +3,8 @@ lib_source_list =3D	 	\
>  	drmtest.c		\
>  	drmtest.h		\
>  	i830_reg.h		\
> +	i915/gem.c		\
> +	i915/gem.h		\
>  	i915/gem_context.c	\
>  	i915/gem_context.h	\
>  	i915/gem_engine_topology.c	\
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index d6ee39e0c..85f96ae1c 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -48,6 +48,7 @@
>  =

>  #include "drmtest.h"
>  #include "i915_drm.h"
> +#include "i915/gem.h"
>  #include "intel_chipset.h"
>  #include "intel_io.h"
>  #include "igt_debugfs.h"
> @@ -162,27 +163,6 @@ static const char *forced_driver(void)
>  	return NULL;
>  }
>  =

> -#define LOCAL_I915_EXEC_VEBOX	(4 << 0)
> -/**
> - * gem_quiescent_gpu:
> - * @fd: open i915 drm file descriptor
> - *
> - * Ensure the gpu is idle by launching a nop execbuf and stalling for it=
. This
> - * is automatically run when opening a drm device node and is also insta=
lled as
> - * an exit handler to have the best assurance that the test is run in a =
pristine
> - * and controlled environment.
> - *
> - * This function simply allows tests to make additional calls in-between=
, if so
> - * desired.
> - */
> -void gem_quiescent_gpu(int fd)
> -{
> -	igt_terminate_spins();
> -
> -	igt_drop_caches_set(fd,
> -			    DROP_ACTIVE | DROP_RETIRE | DROP_IDLE | DROP_FREED);
> -}
> -
>  static int modprobe(const char *driver)
>  {
>  	return igt_kmod_load(driver, "");
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index d5f0fc256..c56bfafa5 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -94,8 +94,6 @@ int __drm_open_driver_another(int idx, int chipset);
>  int __drm_open_driver(int chipset);
>  int __drm_open_driver_render(int chipset);
>  =

> -void gem_quiescent_gpu(int fd);
> -
>  void igt_require_amdgpu(int fd);
>  void igt_require_intel(int fd);
>  void igt_require_vc4(int fd);
> diff --git a/lib/i915/gem.c b/lib/i915/gem.c
> new file mode 100644
> index 000000000..cabd23768
> --- /dev/null
> +++ b/lib/i915/gem.c
> @@ -0,0 +1,117 @@
> +/*
> + * Copyright =A9 2007,2014,2020 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#include <fcntl.h>
> +#include <sys/ioctl.h>
> +
> +#include "i915/gem.h"
> +#include "igt.h"
> +#include "igt_debugfs.h"
> +#include "igt_sysfs.h"
> +
> +static void reset_device(int i915)
> +{
> +	int dir;
> +
> +	dir =3D igt_debugfs_dir(i915);
> +	igt_require(dir >=3D 0);
> +
> +	if (ioctl(i915, DRM_IOCTL_I915_GEM_THROTTLE)) {
> +		igt_info("Found wedged device, trying to reset and continue\n");
> +		igt_sysfs_set(dir, "i915_wedged", "-1");
> +	}
> +	igt_sysfs_set(dir, "i915_next_seqno", "1");
> +
> +	close(dir);
> +}
> +
> +void igt_require_gem(int i915)
> +{
> +	int err;
> +
> +	igt_require_intel(i915);
> +
> +	/*
> +	 * We only want to use the throttle-ioctl for its -EIO reporting
> +	 * of a wedged device, not for actually waiting on outstanding
> +	 * requests! So create a new drm_file for the device that is clean.
> +	 */
> +	i915 =3D gem_reopen_driver(i915);
> +
> +	/*
> +	 * Reset the global seqno at the start of each test. This ensures that
> +	 * the test will not wrap unless it explicitly sets up seqno wrapping
> +	 * itself, which avoids accidentally hanging when setting up long
> +	 * sequences of batches.
> +	 */
> +	reset_device(i915);
> +
> +	err =3D 0;
> +	if (ioctl(i915, DRM_IOCTL_I915_GEM_THROTTLE)) {
> +		err =3D -errno;
> +		igt_assume(err);
> +	}
> +
> +	close(i915);
> +
> +	igt_require_f(err =3D=3D 0, "Unresponsive i915/GEM device\n");


Food for thought (not for this patch): Using igt_abort_f() for this instead?


<snip>

> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index 9e6c5c993..050670785 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -1110,13 +1110,10 @@ static int get_object_count(int fd)
>   */
>  int igt_get_stable_obj_count(int driver)
>  {
> -	int obj_count;
> -	gem_quiescent_gpu(driver);
> -	obj_count =3D get_object_count(driver);
>  	/* The test relies on the system being in the same state before and
>  	 * after the test so any difference in the object count is a result of
>  	 * leaks during the test. */
> -	return obj_count;
> +	return get_object_count(driver);
>  }

No more quiescenting here?


<snip>


> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persis=
tence.c
> index 3d52987d1..bd3c819b4 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -29,6 +29,7 @@
>  #include <unistd.h>
>  =

>  #include "drmtest.h" /* gem_quiescent_gpu()! */

This comment appears on multiple tests and is now lying.



-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
