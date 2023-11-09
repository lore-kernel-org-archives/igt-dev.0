Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7059310E1BD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 06:01:55 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 11:39:27 +0530
Message-Id: <20231109060931.1347354-4-kunal1.joshi@intel.com>
In-Reply-To: <20231109060931.1347354-1-kunal1.joshi@intel.com>
References: <20231109060931.1347354-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/7] lib/igt_psr: modified psr_active_check
 for pr compatability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Whenever PR is active, system will be in SRDENT,
modify psr_active_check to accomadte PR_MODE

Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c                          | 24 +++++++++++++++---------
 lib/igt_psr.h                          |  6 +++---
 tests/intel/kms_dirtyfb.c              |  2 +-
 tests/intel/kms_fbcon_fbt.c            |  4 ++--
 tests/intel/kms_frontbuffer_tracking.c |  4 ++--
 tests/intel/kms_pm_dc.c                |  6 +++---
 tests/intel/kms_psr.c                  |  4 ++--
 tests/intel/kms_psr2_sf.c              | 10 +++++-----
 tests/intel/kms_psr2_su.c              |  4 ++--
 tests/intel/kms_psr_stress_test.c      |  2 +-
 10 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 054622d79..818151228 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -47,13 +47,19 @@ bool psr2_selective_fetch_check(int debugfs_fd)
 	return strstr(buf, "PSR2 selective fetch: enabled");
 }
 
-static bool psr_active_check(int debugfs_fd, enum psr_mode mode)
+static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
+	char debugfs_file[128] = {0};
 	char buf[PSR_STATUS_MAX_LEN];
-	const char *state = mode == PSR_MODE_1 ? "SRDENT" : "DEEP_SLEEP";
+	const char *state = mode == PSR_MODE_1 || PR_MODE ? "SRDENT" : "DEEP_SLEEP";
 	int ret;
 
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status",
+	if (output)
+		sprintf(debugfs_file, "%s/i915_psr_status", output->name);
+	else
+		sprintf(debugfs_file, "%s", "i915_edp_psr_status");
+
+	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file,
 				     buf, sizeof(buf));
 	if (ret < 0) {
 		igt_info("Could not read i915_edp_psr_status: %s\n",
@@ -69,19 +75,19 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode)
 /*
  * For PSR1, we wait until PSR is active. We wait until DEEP_SLEEP for PSR2.
  */
-bool psr_wait_entry(int debugfs_fd, enum psr_mode mode)
+bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
-	return igt_wait(psr_active_check(debugfs_fd, mode), 500, 20);
+	return igt_wait(psr_active_check(debugfs_fd, mode, output), 500, 20);
 }
 
-bool psr_wait_update(int debugfs_fd, enum psr_mode mode)
+bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
-	return igt_wait(!psr_active_check(debugfs_fd, mode), 40, 10);
+	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 40, 10);
 }
 
-bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode)
+bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
-	return igt_wait(!psr_active_check(debugfs_fd, mode), 500, 10);
+	return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 10);
 }
 
 static ssize_t psr_write(int debugfs_fd, const char *buf)
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index e213b05e9..a30330e6c 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -42,9 +42,9 @@ enum psr_mode {
 
 bool psr_disabled_check(int debugfs_fd);
 bool psr2_selective_fetch_check(int debugfs_fd);
-bool psr_wait_entry(int debugfs_fd, enum psr_mode mode);
-bool psr_wait_update(int debugfs_fd, enum psr_mode mode);
-bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode);
+bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
+bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
+bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output);
 bool psr_enable(int device, int debugfs_fd, enum psr_mode);
 bool psr_disable(int device, int debugfs_fd);
 bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output_t *output);
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index f7ff1ac0b..b14cc8bec 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -135,7 +135,7 @@ static void check_feature(data_t *data)
 			     "FBC still disabled");
 		break;
 	case FEATURE_PSR:
-		igt_assert_f(psr_wait_entry(data->debugfs_fd, PSR_MODE_1),
+		igt_assert_f(psr_wait_entry(data->debugfs_fd, PSR_MODE_1, NULL),
 			     "PSR still disabled\n");
 		break;
 	case FEATURE_DRRS:
diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index a7f24e669..4078309d9 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -253,7 +253,7 @@ static void psr_print_status(int debugfs_fd)
 
 static bool psr_wait_until_enabled(int debugfs_fd)
 {
-	bool r = psr_wait_entry(debugfs_fd, PSR_MODE_1);
+	bool r = psr_wait_entry(debugfs_fd, PSR_MODE_1, NULL);
 
 	psr_print_status(debugfs_fd);
 	return r;
@@ -274,7 +274,7 @@ static bool psr_supported_on_chipset(int device, int debugfs_fd)
 
 static bool psr_wait_until_update(struct drm_info *drm)
 {
-	return psr_long_wait_update(drm->debugfs_fd, PSR_MODE_1);
+	return psr_long_wait_update(drm->debugfs_fd, PSR_MODE_1, NULL);
 }
 
 static void disable_features(int device, int debugfs_fd)
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 3cfa22bbf..e5f139195 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1584,10 +1584,10 @@ static void do_status_assertions(int flags)
 	}
 
 	if (flags & ASSERT_PSR_ENABLED)
-		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1),
+		igt_assert_f(psr_wait_entry(drm.debugfs, PSR_MODE_1, NULL),
 			     "PSR still disabled\n");
 	else if (flags & ASSERT_PSR_DISABLED)
