Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D606E43A
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 16:00:34 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id h4so13001603lfu.8
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 09:00:34 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 15 Jun 2021 19:00:21 +0300
Message-Id: <20210615160022.31610-3-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210615160022.31610-1-juhapekka.heikkila@gmail.com>
References: <20210615160022.31610-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/kms_plane: fix rounding error
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
