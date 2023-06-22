Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B3E10E4DB
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 07:01:14 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Jun 2023 12:24:19 +0530
Message-Id: <20230622065422.2235134-21-bhanuprakash.modem@intel.com>
In-Reply-To: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
References: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 i-g-t 20/23] tests/i915: Use drm_close_driver() to
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

To close the drm file descriptor, use igt helper drm_close_driver()
instead of using close().

V2: - New patch for generic tests

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/api_intel_allocator.c            |  6 ++--
 tests/i915/api_intel_bb.c                   |  2 +-
 tests/i915/drm_fdinfo.c                     |  2 +-
 tests/i915/gem_bad_reloc.c                  |  2 +-
 tests/i915/gem_barrier_race.c               |  2 +-
 tests/i915/gem_basic.c                      |  2 +-
 tests/i915/gem_blits.c                      |  2 +-
 tests/i915/gem_busy.c                       |  2 +-
 tests/i915/gem_caching.c                    |  2 +-
 tests/i915/gem_ccs.c                        |  2 +-
 tests/i915/gem_close_race.c                 | 14 ++++-----
 tests/i915/gem_cs_tlb.c                     |  2 +-
 tests/i915/gem_ctx_bad_destroy.c            |  2 +-
 tests/i915/gem_ctx_create.c                 |  4 +--
 tests/i915/gem_ctx_exec.c                   |  2 +-
 tests/i915/gem_ctx_param.c                  |  2 +-
 tests/i915/gem_ctx_persistence.c            |  6 ++--
 tests/i915/gem_ctx_shared.c                 |  2 +-
 tests/i915/gem_ctx_sseu.c                   |  2 +-
 tests/i915/gem_ctx_switch.c                 |  2 +-
 tests/i915/gem_eio.c                        | 16 +++++------
 tests/i915/gem_evict_alignment.c            |  2 +-
 tests/i915/gem_evict_everything.c           |  2 +-
 tests/i915/gem_exec_alignment.c             |  2 +-
 tests/i915/gem_exec_async.c                 |  2 +-
 tests/i915/gem_exec_await.c                 |  2 +-
 tests/i915/gem_exec_basic.c                 |  2 +-
 tests/i915/gem_exec_big.c                   |  2 +-
 tests/i915/gem_exec_capture.c               |  2 +-
 tests/i915/gem_exec_create.c                |  2 +-
 tests/i915/gem_exec_fair.c                  |  2 +-
 tests/i915/gem_exec_fence.c                 |  4 +--
 tests/i915/gem_exec_flush.c                 |  2 +-
 tests/i915/gem_exec_gttfill.c               |  4 +--
 tests/i915/gem_exec_latency.c               |  2 +-
 tests/i915/gem_exec_nop.c                   |  2 +-
 tests/i915/gem_exec_parallel.c              |  4 +--
 tests/i915/gem_exec_params.c                |  2 +-
 tests/i915/gem_exec_reloc.c                 |  2 +-
 tests/i915/gem_exec_schedule.c              |  2 +-
 tests/i915/gem_exec_store.c                 |  2 +-
 tests/i915/gem_exec_suspend.c               |  2 +-
 tests/i915/gem_exec_whisper.c               |  6 ++--
 tests/i915/gem_exercise_blt.c               |  2 +-
 tests/i915/gem_fd_exhaustion.c              |  2 +-
 tests/i915/gem_fence_thrash.c               |  2 +-
 tests/i915/gem_fenced_exec_thrash.c         |  2 +-
 tests/i915/gem_flink_basic.c                |  4 +--
 tests/i915/gem_flink_race.c                 |  6 ++--
 tests/i915/gem_gtt_cpu_tlb.c                |  2 +-
 tests/i915/gem_gtt_hog.c                    |  2 +-
 tests/i915/gem_gtt_speed.c                  |  2 +-
 tests/i915/gem_huc_copy.c                   |  2 +-
 tests/i915/gem_lmem_evict.c                 |  4 +--
 tests/i915/gem_lmem_swapping.c              | 10 +++----
 tests/i915/gem_madvise.c                    | 12 ++++----
 tests/i915/gem_media_fill.c                 |  2 +-
 tests/i915/gem_mmap.c                       |  2 +-
 tests/i915/gem_mmap_gtt.c                   |  6 ++--
 tests/i915/gem_mmap_offset.c                |  8 +++---
 tests/i915/gem_mmap_wc.c                    |  2 +-
 tests/i915/gem_partial_pwrite_pread.c       |  2 +-
 tests/i915/gem_pipe_control_store_loop.c    |  2 +-
 tests/i915/gem_ppgtt.c                      |  8 +++---
 tests/i915/gem_pread.c                      |  2 +-
 tests/i915/gem_pread_after_blit.c           |  2 +-
 tests/i915/gem_pwrite.c                     |  2 +-
 tests/i915/gem_pwrite_snooped.c             |  2 +-
 tests/i915/gem_pxp.c                        |  2 +-
 tests/i915/gem_read_read_speed.c            |  2 +-
 tests/i915/gem_readwrite.c                  |  2 +-
 tests/i915/gem_reg_read.c                   |  2 +-
 tests/i915/gem_render_copy.c                |  2 +-
 tests/i915/gem_render_copy_redux.c          |  2 +-
 tests/i915/gem_reset_stats.c                | 32 ++++++++++-----------
 tests/i915/gem_ringfill.c                   |  2 +-
 tests/i915/gem_set_tiling_vs_blt.c          |  2 +-
 tests/i915/gem_set_tiling_vs_gtt.c          |  2 +-
 tests/i915/gem_set_tiling_vs_pwrite.c       |  2 +-
 tests/i915/gem_shrink.c                     | 14 ++++-----
 tests/i915/gem_softpin.c                    |  4 +--
 tests/i915/gem_spin_batch.c                 |  2 +-
 tests/i915/gem_streaming_writes.c           |  2 +-
 tests/i915/gem_stress.c                     |  2 +-
 tests/i915/gem_sync.c                       |  2 +-
 tests/i915/gem_tiled_blits.c                |  2 +-
 tests/i915/gem_tiled_fence_blits.c          |  2 +-
 tests/i915/gem_tiled_partial_pwrite_pread.c |  2 +-
 tests/i915/gem_tiled_pread_basic.c          |  2 +-
 tests/i915/gem_tiled_pread_pwrite.c         |  2 +-
 tests/i915/gem_tiled_swapping.c             |  2 +-
 tests/i915/gem_tiled_wb.c                   |  2 +-
 tests/i915/gem_tiled_wc.c                   |  2 +-
 tests/i915/gem_tiling_max_stride.c          |  2 +-
 tests/i915/gem_unfence_active_buffers.c     |  2 +-
 tests/i915/gem_unref_active_buffers.c       |  2 +-
 tests/i915/gem_userptr_blits.c              |  6 ++--
 tests/i915/gem_vm_create.c                  |  4 +--
 tests/i915/gem_wait.c                       |  2 +-
 tests/i915/gem_watchdog.c                   |  2 +-
 tests/i915/gem_workarounds.c                |  2 +-
 tests/i915/gen7_exec_parse.c                |  4 +--
 tests/i915/gen9_exec_parse.c                |  2 +-
 tests/i915/i915_fb_tiling.c                 |  2 +-
 tests/i915/i915_getparams_basic.c           |  2 +-
 tests/i915/i915_hangman.c                   |  4 +--
 tests/i915/i915_hwmon.c                     |  2 +-
 tests/i915/i915_module_load.c               |  8 +++---
 tests/i915/i915_pciid.c                     |  2 +-
 tests/i915/i915_pm_backlight.c              |  2 +-
 tests/i915/i915_pm_dc.c                     |  2 +-
 tests/i915/i915_pm_freq_api.c               |  2 +-
 tests/i915/i915_pm_freq_mult.c              |  2 +-
 tests/i915/i915_pm_lpsp.c                   |  2 +-
 tests/i915/i915_pm_rc6_residency.c          |  2 +-
 tests/i915/i915_pm_rps.c                    |  2 +-
 tests/i915/i915_pm_sseu.c                   |  2 +-
 tests/i915/i915_power.c                     |  2 +-
 tests/i915/i915_query.c                     |  2 +-
 tests/i915/i915_suspend.c                   |  6 ++--
 tests/i915/perf.c                           |  6 ++--
 tests/i915/perf_pmu.c                       |  6 ++--
 tests/i915/sysfs_defaults.c                 |  2 +-
 tests/i915/sysfs_heartbeat_interval.c       |  2 +-
 tests/i915/sysfs_preempt_timeout.c          |  2 +-
 tests/i915/sysfs_timeslice_duration.c       |  2 +-
 126 files changed, 206 insertions(+), 206 deletions(-)

diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index cc6f8daa4..b7e3efb87 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -579,7 +579,7 @@ static void reopen(int fd)
 
 	__reopen_allocs(fd, fd2, true);
 
-	close(fd2);
+	drm_close_driver(fd2);
 }
 
 #define REOPEN_TIMEOUT 3
@@ -605,7 +605,7 @@ static void reopen_fork(int fd)
 	/* Check references at the end */
 	__reopen_allocs(fd, fd2, true);
 
-	close(fd2);
+	drm_close_driver(fd2);
 
 	intel_allocator_multiprocess_stop();
 }
@@ -924,5 +924,5 @@ igt_main
 		gem_pool(fd);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 85ca86eed..47049ba23 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -1908,6 +1908,6 @@ igt_main_args("dpibc:", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		buf_ops_destroy(bops);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/drm_fdinfo.c b/tests/i915/drm_fdinfo.c
index d061e901f..c0e0ba190 100644
--- a/tests/i915/drm_fdinfo.c
+++ b/tests/i915/drm_fdinfo.c
@@ -910,6 +910,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(i915, ctx);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_bad_reloc.c b/tests/i915/gem_bad_reloc.c
index d5336b62d..b058639ea 100644
--- a/tests/i915/gem_bad_reloc.c
+++ b/tests/i915/gem_bad_reloc.c
@@ -231,5 +231,5 @@ igt_main
 		negative_reloc_blt(fd);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_barrier_race.c b/tests/i915/gem_barrier_race.c
index 0ac1da3a4..591ddc222 100644
--- a/tests/i915/gem_barrier_race.c
+++ b/tests/i915/gem_barrier_race.c
@@ -120,7 +120,7 @@ static void intel_context_first_pin_last_unpin_loop(int fd, uint64_t engine, int
 
 	} while (!READ_ONCE(*done));
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void test_remote_request(int fd, uint64_t engine, unsigned int timeout)
diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
index 6843bec16..3485f92c8 100644
--- a/tests/i915/gem_basic.c
+++ b/tests/i915/gem_basic.c
@@ -145,7 +145,7 @@ igt_main
 			gpu_fd = __drm_open_driver_another(child, DRIVER_INTEL);
 			igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child, errno);
 			test_create_close(gpu_fd);
-			close(gpu_fd);
+			drm_close_driver(gpu_fd);
 		}
 
 		igt_waitchildren();
diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
index 681fe0466..9b268e9dc 100644
--- a/tests/i915/gem_blits.c
+++ b/tests/i915/gem_blits.c
@@ -904,6 +904,6 @@ igt_main
 
 	igt_fixture {
 		put_ahnd(device.ahnd);
-		close(device.fd);
+		drm_close_driver(device.fd);
 	}
 }
diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index b796ebb2b..c60654b1e 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -617,6 +617,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
index 7af427d7e..6a4da122b 100644
--- a/tests/i915/gem_caching.c
+++ b/tests/i915/gem_caching.c
@@ -356,6 +356,6 @@ igt_main
 		intel_buf_destroy(scratch_buf);
 		intel_buf_destroy(staging_buf);
 		buf_ops_destroy(data.bops);
-		close(data.fd);
+		drm_close_driver(data.fd);
 	}
 }
diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index d38ab49a4..4581b6489 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -764,6 +764,6 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		igt_disallow_hang(i915, hang);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
index 1a2efeab2..9dc218742 100644
--- a/tests/i915/gem_close_race.c
+++ b/tests/i915/gem_close_race.c
@@ -303,7 +303,7 @@ static void thread(int fd, struct drm_gem_open name,
 			n++;
 		} while (1);
 
-		close(crashme.fd);
+		drm_close_driver(crashme.fd);
 	}
 
 	timer_delete(timer);
