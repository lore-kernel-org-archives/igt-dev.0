Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7074410E033
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 05:17:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Mon, 26 Jun 2023 10:40:30 +0530
Message-Id: <20230626051031.2363120-24-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 i-g-t 23/24] tests: Drop xe_device get/put from test
 level
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

As xe_device get/put is already handled at driver open/close
level, drop these checks from tests.

V2: - New patch for xe_config()
V3: - Fix xe_spin_batch.c

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/kms_3d.c                  |  6 ------
 tests/kms_addfb_basic.c         |  9 +--------
 tests/kms_flip.c                |  9 +--------
 tests/kms_flip_event_leak.c     |  4 ----
 tests/kms_getfb.c               | 15 +--------------
 tests/kms_hdmi_inject.c         |  7 -------
 tests/kms_setmode.c             |  7 -------
 tests/xe/xe_compute.c           |  8 ++------
 tests/xe/xe_create.c            |  9 ++-------
 tests/xe/xe_debugfs.c           |  6 +-----
 tests/xe/xe_dma_buf_sync.c      | 11 ++---------
 tests/xe/xe_evict.c             |  5 -----
 tests/xe/xe_exec_balancer.c     |  8 ++------
 tests/xe/xe_exec_basic.c        |  8 ++------
 tests/xe/xe_exec_compute_mode.c |  8 ++------
 tests/xe/xe_exec_fault_mode.c   |  5 +----
 tests/xe/xe_exec_reset.c        | 23 +++++------------------
 tests/xe/xe_exec_threads.c      | 20 ++++----------------
 tests/xe/xe_gpgpu_fill.c        |  3 ---
 tests/xe/xe_guc_pc.c            |  2 --
 tests/xe/xe_huc_copy.c          |  8 ++------
 tests/xe/xe_intel_bb.c          |  2 --
 tests/xe/xe_mmap.c              |  8 ++------
 tests/xe/xe_mmio.c              |  8 ++------
 tests/xe/xe_noexec_ping_pong.c  |  2 --
 tests/xe/xe_pm.c                |  3 ---
 tests/xe/xe_prime_self_import.c | 31 +------------------------------
 tests/xe/xe_query.c             |  8 ++------
 tests/xe/xe_spin_batch.c        |  8 ++------
 tests/xe/xe_vm.c                |  5 +----
 tests/xe/xe_waitfence.c         |  8 ++------
 31 files changed, 40 insertions(+), 224 deletions(-)

diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index 55e1d8058..c7a9d42d2 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -37,9 +37,6 @@ igt_simple_main
 
 	drm_fd = drm_open_driver_master(DRIVER_ANY);
 
-	if (is_xe_device(drm_fd))
-		xe_device_get(drm_fd);
-
 	res = drmModeGetResources(drm_fd);
 	igt_require(res);
 
@@ -116,8 +113,5 @@ igt_simple_main
 
 	drmModeFreeConnector(connector);
 
-	if (is_xe_device(drm_fd))
-		xe_device_put(drm_fd);
-
 	drm_close_driver(drm_fd);
 }
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 53a6a007a..065f21975 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -974,9 +974,6 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require(has_addfb2_iface(fd));
-
-		if (is_xe_device(fd))
-			xe_device_get(fd);
 	}
 
 	invalid_tests(fd);
@@ -1008,10 +1005,6 @@ igt_main
 			igt_display_fini(&display);
 	}
 
-	igt_fixture {
-		if (is_xe_device(fd))
-			xe_device_put(fd);
-
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index efff06e1c..d57990240 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1858,9 +1858,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_install_exit_handler(kms_flip_exit_handler);
 		get_timestamp_format();
 
-		if (is_xe_device(drm_fd))
-			xe_device_get(drm_fd);
-
 		if (is_i915_device(drm_fd)) {
 			bops = buf_ops_create(drm_fd);
 		}
@@ -1926,10 +1923,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	}
 	igt_stop_signal_helper();
 
-	igt_fixture {
-		if (is_xe_device(drm_fd))
-			xe_device_put(drm_fd);
-
+	igt_fixture
 		drm_close_driver(drm_fd);
-	}
 }
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index 7e46f5ec0..423ce40df 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -65,8 +65,6 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_device_drop_master(data->drm_fd);
 
 	igt_device_set_master(fd);
