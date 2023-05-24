Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C354010E5A7
 for <igt-dev@lists.freedesktop.org>; Wed, 24 May 2023 08:44:30 +0000 (UTC)
Date: Wed, 24 May 2023 10:44:25 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230524084425.inmho3ufph2bc3sh@kamilkon-desk1>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
 <20230516165058.4047595-18-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230516165058.4047595-18-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 17/20] tests/i915: Use drm_close_driver() to
 close the drm fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,

few nits, see below.

On 2023-05-16 at 22:20:55 +0530, Bhanuprakash Modem wrote:
> To close the drm file descriptor, use igt helper drm_close_driver()
> instead of using close().
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/core_auth.c                           | 10 +++----
>  tests/core_getclient.c                      |  2 +-
>  tests/core_getstats.c                       |  2 +-
>  tests/core_getversion.c                     |  2 +-
>  tests/core_setmaster.c                      |  6 ++--
>  tests/core_setmaster_vs_auth.c              |  6 ++--
>  tests/debugfs_test.c                        |  2 +-
>  tests/dumb_buffer.c                         |  2 +-
>  tests/eviction_common.c                     |  2 +-
>  tests/fbdev.c                               |  2 +-

Please split above (and some of below) to separate patch:
tests: Use drm_close_driver() to close the drm fd

and leave only i915 in
tests/i915: Use drm_close_driver() to close the drm fd

>  tests/i915/api_intel_allocator.c            |  6 ++--
>  tests/i915/api_intel_bb.c                   |  2 +-
>  tests/i915/drm_fdinfo.c                     |  2 +-
>  tests/i915/gem_bad_reloc.c                  |  2 +-
>  tests/i915/gem_barrier_race.c               |  2 +-
>  tests/i915/gem_basic.c                      |  2 +-
>  tests/i915/gem_blits.c                      |  2 +-
>  tests/i915/gem_busy.c                       |  2 +-
>  tests/i915/gem_caching.c                    |  2 +-
>  tests/i915/gem_ccs.c                        |  2 +-
>  tests/i915/gem_close_race.c                 | 14 ++++-----
>  tests/i915/gem_cs_tlb.c                     |  2 +-
>  tests/i915/gem_ctx_bad_destroy.c            |  2 +-
>  tests/i915/gem_ctx_create.c                 |  4 +--
>  tests/i915/gem_ctx_exec.c                   |  2 +-
>  tests/i915/gem_ctx_param.c                  |  2 +-
>  tests/i915/gem_ctx_persistence.c            |  6 ++--
>  tests/i915/gem_ctx_shared.c                 |  2 +-
>  tests/i915/gem_ctx_sseu.c                   |  2 +-
>  tests/i915/gem_ctx_switch.c                 |  2 +-
>  tests/i915/gem_eio.c                        | 16 +++++------
>  tests/i915/gem_evict_alignment.c            |  2 +-
>  tests/i915/gem_evict_everything.c           |  2 +-
>  tests/i915/gem_exec_alignment.c             |  2 +-
>  tests/i915/gem_exec_async.c                 |  2 +-
>  tests/i915/gem_exec_await.c                 |  2 +-
>  tests/i915/gem_exec_basic.c                 |  2 +-
>  tests/i915/gem_exec_big.c                   |  2 +-
>  tests/i915/gem_exec_capture.c               |  2 +-
>  tests/i915/gem_exec_create.c                |  2 +-
>  tests/i915/gem_exec_fair.c                  |  2 +-
>  tests/i915/gem_exec_fence.c                 |  4 +--
>  tests/i915/gem_exec_flush.c                 |  2 +-
>  tests/i915/gem_exec_gttfill.c               |  4 +--
>  tests/i915/gem_exec_latency.c               |  2 +-
>  tests/i915/gem_exec_nop.c                   |  2 +-
>  tests/i915/gem_exec_parallel.c              |  4 +--
>  tests/i915/gem_exec_params.c                |  2 +-
>  tests/i915/gem_exec_reloc.c                 |  2 +-
>  tests/i915/gem_exec_schedule.c              |  2 +-
>  tests/i915/gem_exec_store.c                 |  2 +-
>  tests/i915/gem_exec_suspend.c               |  2 +-
>  tests/i915/gem_exec_whisper.c               |  6 ++--
>  tests/i915/gem_exercise_blt.c               |  2 +-
>  tests/i915/gem_fd_exhaustion.c              |  2 +-
>  tests/i915/gem_fence_thrash.c               |  2 +-
>  tests/i915/gem_fenced_exec_thrash.c         |  2 +-
>  tests/i915/gem_flink_basic.c                |  4 +--
>  tests/i915/gem_flink_race.c                 |  6 ++--
>  tests/i915/gem_gtt_cpu_tlb.c                |  2 +-
>  tests/i915/gem_gtt_hog.c                    |  2 +-
>  tests/i915/gem_gtt_speed.c                  |  2 +-
>  tests/i915/gem_huc_copy.c                   |  2 +-
>  tests/i915/gem_lmem_evict.c                 |  4 +--
>  tests/i915/gem_lmem_swapping.c              | 10 +++----
>  tests/i915/gem_madvise.c                    | 12 ++++----
>  tests/i915/gem_media_fill.c                 |  2 +-
>  tests/i915/gem_mmap.c                       |  2 +-
>  tests/i915/gem_mmap_gtt.c                   |  6 ++--
>  tests/i915/gem_mmap_offset.c                |  8 +++---
>  tests/i915/gem_mmap_wc.c                    |  2 +-
>  tests/i915/gem_partial_pwrite_pread.c       |  2 +-
>  tests/i915/gem_pipe_control_store_loop.c    |  2 +-
>  tests/i915/gem_ppgtt.c                      |  8 +++---
>  tests/i915/gem_pread.c                      |  2 +-
>  tests/i915/gem_pread_after_blit.c           |  2 +-
>  tests/i915/gem_pwrite.c                     |  2 +-
>  tests/i915/gem_pwrite_snooped.c             |  2 +-
>  tests/i915/gem_pxp.c                        |  2 +-
>  tests/i915/gem_read_read_speed.c            |  2 +-
>  tests/i915/gem_readwrite.c                  |  2 +-
>  tests/i915/gem_reg_read.c                   |  2 +-
>  tests/i915/gem_render_copy.c                |  2 +-
>  tests/i915/gem_render_copy_redux.c          |  2 +-
>  tests/i915/gem_reset_stats.c                | 32 ++++++++++-----------
>  tests/i915/gem_ringfill.c                   |  2 +-
>  tests/i915/gem_set_tiling_vs_blt.c          |  2 +-
>  tests/i915/gem_set_tiling_vs_gtt.c          |  2 +-
>  tests/i915/gem_set_tiling_vs_pwrite.c       |  2 +-
>  tests/i915/gem_shrink.c                     | 14 ++++-----
>  tests/i915/gem_softpin.c                    |  4 +--
>  tests/i915/gem_spin_batch.c                 |  2 +-
>  tests/i915/gem_streaming_writes.c           |  2 +-
>  tests/i915/gem_stress.c                     |  2 +-
>  tests/i915/gem_sync.c                       |  2 +-
>  tests/i915/gem_tiled_blits.c                |  2 +-
>  tests/i915/gem_tiled_fence_blits.c          |  2 +-
>  tests/i915/gem_tiled_partial_pwrite_pread.c |  2 +-
>  tests/i915/gem_tiled_pread_basic.c          |  2 +-
>  tests/i915/gem_tiled_pread_pwrite.c         |  2 +-
>  tests/i915/gem_tiled_swapping.c             |  2 +-
>  tests/i915/gem_tiled_wb.c                   |  2 +-
>  tests/i915/gem_tiled_wc.c                   |  2 +-
>  tests/i915/gem_tiling_max_stride.c          |  2 +-
>  tests/i915/gem_unfence_active_buffers.c     |  2 +-
>  tests/i915/gem_unref_active_buffers.c       |  2 +-
>  tests/i915/gem_userptr_blits.c              |  6 ++--
>  tests/i915/gem_vm_create.c                  |  4 +--
>  tests/i915/gem_wait.c                       |  2 +-
>  tests/i915/gem_watchdog.c                   |  2 +-
>  tests/i915/gem_workarounds.c                |  2 +-
>  tests/i915/gen7_exec_parse.c                |  4 +--
>  tests/i915/gen9_exec_parse.c                |  2 +-
>  tests/i915/i915_fb_tiling.c                 |  2 +-
>  tests/i915/i915_getparams_basic.c           |  2 +-
>  tests/i915/i915_hangman.c                   |  4 +--
>  tests/i915/i915_hwmon.c                     |  2 +-
>  tests/i915/i915_module_load.c               |  8 +++---
>  tests/i915/i915_pciid.c                     |  2 +-
>  tests/i915/i915_pm_backlight.c              |  2 +-
>  tests/i915/i915_pm_dc.c                     |  2 +-
>  tests/i915/i915_pm_freq_api.c               |  2 +-
>  tests/i915/i915_pm_freq_mult.c              |  2 +-
>  tests/i915/i915_pm_lpsp.c                   |  2 +-
>  tests/i915/i915_pm_rc6_residency.c          |  2 +-
>  tests/i915/i915_pm_rps.c                    |  2 +-
>  tests/i915/i915_pm_sseu.c                   |  2 +-
>  tests/i915/i915_power.c                     |  2 +-
>  tests/i915/i915_query.c                     |  2 +-
>  tests/i915/i915_suspend.c                   |  6 ++--
>  tests/i915/perf.c                           |  6 ++--
>  tests/i915/perf_pmu.c                       |  6 ++--
>  tests/i915/sysfs_defaults.c                 |  2 +-
>  tests/i915/sysfs_heartbeat_interval.c       |  2 +-
>  tests/i915/sysfs_preempt_timeout.c          |  2 +-
>  tests/i915/sysfs_timeslice_duration.c       |  2 +-

Split below into separate one.

>  tests/prime_busy.c                          |  2 +-
>  tests/prime_mmap.c                          |  2 +-
>  tests/prime_mmap_coherency.c                |  4 +--
>  tests/prime_mmap_kms.c                      |  2 +-
>  tests/prime_self_import.c                   | 26 ++++++++---------
>  tests/prime_vgem.c                          |  4 +--
>  tests/syncobj_basic.c                       |  2 +-
>  tests/syncobj_timeline.c                    |  2 +-
>  tests/syncobj_wait.c                        |  2 +-
>  tests/template.c                            |  2 +-
>  tests/vgem_basic.c                          |  6 ++--
>  tests/vgem_slow.c                           |  2 +-
>  148 files changed, 252 insertions(+), 252 deletions(-)
> 

One more nit, see below.

