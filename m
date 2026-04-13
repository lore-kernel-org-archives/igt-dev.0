Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F622F531CE
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 23:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EC410E557;
	Mon, 13 Apr 2026 23:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lrpI/zoD";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B34010E557
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 23:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yevevLZaXEt/EtfGQHpNgATthlh9uvqbsRwQuWCTSSs=; b=lrpI/zoDbbT9CN+Ta0Npn9RsUa
 Cng08vkqyZnbm5hLWa4V2Xz7E7CNp9hk3yq6kGUmhpSjBQpjg+utzpEGjQxnWtntt+DY79rf5pWFZ
 OuHlN1I+1hxkMi5A7xPLH6JgnpjhyA3IuI3Uvdr54EjmAEa7f9EuL+bwgX54cSQXZf+6sieJYFNjI
 sdu5vTMJW6V66gpz6LPtsI0QmbRFXdD1ksYcHMC9H/pPlP1BSo/Y+N4hDF5FkA8KmxFm+2eG2T0fx
 e/xd2cVJQn/yy67m7VT3mgxkDCCDjKUsuKpirglT8+W2SqZ03s4+Sxkp/TDERP9UfjD3Mqi7ru4+7
 /Zj4wMhg==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wCQqK-00FeK3-Fu; Tue, 14 Apr 2026 01:37:24 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t v3 1/4] tools/intel_hdcp: Fix status rendering
Date: Mon, 13 Apr 2026 16:36:26 -0700
Message-ID: <20260413233629.771034-2-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413233629.771034-1-John.Harrison@Igalia.com>
References: <20260413233629.771034-1-John.Harrison@Igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

The time was being drawn twice and the position of the text was based
on magic numbers rather than the font size. Which meant it could move
to different places depending upon the screen resolution (as the font
size is calculated based on the screen size).

CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 tools/intel_hdcp.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 266ee1968..c9968f329 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -470,7 +470,7 @@ static void *keypress_thread(void *arg)
 
 static void *video_player_thread(void *arg)
 {
-	double font_size, x, y;
+	double font_size, x, y, edge_gap;
 	struct igt_fb fb;
 	cairo_t *cr;
 	igt_plane_t *primary;
@@ -528,29 +528,13 @@ static void *video_player_thread(void *arg)
 
 		draw_menu_text(cr, data);
 
-		current_time = time(NULL);
-		elapsed = current_time - data->video_start_time;
-		minutes = elapsed / 60;
-		seconds = elapsed % 60;
-		snprintf(timer_str, sizeof(timer_str), "%02d:%02d", minutes, seconds);
-
 		cairo_select_font_face(cr, "Helvetica", CAIRO_FONT_SLANT_NORMAL,
 				       CAIRO_FONT_WEIGHT_BOLD);
 		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
 		font_size = data->height / 12.0;
-		cairo_set_font_size(cr, font_size / 2.0);
-		cairo_text_extents(cr, timer_str, &ext);
-		cairo_move_to(cr, data->width - ext.width - 20, data->height - 20);
-		cairo_show_text(cr, timer_str);
-
-		/* Draw HDCP status above timer */
-		cairo_set_font_size(cr, font_size);
-		cairo_text_extents(cr, hdcp_str, &ext);
-		x = data->width - ext.width - 20;
-		y = data->height - ext.height - 60;
-
-		cairo_move_to(cr, x, y);
-		cairo_show_text(cr, hdcp_str);
+		edge_gap = font_size / 5;
+		x = data->width - edge_gap;
+		y = data->height - edge_gap;
 
 		/* Add timer in bottom-right corner */
 		current_time = time(NULL);
@@ -561,8 +545,16 @@ static void *video_player_thread(void *arg)
 
 		cairo_set_font_size(cr, font_size / 2.0);
 		cairo_text_extents(cr, timer_str, &ext);
-		cairo_move_to(cr, data->width - ext.width - 20, data->height - 20);
+		cairo_move_to(cr, x - ext.width, y);
 		cairo_show_text(cr, timer_str);
+		y -= ext.height + edge_gap;
+
+		/* Draw HDCP status above timer */
+		cairo_set_font_size(cr, font_size);
+		cairo_text_extents(cr, hdcp_str, &ext);
+		cairo_move_to(cr, x - ext.width, y);
+		cairo_show_text(cr, hdcp_str);
+		y -= ext.height + edge_gap;
 
 		cairo_destroy(cr);
 
-- 
2.43.0

