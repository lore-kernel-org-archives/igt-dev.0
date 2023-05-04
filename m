Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A8910E2E0
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 05:02:41 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu,  4 May 2023 10:27:26 +0530
Message-Id: <20230504045726.2954788-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
References: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 6/6] tests: Drop xe_device get/put from test level
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com, mchehab@kernel.org, kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com, karthik.b.s@intel.com, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

As xe_device get/put is already handled at driver open/close
level, drop these checks from tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_3d.c                  |  6 ------
 tests/kms_addfb_basic.c         |  9 +--------
 tests/kms_flip.c                |  9 +--------
 tests/kms_flip_event_leak.c     |  4 ----
 tests/kms_getfb.c               | 15 +--------------
 tests/kms_hdmi_inject.c         |  7 -------
 tests/kms_setmode.c             |  7 -------
 tests/xe/xe_compute.c           |  8 ++------
 tests/xe/xe_create.c            |  8 ++------
 tests/xe/xe_debugfs.c           |  8 ++------
 tests/xe/xe_dma_buf_sync.c      | 11 ++---------
 tests/xe/xe_evict.c             |  5 -----
 tests/xe/xe_exec_balancer.c     |  8 ++------
 tests/xe/xe_exec_basic.c        |  8 ++------
 tests/xe/xe_exec_compute_mode.c |  8 ++------
 tests/xe/xe_exec_fault_mode.c   |  5 +----
 tests/xe/xe_exec_reset.c        | 23 +++++------------------
 tests/xe/xe_exec_threads.c      | 20 ++++----------------
 tests/xe/xe_gpgpu_fill.c        |  6 +-----
 tests/xe/xe_guc_pc.c            |  2 --
 tests/xe/xe_huc_copy.c          |  8 ++------
 tests/xe/xe_intel_bb.c          |  2 --
 tests/xe/xe_mmap.c              |  8 ++------
 tests/xe/xe_mmio.c              |  8 ++------
 tests/xe/xe_noexec_ping_pong.c  |  2 --
 tests/xe/xe_pm.c                |  3 ---
 tests/xe/xe_prime_self_import.c | 31 +------------------------------
 tests/xe/xe_query.c             |  8 ++------
 tests/xe/xe_vm.c                |  5 +----
 tests/xe/xe_waitfence.c         |  8 ++------
 30 files changed, 40 insertions(+), 220 deletions(-)

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
index 1e5d834ce..629b81aa7 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -836,9 +836,6 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require(has_addfb2_iface(fd));
-
-		if (is_xe_device(fd))
-			xe_device_get(fd);
 	}
 
 	invalid_tests(fd);
@@ -870,10 +867,6 @@ igt_main
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
index 8d6a8e74d..c8ca21fe4 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1826,9 +1826,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_install_exit_handler(kms_flip_exit_handler);
 		get_timestamp_format();
 
-		if (is_xe_device(drm_fd))
-			xe_device_get(drm_fd);
-
 		if (is_i915_device(drm_fd)) {
 			bops = buf_ops_create(drm_fd);
 		}
@@ -1894,10 +1891,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
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
index 3cb568808..0b2e66ddf 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -399,9 +399,6 @@ static void test_handle_protection(void) {
 	igt_fixture {
 		non_master_fd = drm_open_driver(DRIVER_ANY);
 
-		if (is_xe_device(non_master_fd))
-			xe_device_get(non_master_fd);
-
 		non_master_add.width = 1024;
 		non_master_add.height = 1024;
 		non_master_add.pixel_format = DRM_FORMAT_XRGB8888;
@@ -449,9 +446,6 @@ static void test_handle_protection(void) {
 		do_ioctl(non_master_fd, DRM_IOCTL_MODE_RMFB, &non_master_add.fb_id);
 		gem_close(non_master_fd, non_master_add.handles[0]);
 
-		if (is_xe_device(non_master_fd))
-			xe_device_get(non_master_fd);
-
 		drm_close_driver(non_master_fd);
 	}
 }
@@ -463,9 +457,6 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require(has_getfb_iface(fd));
-
-		if (is_xe_device(fd))
-			xe_device_get(fd);
 	}
 
 	igt_subtest_group
