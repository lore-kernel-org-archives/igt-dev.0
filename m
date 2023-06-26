Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C44F10E050
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 05:17:25 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Mon, 26 Jun 2023 10:40:27 +0530
Message-Id: <20230626051031.2363120-21-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 i-g-t 20/24] tests/xe: Use drm_close_driver() to
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/testdisplay.c             |  4 ++--
 tests/xe/xe_compute.c           |  2 +-
 tests/xe/xe_create.c            |  4 ++--
 tests/xe/xe_debugfs.c           |  2 +-
 tests/xe/xe_dma_buf_sync.c      |  4 ++--
 tests/xe/xe_evict.c             |  6 +++---
 tests/xe/xe_exec_balancer.c     |  2 +-
 tests/xe/xe_exec_basic.c        |  2 +-
 tests/xe/xe_exec_compute_mode.c |  2 +-
 tests/xe/xe_exec_fault_mode.c   |  2 +-
 tests/xe/xe_exec_reset.c        |  8 ++++----
 tests/xe/xe_exec_threads.c      |  8 ++++----
 tests/xe/xe_guc_pc.c            |  2 +-
 tests/xe/xe_huc_copy.c          |  2 +-
 tests/xe/xe_intel_bb.c          |  2 +-
 tests/xe/xe_mmap.c              |  2 +-
 tests/xe/xe_mmio.c              |  2 +-
 tests/xe/xe_module_load.c       |  2 +-
 tests/xe/xe_noexec_ping_pong.c  |  2 +-
 tests/xe/xe_pm.c                |  2 +-
 tests/xe/xe_prime_self_import.c | 30 +++++++++++++++---------------
 tests/xe/xe_query.c             |  2 +-
 tests/xe/xe_spin_batch.c        |  2 +-
 tests/xe/xe_vm.c                |  2 +-
 tests/xe/xe_waitfence.c         |  2 +-
 25 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index ee272dfb2..294d4c604 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -548,7 +548,7 @@ int update_display(bool probe)
 
 __noreturn static void cleanup_and_exit(int ret)
 {
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 	exit(ret);
 }
 
@@ -779,7 +779,7 @@ out_hotplug:
 out_mainloop:
 	g_main_loop_unref(mainloop);
 out_close:
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 
 	igt_assert_eq(ret, 0);
 }
diff --git a/tests/xe/xe_compute.c b/tests/xe/xe_compute.c
index 28fd8bd11..1bb4e9821 100644
--- a/tests/xe/xe_compute.c
+++ b/tests/xe/xe_compute.c
@@ -46,6 +46,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(xe);
-		close(xe);
+		drm_close_driver(xe);
 	}
 }
diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
index b427c51fd..744f2c799 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -177,7 +177,7 @@ static void create_engines(int fd, enum engine_destroy ed)
 	igt_waitchildren();
 
 	xe_vm_destroy(fd, vm);
-	close(fd);
+	drm_close_driver(fd);
 
 	seconds = igt_seconds_elapsed(&tv);
 	igt_assert_f(seconds < MAXTIME,
@@ -231,6 +231,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(xe);
-		close(xe);
+		drm_close_driver(xe);
 	}
 }
diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index 985bff6d2..c404da258 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -271,6 +271,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
index 71184c969..d6342746a 100644
--- a/tests/xe/xe_dma_buf_sync.c
+++ b/tests/xe/xe_dma_buf_sync.c
@@ -219,7 +219,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 
 	for (i = 0; i < N_FD; ++i) {
 		xe_device_put(fd[i]);
-		close(fd[i]);
+		drm_close_driver(fd[i]);
 	}
 
 }
