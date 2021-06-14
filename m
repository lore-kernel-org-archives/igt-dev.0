Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1F06E0C2
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 17:37:21 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id 131so21320989ljj.3
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 10:37:21 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 14 Jun 2021 20:37:10 +0300
Message-Id: <20210614173710.24903-3-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210614173710.24903-1-juhapekka.heikkila@gmail.com>
References: <20210614173710.24903-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_plane: fix rounding error
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

On some screen sizes with legacy hw there was possible to get
rounding error on source clamping test which would incorrectly
fail clamping tests.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index ba419bbde..f22c045d8 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -473,12 +473,19 @@ static void draw_entire_color_array(data_t *data, cairo_t *cr, uint32_t format,
 	const int color_amount = ARRAY_SIZE(colors_extended);
 	const int x = format == DRM_FORMAT_XRGB8888 ? 0 : data->crop;
 
+	if (format != DRM_FORMAT_XRGB8888) {
+		cairo_rectangle(cr, data->crop, data->crop,
+				fb->width - data->crop * 2,
+				fb->height - data->crop * 2);
+	}
+
+
 	for (int n = 0; n < color_amount; n++) {
 		int y = (fb->height - x * 2) * n / color_amount + x;
 
 		igt_paint_color(cr, x, y,
 				fb->width - x * 2,
-				(fb->height - x * 2) / color_amount,
+				(fb->height - x * 2) / color_amount + 1,
 				colors_extended[n].red,
 				colors_extended[n].green,
 				colors_extended[n].blue);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