-	if (is_xe_device(fd))
-		xe_device_get(fd);
 
 	igt_create_fb(fd, mode->hdisplay, mode->vdisplay,
 		      DRM_FORMAT_XRGB8888,
@@ -77,8 +75,6 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 			      data);
 	igt_assert_eq(ret, 0);
 
-	if (is_xe_device(fd))
-		xe_device_put(fd);
 	ret = drm_close_driver(fd);
 	igt_assert_eq(ret, 0);
 
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 46cad39bd..afcf07fe8 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -404,9 +404,6 @@ static void test_handle_protection(void) {
 	igt_fixture {
 		non_master_fd = drm_open_driver(DRIVER_ANY);
 
-		if (is_xe_device(non_master_fd))
-			xe_device_get(non_master_fd);
-
 		non_master_add.width = 1024;
 		non_master_add.height = 1024;
 		non_master_add.pixel_format = DRM_FORMAT_XRGB8888;
@@ -454,9 +451,6 @@ static void test_handle_protection(void) {
 		do_ioctl(non_master_fd, DRM_IOCTL_MODE_RMFB, &non_master_add.fb_id);
 		gem_close(non_master_fd, non_master_add.handles[0]);
 
-		if (is_xe_device(non_master_fd))
-			xe_device_get(non_master_fd);
-
 		drm_close_driver(non_master_fd);
 	}
 }
@@ -468,9 +462,6 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require(has_getfb_iface(fd));
-
-		if (is_xe_device(fd))
-			xe_device_get(fd);
 	}
 
 	igt_subtest_group
@@ -485,10 +476,6 @@ igt_main
 	igt_subtest_group
 		test_handle_protection();
 
-	igt_fixture {
-		if (is_xe_device(fd))
-			xe_device_put(fd);
-
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index e3db34502..9aa5c59fc 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -206,9 +206,6 @@ igt_main
 		igt_require(connector);
 
 		kmstest_unset_all_crtcs(drm_fd, res);
-
-		if (is_xe_device(drm_fd))
-			xe_device_get(drm_fd);
 	}
 
 	igt_describe("Make sure that 4K modes exposed by DRM match the "
@@ -223,10 +220,6 @@ igt_main
 
 	igt_fixture {
 		drmModeFreeConnector(connector);
-
-		if (is_xe_device(drm_fd))
-			xe_device_put(drm_fd);
-
 		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index a85f4eaf2..035bbd0b0 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -955,9 +955,6 @@ igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 
 		drm_resources = drmModeGetResources(drm_fd);
 		igt_require(drm_resources);
-
-		if (is_xe_device(drm_fd))
-			xe_device_get(drm_fd);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
@@ -974,10 +971,6 @@ igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		drmModeFreeResources(drm_resources);
-
-		if (is_xe_device(drm_fd))
-			xe_device_put(drm_fd);
-
 		drm_close_driver(drm_fd);
 	}
 }
diff --git a/tests/xe/xe_compute.c b/tests/xe/xe_compute.c
index 1bb4e9821..2cf536701 100644
--- a/tests/xe/xe_compute.c
+++ b/tests/xe/xe_compute.c
@@ -36,16 +36,12 @@ igt_main
 {
 	int xe;
 
-	igt_fixture {
+	igt_fixture
 		xe = drm_open_driver(DRIVER_XE);
-		xe_device_get(xe);
-	}
 
 	igt_subtest("compute-square")
 		test_compute_square(xe);
 
-	igt_fixture {
-		xe_device_put(xe);
+	igt_fixture
 		drm_close_driver(xe);
-	}
 }
diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c
index 744f2c799..f893381d9 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -209,10 +209,8 @@ igt_main
 {
 	int xe;
 
-	igt_fixture {
+	igt_fixture
 		xe = drm_open_driver(DRIVER_XE);
-		xe_device_get(xe);
-	}
 
 	igt_subtest("create-invalid-size") {
 		create_invalid_size(xe);
@@ -228,9 +226,6 @@ igt_main
 		create_massive_size(xe);
 	}
 
-
-	igt_fixture {
-		xe_device_put(xe);
+	igt_fixture
 		drm_close_driver(xe);
-	}
 }
diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index bbd821f8c..5e16a71a0 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -241,14 +241,12 @@ static int opt_handler(int option, int option_index, void *input)
 
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
-	struct xe_device *xe_dev;
 	char devnode[PATH_MAX];
 	int fd;
 	int gt;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_dev = xe_device_get(fd);
 		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
 	}
 