> diff --git a/tests/core_auth.c b/tests/core_auth.c
> index 257f12482..110163b00 100644
> --- a/tests/core_auth.c
> +++ b/tests/core_auth.c
> @@ -189,7 +189,7 @@ static void test_basic_auth(int master)
>  	igt_assert(drmGetMagic(slave, &magic) == 0);
>  	igt_assert_eq(magic, old_magic);
>  
> -	close(slave);
> +	drm_close_driver(slave);
>  }
>  
>  igt_main
> @@ -201,7 +201,7 @@ igt_main
>  
>  		igt_assert(check_auth(fd) == true);
>  
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  
>  	igt_describe("Use 2 clients, check second is authenticated even when first dropped.");
> @@ -211,11 +211,11 @@ igt_main
>  
>  		igt_assert(check_auth(fd2) == true);
>  
> -		close(fd);
> +		drm_close_driver(fd);
>  
>  		igt_assert(check_auth(fd2) == true);
>  
> -		close(fd2);
> +		drm_close_driver(fd2);
>  	}
>  
>  	/* above tests require that no drm fd is open */
> @@ -224,7 +224,7 @@ igt_main
>  
>  		igt_fixture
>  			master = drm_open_driver_master(DRIVER_ANY);
> -	
> +

Please do not mix fixups into functional changes.
Rest looks good.

Regards,
Kamil