@@ -256,6 +256,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 2c39d4390..21cf27dc0 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -201,7 +201,7 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 		xe_vm_destroy(fd, vm3);
 	}
 	xe_device_put(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 static void
@@ -369,7 +369,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & MULTI_VM)
 		xe_vm_destroy(fd, vm2);
 	xe_device_put(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 struct thread_data {
@@ -700,5 +700,5 @@ igt_main
 	}
 
 	igt_fixture
-		close(fd);
+		drm_close_driver(fd);
 }
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index 83a7b77ba..e5fe1ea2a 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -701,6 +701,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index ae192f8e3..9aeb861aa 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -350,6 +350,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index e2c9d0f38..966aae566 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -366,6 +366,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
index 6d9e64868..566a5981f 100644
--- a/tests/xe/xe_exec_fault_mode.c
+++ b/tests/xe/xe_exec_fault_mode.c
@@ -562,6 +562,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index 30b0548bf..8699ad26b 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -286,7 +286,7 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
 				xe_engine_destroy(fd, engines[i]);
 		}
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
 		return;
@@ -461,7 +461,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 				xe_engine_destroy(fd, engines[i]);
 		}
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
 		return;
@@ -636,7 +636,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 				xe_engine_destroy(fd, engines[i]);
 		}
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
 		return;
@@ -927,6 +927,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index aac2450ee..f34f33b94 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -245,7 +245,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		xe_vm_destroy(fd, vm);
 	if (owns_fd) {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
 
@@ -459,7 +459,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		xe_vm_destroy(fd, vm);
 	if (owns_fd) {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
 
@@ -703,7 +703,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		xe_vm_destroy(fd, vm);
 	if (owns_fd) {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
 
@@ -1407,6 +1407,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 89d5ae9ef..3e2e44d99 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -490,6 +490,6 @@ igt_main
 		}
 		close(sysfs);
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c
index fdac907d6..ccdfe8622 100644
--- a/tests/xe/xe_huc_copy.c
+++ b/tests/xe/xe_huc_copy.c
@@ -192,6 +192,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(xe);
-		close(xe);
+		drm_close_driver(xe);
 	}
 }
diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
index 83fe29242..5b22b967b 100644
--- a/tests/xe/xe_intel_bb.c
+++ b/tests/xe/xe_intel_bb.c
@@ -1143,6 +1143,6 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 	igt_fixture {
 		xe_device_put(xe);
 		buf_ops_destroy(bops);
-		close(xe);
+		drm_close_driver(xe);
 	}
 }
diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index 420c7f86c..1cc55cf3c 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -140,6 +140,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_mmio.c b/tests/xe/xe_mmio.c
index ca3408934..b8f0596ce 100644
--- a/tests/xe/xe_mmio.c
+++ b/tests/xe/xe_mmio.c
@@ -90,6 +90,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_module_load.c b/tests/xe/xe_module_load.c
index 3b2dc1fdc..575d57268 100644
--- a/tests/xe/xe_module_load.c
+++ b/tests/xe/xe_module_load.c
@@ -87,7 +87,7 @@ static void load_and_check_xe(const char *opts)
 	/* driver is ready, check if it's bound */
 	drm_fd = __drm_open_driver(DRIVER_XE);
 	igt_fail_on_f(drm_fd < 0, "Cannot open the xe DRM driver after modprobing xe.\n");
-	close(drm_fd);
+	drm_close_driver(drm_fd);
 }
 
 static const char * const unwanted_drivers[] = {
diff --git a/tests/xe/xe_noexec_ping_pong.c b/tests/xe/xe_noexec_ping_pong.c
index 1d04d4608..ee0e33e6b 100644
--- a/tests/xe/xe_noexec_ping_pong.c
+++ b/tests/xe/xe_noexec_ping_pong.c
@@ -104,5 +104,5 @@ igt_simple_main
 	test_ping_pong(fd, xe_hw_engine(fd, 0));
 
 	xe_device_put(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index bba799bcb..289337cd3 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -445,6 +445,6 @@ igt_main
 		set_d3cold_allowed(device.pci_xe, d3cold_allowed);
 		igt_restore_runtime_pm();
 		xe_device_put(device.fd_xe);
-		close(device.fd_xe);
+		drm_close_driver(device.fd_xe);
 	}
 }
diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
index 7a7e3d5ed..c1065b2e8 100644
--- a/tests/xe/xe_prime_self_import.c
+++ b/tests/xe/xe_prime_self_import.c
@@ -123,9 +123,9 @@ static void test_with_fd_dup(void)
 	check_bo(fd2, handle_import, fd2, handle_import);
 
 	xe_device_put(fd1);