@@ -329,7 +329,7 @@ static void multigpu_threads(int timeout, unsigned int flags, int gpu_count)
 
 		igt_waitchildren();
 		gem_quiescent_gpu(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_waitchildren();
@@ -348,7 +348,7 @@ static void threads(int timeout, unsigned int flags)
 	igt_waitchildren();
 
 	gem_quiescent_gpu(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 igt_main
@@ -372,7 +372,7 @@ igt_main
 		gpu_count = igt_device_filter_count();
 
 		igt_fork_hang_detector(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_describe("Basic workload submission.");
@@ -384,7 +384,7 @@ igt_main
 		igt_waitchildren();
 
 		gem_quiescent_gpu(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_describe("Basic workload submission on multi-GPU machine.");
@@ -397,7 +397,7 @@ igt_main
 			igt_assert(fd > 0);
 			process(fd, child);
 			gem_quiescent_gpu(fd);
-			close(fd);
+			drm_close_driver(fd);
 		}
 
 		igt_waitchildren();
@@ -424,7 +424,7 @@ igt_main
 		igt_waitchildren();
 
 		gem_quiescent_gpu(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_describe("Share buffer handle across different drm fd's and trying to race"
diff --git a/tests/i915/gem_cs_tlb.c b/tests/i915/gem_cs_tlb.c
index 3f285f42c..2c7781d06 100644
--- a/tests/i915/gem_cs_tlb.c
+++ b/tests/i915/gem_cs_tlb.c
@@ -174,5 +174,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_ctx_bad_destroy.c b/tests/i915/gem_ctx_bad_destroy.c
index 8c47e7c1c..65f6b5583 100644
--- a/tests/i915/gem_ctx_bad_destroy.c
+++ b/tests/i915/gem_ctx_bad_destroy.c
@@ -98,5 +98,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index 95e219482..6d0877954 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -206,7 +206,7 @@ static void files(int core, const intel_ctx_cfg_t *cfg,
 			gem_execbuf(fd, &execbuf);
 
 			intel_ctx_destroy(fd, ctx);
-			close(fd);
+			drm_close_driver(fd);
 			count++;
 
 			clock_gettime(CLOCK_MONOTONIC, &end);
@@ -756,6 +756,6 @@ igt_main
 
 	igt_fixture {
 		igt_stop_hang_detector();
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index f3939df86..4376397a2 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -403,7 +403,7 @@ static void nohangcheck_hostile(int i915)
 	put_ahnd(ahnd);
 
 	close(dir);
-	close(i915);
+	drm_close_driver(i915);
 }
 
 static void close_race(int i915)
diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
index 7c59fe3ed..9b44c86a0 100644
--- a/tests/i915/gem_ctx_param.c
+++ b/tests/i915/gem_ctx_param.c
@@ -636,5 +636,5 @@ igt_main
 		test_get_invalid_param(fd, I915_CONTEXT_PARAM_ENGINES);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index d2558354e..c6e2c5d77 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -791,7 +791,7 @@ static void test_nonpersistent_file(int i915)
 	gem_context_set_persistence(i915, 0, false);
 	spin = igt_spin_new(i915, .ahnd = ahnd, .flags = IGT_SPIN_FENCE_OUT);
 
-	close(i915);
+	drm_close_driver(i915);
 	flush_delayed_fput(debugfs);
 
 	igt_assert_eq(wait_for_status(spin->out_fence, reset_timeout_ms), -EIO);
@@ -1274,7 +1274,7 @@ static void __smoker(int i915, const intel_ctx_cfg_t *cfg,
 
 	intel_ctx_destroy(fd, ctx);
 
-	close(fd);
+	drm_close_driver(fd);
 	flush_delayed_fput(i915);
 
 	igt_spin_end(spin);
@@ -1570,6 +1570,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
index ede6db13b..d24ae5483 100644
--- a/tests/i915/gem_ctx_shared.c
+++ b/tests/i915/gem_ctx_shared.c
@@ -315,7 +315,7 @@ static void exhaust_shared_gtt(int i915, unsigned int flags)
 		igt_info("Created %lu shared contexts, before %d (%s)\n",
 			 count, err, strerror(-err));
 	}
-	close(i915);
+	drm_close_driver(i915);
 	igt_waitchildren();
 }
 
diff --git a/tests/i915/gem_ctx_sseu.c b/tests/i915/gem_ctx_sseu.c
index 78748c24d..3a01944e4 100644
--- a/tests/i915/gem_ctx_sseu.c
+++ b/tests/i915/gem_ctx_sseu.c
@@ -559,6 +559,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_ctx_switch.c b/tests/i915/gem_ctx_switch.c
index b0066ab27..f94a41bec 100644
--- a/tests/i915/gem_ctx_switch.c
+++ b/tests/i915/gem_ctx_switch.c
@@ -805,6 +805,6 @@ igt_main
 		igt_stop_hang_detector();
 		gem_close(fd, heavy);
 		gem_close(fd, light);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 38fd19e89..d889d67dc 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -656,7 +656,7 @@ static void test_banned(int fd)
 {
 	fd = reopen_device(fd);
 	__test_banned(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 #define TEST_WEDGE (1)
@@ -690,7 +690,7 @@ static void test_wait(int fd, unsigned int flags, unsigned int wait)
 	igt_require(i915_reset_control(fd, true));
 
 	trigger_reset(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void test_suspend(int fd, int state)
@@ -708,7 +708,7 @@ static void test_suspend(int fd, int state)
 
 	igt_require(i915_reset_control(fd, true));
 	trigger_reset(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void test_inflight(int fd, unsigned int wait)
@@ -772,7 +772,7 @@ static void test_inflight(int fd, unsigned int wait)
 		trigger_reset(fd);
 
 		gem_close(fd, obj[1].handle);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
 
@@ -833,7 +833,7 @@ static void test_inflight_suspend(int fd)
 
 	igt_assert(i915_reset_control(fd, true));
 	trigger_reset(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static const intel_ctx_t *context_create_safe(int i915)
@@ -923,7 +923,7 @@ static void test_inflight_contexts(int fd, unsigned int wait)
 		for (unsigned int n = 0; n < ARRAY_SIZE(ctx); n++)
 			intel_ctx_destroy(fd, ctx[n]);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
 
@@ -979,7 +979,7 @@ static void test_inflight_external(int fd)
 	put_ahnd(ahnd);
 	igt_assert(i915_reset_control(fd, true));
 	trigger_reset(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void test_inflight_internal(int fd, unsigned int wait)
@@ -1029,7 +1029,7 @@ static void test_inflight_internal(int fd, unsigned int wait)
 
 	igt_assert(i915_reset_control(fd, true));
 	trigger_reset(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void reset_stress(int fd, uint64_t ahnd, const intel_ctx_t *ctx0,
diff --git a/tests/i915/gem_evict_alignment.c b/tests/i915/gem_evict_alignment.c
index f04f24972..4a9507a06 100644
--- a/tests/i915/gem_evict_alignment.c
+++ b/tests/i915/gem_evict_alignment.c
@@ -282,6 +282,6 @@ igt_main
 
 	igt_fixture {
 		igt_stop_hang_helper();
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_evict_everything.c b/tests/i915/gem_evict_everything.c
index 87f854bf8..f0f356cc3 100644
--- a/tests/i915/gem_evict_everything.c
+++ b/tests/i915/gem_evict_everything.c
@@ -351,6 +351,6 @@ igt_main
 
 	igt_fixture {
 		igt_stop_hang_helper();
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
index 9d965270f..10732fec5 100644
--- a/tests/i915/gem_exec_alignment.c
+++ b/tests/i915/gem_exec_alignment.c
@@ -487,7 +487,7 @@ static void forked(int i915, int timeout)
 	igt_waitchildren_timeout(3 * timeout, NULL);
 
 	free(obj);
-	close(i915);
+	drm_close_driver(i915);
 }
 
 static void single(int fd)
diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
index f3c2f671f..8c131d8e1 100644
--- a/tests/i915/gem_exec_async.c
+++ b/tests/i915/gem_exec_async.c
@@ -227,6 +227,6 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index c78403466..53b7bac2f 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -300,6 +300,6 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(device, ctx);
-		close(device);
+		drm_close_driver(device);
 	}
 }
diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
index 623f1ee52..83f71e289 100644
--- a/tests/i915/gem_exec_basic.c
+++ b/tests/i915/gem_exec_basic.c
@@ -113,6 +113,6 @@ igt_main
 		igt_collection_destroy(set);
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
index 3acdb3741..9de9941d5 100644
--- a/tests/i915/gem_exec_big.c
+++ b/tests/i915/gem_exec_big.c
@@ -340,5 +340,5 @@ igt_main
 		exhaustive(i915);
 
 	igt_fixture
-		close(i915);
+		drm_close_driver(i915);
 }
diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 453ae1af9..ab8305e4d 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -1055,6 +1055,6 @@ igt_main
 		close(dir);
 		igt_disallow_hang(fd, hang);
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
index 00c190115..4eb77ecbb 100644
--- a/tests/i915/gem_exec_create.c
+++ b/tests/i915/gem_exec_create.c
@@ -270,6 +270,6 @@ igt_main
 
 	igt_fixture {
 		igt_stop_hang_detector();
-		close(device);
+		drm_close_driver(device);
 	}
 }
diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index eedcfdf80..5ad13f97a 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -1440,6 +1440,6 @@ igt_main
 
 	igt_fixture {
 		igt_stop_hang_detector();
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index d6253a379..4bf29a3e4 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -2118,7 +2118,7 @@ static void test_invalid_timeline_fence_array(int fd)
 	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EFAULT);
 
 	munmap(ptr, 4096);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static const char *test_syncobj_timeline_unused_fence_desc =
@@ -3701,6 +3701,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
index e213bda5e..3902ee957 100644
--- a/tests/i915/gem_exec_flush.c
+++ b/tests/i915/gem_exec_flush.c
@@ -2207,6 +2207,6 @@ igt_main
 
 	igt_fixture {
 		igt_stop_hang_detector();
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
index 4c32a04c0..28c251915 100644
--- a/tests/i915/gem_exec_gttfill.c
+++ b/tests/i915/gem_exec_gttfill.c
@@ -314,7 +314,7 @@ igt_main
 			// release resources
 			igt_stop_hang_detector();
 			intel_ctx_destroy(g_fd, ctx);
-			close(g_fd);
+			drm_close_driver(g_fd);
 		}
 
 		igt_waitchildren();
@@ -322,6 +322,6 @@ igt_main
 
 	igt_fixture {
 		intel_allocator_multiprocess_stop();
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
index 9a9e43bab..c0e607f97 100644
--- a/tests/i915/gem_exec_latency.c
+++ b/tests/i915/gem_exec_latency.c
@@ -1001,6 +1001,6 @@ igt_main
 	igt_fixture {
 		intel_register_access_fini(&mmio_data);
 		intel_ctx_destroy(device, ctx);
-		close(device);
+		drm_close_driver(device);
 	}
 }
diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index 067c92b47..6dea8b167 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -1150,6 +1150,6 @@ igt_main
 		igt_stop_hang_detector();
 		gem_close(device, handle);
 		intel_ctx_destroy(device, ctx);
-		close(device);
+		drm_close_driver(device);
 	}
 }
diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
index bba861185..cae1553f6 100644
--- a/tests/i915/gem_exec_parallel.c
+++ b/tests/i915/gem_exec_parallel.c
@@ -230,7 +230,7 @@ static void *thread(void *data)
 		intel_ctx_destroy(fd, tmp_ctx);
 	gem_close(fd, obj[1].handle);
 	if (t->flags & FDS)
-		close(fd);
+		drm_close_driver(fd);
 
 	t->used = used;
 	return NULL;
@@ -413,6 +413,6 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
index 16ae7a5a6..caaa5fee0 100644
--- a/tests/i915/gem_exec_params.c
+++ b/tests/i915/gem_exec_params.c
@@ -825,6 +825,6 @@ igt_main
 	igt_fixture {
 		gem_close(fd, handle);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index c591f374d..8259ff1d9 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -1771,5 +1771,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index c9be726ab..c94988d36 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -3755,6 +3755,6 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
index d61072dfa..0ab931062 100644
--- a/tests/i915/gem_exec_store.c
+++ b/tests/i915/gem_exec_store.c
@@ -480,6 +480,6 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index 73fbf8cf6..39d75ee03 100644
--- a/tests/i915/gem_exec_suspend.c
+++ b/tests/i915/gem_exec_suspend.c
@@ -510,6 +510,6 @@ igt_main
 		igt_collection_destroy(set);
 		igt_disallow_hang(fd, hang);
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
index 1379f10dc..46712c3e8 100644
--- a/tests/i915/gem_exec_whisper.c
+++ b/tests/i915/gem_exec_whisper.c
@@ -457,7 +457,7 @@ static void fini_hang(struct hang *h)
 	put_offset(h->ahnd, h->obj.handle);
 	put_ahnd(h->ahnd);
 	intel_ctx_destroy(h->fd, h->ctx);
-	close(h->fd);
+	drm_close_driver(h->fd);
 }
 
 static void ctx_set_random_priority(int fd, uint32_t ctx)
@@ -829,7 +829,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 			gem_close(fd, batches[n].handle);
 		if (flags & FDS) {
 			for (n = 0; n < 64; n++)
-				close(fds[n]);
+				drm_close_driver(fds[n]);
 		}
 	}
 
@@ -939,6 +939,6 @@ igt_main
 	igt_fixture {
 		intel_allocator_multiprocess_stop();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_exercise_blt.c b/tests/i915/gem_exercise_blt.c
index 89f89d212..8c70c941c 100644
--- a/tests/i915/gem_exercise_blt.c
+++ b/tests/i915/gem_exercise_blt.c
@@ -398,6 +398,6 @@ igt_main_args("b:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_fd_exhaustion.c b/tests/i915/gem_fd_exhaustion.c
index 75485c1cb..e79d03478 100644
--- a/tests/i915/gem_fd_exhaustion.c
+++ b/tests/i915/gem_fd_exhaustion.c
@@ -75,5 +75,5 @@ igt_simple_main
 
 	igt_waitchildren();
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_fence_thrash.c b/tests/i915/gem_fence_thrash.c
index f8ac29dd7..4cb3d842b 100644
--- a/tests/i915/gem_fence_thrash.c
+++ b/tests/i915/gem_fence_thrash.c
@@ -244,7 +244,7 @@ static int run_test(int threads_per_fence, void *f, int tiling,
 		igt_assert(func(&t) == (void *)0);
 	}
 
-	close(t.fd);
+	drm_close_driver(t.fd);
 
 	return 0;
 }
diff --git a/tests/i915/gem_fenced_exec_thrash.c b/tests/i915/gem_fenced_exec_thrash.c
index f22f16f68..098f22ef4 100644
--- a/tests/i915/gem_fenced_exec_thrash.c
+++ b/tests/i915/gem_fenced_exec_thrash.c
@@ -217,5 +217,5 @@ igt_main
 		run_test(fd, num_fences + 1, intel_gen(devid) >= 4 ? 0 : ENOBUFS, 0);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
index 8a316cdae..e70cab4d1 100644
--- a/tests/i915/gem_flink_basic.c
+++ b/tests/i915/gem_flink_basic.c
@@ -196,7 +196,7 @@ test_flink_lifetime(int fd)
 	igt_assert_eq(ret, 0);
 	igt_assert(open_struct.handle != 0);
 
-	close(fd2);
+	drm_close_driver(fd2);
 	fd2 = drm_open_driver(DRIVER_INTEL);
 
 	/* Flink name remains valid due to the second reference */
@@ -205,7 +205,7 @@ test_flink_lifetime(int fd)
 	igt_assert_eq(ret, 0);
 	igt_assert(open_struct.handle != 0);
 
-	close(fd2);
+	drm_close_driver(fd2);
 }
 
 igt_main
diff --git a/tests/i915/gem_flink_race.c b/tests/i915/gem_flink_race.c
index a9177ce1b..41c15f298 100644
--- a/tests/i915/gem_flink_race.c
+++ b/tests/i915/gem_flink_race.c
@@ -141,7 +141,7 @@ static void test_flink_name(int timeout)
 		 igt_stats_get_max(&stats));
 	igt_stats_fini(&stats);
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void *thread_fn_flink_close(void *p)
@@ -202,13 +202,13 @@ static void test_flink_close(void)
 		igt_assert(status == 0);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 
 	obj_count = igt_get_stable_obj_count(fake) - obj_count;
 
 	igt_info("leaked %i objects\n", obj_count);
 
-	close(fake);
+	drm_close_driver(fake);
 
 	igt_assert_eq(obj_count, 0);
 }
diff --git a/tests/i915/gem_gtt_cpu_tlb.c b/tests/i915/gem_gtt_cpu_tlb.c
index 4f4af6a7b..155aa6516 100644
--- a/tests/i915/gem_gtt_cpu_tlb.c
+++ b/tests/i915/gem_gtt_cpu_tlb.c
@@ -113,5 +113,5 @@ igt_simple_main
 	for (i = 0; i < OBJ_SIZE/4; i++)
 		igt_assert(ptr[i] == i);
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_gtt_hog.c b/tests/i915/gem_gtt_hog.c
index 4c8158c6d..1227c7633 100644
--- a/tests/i915/gem_gtt_hog.c
+++ b/tests/i915/gem_gtt_hog.c
@@ -170,7 +170,7 @@ igt_simple_main
 	int fd = drm_open_driver(DRIVER_INTEL);
 	igt_require_gem(fd);
 	gem_require_mappable_ggtt(fd);
-	close(fd);
+	drm_close_driver(fd);
 
 	data.fd = drm_open_driver(DRIVER_INTEL);
 	data.devid = intel_get_drm_devid(data.fd);
diff --git a/tests/i915/gem_gtt_speed.c b/tests/i915/gem_gtt_speed.c
index a0e37b19e..c85c359a0 100644
--- a/tests/i915/gem_gtt_speed.c
+++ b/tests/i915/gem_gtt_speed.c
@@ -521,5 +521,5 @@ igt_simple_main_args("s:", NULL, help_str, opt_handler, NULL)
 	}
 
 	gem_close(fd, handle);
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_huc_copy.c b/tests/i915/gem_huc_copy.c
index 5a217c984..246fa0a8b 100644
--- a/tests/i915/gem_huc_copy.c
+++ b/tests/i915/gem_huc_copy.c
@@ -150,6 +150,6 @@ igt_main
 
 	igt_fixture {
 		put_ahnd(ahnd);
-		close(drm_fd);
+		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/i915/gem_lmem_evict.c b/tests/i915/gem_lmem_evict.c
index 54277e11d..a3ca2c861 100644
--- a/tests/i915/gem_lmem_evict.c
+++ b/tests/i915/gem_lmem_evict.c
@@ -103,7 +103,7 @@ igt_main
 			igt_require_fd(i915);
 			igt_require_gem(i915);
 			igt_require(gem_has_lmem(i915));
-			close(i915);
+			drm_close_driver(i915);
 		}
 
 		igt_i915_driver_unload();
@@ -142,7 +142,7 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 		igt_i915_driver_unload();
 	}
 }
diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 8211edbe3..a04d0a5f8 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -718,7 +718,7 @@ static void test_evict(int i915,
 
 		igt_waitchildren();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 		intel_allocator_multiprocess_stop();
 	} else {
 		__do_evict(i915, ctx, &region->region, &params, params.seed);
@@ -790,7 +790,7 @@ static void test_smem_oom(int i915,
 			   params.seed + child + 1);
 
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	/* smem memory hog process, respawn till the lmem process completes */
@@ -811,7 +811,7 @@ static void test_smem_oom(int i915,
 						break;
 					gem_leak(fd, alloc);
 				}
-				close(fd);
+				drm_close_driver(fd);
 			}
 			/*
 			 * Wait for grand-child processes to finish or be
@@ -903,7 +903,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			igt_require_fd(i915);
 			igt_require_gem(i915);
 			igt_require(gem_has_lmem(i915));
-			close(i915);
+			drm_close_driver(i915);
 		}
 
 		igt_i915_driver_unload();
@@ -948,7 +948,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_fixture {
 		intel_ctx_destroy(i915, ctx);
 		free(regions);
-		close(i915);
+		drm_close_driver(i915);
 		igt_i915_driver_unload();
 	}
 
diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
index 4efa359ba..765809e7f 100644
--- a/tests/i915/gem_madvise.c
+++ b/tests/i915/gem_madvise.c
@@ -110,7 +110,7 @@ dontneed_before_mmap(void)
 					PROT_READ | PROT_WRITE,
 					t->type);
 
-		close(fd);
+		drm_close_driver(fd);
 		if (!ptr)
 			continue;
 
@@ -132,7 +132,7 @@ dontneed_before_mmap(void)
 		fd = drm_open_driver(DRIVER_INTEL);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void
@@ -156,7 +156,7 @@ dontneed_after_mmap(void)
 					t->type);
 
 		gem_madvise(fd, handle, I915_MADV_DONTNEED);
-		close(fd);
+		drm_close_driver(fd);
 		if (!ptr)
 			continue;
 
@@ -178,7 +178,7 @@ dontneed_after_mmap(void)
 		fd = drm_open_driver(DRIVER_INTEL);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void
@@ -194,7 +194,7 @@ dontneed_before_pwrite(void)
 
 	igt_assert_eq(__gem_write(fd, handle, 0, &bbe, sizeof(bbe)), -EFAULT);
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void
@@ -218,7 +218,7 @@ dontneed_before_exec(void)
 	execbuf.batch_len = sizeof(buf);
 	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EFAULT);
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 igt_main
diff --git a/tests/i915/gem_media_fill.c b/tests/i915/gem_media_fill.c
index 07e7b3ccb..a678d2f99 100644
--- a/tests/i915/gem_media_fill.c
+++ b/tests/i915/gem_media_fill.c
@@ -181,6 +181,6 @@ igt_main
 	igt_fixture {
 		igt_collection_destroy(set);
 		igt_stop_hang_detector();
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
index 421c6f859..d4ca1eda7 100644
--- a/tests/i915/gem_mmap.c
+++ b/tests/i915/gem_mmap.c
@@ -372,5 +372,5 @@ igt_main
 		test_huge_bo(2);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index e5d3aa079..9c06785d2 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -869,13 +869,13 @@ test_isolation(int i915)
 	igt_info("B: {fd:%d, handle:%d, offset:%"PRIx64"}\n",
 		 B, b, offset_b);
 
-	close(B);
+	drm_close_driver(B);
 
 	ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
 	igt_assert(ptr != MAP_FAILED);
 	munmap(ptr, 4096);
 
-	close(A);
+	drm_close_driver(A);
 
 	ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
 	igt_assert(ptr == MAP_FAILED);
@@ -1979,5 +1979,5 @@ igt_main
 
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 2537ecdc5..bc801cd04 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -434,13 +434,13 @@ static void isolation(int i915)
 				igt_assert_eq(errno, EACCES);
 			}
 
-			close(B);
+			drm_close_driver(B);
 
 			ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
 			igt_assert(ptr != MAP_FAILED);
 			munmap(ptr, 4096);
 
-			close(A);
+			drm_close_driver(A);
 
 			ptr = mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
 			igt_assert(ptr == MAP_FAILED);
@@ -735,7 +735,7 @@ static void open_flood(int i915, int timeout)
 			mmap_offset_ioctl(i915, &arg);
 		}
 
-		close(tmp);
+		drm_close_driver(tmp);
 		count++;
 	}
 
@@ -1013,6 +1013,6 @@ igt_main
 		blt_coherency(i915);
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
index ce1c19083..c56e8c353 100644
--- a/tests/i915/gem_mmap_wc.c
+++ b/tests/i915/gem_mmap_wc.c
@@ -687,5 +687,5 @@ igt_main
 		test_set_cache_level(fd);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_partial_pwrite_pread.c b/tests/i915/gem_partial_pwrite_pread.c
index 1b533ef30..659a96b6e 100644
--- a/tests/i915/gem_partial_pwrite_pread.c
+++ b/tests/i915/gem_partial_pwrite_pread.c
@@ -388,6 +388,6 @@ igt_main
 		intel_buf_destroy(scratch_buf);
 		intel_buf_destroy(staging_buf);
 		buf_ops_destroy(data.bops);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
index 986dbf673..1913b874a 100644
--- a/tests/i915/gem_pipe_control_store_loop.c
+++ b/tests/i915/gem_pipe_control_store_loop.c
@@ -199,6 +199,6 @@ igt_main
 
 	igt_fixture {
 		buf_ops_destroy(bops);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
index 9dc6ccfe4..b6081b1e9 100644
--- a/tests/i915/gem_ppgtt.c
+++ b/tests/i915/gem_ppgtt.c
@@ -278,8 +278,8 @@ static void flink_and_close(void)
 	igt_assert_eq(offset, offset_new);
 
 	gem_close(fd, bo);
-	close(fd);
-	close(fd2);
+	drm_close_driver(fd);
+	drm_close_driver(fd2);
 }
 
 #define PAGE_SIZE 4096
@@ -412,7 +412,7 @@ static bool has_contexts(void)
 
 	fd = drm_open_driver(DRIVER_INTEL);
 	result = gem_has_contexts(fd);
-	close(fd);
+	drm_close_driver(fd);
 
 	return result;
 }
@@ -425,7 +425,7 @@ igt_main
 		int fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 		gem_require_blitter(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_subtest("blt-vs-render-ctx0") {
diff --git a/tests/i915/gem_pread.c b/tests/i915/gem_pread.c
index 1dbded440..6f50785da 100644
--- a/tests/i915/gem_pread.c
+++ b/tests/i915/gem_pread.c
@@ -367,6 +367,6 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 		free(src);
 		gem_close(fd, dst);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_pread_after_blit.c b/tests/i915/gem_pread_after_blit.c
index fc6ee4408..b3e20697d 100644
--- a/tests/i915/gem_pread_after_blit.c
+++ b/tests/i915/gem_pread_after_blit.c
@@ -281,5 +281,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_pwrite.c b/tests/i915/gem_pwrite.c
index 8471f963d..e2b48b843 100644
--- a/tests/i915/gem_pwrite.c
+++ b/tests/i915/gem_pwrite.c
@@ -639,5 +639,5 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_pwrite_snooped.c b/tests/i915/gem_pwrite_snooped.c
index 7135dca57..5d9e8da20 100644
--- a/tests/i915/gem_pwrite_snooped.c
+++ b/tests/i915/gem_pwrite_snooped.c
@@ -148,5 +148,5 @@ igt_simple_main
 	test(256, 256);
 
 	buf_ops_destroy(bops);
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 167877d31..4aea765fe 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -1372,6 +1372,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_read_read_speed.c b/tests/i915/gem_read_read_speed.c
index 7eeba7c6a..95ef47da6 100644
--- a/tests/i915/gem_read_read_speed.c
+++ b/tests/i915/gem_read_read_speed.c
@@ -275,6 +275,6 @@ igt_main
 
 	igt_fixture {
 		buf_ops_destroy(bops);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_readwrite.c b/tests/i915/gem_readwrite.c
index fdc68e315..864a2d8d8 100644
--- a/tests/i915/gem_readwrite.c
+++ b/tests/i915/gem_readwrite.c
@@ -158,5 +158,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_reg_read.c b/tests/i915/gem_reg_read.c
index 5f63c02f7..de6788abe 100644
--- a/tests/i915/gem_reg_read.c
+++ b/tests/i915/gem_reg_read.c
@@ -181,6 +181,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_render_copy.c b/tests/i915/gem_render_copy.c
index 657509647..406c30915 100644
--- a/tests/i915/gem_render_copy.c
+++ b/tests/i915/gem_render_copy.c
@@ -999,6 +999,6 @@ igt_main_args("dac", NULL, help_str, opt_handler, NULL)
 		igt_stop_hang_detector();
 		buf_ops_destroy(data.bops);
 		igt_collection_destroy(set);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/gem_render_copy_redux.c b/tests/i915/gem_render_copy_redux.c
index 0cb2936d3..06777dd7f 100644
--- a/tests/i915/gem_render_copy_redux.c
+++ b/tests/i915/gem_render_copy_redux.c
@@ -98,7 +98,7 @@ static void data_init(data_t *data)
 static void data_fini(data_t *data)
 {
 	buf_ops_destroy(data->bops);
-	close(data->fd);
+	drm_close_driver(data->fd);
 }
 
 static void scratch_buf_init(data_t *data, struct intel_buf *buf,
diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
index 7ec9264b5..6939722c7 100644
--- a/tests/i915/gem_reset_stats.c
+++ b/tests/i915/gem_reset_stats.c
@@ -475,7 +475,7 @@ static void test_rs(const struct intel_execution_ring *e,
 	igt_assert(igt_seconds_elapsed(&ts_injected) <= 30);
 
 	for (i = 0; i < num_fds; i++)
-		close(fd[i]);
+		drm_close_driver(fd[i]);
 }
 
 #define MAX_CTX 100
@@ -551,7 +551,7 @@ static void test_rs_ctx(const struct intel_execution_ring *e,
 
 	for (i = 0; i < num_fds; i++) {
 		assert_reset_status(i, fd[i], 0, RS_NO_ERROR);
-		close(fd[i]);
+		drm_close_driver(fd[i]);
 	}
 }
 
@@ -605,8 +605,8 @@ static void test_ban(const struct intel_execution_ring *e)
 	igt_assert_eq(gem_reset_stats(fd_good, 0, &rs_good), 0);
 	igt_assert_eq(rs_good.batch_active, 0);
 
-	close(fd_bad);
-	close(fd_good);
+	drm_close_driver(fd_bad);
+	drm_close_driver(fd_good);
 }
 
 static void test_ban_ctx(const struct intel_execution_ring *e)
@@ -664,7 +664,7 @@ static void test_ban_ctx(const struct intel_execution_ring *e)
 	igt_assert_eq(gem_reset_stats(fd, ctx_good, &rs_good), 0);
 	igt_assert_eq(rs_good.batch_active, 0);
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void test_unrelated_ctx(const struct intel_execution_ring *e)
@@ -690,8 +690,8 @@ static void test_unrelated_ctx(const struct intel_execution_ring *e)
 	assert_reset_status(0, fd1, ctx_guilty, RS_BATCH_ACTIVE);
 	assert_reset_status(1, fd2, ctx_unrelated, RS_NO_ERROR);
 
-	close(fd1);
-	close(fd2);
+	drm_close_driver(fd1);
+	drm_close_driver(fd2);
 }
 
 static int get_reset_count(int fd, int ctx)
@@ -717,7 +717,7 @@ static void test_close_pending_ctx(const struct intel_execution_ring *e)
 	gem_context_destroy(fd, ctx);
 	igt_assert_eq(__gem_context_destroy(fd, ctx), -ENOENT);
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void test_close_pending(const struct intel_execution_ring *e)
@@ -727,7 +727,7 @@ static void test_close_pending(const struct intel_execution_ring *e)
 	assert_reset_status(fd, fd, 0, RS_NO_ERROR);
 
 	inject_hang(fd, 0, e, 0);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void noop_on_each_ring(int fd, const bool reverse)
@@ -789,7 +789,7 @@ static void test_close_pending_fork(const struct intel_execution_ring *e,
 		 * when gpu is reset and ring lists are cleared.
 		 */
 		noop_on_each_ring(fd2, reverse);
-		close(fd2);
+		drm_close_driver(fd2);
 		pause();
 		exit(0);
 	} else {
@@ -802,7 +802,7 @@ static void test_close_pending_fork(const struct intel_execution_ring *e,
 	}
 
 	igt_post_hang_ring(fd, hang);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void test_reset_count(const struct intel_execution_ring *e,
@@ -842,7 +842,7 @@ static void test_reset_count(const struct intel_execution_ring *e,
 	if (create_ctx)
 		gem_context_destroy(fd, ctx);
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static int _test_params(int fd, int ctx, uint32_t flags, uint32_t pad)
@@ -913,7 +913,7 @@ static void test_params_ctx(void)
 
 	fd = drm_reopen_driver(device);
 	_test_param(fd, gem_context_create(fd));
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void test_params(void)
@@ -922,7 +922,7 @@ static void test_params(void)
 
 	fd = drm_reopen_driver(device);
 	_test_param(fd, 0);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static const struct intel_execution_ring *
@@ -968,7 +968,7 @@ static void defer_hangcheck(const struct intel_execution_ring *engine)
 
 	igt_assert_lt(count_start, count_end);
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static bool gem_has_reset_stats(int fd)
@@ -1177,6 +1177,6 @@ igt_main
 	}
 	igt_fixture {
 		igt_assert(igt_params_set(device, "reset", "%d", INT_MAX /* any reset method */));
-		close(device);
+		drm_close_driver(device);
 	}
 }
diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index 52471948e..c718d6fe7 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -522,6 +522,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_set_tiling_vs_blt.c b/tests/i915/gem_set_tiling_vs_blt.c
index cee4591b8..e9d5e3c63 100644
--- a/tests/i915/gem_set_tiling_vs_blt.c
+++ b/tests/i915/gem_set_tiling_vs_blt.c
@@ -276,6 +276,6 @@ igt_main
 
 	igt_fixture{
 		buf_ops_destroy(bops);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_set_tiling_vs_gtt.c b/tests/i915/gem_set_tiling_vs_gtt.c
index 30b69bb8b..4a7ecdc88 100644
--- a/tests/i915/gem_set_tiling_vs_gtt.c
+++ b/tests/i915/gem_set_tiling_vs_gtt.c
@@ -138,5 +138,5 @@ igt_simple_main
 
 	munmap(ptr, OBJECT_SIZE);
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_set_tiling_vs_pwrite.c b/tests/i915/gem_set_tiling_vs_pwrite.c
index 328682d94..ede0c58b6 100644
--- a/tests/i915/gem_set_tiling_vs_pwrite.c
+++ b/tests/i915/gem_set_tiling_vs_pwrite.c
@@ -107,5 +107,5 @@ igt_simple_main
 
 	munmap(ptr, OBJECT_SIZE);
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
index 79301754b..1f16f8a78 100644
--- a/tests/i915/gem_shrink.c
+++ b/tests/i915/gem_shrink.c
@@ -381,7 +381,7 @@ static bool has_userptr(void)
 	if (drmIoctl(fd, DRM_IOCTL_I915_GEM_USERPTR, &userptr))
 		err = errno;
 
-	close(fd);
+	drm_close_driver(fd);
 
 	return err == EFAULT;
 }
@@ -430,7 +430,7 @@ static void run_test(int nchildren, uint64_t alloc,
 				int fd = drm_open_driver(DRIVER_INTEL);
 				for (int pass = 0; pass < nchildren; pass++)
 					leak(fd, alloc);
-				close(fd);
+				drm_close_driver(fd);
 			}
 		}
 	}
