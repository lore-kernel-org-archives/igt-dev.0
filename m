Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917266E7E6
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Apr 2021 10:31:30 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 26 Apr 2021 23:51:28 +0530
Message-Id: <20210426182136.2815-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20210426182136.2815-1-bhanuprakash.modem@intel.com>
References: <20210426182136.2815-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [v3 i-g-t 06/14] tests/kms_plane_scaling: Fix mode
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

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane_scaling.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 34efc588e..d314d1d0e 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -630,9 +630,6 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	d->plane3 = igt_output_get_plane(output2, 0);
 	d->plane4 = get_num_scalers(d, pipe2) >= 2 ? igt_output_get_plane(output2, 1) : NULL;
 
-	mode1 = igt_output_get_mode(output1);
-	mode2 = igt_output_get_mode(output2);
-
 	igt_skip_on(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,
 						tiling));
 
@@ -658,8 +655,20 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_plane_set_fb(d->plane3, &d->fb[2]);
 	if (d->plane4)
 		igt_plane_set_fb(d->plane4, &d->fb[3]);
+
+	if (igt_display_try_commit_atomic(display,
+				DRM_MODE_ATOMIC_TEST_ONLY |
+				DRM_MODE_ATOMIC_ALLOW_MODESET,
+				NULL) != 0) {
+		bool found = override_all_active_output_modes_to_fit_link_bw(display);
+		igt_require_f(found, "No valid mode combo found.\n");
+	}
+
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
+	mode1 = igt_output_get_mode(output1);
+	mode2 = igt_output_get_mode(output2);
+
 	/* Upscaling Primary */
 	igt_plane_set_size(d->plane1, mode1->hdisplay, mode1->vdisplay);
 	igt_plane_set_size(d->plane3, mode2->hdisplay, mode2->vdisplay);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