@@ -269,8 +267,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		test_forcewake(fd);
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
index d6342746a..c08f8ac18 100644
--- a/tests/xe/xe_dma_buf_sync.c
+++ b/tests/xe/xe_dma_buf_sync.c
@@ -112,7 +112,6 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 
 	for (i = 0; i < N_FD; ++i) {
 		fd[i] = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd[0]);
 		vm[i] = xe_vm_create(fd[i], 0, 0);
 		engine[i] = xe_engine_create(fd[i], vm[i], !i ? hwe0 : hwe1, 0);
 	}
@@ -217,11 +216,8 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 		close(dma_buf_fd[i]);
 	}
 
-	for (i = 0; i < N_FD; ++i) {
-		xe_device_put(fd[i]);
+	for (i = 0; i < N_FD; ++i)
 		drm_close_driver(fd[i]);
-	}
-
 }
 
 igt_main
@@ -231,7 +227,6 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 
 		xe_for_each_hw_engine(fd, hwe)
 			if (hwe0 == NULL) {
@@ -254,8 +249,6 @@ igt_main
 	igt_subtest("export-dma-buf-many-read-sync")
 		test_export_dma_buf(hwe0, hwe1, 16, READ_SYNC);
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 21cf27dc0..1a596766b 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -62,7 +62,6 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(bo);
 
 	fd = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
 	if (flags & BIND_ENGINE)
@@ -200,7 +199,6 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
 		xe_vm_destroy(fd, vm2);
 		xe_vm_destroy(fd, vm3);
 	}
-	xe_device_put(fd);
 	drm_close_driver(fd);
 }
 
@@ -239,7 +237,6 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	igt_assert(bo);
 
 	fd = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd);
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
 			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
@@ -368,7 +365,6 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_destroy(fd, vm);
 	if (flags & MULTI_VM)
 		xe_vm_destroy(fd, vm2);
-	xe_device_put(fd);
 	drm_close_driver(fd);
 }
 
@@ -667,7 +663,6 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 		igt_require(xe_has_vram(fd));
 		vram_size = xe_vram_size(fd, 0);
 		igt_assert(vram_size);
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index e5fe1ea2a..928a26297 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -619,10 +619,8 @@ igt_main
 	int class;
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	igt_subtest("virtual-all-active")
 		xe_for_each_gt(fd, gt)
@@ -699,8 +697,6 @@ igt_main
 					test_cm(fd, gt, class, 1, 0, s->flags);
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index 9aeb861aa..af581c327 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -308,10 +308,8 @@ igt_main
 	};
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
@@ -348,8 +346,6 @@ igt_main
 				test_exec(fd, hwe, 1, 0, 1, s->flags);
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index 966aae566..4edcc4abe 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -332,10 +332,8 @@ igt_main
 	};
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
@@ -364,8 +362,6 @@ igt_main
 					  s->flags);
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
index 566a5981f..9b43c6d1b 100644
--- a/tests/xe/xe_exec_fault_mode.c
+++ b/tests/xe/xe_exec_fault_mode.c
@@ -516,7 +516,6 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 		igt_require(xe_supports_faults(fd));
 	}
 
@@ -560,8 +559,6 @@ igt_main
 		xe_for_each_hw_engine(fd, hwe)
 			test_atomic(fd, hwe, 8, WAIT_ATOMIC);
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index 8699ad26b..75c1c4487 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -170,10 +170,8 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
 
-	if (flags & CLOSE_FD) {
+	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	xe_for_each_hw_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
@@ -285,7 +283,6 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
 			for (i = 0; i < n_engines; i++)
 				xe_engine_destroy(fd, engines[i]);
 		}
-		xe_device_put(fd);
 		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
@@ -374,10 +371,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
 
-	if (flags & CLOSE_FD) {
+	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
 	bo_size = sizeof(*data) * n_execs;
@@ -460,7 +455,6 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			for (i = 0; i < n_engines; i++)
 				xe_engine_destroy(fd, engines[i]);
 		}
-		xe_device_put(fd);
 		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
@@ -547,10 +541,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
 
-	if (flags & CLOSE_FD) {
+	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
 			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
@@ -635,7 +627,6 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			for (i = 0; i < n_engines; i++)
 				xe_engine_destroy(fd, engines[i]);
 		}
-		xe_device_put(fd);
 		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