@@ -442,7 +442,7 @@ static void run_test(int nchildren, uint64_t alloc,
 				int fd = drm_open_driver(DRIVER_INTEL);
 				for (int pass = 0; pass < nchildren; pass++)
 					userptr(fd, alloc, 0);
-				close(fd);
+				drm_close_driver(fd);
 			}
 		}
 		nchildren = (nchildren + 1)/2;
@@ -455,7 +455,7 @@ static void run_test(int nchildren, uint64_t alloc,
 				int fd = drm_open_driver(DRIVER_INTEL);
 				for (int pass = 0; pass < nchildren; pass++)
 					userptr(fd, alloc, UDIRTY);
-				close(fd);
+				drm_close_driver(fd);
 			}
 		}
 		nchildren = (nchildren + 1)/2;
@@ -467,7 +467,7 @@ static void run_test(int nchildren, uint64_t alloc,
 			int fd = drm_open_driver(DRIVER_INTEL);
 			for (int pass = 0; pass < nchildren; pass++)
 				func(fd, alloc);
-			close(fd);
+			drm_close_driver(fd);
 		}
 	}
 	igt_waitchildren();
@@ -510,7 +510,7 @@ static void reclaim(unsigned engine, int timeout)
 
 	munmap((void *)shared, 4096);
 	close(debugfs);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 igt_main
