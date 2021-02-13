Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net
 [82.65.109.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDE46E581
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Feb 2021 18:27:50 +0000 (UTC)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Date: Sat, 13 Feb 2021 19:17:55 +0100
Message-Id: <20210213181755.7719-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] overlay: Rename Power into GPU Power
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
List-ID: <igt-dev@lists.freedesktop.org>

intel_gpu_top did the same change in
48b42f08255a45f58780b81766b25ab09a1cb43c, which makes it more
understandable to newbies (at least to me).

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 overlay/overlay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/overlay/overlay.c b/overlay/overlay.c
index fdc62091..220cf7d5 100644
--- a/overlay/overlay.c
+++ b/overlay/overlay.c
@@ -700,12 +700,12 @@ static void show_gpu_freq(struct overlay_context *ctx, struct overlay_gpu_freq *
 	if (has_power) {
 		cairo_set_source_rgba(ctx->cr, 1, 1, 1, 1);
 
-		sprintf(buf, "Power: %llumW", (long long unsigned)gf->power.gpu.power_mW);
+		sprintf(buf, "GPU Power: %llumW", (long long unsigned)gf->power.gpu.power_mW);
 		cairo_move_to(ctx->cr, PAD, y);
 		cairo_show_text(ctx->cr, buf);
 		y += 14;
 
-		sprintf(buf, "Package: %llumW", (long long unsigned)gf->power.pkg.power_mW);
+		sprintf(buf, "Package Power: %llumW", (long long unsigned)gf->power.pkg.power_mW);
 		cairo_move_to(ctx->cr, PAD, y);
 		cairo_show_text(ctx->cr, buf);
 		y += 14;
-- 
2.30.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