@@ -812,10 +803,8 @@ igt_main
 	int class;
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	igt_subtest("spin")
 		xe_for_each_hw_engine(fd, hwe)
@@ -925,8 +914,6 @@ igt_main
 	igt_subtest("gt-reset-stress")
 		gt_reset(fd, 4, 1);
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index f34f33b94..2d6b67f6d 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -73,7 +73,6 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	if (!fd) {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 		owns_fd = true;
 	}
 
@@ -243,10 +242,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 	if (owns_vm)
 		xe_vm_destroy(fd, vm);
-	if (owns_fd) {
-		xe_device_put(fd);
+	if (owns_fd)
 		drm_close_driver(fd);
-	}
 }
 
 static void
@@ -283,7 +280,6 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	if (!fd) {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 		owns_fd = true;
 	}
 
@@ -458,7 +454,6 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	if (owns_vm)
 		xe_vm_destroy(fd, vm);
 	if (owns_fd) {
-		xe_device_put(fd);
 		drm_close_driver(fd);
 	}
 }
@@ -496,7 +491,6 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	if (!fd) {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 		owns_fd = true;
 	}
 
@@ -701,10 +695,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 	if (owns_vm)
 		xe_vm_destroy(fd, vm);
-	if (owns_fd) {
-		xe_device_put(fd);
+	if (owns_fd)
 		drm_close_driver(fd);
-	}
 }
 
 struct thread_data {
@@ -1395,18 +1387,14 @@ igt_main
 	};
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("threads-%s", s->name)
 			threads(fd, s->flags);
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_gpgpu_fill.c b/tests/xe/xe_gpgpu_fill.c
index 12bf7c5fc..4da01ee8c 100644
--- a/tests/xe/xe_gpgpu_fill.c
+++ b/tests/xe/xe_gpgpu_fill.c
@@ -120,8 +120,6 @@ igt_main
 
 		fill_fn = igt_get_gpgpu_fillfunc(data.devid);
 		igt_require_f(fill_fn, "no gpgpu-fill function\n");
-
-		xe_device_get(data.drm_fd);
 	}
 
 	igt_subtest("basic") {
@@ -129,7 +127,6 @@ igt_main
 	}
 
 	igt_fixture {
-		xe_device_put(data.drm_fd);
 		buf_ops_destroy(data.bops);
 		drm_close_driver(data.drm_fd);
 	}
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 3e2e44d99..827693eb4 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -381,7 +381,6 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 
 		sysfs = igt_sysfs_open(fd);
 		igt_assert(sysfs != -1);
@@ -489,7 +488,6 @@ igt_main
 			set_freq(sysfs, gt, "max", stash_max);
 		}
 		close(sysfs);
-		xe_device_put(fd);
 		drm_close_driver(fd);
 	}
 }
diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c
index ccdfe8622..d4377f9a1 100644
--- a/tests/xe/xe_huc_copy.c
+++ b/tests/xe/xe_huc_copy.c
@@ -176,10 +176,8 @@ igt_main
 {
 	int xe;
 
-	igt_fixture {
+	igt_fixture
 		xe = drm_open_driver(DRIVER_XE);
-		xe_device_get(xe);
-	}
 
 	igt_subtest("huc_copy") {
 		/*
@@ -190,8 +188,6 @@ igt_main
 		test_huc_copy(xe);
 	}
 
-	igt_fixture {
-		xe_device_put(xe);
+	igt_fixture
 		drm_close_driver(xe);
-	}
 }
diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
index 5b22b967b..539f44a0f 100644
--- a/tests/xe/xe_intel_bb.c
+++ b/tests/xe/xe_intel_bb.c
@@ -1069,7 +1069,6 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
 		bops = buf_ops_create(xe);
-		xe_device_get(xe);
 	}
 
 	igt_describe("Ensure reset is possible on fresh bb");
@@ -1141,7 +1140,6 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture {
-		xe_device_put(xe);
 		buf_ops_destroy(bops);
 		drm_close_driver(xe);
 	}
diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index 1cc55cf3c..664ed54fc 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -115,10 +115,8 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	igt_subtest("system")
 		test_mmap(fd, system_memory(fd));
@@ -138,8 +136,6 @@ igt_main
 	igt_subtest("bad-object")
 		test_bad_object(fd);
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_mmio.c b/tests/xe/xe_mmio.c
index b8f0596ce..02e79d7e4 100644
--- a/tests/xe/xe_mmio.c
+++ b/tests/xe/xe_mmio.c
@@ -78,18 +78,14 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	igt_subtest("mmio-timestamp")
 		test_xe_mmio_timestamp(fd);
 	igt_subtest("mmio-invalid")
 		test_xe_mmio_invalid(fd);
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_noexec_ping_pong.c b/tests/xe/xe_noexec_ping_pong.c
index ee0e33e6b..49cf11fa6 100644
--- a/tests/xe/xe_noexec_ping_pong.c
+++ b/tests/xe/xe_noexec_ping_pong.c
@@ -99,10 +99,8 @@ igt_simple_main
 {
 
 	fd = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd);
 
 	test_ping_pong(fd, xe_hw_engine(fd, 0));
 
-	xe_device_put(fd);
 	drm_close_driver(fd);
 }
diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index 289337cd3..a7f73c4e6 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -374,8 +374,6 @@ igt_main
 		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
 		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
 
-		xe_device_get(device.fd_xe);
-
 		/* Always perform initial once-basic exec checking for health */
 		xe_for_each_hw_engine(device.fd_xe, hwe)
 			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
@@ -444,7 +442,6 @@ igt_main
 	igt_fixture {
 		set_d3cold_allowed(device.pci_xe, d3cold_allowed);
 		igt_restore_runtime_pm();
-		xe_device_put(device.fd_xe);
 		drm_close_driver(device.fd_xe);
 	}
 }
diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
index c1065b2e8..0fd79f704 100644
--- a/tests/xe/xe_prime_self_import.c
+++ b/tests/xe/xe_prime_self_import.c
@@ -105,9 +105,7 @@ static void test_with_fd_dup(void)
 	counter = 0;
 
 	fd1 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd1);
 	fd2 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd2);
 
 	handle = xe_bo_create(fd1, 0, 0, BO_SIZE);
 
@@ -122,9 +120,7 @@ static void test_with_fd_dup(void)
 	close(dma_buf_fd2);
 	check_bo(fd2, handle_import, fd2, handle_import);
 
-	xe_device_put(fd1);
 	drm_close_driver(fd1);
-	xe_device_put(fd2);
 	drm_close_driver(fd2);
 }
 
@@ -143,9 +139,7 @@ static void test_with_two_bos(void)
 	counter = 0;
 
 	fd1 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd1);
 	fd2 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd2);
 
 	handle1 = xe_bo_create(fd1, 0, 0, BO_SIZE);
 	handle2 = xe_bo_create(fd1, 0, 0, BO_SIZE);
@@ -165,9 +159,7 @@ static void test_with_two_bos(void)
 
 	check_bo(fd2, handle_import, fd2, handle_import);
 
-	xe_device_put(fd1);
 	drm_close_driver(fd1);
-	xe_device_put(fd2);
 	drm_close_driver(fd2);
 }
 
@@ -184,9 +176,7 @@ static void test_with_one_bo_two_files(void)
 	int dma_buf_fd1, dma_buf_fd2;
 
 	fd1 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd1);
 	fd2 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd2);
 
 	handle_orig = xe_bo_create(fd1, 0, 0, BO_SIZE);
 	dma_buf_fd1 = prime_handle_to_fd(fd1, handle_orig);
@@ -200,9 +190,7 @@ static void test_with_one_bo_two_files(void)
 	/* dma-buf self importing an flink bo should give the same handle */
 	igt_assert_eq_u32(handle_import, handle_open);
 
-	xe_device_put(fd1);
 	drm_close_driver(fd1);
-	xe_device_put(fd2);
 	drm_close_driver(fd2);
 	close(dma_buf_fd1);
 	close(dma_buf_fd2);
@@ -221,9 +209,7 @@ static void test_with_one_bo(void)
 	int dma_buf_fd;
 
 	fd1 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd1);
 	fd2 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd2);
 
 	handle = xe_bo_create(fd1, 0, 0, BO_SIZE);
 
@@ -257,10 +243,8 @@ static void test_with_one_bo(void)
 	check_bo(fd1, handle, fd2, handle_import1);
 
 	/* Completely rip out exporting fd. */
-	xe_device_put(fd1);
 	drm_close_driver(fd1);
 	check_bo(fd2, handle_import1, fd2, handle_import1);
-	xe_device_put(fd2);
 	drm_close_driver(fd2);
 }
 