@@ -567,7 +567,7 @@ igt_main
 			 num_processes, alloc_size);
 
 		alloc_size <<= 20;
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_subtest("reclaim")
diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index 62478f4a3..e6cbf624e 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -1433,7 +1433,7 @@ static void *thread(void *data)
 			  fd, ctx->id, t->engine, succeeded);
 	intel_ctx_destroy(fd, ctx);
 	gem_close(fd, obj[1].handle);
-	close(fd);
+	drm_close_driver(fd);
 
 	return (void *) from_user_pointer(ret);
 }
@@ -1747,6 +1747,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
index cd828beb2..18873be16 100644
--- a/tests/i915/gem_spin_batch.c
+++ b/tests/i915/gem_spin_batch.c
@@ -354,6 +354,6 @@ igt_main
 	igt_fixture {
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_streaming_writes.c b/tests/i915/gem_streaming_writes.c
index 2c59c08f6..fc2d3d89f 100644
--- a/tests/i915/gem_streaming_writes.c
+++ b/tests/i915/gem_streaming_writes.c
@@ -448,5 +448,5 @@ igt_main
 		test_batch(fd, 2, 1);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_stress.c b/tests/i915/gem_stress.c
index 625b0e915..bf2e06d71 100644
--- a/tests/i915/gem_stress.c
+++ b/tests/i915/gem_stress.c
@@ -933,7 +933,7 @@ igt_simple_main_args("ds:g:c:t:rbuxmo:fp:",
 	intel_bb_destroy(ibb);
 	buf_ops_destroy(bops);
 
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 
 	igt_stop_signal_helper();
 }
diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index 1ee5b3f3d..f98d4364c 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -1606,6 +1606,6 @@ igt_main
 		intel_allocator_multiprocess_stop();
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_tiled_blits.c b/tests/i915/gem_tiled_blits.c
index 8c3951c6f..22ac3280d 100644
--- a/tests/i915/gem_tiled_blits.c
+++ b/tests/i915/gem_tiled_blits.c
@@ -232,6 +232,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
index 539601e5a..5444dcfb8 100644
--- a/tests/i915/gem_tiled_fence_blits.c
+++ b/tests/i915/gem_tiled_fence_blits.c
@@ -335,5 +335,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_tiled_partial_pwrite_pread.c b/tests/i915/gem_tiled_partial_pwrite_pread.c
index a7e845e32..d4f66d51e 100644
--- a/tests/i915/gem_tiled_partial_pwrite_pread.c
+++ b/tests/i915/gem_tiled_partial_pwrite_pread.c
@@ -330,6 +330,6 @@ igt_main
 		intel_buf_destroy(tiled_staging_buf);
 		buf_ops_destroy(bops);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/i915/gem_tiled_pread_basic.c
index ddf9f0f56..a2253b51e 100644
--- a/tests/i915/gem_tiled_pread_basic.c
+++ b/tests/i915/gem_tiled_pread_basic.c
@@ -230,5 +230,5 @@ igt_simple_main
 		}
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_tiled_pread_pwrite.c b/tests/i915/gem_tiled_pread_pwrite.c
index 3331e61ad..2f0f6f547 100644
--- a/tests/i915/gem_tiled_pread_pwrite.c
+++ b/tests/i915/gem_tiled_pread_pwrite.c
@@ -162,5 +162,5 @@ igt_simple_main
 		gem_madvise(fd, handle, I915_MADV_DONTNEED);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_tiled_swapping.c b/tests/i915/gem_tiled_swapping.c
