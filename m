Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451AC6E889
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Mar 2021 05:23:14 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed,  3 Mar 2021 10:37:37 +0530
Message-Id: <20210303050737.22056-6-anshuman.gupta@intel.com>
In-Reply-To: <20210303050737.22056-1-anshuman.gupta@intel.com>
References: <20210303050737.22056-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 5/5] i915/i915_pm_rpm: Add PC10 idle
 display on test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add a test which validates PC10 residencies with
psr idle display on.

v2: used optimum pc10 timeout value.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index b27c20bd..9e5ee4e5 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -79,6 +79,7 @@ enum pc8_status {
 enum screen_type {
 	SCREEN_TYPE_LPSP,
 	SCREEN_TYPE_NON_LPSP,
+	SCREEN_TYPE_PSR,
 	SCREEN_TYPE_ANY,
 };
 
@@ -137,6 +138,7 @@ struct modeset_params {
 
 struct modeset_params lpsp_mode_params;
 struct modeset_params non_lpsp_mode_params;
+struct modeset_params psr_mode_params;
 struct modeset_params *default_mode_params;
 
 static int modprobe(const char *driver)
@@ -302,6 +304,10 @@ static bool init_modeset_params_for_type(struct mode_set_data *data,
 		    i915_output_is_lpsp_capable(drm_fd, output))
 			continue;
 
+		if (type == SCREEN_TYPE_PSR &&
+		    !psr_sink_support(drm_fd, debugfs, PSR_MODE_1))
+			continue;
+
 		connector = c;
 		mode = igt_output_get_mode(output);
 		break;
@@ -336,6 +342,8 @@ static void init_modeset_cached_params(struct mode_set_data *data)
 		default_mode_params = &non_lpsp_mode_params;
 	else
 		default_mode_params = NULL;
+
+	init_modeset_params_for_type(data, &psr_mode_params, SCREEN_TYPE_PSR);
 }
 
 static bool set_mode_for_params(struct modeset_params *params)
@@ -367,6 +375,9 @@ static bool enable_one_screen_with_type(struct mode_set_data *data,
 	case SCREEN_TYPE_NON_LPSP:
 		params = &non_lpsp_mode_params;
 		break;
+	case SCREEN_TYPE_PSR:
+		params = &psr_mode_params;
+		break;
 	default:
 		igt_assert(0);
 	}
@@ -377,6 +388,12 @@ static bool enable_one_screen_with_type(struct mode_set_data *data,
 	return set_mode_for_params(params);
 }
 
+static void enable_psr_screen(struct mode_set_data *data)
+{
+	psr_enable(drm_fd, debugfs, PSR_MODE_1);
+	igt_require(enable_one_screen_with_type(data, SCREEN_TYPE_PSR));
+}
+
 static void enable_one_screen(struct mode_set_data *data)
 {
 	/* SKIP if there are no connected screens. */
@@ -884,6 +901,12 @@ static void pc10_residency_subtest(bool display_on)
 		disable_all_screens_and_wait(&ms_data);
 		igt_assert_f(pc10_residency_changed(PC10_TIMEOUT),
 			     "Machine is not reaching PC10 state with all screens disabled.\n");
+	} else {
+		/* check pc10 with psr screen */
+		enable_psr_screen(&ms_data);
+		igt_assert(psr_wait_entry(debugfs, PSR_MODE_1));
+		igt_assert_f(pc10_residency_changed(PC10_TIMEOUT),
+			     "Machine is not reaching PC10 state with idle display on\n");
 	}
 }
 
@@ -2121,6 +2144,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		pc8_residency_subtest(true);
 	igt_subtest("pc8-residency-display-off")
 		pc8_residency_subtest(false);
+	igt_subtest("pc10-residency-display-on")
+		pc10_residency_subtest(true);
 	igt_subtest("pc10-residency-display-off")
 		pc10_residency_subtest(false);
 	igt_subtest("debugfs-read")
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
