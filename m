Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E666E7D3
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Apr 2021 10:31:22 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 26 Apr 2021 23:51:24 +0530
Message-Id: <20210426182136.2815-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20210426182136.2815-1-bhanuprakash.modem@intel.com>
References: <20210426182136.2815-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v3 i-g-t 02/14] tests/kms_frontbuffer_tracking: Fix mode
 selection for 2x tests
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

When two monitors connected through MST, the second monitor also
tries to use the same mode. So two such modes may not fit into the
link bandwidth.

This patch will find a combination of modes that fit into the BW.

V2:
* Remove MST specific logic (Daniel)

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_frontbuffer_tracking.c | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index 2e74bec6f..84392360b 100644
--- a/tests/kms_frontbuffer_tracking.c
+++ b/tests/kms_frontbuffer_tracking.c
@@ -1683,6 +1683,33 @@ static void enable_prim_screen_and_wait(const struct test_mode *t)
 	do_assertions(ASSERT_NO_ACTION_CHANGE);
 }
 
+static void update_modeset_cached_params(void)
+{
+	bool found = false;
+
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+	igt_output_set_pipe(scnd_mode_params.output, scnd_mode_params.pipe);
+
+	found = override_all_active_output_modes_to_fit_link_bw(&drm.display);
+	igt_require_f(found, "No valid mode combo found.\n");
+
+	prim_mode_params.mode_copy = *igt_output_get_mode(prim_mode_params.output);
+	prim_mode_params.mode = &prim_mode_params.mode_copy;
+	prim_mode_params.primary.w = prim_mode_params.mode->hdisplay;
+	prim_mode_params.primary.h = prim_mode_params.mode->vdisplay;
+
+	scnd_mode_params.mode_copy = *igt_output_get_mode(scnd_mode_params.output);
+	scnd_mode_params.mode = &scnd_mode_params.mode_copy;
+	scnd_mode_params.primary.w = scnd_mode_params.mode->hdisplay;
+	scnd_mode_params.primary.h = scnd_mode_params.mode->vdisplay;
+
+	fill_fb_region(&prim_mode_params.primary, COLOR_PRIM_BG);
+	fill_fb_region(&scnd_mode_params.primary, COLOR_SCND_BG);
+
+	__set_mode_for_params(&prim_mode_params);
+	__set_mode_for_params(&scnd_mode_params);
+}
+
 static void enable_both_screens_and_wait(const struct test_mode *t)
 {
 	fill_fb_region(&prim_mode_params.primary, COLOR_PRIM_BG);
@@ -1691,6 +1718,12 @@ static void enable_both_screens_and_wait(const struct test_mode *t)
 	__set_mode_for_params(&prim_mode_params);
 	__set_mode_for_params(&scnd_mode_params);
 
+	if (igt_display_try_commit_atomic(&drm.display,
+					  DRM_MODE_ATOMIC_TEST_ONLY |
+					  DRM_MODE_ATOMIC_ALLOW_MODESET,
+					  NULL) != 0)
+		update_modeset_cached_params();
+
 	igt_display_commit2(&drm.display, drm.display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	wanted_crc = &blue_crcs[t->format].crc;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