@@ -480,10 +471,6 @@ igt_main
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
index 5e6cd8529..d2d198a95 100644
--- a/tests/xe/xe_compute.c
+++ b/tests/xe/xe_compute.c
@@ -35,16 +35,12 @@ igt_main
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
index b3d9fd49f..02a0a7338 100644
--- a/tests/xe/xe_create.c
+++ b/tests/xe/xe_create.c
@@ -91,17 +91,13 @@ igt_main
 {
 	int xe;
 
-	igt_fixture {
+	igt_fixture
 		xe = drm_open_driver(DRIVER_XE);
-		xe_device_get(xe);
-	}
 
 	igt_subtest("create-invalid-size") {
 		create_invalid_size(xe);
 	}
 
-	igt_fixture {
-		xe_device_put(xe);
+	igt_fixture
 		drm_close_driver(xe);
-	}
 }
diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index 4006981c6..c4396a37a 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -240,19 +240,17 @@ static int opt_handler(int option, int option_index, void *input)
 
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
 
 	igt_subtest("base") {
-		test_base(fd, xe_dev->config);
+		test_base(fd, xe_config(fd));
 	}
 
 
@@ -268,8 +266,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		test_forcewake(fd);
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
index 81ece2428..64027d68f 100644
--- a/tests/xe/xe_dma_buf_sync.c
+++ b/tests/xe/xe_dma_buf_sync.c
@@ -113,7 +113,6 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 
 	for (i = 0; i < N_FD; ++i) {
 		fd[i] = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd[0]);
 		vm[i] = xe_vm_create(fd[i], 0, 0);
 		engine[i] = xe_engine_create(fd[i], vm[i], !i ? hwe0 : hwe1, 0);
 	}
@@ -218,11 +217,8 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
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
@@ -232,7 +228,6 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 
 		xe_for_each_hw_engine(fd, hwe)
 			if (hwe0 == NULL) {
@@ -255,8 +250,6 @@ igt_main
 	igt_subtest("export-dma-buf-many-read-sync")
 		test_export_dma_buf(hwe0, hwe1, 16, READ_SYNC);
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 14a2d19f1..241eff191 100644
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
 
@@ -668,7 +664,6 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 		igt_require(xe_has_vram(fd));
 		vram_size = xe_vram_size(fd, 0);
 		igt_assert(vram_size);
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index fb4592903..81ec526e7 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -626,10 +626,8 @@ igt_main
 	int class;
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	igt_subtest("virtual-all-active")
 		xe_for_each_gt(fd, gt)
@@ -706,8 +704,6 @@ igt_main
 					test_cm(fd, gt, class, 1, 0, s->flags);
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index d14a764f4..d1f39e4b6 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -311,10 +311,8 @@ igt_main
 	};
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
@@ -351,8 +349,6 @@ igt_main
 				test_exec(fd, hwe, 1, 0, 1, s->flags);
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index 950cb6159..a58067e64 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -327,10 +327,8 @@ igt_main
 	};
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
@@ -359,8 +357,6 @@ igt_main
 					  s->flags);
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
index 8cd883c09..ee167f359 100644
--- a/tests/xe/xe_exec_fault_mode.c
+++ b/tests/xe/xe_exec_fault_mode.c
@@ -524,7 +524,6 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 		igt_require(xe_supports_faults(fd));
 	}
 
@@ -568,8 +567,6 @@ igt_main
 		xe_for_each_hw_engine(fd, hwe)
 			test_atomic(fd, hwe, 8, WAIT_ATOMIC);
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index 3700b8dce..bd8ad76fc 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -178,10 +178,8 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
 
-	if (flags & CLOSE_FD) {
+	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	xe_for_each_hw_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
@@ -293,7 +291,6 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
 			for (i = 0; i < n_engines; i++)
 				xe_engine_destroy(fd, engines[i]);
 		}
-		xe_device_put(fd);
 		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
@@ -388,10 +385,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
 
-	if (flags & CLOSE_FD) {
+	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
 	bo_size = sizeof(*data) * n_execs;
@@ -474,7 +469,6 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			for (i = 0; i < n_engines; i++)
 				xe_engine_destroy(fd, engines[i]);
 		}
-		xe_device_put(fd);
 		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
@@ -566,10 +560,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
 
-	if (flags & CLOSE_FD) {
+	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
 			  DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
@@ -654,7 +646,6 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			for (i = 0; i < n_engines; i++)
 				xe_engine_destroy(fd, engines[i]);
 		}
-		xe_device_put(fd);
 		drm_close_driver(fd);
 		/* FIXME: wait for idle */
 		usleep(150000);
@@ -831,10 +822,8 @@ igt_main
 	int class;
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	igt_subtest("spin")
 		xe_for_each_hw_engine(fd, hwe)
