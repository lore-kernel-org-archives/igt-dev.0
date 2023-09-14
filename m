Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6496010E0D7
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 20:12:24 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 01:36:28 +0530
Message-Id: <20230914200628.419069-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Extend the
 test to enable FBC for each plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added a new subtest to validate FBC on each plane, this new subtest
will first disable the fbc feature on all pipes and planes and then
enable it on all plane one by one and confirm.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 215ecdeef..7cb825547 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1941,6 +1941,28 @@ static void rte_subtest(const struct test_mode *t)
 	}
 }
 
+static void fbc_rte_subtest(const struct test_mode *t)
+{
+	igt_plane_t *plane;
+
+	prepare_subtest_data(t, NULL);
+
+	unset_all_crtcs();
+	do_assertions(ASSERT_FBC_DISABLED | ASSERT_PSR_DISABLED |
+		      DONT_ASSERT_CRC | ASSERT_DRRS_INACTIVE);
+
+	fill_fb_region(&prim_mode_params.primary, COLOR_PRIM_BG);
+	set_mode_for_params(&prim_mode_params);
+
+	for_each_plane_on_pipe(&drm.display, prim_mode_params.pipe, plane) {
+		if (plane->index <= 2) {
+			wanted_crc = &blue_crcs[t->format].crc;
+			fbc_update_last_action();
+			do_assertions(ASSERT_NO_ACTION_CHANGE);
+		}
+	}
+}
+
 static void update_wanted_crc(const struct test_mode *t, igt_crc_t *crc)
 {
 	if (t->screen == SCREEN_PRIM)
@@ -5064,6 +5086,21 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		}
 	}
 
+	t.pipes = PIPE_SINGLE;
+	t.feature = FEATURE_FBC;
+	t.screen = SCREEN_PRIM;
+	t.plane = PLANE_PRI;
+	t.fbs = FBS_INDIVIDUAL;
+	t.format = FORMAT_DEFAULT;
+	/* Make sure nothing is using these values. */
+	t.flip = -1;
+	t.method = -1;
+	t.tiling = opt.tiling;
+
+	igt_subtest_f("fbc-%s-rte",
+		      pipes_str(t.pipes))
+		fbc_rte_subtest(&t);
+
 	TEST_MODE_ITER_BEGIN(t)
 
 		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
-- 
2.25.1