index fb633ecab..90ce70bdb 100644
--- a/tests/i915/gem_tiled_swapping.c
+++ b/tests/i915/gem_tiled_swapping.c
@@ -256,5 +256,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_tiled_wb.c b/tests/i915/gem_tiled_wb.c
index 7f1afbc90..6a8b79ecc 100644
--- a/tests/i915/gem_tiled_wb.c
+++ b/tests/i915/gem_tiled_wb.c
@@ -249,5 +249,5 @@ igt_simple_main
 		munmap(linear, last_page - first_page);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_tiled_wc.c b/tests/i915/gem_tiled_wc.c
index dc4e4d2d7..1994453b3 100644
--- a/tests/i915/gem_tiled_wc.c
+++ b/tests/i915/gem_tiled_wc.c
@@ -250,5 +250,5 @@ igt_simple_main
 		munmap(linear, last_page - first_page);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_tiling_max_stride.c b/tests/i915/gem_tiling_max_stride.c
index 6001f72be..5943ed93f 100644
--- a/tests/i915/gem_tiling_max_stride.c
+++ b/tests/i915/gem_tiling_max_stride.c
@@ -146,5 +146,5 @@ igt_simple_main
 
 	munmap(ptr, size);
 
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/i915/gem_unfence_active_buffers.c b/tests/i915/gem_unfence_active_buffers.c
index 1f25a81b1..d3bc1cee6 100644
--- a/tests/i915/gem_unfence_active_buffers.c
+++ b/tests/i915/gem_unfence_active_buffers.c
@@ -107,5 +107,5 @@ igt_simple_main
 
 	igt_spin_free(i915, spin);
 	put_ahnd(ahnd);
