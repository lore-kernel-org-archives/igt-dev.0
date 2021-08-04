Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C9C6E22B
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Aug 2021 03:08:15 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Wed,  4 Aug 2021 08:26:36 +0530
Message-Id: <20210804025637.2473-2-vidya.srinivas@intel.com>
In-Reply-To: <20210804025637.2473-1-vidya.srinivas@intel.com>
References: <20210804025637.2473-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] Revert "tests/kms_plane_alpha_blend:
 Align width to 256B"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: juhapekkaheikkila@gmail.com, tejaskumax.surendrakumar.upadhyay@intel.com, Vidya Srinivas <vidya.srinivas@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This reverts commit 6135b9cc319ed965e3aafb5b2ae2abf4762a06b2.

There was a rounding error in draw_squares which is now fixed.
To submit that change from Juha-Pekka, we need to revert this
change.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_plane_alpha_blend.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index cb8f92891dd5..8616169e7ca2 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -168,7 +168,6 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 	w = mode->hdisplay;
 	h = mode->vdisplay;
 
-	w = ALIGN(w, 256);
 	/* recreate all fbs if incompatible */
 	if (data->xrgb_fb.width != w || data->xrgb_fb.height != h) {
 		cairo_t *cr;
-- 
2.32.0
