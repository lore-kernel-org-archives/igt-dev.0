Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919076E22B
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Aug 2021 03:08:16 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Wed,  4 Aug 2021 08:26:37 +0530
Message-Id: <20210804025637.2473-3-vidya.srinivas@intel.com>
In-Reply-To: <20210804025637.2473-1-vidya.srinivas@intel.com>
References: <20210804025637.2473-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_plane_alpha_blend: Fix
 rounding in draw_squares
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
Cc: juhapekkaheikkila@gmail.com, tejaskumax.surendrakumar.upadhyay@intel.com, Vidya Srinivas <vidya.srinivas@intel.com>, =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Patch fixes a rounding issue in draw_squares. Due to this,
coverage-premultiplied-constant subtest gives CRC
mismatch on panels with 1366x768 resolution.

Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
---
 tests/kms_plane_alpha_blend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 8616169e7ca2..b4cf039bd914 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -88,7 +88,7 @@ static void draw_squares(struct igt_fb *fb, int w, int h, double a)
 	igt_paint_color_alpha(cr, w / 2, 0,     w / 2, h / 2, 0., 1., 0., a);
 	igt_paint_color_alpha(cr, 0, h / 2,     w / 2, h / 2, 0., 0., 1., a);
 	igt_paint_color_alpha(cr, w / 2, h / 2, w / 4, h / 2, 1., 1., 1., a);
-	igt_paint_color_alpha(cr, 3 * w / 4, h / 2, w / 4, h / 2, 0., 0., 0., a);
+	igt_paint_color_alpha(cr, w * 3 / 4, h / 2, w - (w * 3 / 4), h / 2, 0., 0., 0., a);
 
 	igt_put_cairo_ctx(cr);
 }
-- 
2.32.0