-	close(i915);
+	drm_close_driver(i915);
 }
diff --git a/tests/i915/gem_unref_active_buffers.c b/tests/i915/gem_unref_active_buffers.c
index badded1f7..47023a3a0 100644
--- a/tests/i915/gem_unref_active_buffers.c
+++ b/tests/i915/gem_unref_active_buffers.c
@@ -133,5 +133,5 @@ igt_simple_main
 
 	igt_spin_free(i915, spin);
 	put_ahnd(ahnd);
-	close(i915);
+	drm_close_driver(i915);
 }
diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index e9235a689..ecbfdf94f 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -1086,7 +1086,7 @@ static void test_nohangcheck_hostile(int i915)
 	close(fence);
 
 	close(dir);
-	close(i915);
+	drm_close_driver(i915);
 }
 
 static size_t hugepagesize(void)
@@ -1644,9 +1644,9 @@ static int test_dmabuf(void)
 
 	/* destroy userptr object and expect SIGBUS */
 	free_userptr_bo(fd1, handle);
-	close(fd1);
+	drm_close_driver(fd1);
 
-	close(fd2);
+	drm_close_driver(fd2);
 	reset_handle_ptr();
 
 	return 0;
diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
index f24aefdae..8834c987f 100644
--- a/tests/i915/gem_vm_create.c
+++ b/tests/i915/gem_vm_create.c
@@ -370,7 +370,7 @@ static void isolation(int i915)
 	gem_read(i915, obj[0].handle, 0, &result, sizeof(result));
 	igt_assert_eq(result, 1);
 
-	close(other);
+	drm_close_driver(other);
 
 	gem_close(i915, obj[1].handle);
 	gem_close(i915, obj[0].handle);
@@ -411,6 +411,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
index c1cd37e63..674deb57d 100644
--- a/tests/i915/gem_wait.c
+++ b/tests/i915/gem_wait.c
@@ -336,6 +336,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
index 640a8cad8..1e4c35021 100644
--- a/tests/i915/gem_watchdog.c
+++ b/tests/i915/gem_watchdog.c
@@ -597,6 +597,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(i915, ctx);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
index da8cfa011..c5ca26c08 100644
--- a/tests/i915/gem_workarounds.c
+++ b/tests/i915/gem_workarounds.c
@@ -305,7 +305,7 @@ static void check_workarounds(int fd, enum operation op, unsigned int flags)
 	if (flags & CONTEXT)
 		intel_ctx_destroy(fd, ctx);
 	if (flags & FD)
-		close(fd);
+		drm_close_driver(fd);
 }
 
 igt_main
diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
index 81a5bb14f..807cb1e9d 100644
--- a/tests/i915/gen7_exec_parse.c
+++ b/tests/i915/gen7_exec_parse.c
@@ -476,7 +476,7 @@ static void hsw_load_register_reg(void)
 				   0xabcdabc0);
 	}
 
-	close(fd);
+	drm_close_driver(fd);
 }
 
 igt_main
@@ -748,6 +748,6 @@ igt_main
 		igt_stop_hang_detector();
 		gem_close(fd, handle);
 
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index a927bfaca..33ff6bcb5 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -1299,6 +1299,6 @@ igt_main
 		igt_stop_hang_detector();
 		gem_close(i915, handle);
 
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/i915_fb_tiling.c b/tests/i915/i915_fb_tiling.c
index 586950266..14c17b030 100644
--- a/tests/i915/i915_fb_tiling.c
+++ b/tests/i915/i915_fb_tiling.c
@@ -52,5 +52,5 @@ igt_simple_main
 	igt_assert_eq(ret, -EBUSY);
 
 	igt_remove_fb(drm_fd, &fb);
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 }
diff --git a/tests/i915/i915_getparams_basic.c b/tests/i915/i915_getparams_basic.c
index 74ccaf4d3..b22ab5d93 100644
--- a/tests/i915/i915_getparams_basic.c
+++ b/tests/i915/i915_getparams_basic.c
@@ -62,7 +62,7 @@ init(void)
 static void
 deinit(void)
 {
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 }
 
 
diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index fc46bd297..dcd34cd0e 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -160,7 +160,7 @@ static void check_alive(void)
 	put_ahnd(ahnd);
 	intel_ctx_destroy(fd, ctx);
 	gem_quiescent_gpu(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static bool has_error_state(int dir)
@@ -643,6 +643,6 @@ igt_main
 
 		igt_disallow_hang(device, hang);
 		intel_ctx_destroy(device, ctx);
-		close(device);
+		drm_close_driver(device);
 	}
 }
diff --git a/tests/i915/i915_hwmon.c b/tests/i915/i915_hwmon.c
index 279f6821b..48ed9f3b7 100644
--- a/tests/i915/i915_hwmon.c
+++ b/tests/i915/i915_hwmon.c
@@ -96,6 +96,6 @@ igt_main
 
 	igt_fixture {
 		close(hwm);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/i915_module_load.c b/tests/i915/i915_module_load.c
index df24aee5e..9fffe93d9 100644
--- a/tests/i915/i915_module_load.c
+++ b/tests/i915/i915_module_load.c
@@ -280,7 +280,7 @@ static void gem_sanitycheck(void)
 		store_all(i915);
 	errno = 0;
 
-	close(i915);
+	drm_close_driver(i915);
 	igt_assert_eq(err, expected);
 }
 
