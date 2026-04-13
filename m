Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2D3F531DE
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 23:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D62510E557;
	Mon, 13 Apr 2026 23:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="g63q8xhq";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C6B10E557
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 23:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3IlCgE0ZyRhMu0UaskQkZP9355pjIWQXicUWjEVoKZU=; b=g63q8xhqP+/paORd7IEUCSSjwn
 tzTv7LCgReqCjJnB/UMCNpLboCs0j5h9ua53Nvs/K6HzJUGA5bHFm9WOoxG9q+B9L0z64Ga3Y2L1G
 uciu3w3YO0SiX9y5ponzP8917bL8X6ODUb1+iR4wdYRLekH3IfEbu0nsa6Gue1N9v2BIXHDJLpkXE
 qfpjU7dLnQlbv3Ey8/7qtrqcZD/URWBKEM1oo7eVKSqYU26cYF1MnbmbZZzhnRrg9exPxQfFMS208
 pxbxPebbsjTQD7xq+bcGuisnyT3JzqdGAPo9qRmTeSAyQsBSQujd1nZVRlxGjXq/TLK+fg1r5T0Su
 HTbsi0KQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wCQqN-00FeK3-08; Tue, 14 Apr 2026 01:37:27 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t v3 2/4] tools/intel_hdcp: Move text rendering into
 helper function
Date: Mon, 13 Apr 2026 16:36:27 -0700
Message-ID: <20260413233629.771034-3-John.Harrison@Igalia.com>
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

Rather than duplicate the text rendering calculations over and over,
add a helper function.

CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 tools/intel_hdcp.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index c9968f329..4dfeda594 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -468,6 +468,17 @@ static void *keypress_thread(void *arg)
 	return NULL;
 }
 
+static double draw_text_right(cairo_t *cr, double font_size, double x, double y, const char *str )
+{
+	cairo_text_extents_t ext;
+
+	cairo_set_font_size(cr, font_size);
+	cairo_text_extents(cr, str, &ext);
+	cairo_move_to(cr, x - ext.width, y);
+	cairo_show_text(cr, str);
+	return y - ext.height - (font_size / 4);
+}
+
 static void *video_player_thread(void *arg)
 {
 	double font_size, x, y, edge_gap;
@@ -476,7 +487,6 @@ static void *video_player_thread(void *arg)
 	igt_plane_t *primary;
 	const char *hdcp_str;
 	double bg_r = 0.0, bg_g = 0.0, bg_b = 0.0;
-	cairo_text_extents_t ext;
 	enum hdcp_type cur_type, prev_type;
 	data_t *data;
 	char timer_str[32];
@@ -542,19 +552,10 @@ static void *video_player_thread(void *arg)
 		minutes = elapsed / 60;
 		seconds = elapsed % 60;
 		snprintf(timer_str, sizeof(timer_str), "%02d:%02d", minutes, seconds);
-
-		cairo_set_font_size(cr, font_size / 2.0);
-		cairo_text_extents(cr, timer_str, &ext);
-		cairo_move_to(cr, x - ext.width, y);
-		cairo_show_text(cr, timer_str);
-		y -= ext.height + edge_gap;
+		y = draw_text_right(cr, font_size / 2.0, x, y, timer_str );
 
 		/* Draw HDCP status above timer */
-		cairo_set_font_size(cr, font_size);
-		cairo_text_extents(cr, hdcp_str, &ext);
-		cairo_move_to(cr, x - ext.width, y);
-		cairo_show_text(cr, hdcp_str);
-		y -= ext.height + edge_gap;
+		y = draw_text_right(cr, font_size, x, y, hdcp_str );
 
 		cairo_destroy(cr);
 
-- 
2.43.0