@@ -944,8 +933,6 @@ igt_main
 	igt_subtest("gt-reset-stress")
 		gt_reset(fd, 4, 1);
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index bde92a9c5..6450d1e40 100644
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
@@ -282,7 +279,6 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	if (!fd) {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 		owns_fd = true;
 	}
 
@@ -453,7 +449,6 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	if (owns_vm)
 		xe_vm_destroy(fd, vm);
 	if (owns_fd) {
-		xe_device_put(fd);
 		drm_close_driver(fd);
 	}
 }
@@ -491,7 +486,6 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	if (!fd) {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 		owns_fd = true;
 	}
 
@@ -696,10 +690,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
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
@@ -1391,18 +1383,14 @@ igt_main
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
index 5bca19c87..c7391a26a 100644
--- a/tests/xe/xe_gpgpu_fill.c
+++ b/tests/xe/xe_gpgpu_fill.c
@@ -120,16 +120,12 @@ igt_main
 
 		fill_fn = igt_get_gpgpu_fillfunc(data.devid);
 		igt_require_f(fill_fn, "no gpgpu-fill function\n");
-
-		xe_device_get(data.drm_fd);
 	}
 
 	igt_subtest("basic") {
 		gpgpu_fill(&data, fill_fn, 0);
 	}
 
-	igt_fixture {
-		xe_device_put(data.drm_fd);
+	igt_fixture
 		buf_ops_destroy(data.bops);
-	}
 }
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 56d4f9190..13b862c5a 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -387,7 +387,6 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 
 		sysfs = igt_sysfs_open(fd);
 		igt_assert(sysfs != -1);
@@ -495,7 +494,6 @@ igt_main
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
index f43beb1a8..59740d4d2 100644
--- a/tests/xe/xe_intel_bb.c
+++ b/tests/xe/xe_intel_bb.c
@@ -1105,7 +1105,6 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
 		bops = buf_ops_create(xe);
-		xe_device_get(xe);
 	}
 
 	igt_describe("Ensure reset is possible on fresh bb");
@@ -1178,7 +1177,6 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture {
-		xe_device_put(xe);
 		buf_ops_destroy(bops);
 		drm_close_driver(xe);
 	}
diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index 352cbcab4..463d0cac7 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -61,10 +61,8 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	igt_subtest("system")
 		test_mmap(fd, system_memory(fd));
@@ -75,8 +73,6 @@ igt_main
 	igt_subtest("vram-system")
 		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd));
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_mmio.c b/tests/xe/xe_mmio.c
index 77a38b8d1..6825478f0 100644
--- a/tests/xe/xe_mmio.c
+++ b/tests/xe/xe_mmio.c
@@ -77,18 +77,14 @@ igt_main
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
index f276e694c..3c2b340bd 100644
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
index 7bec294ed..b4d5fe252 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -370,8 +370,6 @@ igt_main
 		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
 		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
 
-		xe_device_get(device.fd_xe);
-
 		/* Always perform initial once-basic exec checking for health */
 		xe_for_each_hw_engine(device.fd_xe, hwe)
 			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
@@ -440,7 +438,6 @@ igt_main
 	igt_fixture {
 		set_d3cold_allowed(device.pci_xe, d3cold_allowed);
 		igt_restore_runtime_pm();
-		xe_device_put(device.fd_xe);
 		drm_close_driver(device.fd_xe);
 	}
 }
diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
index a86d0e9f2..5b21a39ea 100644
--- a/tests/xe/xe_prime_self_import.c
+++ b/tests/xe/xe_prime_self_import.c
@@ -104,9 +104,7 @@ static void test_with_fd_dup(void)
 	counter = 0;
 
 	fd1 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd1);
 	fd2 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd2);
 
 	handle = xe_bo_create(fd1, 0, 0, BO_SIZE);
 
@@ -121,9 +119,7 @@ static void test_with_fd_dup(void)
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
 
@@ -185,9 +177,7 @@ static void test_with_one_bo_two_files(void)
 	int dma_buf_fd1, dma_buf_fd2;
 
 	fd1 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd1);
 	fd2 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd2);
 
 	handle_orig = xe_bo_create(fd1, 0, 0, BO_SIZE);
 	dma_buf_fd1 = prime_handle_to_fd(fd1, handle_orig);
@@ -201,9 +191,7 @@ static void test_with_one_bo_two_files(void)
 	/* dma-buf self importing an flink bo should give the same handle */
 	igt_assert_eq_u32(handle_import, handle_open);
 
-	xe_device_put(fd1);
 	drm_close_driver(fd1);