@@ -313,7 +297,6 @@ static void *thread_fn_reimport_vs_close(void *p)
 	threads = calloc(num_threads, sizeof(pthread_t));
 
 	fds[0] = drm_open_driver(DRIVER_XE);
-	xe_device_get(fds[0]);
 
 	handle = xe_bo_create(fds[0], 0, 0, BO_SIZE);
 
@@ -333,7 +316,6 @@ static void *thread_fn_reimport_vs_close(void *p)
 	}
 
 	pthread_barrier_destroy(&g_barrier);
-	xe_device_put(fds[0]);
 	drm_close_driver(fds[0]);
 	close(fds[1]);
 
@@ -405,13 +387,11 @@ static void test_export_close_race(void)
 	/* Allocate exit handler fds in here so that we dont screw
 	 * up the counts */
 	fake = drm_open_driver(DRIVER_XE);
-	xe_device_get(fake);
 
 	/* TODO: Read object count */
 	obj_count = 0;
 
 	fd = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd);
 	pthread_barrier_init(&g_barrier, NULL, num_threads);
 
 	for (i = 0; i < num_threads; i++) {
@@ -427,7 +407,6 @@ static void test_export_close_race(void)
 	}
 
 	pthread_barrier_destroy(&g_barrier);
-	xe_device_put(fd);
 	drm_close_driver(fd);
 
 	/* TODO: Read object count */
@@ -435,7 +414,6 @@ static void test_export_close_race(void)
 
 	igt_info("leaked %i objects\n", obj_count);
 
-	xe_device_put(fake);
 	drm_close_driver(fake);
 
 	igt_assert_eq(obj_count, 0);
@@ -456,7 +434,6 @@ static void test_llseek_size(void)
 	counter = 0;
 
 	fd = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd);
 
 	for (i = 0; i < 10; i++) {
 		int bufsz = xe_get_default_alignment(fd) << i;
@@ -471,7 +448,6 @@ static void test_llseek_size(void)
 		close(dma_buf_fd);
 	}
 
-	xe_device_put(fd);
 	drm_close_driver(fd);
 }
 
@@ -490,7 +466,6 @@ static void test_llseek_bad(void)
 	counter = 0;
 
 	fd = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd);
 
 	handle = xe_bo_create(fd, 0, 0, BO_SIZE);
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
@@ -507,7 +482,6 @@ static void test_llseek_bad(void)
 
 	close(dma_buf_fd);
 
-	xe_device_put(fd);
 	drm_close_driver(fd);
 }
 
@@ -531,7 +505,6 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
@@ -539,8 +512,6 @@ igt_main
 			tests[i].fn();
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index 22eeb2b43..beee12ef9 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -458,10 +458,8 @@ igt_main
 {
 	int xe;
 
-	igt_fixture {
+	igt_fixture
 		xe = drm_open_driver(DRIVER_XE);
-		xe_device_get(xe);
-	}
 
 	igt_subtest("query-engines")
 		test_query_engines(xe);
@@ -490,8 +488,6 @@ igt_main
 	igt_subtest("query-invalid-extension")
 		test_query_invalid_extension(xe);
 
-	igt_fixture {
-		xe_device_put(xe);
+	igt_fixture
 		drm_close_driver(xe);
-	}
 }
diff --git a/tests/xe/xe_spin_batch.c b/tests/xe/xe_spin_batch.c
index 1503b30a9..56581f760 100644
--- a/tests/xe/xe_spin_batch.c
+++ b/tests/xe/xe_spin_batch.c
@@ -144,10 +144,8 @@ igt_main
 	int fd;
 	int gt, class;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	igt_subtest("spin-basic")
 		spin_basic(fd);
@@ -165,8 +163,6 @@ igt_main
 				spin_all(fd, gt, class);
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 28269c604..ca46531c0 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -1638,7 +1638,6 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 
 		xe_for_each_hw_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY) {
@@ -1854,8 +1853,6 @@ igt_main
 		}
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
index d2e422f83..28b218352 100644
--- a/tests/xe/xe_waitfence.c
+++ b/tests/xe/xe_waitfence.c
@@ -119,10 +119,8 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	igt_subtest("reltime")
 		waitfence(fd, RELTIME);
@@ -130,8 +128,6 @@ igt_main
 	igt_subtest("abstime")
 		waitfence(fd, ABSTIME);
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
-- 
2.40.0
