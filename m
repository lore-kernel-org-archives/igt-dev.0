Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163C6ECD6EE
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 21:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D4C10E65A;
	Wed, 11 Feb 2026 21:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JAdvPvyI";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5888310E65A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 21:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k6qnBSe7avtnzyiHGw4Alb7xTDC4CK05w3Veh4Nplwo=; b=JAdvPvyIgUmAavNkFhFljS0TzU
 loEtIxsSxO4N5wXsbUk4cFMNeCJl11eA+fHYKKIVnzrkIH8gJPcgFQKrnGey2bEvj6hqFW/MWE56v
 WlYJ0VANOxkZkajpyBFjjLbLutoCNI29g0v8F9Ux+hyRq6Oy7RFD98D049fJwyAIxsKMBYABcpWLU
 9p9Lxo1VA302KuaFaviacxv195ISzDfCf/psxCFCN+/7uYD80co5dGGANx7tUt83sm+TXuqfLZb8c
 M5gbbCbn/lhdkG8DdwmbvH+WSXRSrXYG+nVmPs3DDKphPguR4O43GZfaAHVUVDZrUaOj9wLxdY773
 OgRLG89g==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vqI2j-00HHEg-C4
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 22:46:41 +0100
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tool/intel_hdcp: Fix flickering and show actual HDCP
 status
Date: Wed, 11 Feb 2026 13:46:31 -0800
Message-ID: <20260211214631.265577-1-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
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

The 'video player' showed what the requested HDCP mode was but not the
actual status. The menu system did redraw the screen with a special
colour to denote the status, but that was immediately overwritten by
the player thread. So all you got was a very brief full screen flicker.

Instead, add the current HDCP status as an extra text line of the
video player's output. Also, drop the menu update once the video
player is running to remove the flickering.

Lastly, move the enable of HDCP inside the mutex lock with the
internal state change. That way, the 'enabled/desired' line does not
update in advance of the 'requested' line (due to the video player
thread being asynchronous and managing to turn HDCP on while the menu
thread is waiting on the mutex lock).

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 tools/intel_hdcp.c | 49 +++++++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index cd5d2b6be..56ed720cf 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -102,24 +102,13 @@ static void draw_menu_text(cairo_t *cr, data_t *data)
 	}
 }
 
-static void draw_menu(data_t *data, const char *status)
+static void draw_menu(data_t *data)
 {
 	cairo_t *cr = igt_get_cairo_ctx(data->fd, &data->fb);
 
-	/* Background color and text color based on HDCP status */
-	if (strcmp(status, "INIT") == 0) {
-		cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
-		cairo_paint(cr);
-		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
-	} else if (strcmp(status, "Enabled") == 0) {
-		cairo_set_source_rgb(cr, 0.0, 1.0, 0.0);
-		cairo_paint(cr);
-		cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
-	} else {
-		cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);
-		cairo_paint(cr);
-		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
-	}
+	cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
+	cairo_paint(cr);
+	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
 
 	draw_menu_text(cr, data);
 
@@ -482,6 +471,7 @@ static void *video_player_thread(void *arg)
 	char timer_str[32];
 	time_t current_time, elapsed;
 	int minutes, seconds;
+	const char *status = NULL;
 
 	data = (data_t *)arg;
 	cur_type = data->hdcp_type;
@@ -502,6 +492,8 @@ static void *video_player_thread(void *arg)
 			prev_type = cur_type;
 		}
 
+		status = get_hdcp_status(data, data->selected_connector);
+
 		switch (cur_type) {
 		case HDCP_TYPE_1_4:
 			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0;
@@ -544,10 +536,18 @@ static void *video_player_thread(void *arg)
 		cairo_show_text(cr, timer_str);
 
 		/* Draw HDCP status above timer */
+		cairo_set_font_size(cr, font_size);
+		cairo_text_extents(cr, status, &ext);
+		x = data->width - ext.width - 20;
+		y = data->height - ext.height - 20;
+
+		cairo_move_to(cr, x, y);
+		cairo_show_text(cr, status);
+
 		cairo_set_font_size(cr, font_size);
 		cairo_text_extents(cr, hdcp_str, &ext);
 		x = data->width - ext.width - 20;
-		y = data->height - ext.height - 60;
+		y = data->height - ext.height - 120;
 
 		cairo_move_to(cr, x, y);
 		cairo_show_text(cr, hdcp_str);
@@ -605,8 +605,8 @@ static void stop_video_player(data_t *data)
 
 static void enable_hdcp_type(data_t *data, enum hdcp_type type)
 {
-		set_hdcp_prop(data, CP_DESIRED, type, data->selected_connector);
 		pthread_mutex_lock(&data->lock);
+		set_hdcp_prop(data, CP_DESIRED, type, data->selected_connector);
 		data->hdcp_type = type;
 		data->video_start_time = time(NULL);
 		pthread_mutex_unlock(&data->lock);
@@ -667,13 +667,12 @@ int main(int argc, char **argv)
 {
 	data_t data;
 	pthread_t tid;
-	const char *status = NULL;
 	igt_plane_t *primary;
 
 	data.selected_connector = -1;
 	test_init(&data);
 
-	draw_menu(&data, "INIT");
+	draw_menu(&data);
 	primary = igt_output_get_plane_type(data.output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &data.fb);
 	igt_display_commit2(&data.display, COMMIT_ATOMIC);
@@ -707,7 +706,6 @@ int main(int argc, char **argv)
 			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_1);
 			break;
 		case 5:
-			stop_video_player(&data);
 			set_hdcp_prop(&data, CP_UNDESIRED, HDCP_TYPE_2_2_TYPE_1,
 				      data.selected_connector);
 			data.hdcp_type = HDCP_TYPE_NONE;
@@ -716,17 +714,6 @@ int main(int argc, char **argv)
 			break;
 		}
 
-		if (cmd == 1) {
-			draw_menu(&data, "INIT");
-		} else {
-			status = get_hdcp_status(&data, data.selected_connector);
-			draw_menu(&data, status);
-		}
-
-		primary = igt_output_get_plane_type(data.output, DRM_PLANE_TYPE_PRIMARY);
-		igt_plane_set_fb(primary, &data.fb);
-		igt_display_commit2(&data.display, COMMIT_ATOMIC);
-
 		usleep(200 * 1000);
 	}
 
-- 
2.43.0