-	xe_device_put(fd2);
 	drm_close_driver(fd2);
 	close(dma_buf_fd1);
 	close(dma_buf_fd2);
@@ -222,9 +210,7 @@ static void test_with_one_bo(void)
 	int dma_buf_fd;
 
 	fd1 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd1);
 	fd2 = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd2);
 
 	handle = xe_bo_create(fd1, 0, 0, BO_SIZE);
 
@@ -258,10 +244,8 @@ static void test_with_one_bo(void)
 	check_bo(fd1, handle, fd2, handle_import1);
 
 	/* Completely rip out exporting fd. */
-	xe_device_put(fd1);
 	drm_close_driver(fd1);
 	check_bo(fd2, handle_import1, fd2, handle_import1);
-	xe_device_put(fd2);
 	drm_close_driver(fd2);
 }
 
@@ -314,7 +298,6 @@ static void *thread_fn_reimport_vs_close(void *p)
 	threads = calloc(num_threads, sizeof(pthread_t));
 
 	fds[0] = drm_open_driver(DRIVER_XE);
-	xe_device_get(fds[0]);
 
 	handle = xe_bo_create(fds[0], 0, 0, BO_SIZE);
 
@@ -334,7 +317,6 @@ static void *thread_fn_reimport_vs_close(void *p)
 	}
 
 	pthread_barrier_destroy(&g_barrier);
-	xe_device_put(fds[0]);
 	drm_close_driver(fds[0]);
 	close(fds[1]);
 
@@ -406,13 +388,11 @@ static void test_export_close_race(void)
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
@@ -428,7 +408,6 @@ static void test_export_close_race(void)
 	}
 
 	pthread_barrier_destroy(&g_barrier);
-	xe_device_put(fd);
 	drm_close_driver(fd);
 
 	/* TODO: Read object count */
@@ -436,7 +415,6 @@ static void test_export_close_race(void)
 
 	igt_info("leaked %i objects\n", obj_count);
 
-	xe_device_put(fake);
 	drm_close_driver(fake);
 
 	igt_assert_eq(obj_count, 0);
@@ -458,7 +436,6 @@ static void test_llseek_size(void)
 	counter = 0;
 
 	fd = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd);
 
 	for (i = 0; i < 10; i++) {
 		int bufsz = xe_get_default_alignment(fd) << i;
@@ -473,7 +450,6 @@ static void test_llseek_size(void)
 		close(dma_buf_fd);
 	}
 
-	xe_device_put(fd);
 	drm_close_driver(fd);
 }
 
@@ -493,7 +469,6 @@ static void test_llseek_bad(void)
 	counter = 0;
 
 	fd = drm_open_driver(DRIVER_XE);
-	xe_device_get(fd);
 
 	handle = xe_bo_create(fd, 0, 0, BO_SIZE);
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
@@ -510,7 +485,6 @@ static void test_llseek_bad(void)
 
 	close(dma_buf_fd);
 
-	xe_device_put(fd);
 	drm_close_driver(fd);
 }
 
@@ -534,7 +508,6 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
@@ -542,8 +515,6 @@ igt_main
 			tests[i].fn();
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index 1c06534d4..99e92b7c1 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -457,10 +457,8 @@ igt_main
 {
 	int xe;
 
-	igt_fixture {
+	igt_fixture
 		xe = drm_open_driver(DRIVER_XE);
-		xe_device_get(xe);
-	}
 
 	igt_subtest("query-engines")
 		test_query_engines(xe);
@@ -489,8 +487,6 @@ igt_main
 	igt_subtest("query-invalid-extension")
 		test_query_invalid_extension(xe);
 
-	igt_fixture {
-		xe_device_put(xe);
+	igt_fixture
 		drm_close_driver(xe);
-	}
 }
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 9015a5a57..13295cbe1 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -1621,7 +1621,6 @@ igt_main
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
 
 		xe_for_each_hw_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY) {
@@ -1837,8 +1836,6 @@ igt_main
 		}
 	}
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
index 8bfb741f6..c9d7f6981 100644
--- a/tests/xe/xe_waitfence.c
+++ b/tests/xe/xe_waitfence.c
@@ -88,16 +88,12 @@ igt_main
 {
 	int fd;
 
-	igt_fixture {
+	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
-		xe_device_get(fd);
-	}
 
 	igt_subtest("test")
 		test(fd);
 
-	igt_fixture {
-		xe_device_put(fd);
+	igt_fixture
 		drm_close_driver(fd);
-	}
 }
-- 
2.40.0