-	close(fd1);
+	drm_close_driver(fd1);
 	xe_device_put(fd2);
-	close(fd2);
+	drm_close_driver(fd2);
 }
 
 /**
@@ -166,9 +166,9 @@ static void test_with_two_bos(void)
 	check_bo(fd2, handle_import, fd2, handle_import);
 
 	xe_device_put(fd1);
-	close(fd1);
+	drm_close_driver(fd1);
 	xe_device_put(fd2);
-	close(fd2);
+	drm_close_driver(fd2);
 }
 
 /**
@@ -201,9 +201,9 @@ static void test_with_one_bo_two_files(void)
 	igt_assert_eq_u32(handle_import, handle_open);
 
 	xe_device_put(fd1);
-	close(fd1);
+	drm_close_driver(fd1);
 	xe_device_put(fd2);
-	close(fd2);
+	drm_close_driver(fd2);
 	close(dma_buf_fd1);
 	close(dma_buf_fd2);
 }
@@ -258,10 +258,10 @@ static void test_with_one_bo(void)
 
 	/* Completely rip out exporting fd. */
 	xe_device_put(fd1);
-	close(fd1);
+	drm_close_driver(fd1);
 	check_bo(fd2, handle_import1, fd2, handle_import1);
 	xe_device_put(fd2);
-	close(fd2);
+	drm_close_driver(fd2);
 }
 
 static void *thread_fn_reimport_vs_close(void *p)
@@ -334,7 +334,7 @@ static void *thread_fn_reimport_vs_close(void *p)
 
 	pthread_barrier_destroy(&g_barrier);
 	xe_device_put(fds[0]);
-	close(fds[0]);
+	drm_close_driver(fds[0]);
 	close(fds[1]);
 
 	/* TODO: Read object count */
@@ -342,7 +342,7 @@ static void *thread_fn_reimport_vs_close(void *p)
 
 	igt_info("leaked %i objects\n", obj_count);
 
-	close(fake);
+	drm_close_driver(fake);
 
 	igt_assert_eq(obj_count, 0);
 }
@@ -428,7 +428,7 @@ static void test_export_close_race(void)
 
 	pthread_barrier_destroy(&g_barrier);
 	xe_device_put(fd);
-	close(fd);
+	drm_close_driver(fd);
 
 	/* TODO: Read object count */
 	obj_count = 0;
@@ -436,7 +436,7 @@ static void test_export_close_race(void)
 	igt_info("leaked %i objects\n", obj_count);
 
 	xe_device_put(fake);
-	close(fake);
+	drm_close_driver(fake);
 
 	igt_assert_eq(obj_count, 0);
 }
@@ -472,7 +472,7 @@ static void test_llseek_size(void)
 	}
 
 	xe_device_put(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 /**
@@ -508,7 +508,7 @@ static void test_llseek_bad(void)
 	close(dma_buf_fd);
 
 	xe_device_put(fd);
-	close(fd);
+	drm_close_driver(fd);
 }
 
 igt_main
@@ -541,6 +541,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index 40bd19ae7..22eeb2b43 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -492,6 +492,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(xe);
-		close(xe);
+		drm_close_driver(xe);
 	}
 }
diff --git a/tests/xe/xe_spin_batch.c b/tests/xe/xe_spin_batch.c
index 29a837251..1503b30a9 100644
--- a/tests/xe/xe_spin_batch.c
+++ b/tests/xe/xe_spin_batch.c
@@ -167,6 +167,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 479ded70f..28269c604 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -1856,6 +1856,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
index c6b2db125..d2e422f83 100644
--- a/tests/xe/xe_waitfence.c
+++ b/tests/xe/xe_waitfence.c
@@ -132,6 +132,6 @@ igt_main
 
 	igt_fixture {
 		xe_device_put(fd);
-		close(fd);
+		drm_close_driver(fd);
 	}
 }
-- 
2.40.0
