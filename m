Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DA5898BC
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Sep 2021 18:17:42 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon,  6 Sep 2021 21:17:32 +0300
Message-Id: <20210906181736.3914421-3-imre.deak@intel.com>
In-Reply-To: <20210906181736.3914421-1-imre.deak@intel.com>
References: <20210906181736.3914421-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 2/6] tests/kms_ccs: Use test pattern when
 possible
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

A CRC match against a test pattern reference image gives a better
guarantee than against a solid filled image, so use a test pattern
instead.

The sprite tests compare a single solid filled reference plane against
two overlapped solid filled planes for some reason, so for these subtests
and the fast clear subtest still keep the solid filled pattern.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_ccs.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 61edad627..c87812d20 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -329,15 +329,21 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 		srand(data->seed);
 		fill_fb_random(data->drm_fd, fb);
 	} else if (!(data->flags & TEST_BAD_PIXEL_FORMAT)) {
+		bool do_fast_clear = is_ccs_cc_modifier(data->ccs_modifier);
+		bool do_solid_fill = do_fast_clear || data->plane;
 		int c = !!data->plane;
 
-		if (is_ccs_cc_modifier(modifier)) {
+		if (do_fast_clear && (fb_flags & FB_COMPRESSED)) {
 			fast_clear_fb(data->drm_fd, fb, cc_color);
 		} else {
 			cr = igt_get_cairo_ctx(data->drm_fd, fb);
-			igt_paint_color(cr, 0, 0, width, height,
-					colors[c].r, colors[c].g, colors[c].b);
-					igt_put_cairo_ctx(cr);
+
+			if (do_solid_fill)
+				igt_paint_color(cr, 0, 0, width, height,
+						colors[c].r, colors[c].g, colors[c].b);
+			else
+				igt_paint_test_pattern(cr, width, height);
+			igt_put_cairo_ctx(cr);
 		}
 	}
 
-- 
2.27.0
