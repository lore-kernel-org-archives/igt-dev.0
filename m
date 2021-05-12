Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6896E81A
 for <igt-dev@lists.freedesktop.org>; Wed, 12 May 2021 09:16:09 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 12 May 2021 22:35:24 +0530
Message-Id: <20210512170536.4778-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
References: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v6 i-g-t 02/14] tests/kms_frontbuffer_tracking: Fix mode
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

This patch will find the connector/mode combination that fits
into the bandwidth when more than one monitor is connected.

Example:
  When two monitors connected through MST, the second monitor
  also tries to use the same mode. So two such modes may not
  fit into the link bandwidth. So, iterate through connected
  outputs & modes and find a combination of modes those fit
  into the link BW.

V2:
* Remove MST specific logic (Daniel)
V3:
* Add support for legacy commit (Ankit)
V4:
* Fix commit message (Ankit)

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_frontbuffer_tracking.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index 2e74bec6f..65c2ddb5c 100644
--- a/tests/kms_frontbuffer_tracking.c
+++ b/tests/kms_frontbuffer_tracking.c
@@ -1683,14 +1683,54 @@ static void enable_prim_screen_and_wait(const struct test_mode *t)
 	do_assertions(ASSERT_NO_ACTION_CHANGE);
 }
 
+static void update_modeset_cached_params(void)
+{
+	bool found = false;
+
+	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
+	igt_output_set_pipe(scnd_mode_params.output, scnd_mode_params.pipe);
+
+	found = igt_override_all_active_output_modes_to_fit_bw(&drm.display);
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
+	int ret;
+
 	fill_fb_region(&prim_mode_params.primary, COLOR_PRIM_BG);
 	fill_fb_region(&scnd_mode_params.primary, COLOR_SCND_BG);
 
 	__set_mode_for_params(&prim_mode_params);
 	__set_mode_for_params(&scnd_mode_params);
 
+	if (drm.display.is_atomic)
+		ret = igt_display_try_commit_atomic(&drm.display,
+				DRM_MODE_ATOMIC_TEST_ONLY |
+				DRM_MODE_ATOMIC_ALLOW_MODESET,
+				NULL);
+	else
+		ret = igt_display_try_commit2(&drm.display, COMMIT_LEGACY);
+
+	if (ret)
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