-		igt_assert_f(psr_wait_update(drm.debugfs, PSR_MODE_1),
+		igt_assert_f(psr_wait_update(drm.debugfs, PSR_MODE_1, NULL),
 			     "PSR still enabled\n");
 }
 
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index e5daacb84..a3c7c4018 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -382,7 +382,7 @@ static void setup_dc3co(data_t *data)
 {
 	data->op_psr_mode = PSR_MODE_2;
 	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode);
-	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode),
+	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
 		      "PSR2 is not enabled\n");
 }
 
@@ -418,7 +418,7 @@ static void test_dc_state_psr(data_t *data, int dc_flag)
 	dc_counter_before_psr = read_dc_counter(data->debugfs_fd, dc_flag);
 	setup_output(data);
 	setup_primary(data);
-	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode));
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
 	check_dc_counter(data, dc_flag, dc_counter_before_psr);
 	cleanup_dc_psr(data);
 }
@@ -624,7 +624,7 @@ static void test_pkgc_state_psr(data_t *data)
 	prev_value = read_pkgc_counter(data->debugfs_root_fd);
 	setup_output(data);
 	setup_primary(data);
-	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode));
+	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
 	psr_dpms(data, DRM_MODE_DPMS_OFF);
 	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
 		  timeout_sec * 1000, 100);
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 260095aec..8485e9894 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -441,7 +441,7 @@ static bool psr_wait_entry_if_enabled(data_t *data)
 	if (data->with_psr_disabled)
 		return true;
 
-	return psr_wait_entry(data->debugfs_fd, data->op_psr_mode);
+	return psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output);
 }
 
 static bool psr_wait_update_if_enabled(data_t *data)
@@ -449,7 +449,7 @@ static bool psr_wait_update_if_enabled(data_t *data)
 	if (data->with_psr_disabled)
 		return true;
 
-	return psr_wait_update(data->debugfs_fd, data->op_psr_mode);
+	return psr_wait_update(data->debugfs_fd, data->op_psr_mode, data->output);
 }
 
 static bool psr_enable_if_enabled(data_t *data)
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 2d05f1110..9f5186eee 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -677,7 +677,7 @@ static void damaged_plane_move(data_t *data)
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
 
 	expected_output(data);
 }
@@ -777,7 +777,7 @@ static void plane_move_continuous(data_t *data)
 {
 	int target_x, target_y;
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
 
 	get_target_coords(data, &target_x, &target_y);
 
@@ -854,7 +854,7 @@ static void damaged_plane_update(data_t *data)
 	igt_plane_set_position(data->test_plane, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
 
 	expected_output(data);
 }
@@ -863,7 +863,7 @@ static void run(data_t *data)
 {
 	int i;
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL));
 
 	data->screen_changes = 0;
 
@@ -941,7 +941,7 @@ static int check_psr2_support(data_t *data)
 	int status;
 
 	prepare(data);
-	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2);
+	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2, NULL);
 	cleanup(data);
 
 	return status;
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index 2f89de435..3506409b7 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -258,7 +258,7 @@ static void run(data_t *data, igt_output_t *output)
 {
 	bool result = false;
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2, output));
 
 	for (data->screen_changes = 0;
 	     data->screen_changes < MAX_SCREEN_CHANGES && !result;
@@ -304,7 +304,7 @@ static int check_psr2_support(data_t *data, enum pipe pipe)
 	igt_output_set_pipe(output, pipe);
 
 	prepare(data, output);
-	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2);
+	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2, output);
 	cleanup(data, output);
 
 	return status;
diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index beded3b94..e3b21603a 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -232,7 +232,7 @@ static void prepare(data_t *data)
 
 	data->initial_state = psr_get_mode(data->debugfs_fd);
 	igt_require(data->initial_state != PSR_DISABLED);
-	igt_require(psr_wait_entry(data->debugfs_fd, data->initial_state));
+	igt_require(psr_wait_entry(data->debugfs_fd, data->initial_state, NULL));
 }
 
 static void cleanup(data_t *data)
-- 
2.25.1