@@ -328,7 +328,7 @@ static void load_and_check_i915(void)
 
 	/* make sure the GPU is idle */
 	gem_quiescent_gpu(drm_fd);
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 
 	/* make sure we can do basic memory ops */
 	gem_sanitycheck();
@@ -369,7 +369,7 @@ static uint32_t  driver_load_with_lmem_bar_size(uint32_t lmem_bar_size, bool che
 		}
 	}
 
-	close(i915);
+	drm_close_driver(i915);
 
 	return lmem_bar_size;
 }
@@ -461,7 +461,7 @@ igt_main
 			igt_require_gem(i915);
 			igt_require(gem_has_lmem(i915));
 			igt_skip_on_f(igt_sysfs_get_num_gt(i915) > 1, "Skips for more than one lmem instance.\n");
-			close(i915);
+			drm_close_driver(i915);
 		}
 
 		/* Test for lmem_bar_size modparam support */
diff --git a/tests/i915/i915_pciid.c b/tests/i915/i915_pciid.c
index c44be56dc..8322bd564 100644
--- a/tests/i915/i915_pciid.c
+++ b/tests/i915/i915_pciid.c
@@ -77,5 +77,5 @@ igt_simple_main
 
 	igt_assert(has_known_intel_chipset(intel));
 
-	close(intel);
+	drm_close_driver(intel);
 }
diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index b633387bc..3c73b054b 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -357,6 +357,6 @@ igt_main
 
 		igt_display_fini(&display);
 		igt_pm_restore_sata_link_power_management();
-		close(display.drm_fd);
+		drm_close_driver(display.drm_fd);
 	}
 }
diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 2bb07ba8b..5069ddcc3 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -730,7 +730,7 @@ igt_main
 		close(data.debugfs_root_fd);
 		close(data.msr_fd);
 		display_fini(&data);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 
 	igt_exit();
diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.c
index 9005cd220..7422493af 100644
--- a/tests/i915/i915_pm_freq_api.c
+++ b/tests/i915/i915_pm_freq_api.c
@@ -150,6 +150,6 @@ igt_main
 			igt_assert(set_freq(dirfd, RPS_MAX_FREQ_MHZ, stash_max[gt]) > 0);
 			igt_assert(set_freq(dirfd, RPS_MIN_FREQ_MHZ, stash_min[gt]) > 0);
 		}
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/i915_pm_freq_mult.c b/tests/i915/i915_pm_freq_mult.c
index d75ec3f9e..af62bbc2c 100644
--- a/tests/i915/i915_pm_freq_mult.c
+++ b/tests/i915/i915_pm_freq_mult.c
@@ -177,6 +177,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index cb01a6d9e..291e56674 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -223,6 +223,6 @@ igt_main
 	igt_fixture {
 		free(data.pwr_dmn_info);
 		igt_display_fini(&data.display);
-		close(data.drm_fd);
+		drm_close_driver(data.drm_fd);
 	}
 }
diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_residency.c
index ce81e668a..b266680ac 100644
--- a/tests/i915/i915_pm_rc6_residency.c
+++ b/tests/i915/i915_pm_rc6_residency.c
@@ -627,6 +627,6 @@ igt_main
 
 	igt_fixture {
 		intel_ctx_destroy(i915, ctx);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index 238d39240..7044fcd81 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -917,7 +917,7 @@ static void pm_rps_exit_handler(int sig)
 	if (lh.igt_proc.running)
 		load_helper_stop();
 
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 }
 
 igt_main
diff --git a/tests/i915/i915_pm_sseu.c b/tests/i915/i915_pm_sseu.c
index 39eecb8fe..cee29a7c5 100644
--- a/tests/i915/i915_pm_sseu.c
+++ b/tests/i915/i915_pm_sseu.c
@@ -323,7 +323,7 @@ gem_deinit(void)
 	case 2:
 		buf_ops_destroy(gem.bops);
 	case 1:
-		close(gem.drm_fd);
+		drm_close_driver(gem.drm_fd);
 	}
 }
 
diff --git a/tests/i915/i915_power.c b/tests/i915/i915_power.c
index 3675b9d6d..ed7bef495 100644
--- a/tests/i915/i915_power.c
+++ b/tests/i915/i915_power.c
@@ -86,6 +86,6 @@ igt_main
 	}
 
 	igt_fixture {
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 194f2e91b..f97379b83 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -1572,6 +1572,6 @@ igt_main
 		query_parse_and_validate_hwconfig_table(fd);
 
 	igt_fixture {
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index 9f0a4d2ac..851e797c2 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -256,7 +256,7 @@ test_shrink(int fd, unsigned int mode)
 		igt_system_suspend_autoresume(mode, SUSPEND_TEST_NONE);
 
 		munmap(mem, size);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_waitchildren();
@@ -300,7 +300,7 @@ test_suspend_without_i915(int state)
 		igt_pm_get_d3cold_allowed(&card, d3cold_allowed);
 		igt_pm_set_d3cold_allowed(&card, "0\n");
 	}
-	close(fd);
+	drm_close_driver(fd);
 
 	igt_kmsg(KMSG_INFO "Unloading i915\n");
 	igt_assert_eq(igt_i915_driver_unload(),0);
@@ -383,5 +383,5 @@ igt_main
 		test_forcewake(fd, true);
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 069ab8c02..3565d61cc 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -4704,7 +4704,7 @@ gen12_test_single_ctx_render_target_writes_a_counter(const struct intel_executio
 			igt_drop_root();
 			gen12_single_ctx_helper(e);
 
-			close(drm_fd);
+			drm_close_driver(drm_fd);
 		}
 		child_ret = igt_wait_helper(&child);
 		igt_assert(WEXITSTATUS(child_ret) == EAGAIN ||
@@ -5485,7 +5485,7 @@ test_i915_ref_count(void)
 	igt_debug("ref count after opening i915 perf stream = %u\n", ref_count1);
 	igt_assert(ref_count1 > ref_count0);
 
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 	close(sysfs);
 	drm_fd = -1;
 	sysfs = -1;
@@ -6194,6 +6194,6 @@ igt_main
 			put_engine_groups(perf_oa_groups, num_perf_oa_groups);
 
 		intel_ctx_destroy(drm_fd, ctx);
-		close(drm_fd);
+		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 8b31df7b2..0806a8e54 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -2424,7 +2424,7 @@ static void test_unload(unsigned int num_engines)
 		if (fd[count] != -1)
 			count++;
 
-		close(i915);
+		drm_close_driver(i915);
 
 		buf = calloc(count, sizeof(uint64_t));
 		igt_assert(buf);
@@ -2768,13 +2768,13 @@ igt_main
 
 		igt_fixture {
 			intel_ctx_destroy(render_fd, render_ctx);
-			close(render_fd);
+			drm_close_driver(render_fd);
 		}
 	}
 
 	igt_fixture {
 		intel_ctx_destroy(fd, ctx);
-		close(fd);
+		drm_close_driver(fd);
 	}
 
 	igt_subtest("module-unload") {
diff --git a/tests/i915/sysfs_defaults.c b/tests/i915/sysfs_defaults.c
index 066532f0a..b686c19fc 100644
--- a/tests/i915/sysfs_defaults.c
+++ b/tests/i915/sysfs_defaults.c
@@ -116,6 +116,6 @@ igt_main
 
 	igt_fixture {
 		close(engines);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
index a3de43a37..22c5888c6 100644
--- a/tests/i915/sysfs_heartbeat_interval.c
+++ b/tests/i915/sysfs_heartbeat_interval.c
@@ -543,6 +543,6 @@ igt_main
 
 	igt_fixture {
 		close(engines);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/sysfs_preempt_timeout.c b/tests/i915/sysfs_preempt_timeout.c
index 3d24bf61c..964b78ae8 100644
--- a/tests/i915/sysfs_preempt_timeout.c
+++ b/tests/i915/sysfs_preempt_timeout.c
@@ -362,6 +362,6 @@ igt_main
 
 	igt_fixture {
 		close(engines);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
index f1b518264..fc2b14e16 100644
--- a/tests/i915/sysfs_timeslice_duration.c
+++ b/tests/i915/sysfs_timeslice_duration.c
@@ -587,6 +587,6 @@ igt_main
 
 	igt_fixture {
 		close(engines);
-		close(i915);
+		drm_close_driver(i915);
 	}
 }
-- 
2.40.0