>  		igt_describe("Test magic numbers for master and slave.");
>  		igt_subtest("basic-auth")
>  			test_basic_auth(master);
> diff --git a/tests/core_getclient.c b/tests/core_getclient.c
> index 40a1c194d..9e53c46f9 100644
> --- a/tests/core_getclient.c
> +++ b/tests/core_getclient.c
> @@ -58,5 +58,5 @@ igt_simple_main
>  	ret = ioctl(fd, DRM_IOCTL_GET_CLIENT, &client);
>  	igt_assert(ret == -1 && errno == EINVAL);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/core_getstats.c b/tests/core_getstats.c
> index fde27cdc6..c68b6b559 100644
> --- a/tests/core_getstats.c
> +++ b/tests/core_getstats.c
> @@ -52,5 +52,5 @@ igt_simple_main
>  	ret = ioctl(fd, DRM_IOCTL_GET_STATS, &stats);
>  	igt_assert(ret == 0);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/core_getversion.c b/tests/core_getversion.c
> index f6953b313..0c2949f18 100644
> --- a/tests/core_getversion.c
> +++ b/tests/core_getversion.c
> @@ -46,5 +46,5 @@ igt_simple_main
>  		igt_assert_lte(1, v->version_major);
>  
>  	drmFree(v);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/core_setmaster.c b/tests/core_setmaster.c
> index 470f9441d..30348dd62 100644
> --- a/tests/core_setmaster.c
> +++ b/tests/core_setmaster.c
> @@ -85,7 +85,7 @@ static void check_drop_set(void)
>  	igt_assert_eq(drmDropMaster(master), 0);
>  	igt_assert_eq(drmSetMaster(master), 0);
>  
> -	close(master);
> +	drm_close_driver(master);
>  }
>  
>  static unsigned tweak_perm(uint8_t *saved_perm, unsigned max_perm, bool save)
> @@ -206,10 +206,10 @@ igt_main
>  			igt_assert_eq(drmSetMaster(master), -1);
>  			igt_assert_eq(errno, EACCES);
>  
> -			close(master);
> +			drm_close_driver(master);
>  		}
>  		igt_waitchildren();
>  
> -		close(master);
> +		drm_close_driver(master);
>  	}
>  }
> diff --git a/tests/core_setmaster_vs_auth.c b/tests/core_setmaster_vs_auth.c
> index 0b4b8613c..da4662e0a 100644
> --- a/tests/core_setmaster_vs_auth.c
> +++ b/tests/core_setmaster_vs_auth.c
> @@ -66,7 +66,7 @@ igt_simple_main
>  	igt_assert_neq(drmAuthMagic(master2, magic), 0);
>  	igt_assert_eq(errno, EINVAL);
>  
> -	close(client);
> -	close(master2);
> -	close(master1);
> +	drm_close_driver(client);
> +	drm_close_driver(master2);
> +	drm_close_driver(master1);
>  }
> diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
> index 8c775158f..b45646d70 100644
> --- a/tests/debugfs_test.c
> +++ b/tests/debugfs_test.c
> @@ -213,6 +213,6 @@ igt_main
>  	igt_fixture {
>  		close(sysfs);
>  		close(debugfs);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index ded6b809c..8aa320a59 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -394,6 +394,6 @@ igt_main
>  		always_clear(fd, 30);
>  
>  	igt_fixture {
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/eviction_common.c b/tests/eviction_common.c
> index 95af106c1..5948fbc64 100644
> --- a/tests/eviction_common.c
> +++ b/tests/eviction_common.c
> @@ -300,7 +300,7 @@ static int forking_evictions(int fd, struct igt_eviction_test_ops *ops,
>  
>  		/* drmfd closing will take care of additional bo refs */
>  		if (flags & FORKING_EVICTIONS_DUP_DRMFD)
> -			close(realfd);
> +			drm_close_driver(realfd);
>  	}
>  
>  	igt_waitchildren();
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index 794882a6a..154e78b0f 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -443,6 +443,6 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index 1263e0fbd..9ce0fff9f 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -502,7 +502,7 @@ static void reopen(int fd)
>  
>  	__reopen_allocs(fd, fd2, true);
>  
> -	close(fd2);
> +	drm_close_driver(fd2);
>  }
>  
>  #define REOPEN_TIMEOUT 3
> @@ -528,7 +528,7 @@ static void reopen_fork(int fd)
>  	/* Check references at the end */
>  	__reopen_allocs(fd, fd2, true);
>  
> -	close(fd2);
> +	drm_close_driver(fd2);
>  
>  	intel_allocator_multiprocess_stop();
>  }
> @@ -847,5 +847,5 @@ igt_main
>  		gem_pool(fd);
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index 46633b038..da74e1ed3 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -1701,6 +1701,6 @@ igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
>  
>  	igt_fixture {
>  		buf_ops_destroy(bops);
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/drm_fdinfo.c b/tests/i915/drm_fdinfo.c
> index a8b2997fa..b8d1e6c4c 100644
> --- a/tests/i915/drm_fdinfo.c
> +++ b/tests/i915/drm_fdinfo.c
> @@ -866,6 +866,6 @@ igt_main
>  
>  	igt_fixture {
>  		intel_ctx_destroy(i915, ctx);
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/gem_bad_reloc.c b/tests/i915/gem_bad_reloc.c
> index 478e78a66..fc1c6a574 100644
> --- a/tests/i915/gem_bad_reloc.c
> +++ b/tests/i915/gem_bad_reloc.c
> @@ -212,5 +212,5 @@ igt_main
>  		negative_reloc_blt(fd);
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_barrier_race.c b/tests/i915/gem_barrier_race.c
> index 46273ab55..59775be4e 100644
> --- a/tests/i915/gem_barrier_race.c
> +++ b/tests/i915/gem_barrier_race.c
> @@ -108,7 +108,7 @@ static void intel_context_first_pin_last_unpin_loop(int fd, uint64_t engine, int
>  
>  	} while (!READ_ONCE(*done));
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void test_remote_request(int fd, uint64_t engine, unsigned int timeout)
> diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
> index 4e063febd..edcc6d443 100644
> --- a/tests/i915/gem_basic.c
> +++ b/tests/i915/gem_basic.c
> @@ -108,7 +108,7 @@ igt_main
>  			gpu_fd = __drm_open_driver_another(child, DRIVER_INTEL);
>  			igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child, errno);
>  			test_create_close(gpu_fd);
> -			close(gpu_fd);
> +			drm_close_driver(gpu_fd);
>  		}
>  
>  		igt_waitchildren();
> diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
> index 5fbb384db..5ac0bfdc3 100644
> --- a/tests/i915/gem_blits.c
> +++ b/tests/i915/gem_blits.c
> @@ -893,6 +893,6 @@ igt_main
>  
>  	igt_fixture {
>  		put_ahnd(device.ahnd);
> -		close(device.fd);
> +		drm_close_driver(device.fd);
>  	}
>  }
> diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
> index 08a500a9e..70ba1999f 100644
> --- a/tests/i915/gem_busy.c
> +++ b/tests/i915/gem_busy.c
> @@ -562,6 +562,6 @@ igt_main
>  
>  	igt_fixture {
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
> index 6e944f0ac..16c594aa6 100644
> --- a/tests/i915/gem_caching.c
> +++ b/tests/i915/gem_caching.c
> @@ -340,6 +340,6 @@ igt_main
>  		intel_buf_destroy(scratch_buf);
>  		intel_buf_destroy(staging_buf);
>  		buf_ops_destroy(data.bops);
> -		close(data.fd);
> +		drm_close_driver(data.fd);
>  	}
>  }
> diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> index d25e00fc8..4a1ae094d 100644
> --- a/tests/i915/gem_ccs.c
> +++ b/tests/i915/gem_ccs.c
> @@ -731,6 +731,6 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  
>  	igt_fixture {
>  		igt_disallow_hang(i915, hang);
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> index dc88eca47..25249b2a5 100644
> --- a/tests/i915/gem_close_race.c
> +++ b/tests/i915/gem_close_race.c
> @@ -248,7 +248,7 @@ static void thread(int fd, struct drm_gem_open name,
>  			n++;
>  		} while (1);
>  
> -		close(crashme.fd);
> +		drm_close_driver(crashme.fd);
>  	}
>  
>  	timer_delete(timer);
> @@ -274,7 +274,7 @@ static void multigpu_threads(int timeout, unsigned int flags, int gpu_count)
>  
>  		igt_waitchildren();
>  		gem_quiescent_gpu(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  
>  	igt_waitchildren();
> @@ -293,7 +293,7 @@ static void threads(int timeout, unsigned int flags)
>  	igt_waitchildren();
>  
>  	gem_quiescent_gpu(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  igt_main
> @@ -317,7 +317,7 @@ igt_main
>  		gpu_count = igt_device_filter_count();
>  
>  		igt_fork_hang_detector(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  
>  	igt_describe("Basic workload submission.");
> @@ -329,7 +329,7 @@ igt_main
>  		igt_waitchildren();
>  
>  		gem_quiescent_gpu(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  
>  	igt_describe("Basic workload submission on multi-GPU machine.");
> @@ -342,7 +342,7 @@ igt_main
>  			igt_assert(fd > 0);
>  			process(fd, child);
>  			gem_quiescent_gpu(fd);
> -			close(fd);
> +			drm_close_driver(fd);
>  		}
>  
>  		igt_waitchildren();
> @@ -369,7 +369,7 @@ igt_main
>  		igt_waitchildren();
>  
>  		gem_quiescent_gpu(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  
>  	igt_describe("Share buffer handle across different drm fd's and trying to race"
> diff --git a/tests/i915/gem_cs_tlb.c b/tests/i915/gem_cs_tlb.c
> index 2117b41e4..ff96e63ed 100644
> --- a/tests/i915/gem_cs_tlb.c
> +++ b/tests/i915/gem_cs_tlb.c
> @@ -162,5 +162,5 @@ igt_main
>  	}
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_ctx_bad_destroy.c b/tests/i915/gem_ctx_bad_destroy.c
> index 50bb9aa07..5dc6d040d 100644
> --- a/tests/i915/gem_ctx_bad_destroy.c
> +++ b/tests/i915/gem_ctx_bad_destroy.c
> @@ -80,5 +80,5 @@ igt_main
>  	}
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
> index a59abd080..a2d4f56ab 100644
> --- a/tests/i915/gem_ctx_create.c
> +++ b/tests/i915/gem_ctx_create.c
> @@ -117,7 +117,7 @@ static void files(int core, const intel_ctx_cfg_t *cfg,
>  			gem_execbuf(fd, &execbuf);
>  
>  			intel_ctx_destroy(fd, ctx);
> -			close(fd);
> +			drm_close_driver(fd);
>  			count++;
>  
>  			clock_gettime(CLOCK_MONOTONIC, &end);
> @@ -667,6 +667,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_stop_hang_detector();
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> index 40a373ab6..b79be4946 100644
> --- a/tests/i915/gem_ctx_exec.c
> +++ b/tests/i915/gem_ctx_exec.c
> @@ -344,7 +344,7 @@ static void nohangcheck_hostile(int i915)
>  	put_ahnd(ahnd);
>  
>  	close(dir);
> -	close(i915);
> +	drm_close_driver(i915);
>  }
>  
>  static void close_race(int i915)
> diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
> index 2526b09cb..ac78b33a6 100644
> --- a/tests/i915/gem_ctx_param.c
> +++ b/tests/i915/gem_ctx_param.c
> @@ -472,5 +472,5 @@ igt_main
>  		test_get_invalid_param(fd, I915_CONTEXT_PARAM_ENGINES);
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index c0197cea7..e04a34c2a 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -604,7 +604,7 @@ static void test_nonpersistent_file(int i915)
>  	gem_context_set_persistence(i915, 0, false);
>  	spin = igt_spin_new(i915, .ahnd = ahnd, .flags = IGT_SPIN_FENCE_OUT);
>  
> -	close(i915);
> +	drm_close_driver(i915);
>  	flush_delayed_fput(debugfs);
>  
>  	igt_assert_eq(wait_for_status(spin->out_fence, reset_timeout_ms), -EIO);
> @@ -1087,7 +1087,7 @@ static void __smoker(int i915, const intel_ctx_cfg_t *cfg,
>  
>  	intel_ctx_destroy(fd, ctx);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  	flush_delayed_fput(i915);
>  
>  	igt_spin_end(spin);
> @@ -1383,6 +1383,6 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index 77a210d03..0e121647e 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -246,7 +246,7 @@ static void exhaust_shared_gtt(int i915, unsigned int flags)
>  		igt_info("Created %lu shared contexts, before %d (%s)\n",
>  			 count, err, strerror(-err));
>  	}
> -	close(i915);
> +	drm_close_driver(i915);
>  	igt_waitchildren();
>  }
>  
> diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
> index 7685511f0..dcc38ae17 100644
> --- a/tests/i915/gem_ctx_sseu.c
> +++ b/tests/i915/gem_ctx_sseu.c
> @@ -545,6 +545,6 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_ctx_switch.c b/tests/i915/gem_ctx_switch.c
> index 4e46b7634..f675570ec 100644
> --- a/tests/i915/gem_ctx_switch.c
> +++ b/tests/i915/gem_ctx_switch.c
> @@ -440,6 +440,6 @@ igt_main
>  		igt_stop_hang_detector();
>  		gem_close(fd, heavy);
>  		gem_close(fd, light);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index 18eec0413..159b849db 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -461,7 +461,7 @@ static void test_banned(int fd)
>  {
>  	fd = reopen_device(fd);
>  	__test_banned(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  #define TEST_WEDGE (1)
> @@ -495,7 +495,7 @@ static void test_wait(int fd, unsigned int flags, unsigned int wait)
>  	igt_require(i915_reset_control(fd, true));
>  
>  	trigger_reset(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void test_suspend(int fd, int state)
> @@ -513,7 +513,7 @@ static void test_suspend(int fd, int state)
>  
>  	igt_require(i915_reset_control(fd, true));
>  	trigger_reset(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void test_inflight(int fd, unsigned int wait)
> @@ -577,7 +577,7 @@ static void test_inflight(int fd, unsigned int wait)
>  		trigger_reset(fd);
>  
>  		gem_close(fd, obj[1].handle);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
>  
> @@ -638,7 +638,7 @@ static void test_inflight_suspend(int fd)
>  
>  	igt_assert(i915_reset_control(fd, true));
>  	trigger_reset(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static const intel_ctx_t *context_create_safe(int i915)
> @@ -728,7 +728,7 @@ static void test_inflight_contexts(int fd, unsigned int wait)
>  		for (unsigned int n = 0; n < ARRAY_SIZE(ctx); n++)
>  			intel_ctx_destroy(fd, ctx[n]);
>  
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
>  
> @@ -784,7 +784,7 @@ static void test_inflight_external(int fd)
>  	put_ahnd(ahnd);
>  	igt_assert(i915_reset_control(fd, true));
>  	trigger_reset(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void test_inflight_internal(int fd, unsigned int wait)
> @@ -834,7 +834,7 @@ static void test_inflight_internal(int fd, unsigned int wait)
>  
>  	igt_assert(i915_reset_control(fd, true));
>  	trigger_reset(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void reset_stress(int fd, uint64_t ahnd, const intel_ctx_t *ctx0,
> diff --git a/tests/i915/gem_evict_alignment.c b/tests/i915/gem_evict_alignment.c
> index 0b560ab03..7a40b0128 100644
> --- a/tests/i915/gem_evict_alignment.c
> +++ b/tests/i915/gem_evict_alignment.c
> @@ -265,6 +265,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_stop_hang_helper();
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_evict_everything.c b/tests/i915/gem_evict_everything.c
> index 120f89072..d5d464889 100644
> --- a/tests/i915/gem_evict_everything.c
> +++ b/tests/i915/gem_evict_everything.c
> @@ -290,6 +290,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_stop_hang_helper();
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
> index ddddad533..947d17cb8 100644
> --- a/tests/i915/gem_exec_alignment.c
> +++ b/tests/i915/gem_exec_alignment.c
> @@ -465,7 +465,7 @@ static void forked(int i915, int timeout)
>  	igt_waitchildren_timeout(3 * timeout, NULL);
>  
>  	free(obj);
> -	close(i915);
> +	drm_close_driver(i915);
>  }
>  
>  static void single(int fd)
> diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
> index 173bc4648..6895b9c6c 100644
> --- a/tests/i915/gem_exec_async.c
> +++ b/tests/i915/gem_exec_async.c
> @@ -213,6 +213,6 @@ igt_main
>  	igt_fixture {
>  		igt_stop_hang_detector();
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
> index 4935cf395..0fd8cbf67 100644
> --- a/tests/i915/gem_exec_await.c
> +++ b/tests/i915/gem_exec_await.c
> @@ -287,6 +287,6 @@ igt_main
>  	igt_fixture {
>  		igt_stop_hang_detector();
>  		intel_ctx_destroy(device, ctx);
> -		close(device);
> +		drm_close_driver(device);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
> index ca4fc7b96..c018d4089 100644
> --- a/tests/i915/gem_exec_basic.c
> +++ b/tests/i915/gem_exec_basic.c
> @@ -98,6 +98,6 @@ igt_main
>  		igt_collection_destroy(set);
>  		igt_stop_hang_detector();
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
> index 4619bda81..5a8df7264 100644
> --- a/tests/i915/gem_exec_big.c
> +++ b/tests/i915/gem_exec_big.c
> @@ -326,5 +326,5 @@ igt_main
>  		exhaustive(i915);
>  
>  	igt_fixture
> -		close(i915);
> +		drm_close_driver(i915);
>  }
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index 5d3e0905d..b8d390a63 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -1013,6 +1013,6 @@ igt_main
>  		close(dir);
>  		igt_disallow_hang(fd, hang);
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
> index 449aa5b2e..8ca564b09 100644
> --- a/tests/i915/gem_exec_create.c
> +++ b/tests/i915/gem_exec_create.c
> @@ -225,6 +225,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_stop_hang_detector();
> -		close(device);
> +		drm_close_driver(device);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
> index 67af4739d..3ec5ed42a 100644
> --- a/tests/i915/gem_exec_fair.c
> +++ b/tests/i915/gem_exec_fair.c
> @@ -1348,6 +1348,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_stop_hang_detector();
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index 70f86da5c..eebeead95 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -1768,7 +1768,7 @@ static void test_invalid_timeline_fence_array(int fd)
>  	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EFAULT);
>  
>  	munmap(ptr, 4096);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static const char *test_syncobj_timeline_unused_fence_desc =
> @@ -3351,6 +3351,6 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
> index 42ddbc529..6a156c5c5 100644
> --- a/tests/i915/gem_exec_flush.c
> +++ b/tests/i915/gem_exec_flush.c
> @@ -711,6 +711,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_stop_hang_detector();
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> index d6c8f2192..320b47001 100644
> --- a/tests/i915/gem_exec_gttfill.c
> +++ b/tests/i915/gem_exec_gttfill.c
> @@ -279,7 +279,7 @@ igt_main
>  			// release resources
>  			igt_stop_hang_detector();
>  			intel_ctx_destroy(g_fd, ctx);
> -			close(g_fd);
> +			drm_close_driver(g_fd);
>  		}
>  
>  		igt_waitchildren();
> @@ -287,6 +287,6 @@ igt_main
>  
>  	igt_fixture {
>  		intel_allocator_multiprocess_stop();
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
> index 4838a7082..d344db05e 100644
> --- a/tests/i915/gem_exec_latency.c
> +++ b/tests/i915/gem_exec_latency.c
> @@ -971,6 +971,6 @@ igt_main
>  	igt_fixture {
>  		intel_register_access_fini(&mmio_data);
>  		intel_ctx_destroy(device, ctx);
> -		close(device);
> +		drm_close_driver(device);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> index f1ec23e8c..079731704 100644
> --- a/tests/i915/gem_exec_nop.c
> +++ b/tests/i915/gem_exec_nop.c
> @@ -1083,6 +1083,6 @@ igt_main
>  		igt_stop_hang_detector();
>  		gem_close(device, handle);
>  		intel_ctx_destroy(device, ctx);
> -		close(device);
> +		drm_close_driver(device);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
> index 97257ea49..91ab4cd75 100644
> --- a/tests/i915/gem_exec_parallel.c
> +++ b/tests/i915/gem_exec_parallel.c
> @@ -181,7 +181,7 @@ static void *thread(void *data)
>  		intel_ctx_destroy(fd, tmp_ctx);
>  	gem_close(fd, obj[1].handle);
>  	if (t->flags & FDS)
> -		close(fd);
> +		drm_close_driver(fd);
>  
>  	t->used = used;
>  	return NULL;
> @@ -364,6 +364,6 @@ igt_main
>  	igt_fixture {
>  		igt_stop_hang_detector();
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
> index d0805d330..80024fb3d 100644
> --- a/tests/i915/gem_exec_params.c
> +++ b/tests/i915/gem_exec_params.c
> @@ -646,6 +646,6 @@ igt_main
>  	igt_fixture {
>  		gem_close(fd, handle);
>  
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> index 3ce89ca64..bcaffd1d9 100644
> --- a/tests/i915/gem_exec_reloc.c
> +++ b/tests/i915/gem_exec_reloc.c
> @@ -1178,5 +1178,5 @@ igt_main
>  	}
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> index ab1dd7749..a12db4df2 100644
> --- a/tests/i915/gem_exec_schedule.c
> +++ b/tests/i915/gem_exec_schedule.c
> @@ -3369,6 +3369,6 @@ igt_main
>  	igt_fixture {
>  		igt_stop_hang_detector();
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
> index 7d23bcd5b..6bf392bd2 100644
> --- a/tests/i915/gem_exec_store.c
> +++ b/tests/i915/gem_exec_store.c
> @@ -455,6 +455,6 @@ igt_main
>  	igt_fixture {
>  		igt_stop_hang_detector();
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
> index 8d56093fa..2295ed04c 100644
> --- a/tests/i915/gem_exec_suspend.c
> +++ b/tests/i915/gem_exec_suspend.c
> @@ -411,6 +411,6 @@ igt_main
>  		igt_collection_destroy(set);
>  		igt_disallow_hang(fd, hang);
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
> index 80e4b3916..41d9b9d5b 100644
> --- a/tests/i915/gem_exec_whisper.c
> +++ b/tests/i915/gem_exec_whisper.c
> @@ -178,7 +178,7 @@ static void fini_hang(struct hang *h)
>  	put_offset(h->ahnd, h->obj.handle);
>  	put_ahnd(h->ahnd);
>  	intel_ctx_destroy(h->fd, h->ctx);
> -	close(h->fd);
> +	drm_close_driver(h->fd);
>  }
>  
>  static void ctx_set_random_priority(int fd, uint32_t ctx)
> @@ -550,7 +550,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
>  			gem_close(fd, batches[n].handle);
>  		if (flags & FDS) {
>  			for (n = 0; n < 64; n++)
> -				close(fds[n]);
> +				drm_close_driver(fds[n]);
>  		}
>  	}
>  
> @@ -660,6 +660,6 @@ igt_main
>  	igt_fixture {
>  		intel_allocator_multiprocess_stop();
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_exercise_blt.c b/tests/i915/gem_exercise_blt.c
> index fb11fb925..365b9b005 100644
> --- a/tests/i915/gem_exercise_blt.c
> +++ b/tests/i915/gem_exercise_blt.c
> @@ -381,6 +381,6 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  	}
>  
>  	igt_fixture {
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/gem_fd_exhaustion.c b/tests/i915/gem_fd_exhaustion.c
> index a6463685e..717422951 100644
> --- a/tests/i915/gem_fd_exhaustion.c
> +++ b/tests/i915/gem_fd_exhaustion.c
> @@ -69,5 +69,5 @@ igt_simple_main
>  
>  	igt_waitchildren();
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_fence_thrash.c b/tests/i915/gem_fence_thrash.c
> index 89a5ae29d..5ff52a5c0 100644
> --- a/tests/i915/gem_fence_thrash.c
> +++ b/tests/i915/gem_fence_thrash.c
> @@ -225,7 +225,7 @@ static int run_test(int threads_per_fence, void *f, int tiling,
>  		igt_assert(func(&t) == (void *)0);
>  	}
>  
> -	close(t.fd);
> +	drm_close_driver(t.fd);
>  
>  	return 0;
>  }
> diff --git a/tests/i915/gem_fenced_exec_thrash.c b/tests/i915/gem_fenced_exec_thrash.c
> index a9597d801..03ba200a7 100644
> --- a/tests/i915/gem_fenced_exec_thrash.c
> +++ b/tests/i915/gem_fenced_exec_thrash.c
> @@ -199,5 +199,5 @@ igt_main
>  		run_test(fd, num_fences + 1, intel_gen(devid) >= 4 ? 0 : ENOBUFS, 0);
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
> index e9b915082..9a014eb07 100644
> --- a/tests/i915/gem_flink_basic.c
> +++ b/tests/i915/gem_flink_basic.c
> @@ -147,7 +147,7 @@ test_flink_lifetime(int fd)
>  	igt_assert_eq(ret, 0);
>  	igt_assert(open_struct.handle != 0);
>  
> -	close(fd2);
> +	drm_close_driver(fd2);
>  	fd2 = drm_open_driver(DRIVER_INTEL);
>  
>  	/* Flink name remains valid due to the second reference */
> @@ -156,7 +156,7 @@ test_flink_lifetime(int fd)
>  	igt_assert_eq(ret, 0);
>  	igt_assert(open_struct.handle != 0);
>  
> -	close(fd2);
> +	drm_close_driver(fd2);
>  }
>  
>  igt_main
> diff --git a/tests/i915/gem_flink_race.c b/tests/i915/gem_flink_race.c
> index 70e133d70..c167e5789 100644
> --- a/tests/i915/gem_flink_race.c
> +++ b/tests/i915/gem_flink_race.c
> @@ -127,7 +127,7 @@ static void test_flink_name(int timeout)
>  		 igt_stats_get_max(&stats));
>  	igt_stats_fini(&stats);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void *thread_fn_flink_close(void *p)
> @@ -188,13 +188,13 @@ static void test_flink_close(void)
>  		igt_assert(status == 0);
>  	}
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  
>  	obj_count = igt_get_stable_obj_count(fake) - obj_count;
>  
>  	igt_info("leaked %i objects\n", obj_count);
>  
> -	close(fake);
> +	drm_close_driver(fake);
>  
>  	igt_assert_eq(obj_count, 0);
>  }
> diff --git a/tests/i915/gem_gtt_cpu_tlb.c b/tests/i915/gem_gtt_cpu_tlb.c
> index 8000e58cc..5f0a19b8b 100644
> --- a/tests/i915/gem_gtt_cpu_tlb.c
> +++ b/tests/i915/gem_gtt_cpu_tlb.c
> @@ -105,5 +105,5 @@ igt_simple_main
>  	for (i = 0; i < OBJ_SIZE/4; i++)
>  		igt_assert(ptr[i] == i);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_gtt_hog.c b/tests/i915/gem_gtt_hog.c
> index 15a6139ea..c365f1196 100644
> --- a/tests/i915/gem_gtt_hog.c
> +++ b/tests/i915/gem_gtt_hog.c
> @@ -164,7 +164,7 @@ igt_simple_main
>  	int fd = drm_open_driver(DRIVER_INTEL);
>  	igt_require_gem(fd);
>  	gem_require_mappable_ggtt(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  
>  	data.fd = drm_open_driver(DRIVER_INTEL);
>  	data.devid = intel_get_drm_devid(data.fd);
> diff --git a/tests/i915/gem_gtt_speed.c b/tests/i915/gem_gtt_speed.c
> index 272091fdb..d142b1cf7 100644
> --- a/tests/i915/gem_gtt_speed.c
> +++ b/tests/i915/gem_gtt_speed.c
> @@ -515,5 +515,5 @@ igt_simple_main_args("s:", NULL, help_str, opt_handler, NULL)
>  	}
>  
>  	gem_close(fd, handle);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_huc_copy.c b/tests/i915/gem_huc_copy.c
> index ea32b705a..9c31eeaea 100644
> --- a/tests/i915/gem_huc_copy.c
> +++ b/tests/i915/gem_huc_copy.c
> @@ -139,6 +139,6 @@ igt_main
>  
>  	igt_fixture {
>  		put_ahnd(ahnd);
> -		close(drm_fd);
> +		drm_close_driver(drm_fd);
>  	}
>  }
> diff --git a/tests/i915/gem_lmem_evict.c b/tests/i915/gem_lmem_evict.c
> index d2611bd56..7072b9565 100644
> --- a/tests/i915/gem_lmem_evict.c
> +++ b/tests/i915/gem_lmem_evict.c
> @@ -93,7 +93,7 @@ igt_main
>  			igt_require_fd(i915);
>  			igt_require_gem(i915);
>  			igt_require(gem_has_lmem(i915));
> -			close(i915);
> +			drm_close_driver(i915);
>  		}
>  
>  		igt_i915_driver_unload();
> @@ -132,7 +132,7 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		close(i915);
> +		drm_close_driver(i915);
>  		igt_i915_driver_unload();
>  	}
>  }
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index 4177286b0..0bd71babe 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -551,7 +551,7 @@ static void test_evict(int i915,
>  
>  		igt_waitchildren();
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  		intel_allocator_multiprocess_stop();
>  	} else {
>  		__do_evict(i915, ctx, &region->region, &params, params.seed);
> @@ -623,7 +623,7 @@ static void test_smem_oom(int i915,
>  			   params.seed + child + 1);
>  
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  
>  	/* smem memory hog process, respawn till the lmem process completes */
> @@ -644,7 +644,7 @@ static void test_smem_oom(int i915,
>  						break;
>  					gem_leak(fd, alloc);
>  				}
> -				close(fd);
> +				drm_close_driver(fd);
>  			}
>  			/*
>  			 * Wait for grand-child processes to finish or be
> @@ -736,7 +736,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  			igt_require_fd(i915);
>  			igt_require_gem(i915);
>  			igt_require(gem_has_lmem(i915));
> -			close(i915);
> +			drm_close_driver(i915);
>  		}
>  
>  		igt_i915_driver_unload();
> @@ -781,7 +781,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  	igt_fixture {
>  		intel_ctx_destroy(i915, ctx);
>  		free(regions);
> -		close(i915);
> +		drm_close_driver(i915);
>  		igt_i915_driver_unload();
>  	}
>  
> diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
> index 2502d84c7..c141d208d 100644
> --- a/tests/i915/gem_madvise.c
> +++ b/tests/i915/gem_madvise.c
> @@ -77,7 +77,7 @@ dontneed_before_mmap(void)
>  					PROT_READ | PROT_WRITE,
>  					t->type);
>  
> -		close(fd);
> +		drm_close_driver(fd);
>  		if (!ptr)
>  			continue;
>  
> @@ -99,7 +99,7 @@ dontneed_before_mmap(void)
>  		fd = drm_open_driver(DRIVER_INTEL);
>  	}
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void
> @@ -123,7 +123,7 @@ dontneed_after_mmap(void)
>  					t->type);
>  
>  		gem_madvise(fd, handle, I915_MADV_DONTNEED);
> -		close(fd);
> +		drm_close_driver(fd);
>  		if (!ptr)
>  			continue;
>  
> @@ -145,7 +145,7 @@ dontneed_after_mmap(void)
>  		fd = drm_open_driver(DRIVER_INTEL);
>  	}
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void
> @@ -161,7 +161,7 @@ dontneed_before_pwrite(void)
>  
>  	igt_assert_eq(__gem_write(fd, handle, 0, &bbe, sizeof(bbe)), -EFAULT);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void
> @@ -185,7 +185,7 @@ dontneed_before_exec(void)
>  	execbuf.batch_len = sizeof(buf);
>  	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EFAULT);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  igt_main
> diff --git a/tests/i915/gem_media_fill.c b/tests/i915/gem_media_fill.c
> index e418047c2..127d7e3a6 100644
> --- a/tests/i915/gem_media_fill.c
> +++ b/tests/i915/gem_media_fill.c
> @@ -173,6 +173,6 @@ igt_main
>  	igt_fixture {
>  		igt_collection_destroy(set);
>  		igt_stop_hang_detector();
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
> index 61f862a8e..053c9ed4c 100644
> --- a/tests/i915/gem_mmap.c
> +++ b/tests/i915/gem_mmap.c
> @@ -315,5 +315,5 @@ igt_main
>  		test_huge_bo(2);
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> index 0b3a6e5b7..dae6d66b3 100644
> --- a/tests/i915/gem_mmap_gtt.c
> +++ b/tests/i915/gem_mmap_gtt.c
> @@ -381,13 +381,13 @@ test_isolation(int i915)
>  	igt_info("B: {fd:%d, handle:%d, offset:%"PRIx64"}\n",
>  		 B, b, offset_b);
>  
> -	close(B);
> +	drm_close_driver(B);
>  
>  	ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
>  	igt_assert(ptr != MAP_FAILED);
>  	munmap(ptr, 4096);
>  
> -	close(A);
> +	drm_close_driver(A);
>  
>  	ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
>  	igt_assert(ptr == MAP_FAILED);
> @@ -1491,5 +1491,5 @@ igt_main
>  
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index e7659e301..07d68594e 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -346,13 +346,13 @@ static void isolation(int i915)
>  				igt_assert_eq(errno, EACCES);
>  			}
>  
> -			close(B);
> +			drm_close_driver(B);
>  
>  			ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
>  			igt_assert(ptr != MAP_FAILED);
>  			munmap(ptr, 4096);
>  
> -			close(A);
> +			drm_close_driver(A);
>  
>  			ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
>  			igt_assert(ptr == MAP_FAILED);
> @@ -647,7 +647,7 @@ static void open_flood(int i915, int timeout)
>  			mmap_offset_ioctl(i915, &arg);
>  		}
>  
> -		close(tmp);
> +		drm_close_driver(tmp);
>  		count++;
>  	}
>  
> @@ -925,6 +925,6 @@ igt_main
>  		blt_coherency(i915);
>  
>  	igt_fixture {
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
> index 6dc7bae49..9fc26593e 100644
> --- a/tests/i915/gem_mmap_wc.c
> +++ b/tests/i915/gem_mmap_wc.c
> @@ -620,5 +620,5 @@ igt_main
>  		test_set_cache_level(fd);
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_partial_pwrite_pread.c b/tests/i915/gem_partial_pwrite_pread.c
> index 474149d48..affce4ee6 100644
> --- a/tests/i915/gem_partial_pwrite_pread.c
> +++ b/tests/i915/gem_partial_pwrite_pread.c
> @@ -326,6 +326,6 @@ igt_main
>  		intel_buf_destroy(scratch_buf);
>  		intel_buf_destroy(staging_buf);
>  		buf_ops_destroy(data.bops);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
> index 59959a374..8e9af5088 100644
> --- a/tests/i915/gem_pipe_control_store_loop.c
> +++ b/tests/i915/gem_pipe_control_store_loop.c
> @@ -183,6 +183,6 @@ igt_main
>  
>  	igt_fixture {
>  		buf_ops_destroy(bops);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
> index c3102857a..09b4c6acc 100644
> --- a/tests/i915/gem_ppgtt.c
> +++ b/tests/i915/gem_ppgtt.c
> @@ -251,8 +251,8 @@ static void flink_and_close(void)
>  	igt_assert_eq(offset, offset_new);
>  
>  	gem_close(fd, bo);
> -	close(fd);
> -	close(fd2);
> +	drm_close_driver(fd);
> +	drm_close_driver(fd2);
>  }
>  
>  #define PAGE_SIZE 4096
> @@ -385,7 +385,7 @@ static bool has_contexts(void)
>  
>  	fd = drm_open_driver(DRIVER_INTEL);
>  	result = gem_has_contexts(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  
>  	return result;
>  }
> @@ -398,7 +398,7 @@ igt_main
>  		int fd = drm_open_driver(DRIVER_INTEL);
>  		igt_require_gem(fd);
>  		gem_require_blitter(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  
>  	igt_subtest("blt-vs-render-ctx0") {
> diff --git a/tests/i915/gem_pread.c b/tests/i915/gem_pread.c
> index a8bf2b054..e76dbce1f 100644
> --- a/tests/i915/gem_pread.c
> +++ b/tests/i915/gem_pread.c
> @@ -350,6 +350,6 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
>  		free(src);
>  		gem_close(fd, dst);
>  
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_pread_after_blit.c b/tests/i915/gem_pread_after_blit.c
> index 3b56f787a..d5d20f58d 100644
> --- a/tests/i915/gem_pread_after_blit.c
> +++ b/tests/i915/gem_pread_after_blit.c
> @@ -252,5 +252,5 @@ igt_main
>  	}
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_pwrite.c b/tests/i915/gem_pwrite.c
> index 6e3f833cd..353ce1a01 100644
> --- a/tests/i915/gem_pwrite.c
> +++ b/tests/i915/gem_pwrite.c
> @@ -572,5 +572,5 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
>  	}
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_pwrite_snooped.c b/tests/i915/gem_pwrite_snooped.c
> index e6a10747d..8883b2737 100644
> --- a/tests/i915/gem_pwrite_snooped.c
> +++ b/tests/i915/gem_pwrite_snooped.c
> @@ -140,5 +140,5 @@ igt_simple_main
>  	test(256, 256);
>  
>  	buf_ops_destroy(bops);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> index 2f27abd58..a4209945f 100644
> --- a/tests/i915/gem_pxp.c
> +++ b/tests/i915/gem_pxp.c
> @@ -1293,6 +1293,6 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/gem_read_read_speed.c b/tests/i915/gem_read_read_speed.c
> index 7c5c90f79..9e84c7a27 100644
> --- a/tests/i915/gem_read_read_speed.c
> +++ b/tests/i915/gem_read_read_speed.c
> @@ -214,6 +214,6 @@ igt_main
>  
>  	igt_fixture {
>  		buf_ops_destroy(bops);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_readwrite.c b/tests/i915/gem_readwrite.c
> index 2d437dec3..6a24d74ec 100644
> --- a/tests/i915/gem_readwrite.c
> +++ b/tests/i915/gem_readwrite.c
> @@ -143,5 +143,5 @@ igt_main
>  	}
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_reg_read.c b/tests/i915/gem_reg_read.c
> index 79facc1f2..302aa82ab 100644
> --- a/tests/i915/gem_reg_read.c
> +++ b/tests/i915/gem_reg_read.c
> @@ -170,6 +170,6 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_render_copy.c b/tests/i915/gem_render_copy.c
> index 2c150b2b0..0eaa10754 100644
> --- a/tests/i915/gem_render_copy.c
> +++ b/tests/i915/gem_render_copy.c
> @@ -879,6 +879,6 @@ igt_main_args("dac", NULL, help_str, opt_handler, NULL)
>  		igt_stop_hang_detector();
>  		buf_ops_destroy(data.bops);
>  		igt_collection_destroy(set);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/gem_render_copy_redux.c b/tests/i915/gem_render_copy_redux.c
> index 5e1daccf1..dd7917413 100644
> --- a/tests/i915/gem_render_copy_redux.c
> +++ b/tests/i915/gem_render_copy_redux.c
> @@ -81,7 +81,7 @@ static void data_init(data_t *data)
>  static void data_fini(data_t *data)
>  {
>  	buf_ops_destroy(data->bops);
> -	close(data->fd);
> +	drm_close_driver(data->fd);
>  }
>  
>  static void scratch_buf_init(data_t *data, struct intel_buf *buf,
> diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
> index ddc61781c..3ba2d0c7b 100644
> --- a/tests/i915/gem_reset_stats.c
> +++ b/tests/i915/gem_reset_stats.c
> @@ -297,7 +297,7 @@ static void test_rs(const struct intel_execution_ring *e,
>  	igt_assert(igt_seconds_elapsed(&ts_injected) <= 30);
>  
>  	for (i = 0; i < num_fds; i++)
> -		close(fd[i]);
> +		drm_close_driver(fd[i]);
>  }
>  
>  #define MAX_CTX 100
> @@ -373,7 +373,7 @@ static void test_rs_ctx(const struct intel_execution_ring *e,
>  
>  	for (i = 0; i < num_fds; i++) {
>  		assert_reset_status(i, fd[i], 0, RS_NO_ERROR);
> -		close(fd[i]);
> +		drm_close_driver(fd[i]);
>  	}
>  }
>  
> @@ -427,8 +427,8 @@ static void test_ban(const struct intel_execution_ring *e)
>  	igt_assert_eq(gem_reset_stats(fd_good, 0, &rs_good), 0);
>  	igt_assert_eq(rs_good.batch_active, 0);
>  
> -	close(fd_bad);
> -	close(fd_good);
> +	drm_close_driver(fd_bad);
> +	drm_close_driver(fd_good);
>  }
>  
>  static void test_ban_ctx(const struct intel_execution_ring *e)
> @@ -486,7 +486,7 @@ static void test_ban_ctx(const struct intel_execution_ring *e)
>  	igt_assert_eq(gem_reset_stats(fd, ctx_good, &rs_good), 0);
>  	igt_assert_eq(rs_good.batch_active, 0);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void test_unrelated_ctx(const struct intel_execution_ring *e)
> @@ -512,8 +512,8 @@ static void test_unrelated_ctx(const struct intel_execution_ring *e)
>  	assert_reset_status(0, fd1, ctx_guilty, RS_BATCH_ACTIVE);
>  	assert_reset_status(1, fd2, ctx_unrelated, RS_NO_ERROR);
>  
> -	close(fd1);
> -	close(fd2);
> +	drm_close_driver(fd1);
> +	drm_close_driver(fd2);
>  }
>  
>  static int get_reset_count(int fd, int ctx)
> @@ -539,7 +539,7 @@ static void test_close_pending_ctx(const struct intel_execution_ring *e)
>  	gem_context_destroy(fd, ctx);
>  	igt_assert_eq(__gem_context_destroy(fd, ctx), -ENOENT);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void test_close_pending(const struct intel_execution_ring *e)
> @@ -549,7 +549,7 @@ static void test_close_pending(const struct intel_execution_ring *e)
>  	assert_reset_status(fd, fd, 0, RS_NO_ERROR);
>  
>  	inject_hang(fd, 0, e, 0);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void noop_on_each_ring(int fd, const bool reverse)
> @@ -611,7 +611,7 @@ static void test_close_pending_fork(const struct intel_execution_ring *e,
>  		 * when gpu is reset and ring lists are cleared.
>  		 */
>  		noop_on_each_ring(fd2, reverse);
> -		close(fd2);
> +		drm_close_driver(fd2);
>  		pause();
>  		exit(0);
>  	} else {
> @@ -624,7 +624,7 @@ static void test_close_pending_fork(const struct intel_execution_ring *e,
>  	}
>  
>  	igt_post_hang_ring(fd, hang);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void test_reset_count(const struct intel_execution_ring *e,
> @@ -664,7 +664,7 @@ static void test_reset_count(const struct intel_execution_ring *e,
>  	if (create_ctx)
>  		gem_context_destroy(fd, ctx);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static int _test_params(int fd, int ctx, uint32_t flags, uint32_t pad)
> @@ -735,7 +735,7 @@ static void test_params_ctx(void)
>  
>  	fd = drm_reopen_driver(device);
>  	_test_param(fd, gem_context_create(fd));
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void test_params(void)
> @@ -744,7 +744,7 @@ static void test_params(void)
>  
>  	fd = drm_reopen_driver(device);
>  	_test_param(fd, 0);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static const struct intel_execution_ring *
> @@ -790,7 +790,7 @@ static void defer_hangcheck(const struct intel_execution_ring *engine)
>  
>  	igt_assert_lt(count_start, count_end);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static bool gem_has_reset_stats(int fd)
> @@ -999,6 +999,6 @@ igt_main
>  	}
>  	igt_fixture {
>  		igt_assert(igt_params_set(device, "reset", "%d", INT_MAX /* any reset method */));
> -		close(device);
> +		drm_close_driver(device);
>  	}
>  }
> diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> index de6e26bf4..70ebc0c60 100644
> --- a/tests/i915/gem_ringfill.c
> +++ b/tests/i915/gem_ringfill.c
> @@ -401,6 +401,6 @@ igt_main
>  
>  	igt_fixture {
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_set_tiling_vs_blt.c b/tests/i915/gem_set_tiling_vs_blt.c
> index 5e3bf6a12..7148c9d18 100644
> --- a/tests/i915/gem_set_tiling_vs_blt.c
> +++ b/tests/i915/gem_set_tiling_vs_blt.c
> @@ -261,6 +261,6 @@ igt_main
>  
>  	igt_fixture{
>  		buf_ops_destroy(bops);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_set_tiling_vs_gtt.c b/tests/i915/gem_set_tiling_vs_gtt.c
> index 2f890e83b..4ebf17dcb 100644
> --- a/tests/i915/gem_set_tiling_vs_gtt.c
> +++ b/tests/i915/gem_set_tiling_vs_gtt.c
> @@ -130,5 +130,5 @@ igt_simple_main
>  
>  	munmap(ptr, OBJECT_SIZE);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_set_tiling_vs_pwrite.c b/tests/i915/gem_set_tiling_vs_pwrite.c
> index 6bec7f27e..170195e47 100644
> --- a/tests/i915/gem_set_tiling_vs_pwrite.c
> +++ b/tests/i915/gem_set_tiling_vs_pwrite.c
> @@ -99,5 +99,5 @@ igt_simple_main
>  
>  	munmap(ptr, OBJECT_SIZE);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
> index 380d2c846..a104c9f3a 100644
> --- a/tests/i915/gem_shrink.c
> +++ b/tests/i915/gem_shrink.c
> @@ -270,7 +270,7 @@ static bool has_userptr(void)
>  	if (drmIoctl(fd, DRM_IOCTL_I915_GEM_USERPTR, &userptr))
>  		err = errno;
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  
>  	return err == EFAULT;
>  }
> @@ -319,7 +319,7 @@ static void run_test(int nchildren, uint64_t alloc,
>  				int fd = drm_open_driver(DRIVER_INTEL);
>  				for (int pass = 0; pass < nchildren; pass++)
>  					leak(fd, alloc);
> -				close(fd);
> +				drm_close_driver(fd);
>  			}
>  		}
>  	}
> @@ -331,7 +331,7 @@ static void run_test(int nchildren, uint64_t alloc,
>  				int fd = drm_open_driver(DRIVER_INTEL);
>  				for (int pass = 0; pass < nchildren; pass++)
>  					userptr(fd, alloc, 0);
> -				close(fd);
> +				drm_close_driver(fd);
>  			}
>  		}
>  		nchildren = (nchildren + 1)/2;
> @@ -344,7 +344,7 @@ static void run_test(int nchildren, uint64_t alloc,
>  				int fd = drm_open_driver(DRIVER_INTEL);
>  				for (int pass = 0; pass < nchildren; pass++)
>  					userptr(fd, alloc, UDIRTY);
> -				close(fd);
> +				drm_close_driver(fd);
>  			}
>  		}
>  		nchildren = (nchildren + 1)/2;
> @@ -356,7 +356,7 @@ static void run_test(int nchildren, uint64_t alloc,
>  			int fd = drm_open_driver(DRIVER_INTEL);
>  			for (int pass = 0; pass < nchildren; pass++)
>  				func(fd, alloc);
> -			close(fd);
> +			drm_close_driver(fd);
>  		}
>  	}
>  	igt_waitchildren();
> @@ -399,7 +399,7 @@ static void reclaim(unsigned engine, int timeout)
>  
>  	munmap((void *)shared, 4096);
>  	close(debugfs);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  igt_main
> @@ -456,7 +456,7 @@ igt_main
>  			 num_processes, alloc_size);
>  
>  		alloc_size <<= 20;
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  
>  	igt_subtest("reclaim")
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> index 933daa4a1..22e11ce43 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -1217,7 +1217,7 @@ static void *thread(void *data)
>  			  fd, ctx->id, t->engine, succeeded);
>  	intel_ctx_destroy(fd, ctx);
>  	gem_close(fd, obj[1].handle);
> -	close(fd);
> +	drm_close_driver(fd);
>  
>  	return (void *) from_user_pointer(ret);
>  }
> @@ -1531,6 +1531,6 @@ igt_main
>  
>  	igt_fixture {
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
> index 7dc68ebc7..68e7af7e3 100644
> --- a/tests/i915/gem_spin_batch.c
> +++ b/tests/i915/gem_spin_batch.c
> @@ -277,6 +277,6 @@ igt_main
>  	igt_fixture {
>  		igt_stop_hang_detector();
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_streaming_writes.c b/tests/i915/gem_streaming_writes.c
> index 883fe4293..a8e6c42a8 100644
> --- a/tests/i915/gem_streaming_writes.c
> +++ b/tests/i915/gem_streaming_writes.c
> @@ -419,5 +419,5 @@ igt_main
>  		test_batch(fd, 2, 1);
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_stress.c b/tests/i915/gem_stress.c
> index 3765ab14b..23690c077 100644
> --- a/tests/i915/gem_stress.c
> +++ b/tests/i915/gem_stress.c
> @@ -926,7 +926,7 @@ igt_simple_main_args("ds:g:c:t:rbuxmo:fp:",
>  	intel_bb_destroy(ibb);
>  	buf_ops_destroy(bops);
>  
> -	close(drm_fd);
> +	drm_close_driver(drm_fd);
>  
>  	igt_stop_signal_helper();
>  }
> diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> index e7dc6637a..18adbd19d 100644
> --- a/tests/i915/gem_sync.c
> +++ b/tests/i915/gem_sync.c
> @@ -1363,6 +1363,6 @@ igt_main
>  		intel_allocator_multiprocess_stop();
>  		igt_stop_hang_detector();
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_tiled_blits.c b/tests/i915/gem_tiled_blits.c
> index 5e7ed0c4e..0f8434d7f 100644
> --- a/tests/i915/gem_tiled_blits.c
> +++ b/tests/i915/gem_tiled_blits.c
> @@ -215,6 +215,6 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
> index a3a0221d6..8e908eac0 100644
> --- a/tests/i915/gem_tiled_fence_blits.c
> +++ b/tests/i915/gem_tiled_fence_blits.c
> @@ -320,5 +320,5 @@ igt_main
>  	}
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_tiled_partial_pwrite_pread.c b/tests/i915/gem_tiled_partial_pwrite_pread.c
> index 95fb69c65..ecc97002e 100644
> --- a/tests/i915/gem_tiled_partial_pwrite_pread.c
> +++ b/tests/i915/gem_tiled_partial_pwrite_pread.c
> @@ -318,6 +318,6 @@ igt_main
>  		intel_buf_destroy(tiled_staging_buf);
>  		buf_ops_destroy(bops);
>  
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/i915/gem_tiled_pread_basic.c
> index 2b4cec6e7..48f5c67e1 100644
> --- a/tests/i915/gem_tiled_pread_basic.c
> +++ b/tests/i915/gem_tiled_pread_basic.c
> @@ -222,5 +222,5 @@ igt_simple_main
>  		}
>  	}
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_tiled_pread_pwrite.c b/tests/i915/gem_tiled_pread_pwrite.c
> index 2d21dfb76..885785cab 100644
> --- a/tests/i915/gem_tiled_pread_pwrite.c
> +++ b/tests/i915/gem_tiled_pread_pwrite.c
> @@ -154,5 +154,5 @@ igt_simple_main
>  		gem_madvise(fd, handle, I915_MADV_DONTNEED);
>  	}
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_tiled_swapping.c b/tests/i915/gem_tiled_swapping.c
> index f4bdce738..718516def 100644
> --- a/tests/i915/gem_tiled_swapping.c
> +++ b/tests/i915/gem_tiled_swapping.c
> @@ -246,5 +246,5 @@ igt_main
>  	}
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_tiled_wb.c b/tests/i915/gem_tiled_wb.c
> index e9efbdf23..b2337806d 100644
> --- a/tests/i915/gem_tiled_wb.c
> +++ b/tests/i915/gem_tiled_wb.c
> @@ -239,5 +239,5 @@ igt_simple_main
>  		munmap(linear, last_page - first_page);
>  	}
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_tiled_wc.c b/tests/i915/gem_tiled_wc.c
> index 1f245eb7d..4f733163b 100644
> --- a/tests/i915/gem_tiled_wc.c
> +++ b/tests/i915/gem_tiled_wc.c
> @@ -243,5 +243,5 @@ igt_simple_main
>  		munmap(linear, last_page - first_page);
>  	}
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_tiling_max_stride.c b/tests/i915/gem_tiling_max_stride.c
> index 513d579d3..d326ae7c2 100644
> --- a/tests/i915/gem_tiling_max_stride.c
> +++ b/tests/i915/gem_tiling_max_stride.c
> @@ -138,5 +138,5 @@ igt_simple_main
>  
>  	munmap(ptr, size);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_unfence_active_buffers.c b/tests/i915/gem_unfence_active_buffers.c
> index a0a601de2..71686095d 100644
> --- a/tests/i915/gem_unfence_active_buffers.c
> +++ b/tests/i915/gem_unfence_active_buffers.c
> @@ -99,5 +99,5 @@ igt_simple_main
>  
>  	igt_spin_free(i915, spin);
>  	put_ahnd(ahnd);
> -	close(i915);
> +	drm_close_driver(i915);
>  }
> diff --git a/tests/i915/gem_unref_active_buffers.c b/tests/i915/gem_unref_active_buffers.c
> index 735c14720..9d92156a1 100644
> --- a/tests/i915/gem_unref_active_buffers.c
> +++ b/tests/i915/gem_unref_active_buffers.c
> @@ -121,5 +121,5 @@ igt_simple_main
>  
>  	igt_spin_free(i915, spin);
>  	put_ahnd(ahnd);
> -	close(i915);
> +	drm_close_driver(i915);
>  }
> diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> index 056c7a7ac..d46623f69 100644
> --- a/tests/i915/gem_userptr_blits.c
> +++ b/tests/i915/gem_userptr_blits.c
> @@ -730,7 +730,7 @@ static void test_nohangcheck_hostile(int i915)
>  	close(fence);
>  
>  	close(dir);
> -	close(i915);
> +	drm_close_driver(i915);
>  }
>  
>  static size_t hugepagesize(void)
> @@ -1288,9 +1288,9 @@ static int test_dmabuf(void)
>  
>  	/* destroy userptr object and expect SIGBUS */
>  	free_userptr_bo(fd1, handle);
> -	close(fd1);
> +	drm_close_driver(fd1);
>  
> -	close(fd2);
> +	drm_close_driver(fd2);
>  	reset_handle_ptr();
>  
>  	return 0;
> diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
> index 44958cce8..fbfd7512a 100644
> --- a/tests/i915/gem_vm_create.c
> +++ b/tests/i915/gem_vm_create.c
> @@ -347,7 +347,7 @@ static void isolation(int i915)
>  	gem_read(i915, obj[0].handle, 0, &result, sizeof(result));
>  	igt_assert_eq(result, 1);
>  
> -	close(other);
> +	drm_close_driver(other);
>  
>  	gem_close(i915, obj[1].handle);
>  	gem_close(i915, obj[0].handle);
> @@ -388,6 +388,6 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
> index 27d084afa..a33e461d8 100644
> --- a/tests/i915/gem_wait.c
> +++ b/tests/i915/gem_wait.c
> @@ -257,6 +257,6 @@ igt_main
>  
>  	igt_fixture {
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
> index 47ccd2caa..12a7d1720 100644
> --- a/tests/i915/gem_watchdog.c
> +++ b/tests/i915/gem_watchdog.c
> @@ -586,6 +586,6 @@ igt_main
>  
>  	igt_fixture {
>  		intel_ctx_destroy(i915, ctx);
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
> index 7462dc600..4b003ffbc 100644
> --- a/tests/i915/gem_workarounds.c
> +++ b/tests/i915/gem_workarounds.c
> @@ -235,7 +235,7 @@ static void check_workarounds(int fd, enum operation op, unsigned int flags)
>  	if (flags & CONTEXT)
>  		intel_ctx_destroy(fd, ctx);
>  	if (flags & FD)
> -		close(fd);
> +		drm_close_driver(fd);
>  }
>  
>  igt_main
> diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
> index e9751ea73..895aea1ea 100644
> --- a/tests/i915/gen7_exec_parse.c
> +++ b/tests/i915/gen7_exec_parse.c
> @@ -445,7 +445,7 @@ static void hsw_load_register_reg(void)
>  				   0xabcdabc0);
>  	}
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  igt_main
> @@ -717,6 +717,6 @@ igt_main
>  		igt_stop_hang_detector();
>  		gem_close(fd, handle);
>  
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
> index 26b151705..e7d47fccc 100644
> --- a/tests/i915/gen9_exec_parse.c
> +++ b/tests/i915/gen9_exec_parse.c
> @@ -1252,6 +1252,6 @@ igt_main
>  		igt_stop_hang_detector();
>  		gem_close(i915, handle);
>  
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/i915_fb_tiling.c b/tests/i915/i915_fb_tiling.c
> index cafa5233c..f3f0c3d0a 100644
> --- a/tests/i915/i915_fb_tiling.c
> +++ b/tests/i915/i915_fb_tiling.c
> @@ -44,5 +44,5 @@ igt_simple_main
>  	igt_assert_eq(ret, -EBUSY);
>  
>  	igt_remove_fb(drm_fd, &fb);
> -	close(drm_fd);
> +	drm_close_driver(drm_fd);
>  }
> diff --git a/tests/i915/i915_getparams_basic.c b/tests/i915/i915_getparams_basic.c
> index 5422d585f..b6988784d 100644
> --- a/tests/i915/i915_getparams_basic.c
> +++ b/tests/i915/i915_getparams_basic.c
> @@ -46,7 +46,7 @@ init(void)
>  static void
>  deinit(void)
>  {
> -	close(drm_fd);
> +	drm_close_driver(drm_fd);
>  }
>  
>  
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index dd396c4e9..d8c9ec0ef 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -97,7 +97,7 @@ static void check_alive(void)
>  	put_ahnd(ahnd);
>  	intel_ctx_destroy(fd, ctx);
>  	gem_quiescent_gpu(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static bool has_error_state(int dir)
> @@ -580,6 +580,6 @@ igt_main
>  
>  		igt_disallow_hang(device, hang);
>  		intel_ctx_destroy(device, ctx);
> -		close(device);
> +		drm_close_driver(device);
>  	}
>  }
> diff --git a/tests/i915/i915_hwmon.c b/tests/i915/i915_hwmon.c
> index 6d9937e99..4b7ecb766 100644
> --- a/tests/i915/i915_hwmon.c
> +++ b/tests/i915/i915_hwmon.c
> @@ -83,6 +83,6 @@ igt_main
>  
>  	igt_fixture {
>  		close(hwm);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
> index 725687dab..057c68906 100644
> --- a/tests/i915/i915_module_load.c
> +++ b/tests/i915/i915_module_load.c
> @@ -238,7 +238,7 @@ static void gem_sanitycheck(void)
>  		store_all(i915);
>  	errno = 0;
>  
> -	close(i915);
> +	drm_close_driver(i915);
>  	igt_assert_eq(err, expected);
>  }
>  
> @@ -286,7 +286,7 @@ static void load_and_check_i915(void)
>  
>  	/* make sure the GPU is idle */
>  	gem_quiescent_gpu(drm_fd);
> -	close(drm_fd);
> +	drm_close_driver(drm_fd);
>  
>  	/* make sure we can do basic memory ops */
>  	gem_sanitycheck();
> @@ -327,7 +327,7 @@ static uint32_t  driver_load_with_lmem_bar_size(uint32_t lmem_bar_size, bool che
>  		}
>  	}
>  
> -	close(i915);
> +	drm_close_driver(i915);
>  
>  	return lmem_bar_size;
>  }
> @@ -419,7 +419,7 @@ igt_main
>  			igt_require_gem(i915);
>  			igt_require(gem_has_lmem(i915));
>  			igt_skip_on_f(igt_sysfs_get_num_gt(i915) > 1, "Skips for more than one lmem instance.\n");
> -			close(i915);
> +			drm_close_driver(i915);
>  		}
>  
>  		/* Test for lmem_bar_size modparam support */
> diff --git a/tests/i915/i915_pciid.c b/tests/i915/i915_pciid.c
> index 377eec58c..9da7dc074 100644
> --- a/tests/i915/i915_pciid.c
> +++ b/tests/i915/i915_pciid.c
> @@ -65,5 +65,5 @@ igt_simple_main
>  
>  	igt_assert(has_known_intel_chipset(intel));
>  
> -	close(intel);
> +	drm_close_driver(intel);
>  }
> diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
> index 829606622..0bdb98f3f 100644
> --- a/tests/i915/i915_pm_backlight.c
> +++ b/tests/i915/i915_pm_backlight.c
> @@ -332,6 +332,6 @@ igt_main
>  
>  		igt_display_fini(&display);
>  		igt_pm_restore_sata_link_power_management();
> -		close(display.drm_fd);
> +		drm_close_driver(display.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 6f08cb3fc..859bfdc55 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -689,7 +689,7 @@ igt_main
>  		close(data.debugfs_root_fd);
>  		close(data.msr_fd);
>  		display_fini(&data);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  
>  	igt_exit();
> diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
> index 662d514a4..096adbbb5 100644
> --- a/tests/i915/i915_pm_freq_api.c
> +++ b/tests/i915/i915_pm_freq_api.c
> @@ -139,6 +139,6 @@ igt_main
>  			igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, stash_max[gt]) > 0);
>  			igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min[gt]) > 0);
>  		}
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/i915_pm_freq_mult.c b/tests/i915/i915_pm_freq_mult.c
> index 894ae294c..825f5a326 100644
> --- a/tests/i915/i915_pm_freq_mult.c
> +++ b/tests/i915/i915_pm_freq_mult.c
> @@ -167,6 +167,6 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
> index 3ad8b2603..fc4404c9b 100644
> --- a/tests/i915/i915_pm_lpsp.c
> +++ b/tests/i915/i915_pm_lpsp.c
> @@ -211,6 +211,6 @@ igt_main
>  	igt_fixture {
>  		free(data.pwr_dmn_info);
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
> index 3554f5d77..0fac22770 100644
> --- a/tests/i915/i915_pm_rc6_residency.c
> +++ b/tests/i915/i915_pm_rc6_residency.c
> @@ -611,6 +611,6 @@ igt_main
>  
>  	igt_fixture {
>  		intel_ctx_destroy(i915, ctx);
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
> index f2374aff0..34abfe690 100644
> --- a/tests/i915/i915_pm_rps.c
> +++ b/tests/i915/i915_pm_rps.c
> @@ -877,7 +877,7 @@ static void pm_rps_exit_handler(int sig)
>  	if (lh.igt_proc.running)
>  		load_helper_stop();
>  
> -	close(drm_fd);
> +	drm_close_driver(drm_fd);
>  }
>  
>  igt_main
> diff --git a/tests/i915/i915_pm_sseu.c b/tests/i915/i915_pm_sseu.c
> index 1b428c9ba..771971851 100644
> --- a/tests/i915/i915_pm_sseu.c
> +++ b/tests/i915/i915_pm_sseu.c
> @@ -315,7 +315,7 @@ gem_deinit(void)
>  	case 2:
>  		buf_ops_destroy(gem.bops);
>  	case 1:
> -		close(gem.drm_fd);
> +		drm_close_driver(gem.drm_fd);
>  	}
>  }
>  
> diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
> index 51b412e3a..9f6235083 100644
> --- a/tests/i915/i915_power.c
> +++ b/tests/i915/i915_power.c
> @@ -76,6 +76,6 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
> index e725e04e4..ea191f8a3 100644
> --- a/tests/i915/i915_query.c
> +++ b/tests/i915/i915_query.c
> @@ -1465,6 +1465,6 @@ igt_main
>  		query_parse_and_validate_hwconfig_table(fd);
>  
>  	igt_fixture {
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> index 5b289ecb2..79004c1cc 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -188,7 +188,7 @@ test_shrink(int fd, unsigned int mode)
>  		igt_system_suspend_autoresume(mode, SUSPEND_TEST_NONE);
>  
>  		munmap(mem, size);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  
>  	igt_waitchildren();
> @@ -232,7 +232,7 @@ test_suspend_without_i915(int state)
>  		igt_pm_get_d3cold_allowed(&card, d3cold_allowed);
>  		igt_pm_set_d3cold_allowed(&card, "0\n");
>  	}
> -	close(fd);
> +	drm_close_driver(fd);
>  
>  	igt_kmsg(KMSG_INFO "Unloading i915\n");
>  	igt_assert_eq(igt_i915_driver_unload(),0);
> @@ -315,5 +315,5 @@ igt_main
>  		test_forcewake(fd, true);
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index cd73b1a98..bb54abccf 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -4518,7 +4518,7 @@ gen12_test_single_ctx_render_target_writes_a_counter(const struct intel_executio
>  			igt_drop_root();
>  			gen12_single_ctx_helper(e);
>  
> -			close(drm_fd);
> +			drm_close_driver(drm_fd);
>  		}
>  		child_ret = igt_wait_helper(&child);
>  		igt_assert(WEXITSTATUS(child_ret) == EAGAIN ||
> @@ -5299,7 +5299,7 @@ test_i915_ref_count(void)
>  	igt_debug("ref count after opening i915 perf stream = %u\n", ref_count1);
>  	igt_assert(ref_count1 > ref_count0);
>  
> -	close(drm_fd);
> +	drm_close_driver(drm_fd);
>  	close(sysfs);
>  	drm_fd = -1;
>  	sysfs = -1;
> @@ -6008,6 +6008,6 @@ igt_main
>  			put_engine_groups(perf_oa_groups, num_perf_oa_groups);
>  
>  		intel_ctx_destroy(drm_fd, ctx);
> -		close(drm_fd);
> +		drm_close_driver(drm_fd);
>  	}
>  }
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index c5f083bbd..34b0e10f6 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -2111,7 +2111,7 @@ static void test_unload(unsigned int num_engines)
>  		if (fd[count] != -1)
>  			count++;
>  
> -		close(i915);
> +		drm_close_driver(i915);
>  
>  		buf = calloc(count, sizeof(uint64_t));
>  		igt_assert(buf);
> @@ -2436,13 +2436,13 @@ igt_main
>  
>  		igt_fixture {
>  			intel_ctx_destroy(render_fd, render_ctx);
> -			close(render_fd);
> +			drm_close_driver(render_fd);
>  		}
>  	}
>  
>  	igt_fixture {
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  
>  	igt_subtest("module-unload") {
> diff --git a/tests/i915/sysfs_defaults.c b/tests/i915/sysfs_defaults.c
> index dda27a0af..94437c0a0 100644
> --- a/tests/i915/sysfs_defaults.c
> +++ b/tests/i915/sysfs_defaults.c
> @@ -105,6 +105,6 @@ igt_main
>  
>  	igt_fixture {
>  		close(engines);
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
> index 8a3dd3975..467e0728b 100644
> --- a/tests/i915/sysfs_heartbeat_interval.c
> +++ b/tests/i915/sysfs_heartbeat_interval.c
> @@ -514,6 +514,6 @@ igt_main
>  
>  	igt_fixture {
>  		close(engines);
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/sysfs_preempt_timeout.c b/tests/i915/sysfs_preempt_timeout.c
> index 5e0a7d962..b686d6ba8 100644
> --- a/tests/i915/sysfs_preempt_timeout.c
> +++ b/tests/i915/sysfs_preempt_timeout.c
> @@ -343,6 +343,6 @@ igt_main
>  
>  	igt_fixture {
>  		close(engines);
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
> index 92c4c5eae..8f0d8d94b 100644
> --- a/tests/i915/sysfs_timeslice_duration.c
> +++ b/tests/i915/sysfs_timeslice_duration.c
> @@ -564,6 +564,6 @@ igt_main
>  
>  	igt_fixture {
>  		close(engines);
> -		close(i915);
> +		drm_close_driver(i915);
>  	}
>  }
> diff --git a/tests/prime_busy.c b/tests/prime_busy.c
> index 343020f13..f9f1674d4 100644
> --- a/tests/prime_busy.c
> +++ b/tests/prime_busy.c
> @@ -162,6 +162,6 @@ igt_main
>  
>  	igt_fixture {
>  		intel_ctx_destroy(fd, ctx);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
> index bc19f68c9..1c2d2a301 100644
> --- a/tests/prime_mmap.c
> +++ b/tests/prime_mmap.c
> @@ -557,6 +557,6 @@ igt_main
>  		free(query_info);
>  		igt_collection_destroy(set);
>  		igt_collection_destroy(dma_buf_set);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/prime_mmap_coherency.c b/tests/prime_mmap_coherency.c
> index b22fb35c1..a18c16c5c 100644
> --- a/tests/prime_mmap_coherency.c
> +++ b/tests/prime_mmap_coherency.c
> @@ -249,7 +249,7 @@ static void blit_and_cmp(void)
>  
>  	intel_bb_destroy(local_batch);
>  	buf_ops_destroy(local_bops);
> -	close(local_fd);
> +	drm_close_driver(local_fd);
>  }
>  
>  /*
> @@ -346,6 +346,6 @@ igt_main
>  	igt_fixture {
>  		buf_ops_destroy(bops);
>  
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/prime_mmap_kms.c b/tests/prime_mmap_kms.c
> index 8b127a13c..1a63be38f 100644
> --- a/tests/prime_mmap_kms.c
> +++ b/tests/prime_mmap_kms.c
> @@ -263,6 +263,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&gpu.display);
> -		close(gpu.drm_fd);
> +		drm_close_driver(gpu.drm_fd);
>  	}
>  }
> diff --git a/tests/prime_self_import.c b/tests/prime_self_import.c
> index bf5486194..0b5ac256d 100644
> --- a/tests/prime_self_import.c
> +++ b/tests/prime_self_import.c
> @@ -106,8 +106,8 @@ static void test_with_fd_dup(void)
>  	close(dma_buf_fd2);
>  	check_bo(fd2, handle_import, fd2, handle_import);
>  
> -	close(fd1);
> -	close(fd2);
> +	drm_close_driver(fd1);
> +	drm_close_driver(fd2);
>  }
>  
>  static void test_with_two_bos(void)
> @@ -139,8 +139,8 @@ static void test_with_two_bos(void)
>  
>  	check_bo(fd2, handle_import, fd2, handle_import);
>  
> -	close(fd1);
> -	close(fd2);
> +	drm_close_driver(fd1);
> +	drm_close_driver(fd2);
>  }
>  
>  static void test_with_one_bo_two_files(void)
> @@ -164,8 +164,8 @@ static void test_with_one_bo_two_files(void)
>  	/* dma-buf self importing an flink bo should give the same handle */
>  	igt_assert_eq_u32(handle_import, handle_open);
>  
> -	close(fd1);
> -	close(fd2);
> +	drm_close_driver(fd1);
> +	drm_close_driver(fd2);
>  	close(dma_buf_fd1);
>  	close(dma_buf_fd2);
>  }
> @@ -211,7 +211,7 @@ static void test_with_one_bo(void)
>  	check_bo(fd1, handle, fd2, handle_import1);
>  
>  	/* Completely rip out exporting fd. */
> -	close(fd1);
> +	drm_close_driver(fd1);
>  	check_bo(fd2, handle_import1, fd2, handle_import1);
>  }
>  
> @@ -275,14 +275,14 @@ static void test_reimport_close_race(void)
>  		igt_assert(status == 0);
>  	}
>  
> -	close(fds[0]);
> +	drm_close_driver(fds[0]);
>  	close(fds[1]);
>  
>  	obj_count = igt_get_stable_obj_count(fake) - obj_count;
>  
>  	igt_info("leaked %i objects\n", obj_count);
>  
> -	close(fake);
> +	drm_close_driver(fake);
>  
>  	igt_assert_eq(obj_count, 0);
>  }
> @@ -357,13 +357,13 @@ static void test_export_close_race(void)
>  		igt_assert(status == 0);
>  	}
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  
>  	obj_count = igt_get_stable_obj_count(fake) - obj_count;
>  
>  	igt_info("leaked %i objects\n", obj_count);
>  
> -	close(fake);
> +	drm_close_driver(fake);
>  
>  	igt_assert_eq(obj_count, 0);
>  }
> @@ -392,7 +392,7 @@ static void test_llseek_size(void)
>  		close(dma_buf_fd);
>  	}
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  static void test_llseek_bad(void)
> @@ -421,7 +421,7 @@ static void test_llseek_bad(void)
>  
>  	close(dma_buf_fd);
>  
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>  
>  igt_main
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index dcf9e78d4..be6ab65b1 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -1200,7 +1200,7 @@ igt_main
>  
>  
>  	igt_fixture {
> -		close(i915);
> -		close(vgem);
> +		drm_close_driver(i915);
> +		drm_close_driver(vgem);
>  	}
>  }
> diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
> index 6e20c3411..beb44b1e9 100644
> --- a/tests/syncobj_basic.c
> +++ b/tests/syncobj_basic.c
> @@ -232,7 +232,7 @@ igt_main
>  		test_valid_cycle(fd);
>  
>  	igt_fixture {
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  
>  }
> diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
> index 7f5ff6f6c..081f440f3 100644
> --- a/tests/syncobj_timeline.c
> +++ b/tests/syncobj_timeline.c
> @@ -1538,6 +1538,6 @@ igt_main
>  		test_32bits_limit(fd);
>  
>  	igt_fixture {
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
> index 427b6b119..eebc96b67 100644
> --- a/tests/syncobj_wait.c
> +++ b/tests/syncobj_wait.c
> @@ -914,6 +914,6 @@ igt_main
>  		test_wait_interrupted(fd, WAIT_ALL);
>  
>  	igt_fixture {
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/template.c b/tests/template.c
> index e23814fb7..ae2681c01 100644
> --- a/tests/template.c
> +++ b/tests/template.c
> @@ -76,6 +76,6 @@ igt_main
>  	 */
>  
>  	igt_fixture {
> -		close(drm_fd);
> +		drm_close_driver(drm_fd);
>  	}
>  }
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index ada5518d7..36899b307 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -64,8 +64,8 @@ static void test_setversion(int fd)
>  
>  static void test_client(int fd)
>  {
> -	close(drm_open_driver(DRIVER_VGEM));
> -	close(drm_open_driver_render(DRIVER_VGEM));
> +	drm_close_driver(drm_open_driver(DRIVER_VGEM));
> +	drm_close_driver(drm_open_driver_render(DRIVER_VGEM));
>  }
>  
>  static void test_create(int fd)
> @@ -537,6 +537,6 @@ igt_main
>  		test_debugfs_read(fd);
>  
>  	igt_fixture {
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/vgem_slow.c b/tests/vgem_slow.c
> index 58b09e421..4c4e94ea0 100644
> --- a/tests/vgem_slow.c
> +++ b/tests/vgem_slow.c
> @@ -85,6 +85,6 @@ igt_main
>  		test_nohang(fd);
>  
>  	igt_fixture {
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> -- 
> 2.40.0
> 
