Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4440310E8A6
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Oct 2022 16:56:55 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 11 Oct 2022 19:52:50 +0300
Message-Id: <20221011165250.4124304-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_busy: Ensure GPU reset when waiting for
 a new FB during modeset
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

When waiting for a modeset's new framebuffer the timeout for this FB's
fence to signal is determined by the kernel's
CONFIG_DRM_I915_FENCE_TIMEOUT which is 10 sec by default (and in the
current CI kconfig). The GPU reset timeout in turn is determined by
CONFIG_DRM_I915_HEARTBEAT_INTERVAL which is 2.5 sec by default (and in
the current CI kconfig). By default a spinner batch - like the one
created by test_atomic_commit_hang() - will cause a GPU reset that is 5
times the above heartbeat interval (the interval rounded to seconds
first, that is 15 seconds atm).

Based on the above during extended-modeset-hang-newfb-with-reset the
enabling modeset part for instance will cause a fence timeout before the
presumed GPU hang would be detected, so the corresponding commit will
complete without the expected GPU reset.

Note that extended-modeset-hang-oldfb-with-reset for instance is not
affected by this problem, since waiting for the old framebuffer's fence
to signal happens without a fence timeout (timing out instead at the
GPU hang detect/reset).

Fix the above by reducing the heartbeat interval to 250 msec,
corresponding to a ~1.3 sec GPU hang detection timeout. This also speeds
up the GPU hang subtests.

Testcase: igt@kms_busy@extended-modeset-hang-newfb-with-reset
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/i915/kms_busy.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
index 99a07c2ae..9ef53f594 100644
--- a/tests/i915/kms_busy.c
+++ b/tests/i915/kms_busy.c
@@ -312,6 +312,33 @@ static int opt_handler(int opt, int opt_index, void *data)
 	return IGT_OPT_HANDLER_SUCCESS;
 }
 
+static void gpu_engines_init_timeouts(int fd, int max_engines,
+				      int *num_engines, struct gem_engine_properties *props)
+{
+	const struct intel_execution_engine2 *e;
+
+	*num_engines = 0;
+	for_each_physical_engine(fd, e) {
+		igt_assert(*num_engines < max_engines);
+
+		props[*num_engines].engine = e;
+		props[*num_engines].preempt_timeout = 0;
+		props[*num_engines].heartbeat_interval = 250;
+
+		gem_engine_properties_configure(fd, &props[*num_engines]);
+
+		(*num_engines)++;
+	}
+}
+
+static void gpu_engines_restore_timeouts(int fd, int num_engines, const struct gem_engine_properties *props)
+{
+	int i;
+
+	for (i = 0; i < num_engines; i++)
+		gem_engine_properties_restore(fd, &props[i]);
+}
+
 const char *help_str =
 	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
 
@@ -335,11 +362,15 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		{ "extended-modeset-hang-oldfb-with-reset", true, false, true },
 		{ "extended-modeset-hang-newfb-with-reset", true, true, true },
 	};
+	struct gem_engine_properties saved_gpu_timeouts[GEM_MAX_ENGINES];
+	int num_engines;
+	int fd;
 
 	igt_fixture {
-		int fd = drm_open_driver_master(DRIVER_INTEL);
 		enum pipe pipe;
 
+		fd = drm_open_driver_master(DRIVER_INTEL);
+
 		igt_require_gem(fd);
 		gem_require_mmap_device_coherent(fd);
 		igt_require(gem_has_ring(fd, I915_EXEC_DEFAULT));
@@ -352,6 +383,8 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		for_each_pipe(&display, pipe)
 			active_pipes[last_pipe++] = pipe;
 		last_pipe--;
+
+		gpu_engines_init_timeouts(fd, ARRAY_SIZE(saved_gpu_timeouts), &num_engines, saved_gpu_timeouts);
 	}
 
 	/* XXX Extend to cover atomic rendering tests to all planes + legacy */
@@ -435,6 +468,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture {
+		gpu_engines_restore_timeouts(fd, num_engines, saved_gpu_timeouts);
 		igt_display_fini(&display);
 	}
 }
-- 
2.34.1
