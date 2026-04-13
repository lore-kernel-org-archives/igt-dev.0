Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528E5F531DE
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 23:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0490A10E557;
	Mon, 13 Apr 2026 23:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BVBMOYmO";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4C210E557
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 23:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X+obHHN6d7Elk/uYXpQHS3YFQPqXb2kbw9wKVQZgAt8=; b=BVBMOYmOjAntHmLSvbquq1grCs
 dHOSmQtRA0oeanb2e4bEUYDuGdacjzbYzh1dLE4j75aJbBO7+0MAqV9tS1t5v1CMgBSR/F9R5pVKK
 erEJ+AKpMioSijd189+tSEPJhI7W4SgXl64NIhvxTiQNwFfnffmd+inhpBL/KeacAUQUagVpuLa7I
 eZ6YymNgl7pj8IWQq6Oy1a1SLyZT5GqpC3Pg4oaLgKlA7cn/oYz8730yPO8j1oqQtSlbesV7Kj/BV
 o0WLHzxjffQS3EtJcf7pCKZHseAhLz5UyOry2WJvF7z8ThCWitRqIUwb0HNdsC+hqly25MN78UKTK
 VI9o/JdQ==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wCQqO-00FeK3-OG; Tue, 14 Apr 2026 01:37:29 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3 3/4] tools/intel_hdcp: Show actual HDCP status
Date: Mon, 13 Apr 2026 16:36:28 -0700
Message-ID: <20260413233629.771034-4-John.Harrison@Igalia.com>
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

The 'video player' showed what the requested HDCP mode was but not the
actual status. The menu system does redraw the screen with a special
colour to denote the status, but that is immediately overwritten by
the player thread. So all you get is a very brief full screen flicker
(to be fixed in next patch).

Instead, add the current HDCP status as an extra text line of the
video player's output so it is permanently visible and clear.

Also, move the enable of HDCP inside the mutex lock with the
internal state change. That way, the newly added 'enabled/desired'
line does not update in advance of the 'requested' line (due to the
video player thread being asynchronous and managing to turn HDCP on
while the menu thread is waiting on the mutex lock).

v2: Split into two patches (review feedback by Kamil)
v3: Fix text positions by using helper function

CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: John Harrison <John.Harrison@Igalia.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_hdcp.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 4dfeda594..c12de06df 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -485,7 +485,8 @@ static void *video_player_thread(void *arg)
 	struct igt_fb fb;
 	cairo_t *cr;
 	igt_plane_t *primary;
-	const char *hdcp_str;
+	const char *hdcp_request;
+	const char *hdcp_status;
 	double bg_r = 0.0, bg_g = 0.0, bg_b = 0.0;
 	enum hdcp_type cur_type, prev_type;
 	data_t *data;
@@ -512,22 +513,24 @@ static void *video_player_thread(void *arg)
 			prev_type = cur_type;
 		}
 
+		hdcp_status = get_hdcp_status(data, data->selected_connector);
+
 		switch (cur_type) {
 		case HDCP_TYPE_1_4:
 			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0;
-			hdcp_str = "HDCP1.4";
+			hdcp_request = "HDCP1.4";
 			break;
 		case HDCP_TYPE_2_2_TYPE_0:
 			bg_r = 0.0; bg_g = 0.45; bg_b = 0.45;
-			hdcp_str = "HDCP2.2 TYPE 0";
+			hdcp_request = "HDCP2.2 TYPE 0";
 			break;
 		case HDCP_TYPE_2_2_TYPE_1:
 			bg_r = 0.45; bg_g = 0.15; bg_b = 0.6;
-			hdcp_str = "HDCP2.2 TYPE 1";
+			hdcp_request = "HDCP2.2 TYPE 1";
 			break;
 		default:
 			bg_r = 0.0; bg_g = 0.0; bg_b = 0.0;
-			hdcp_str = "NO HDCP";
+			hdcp_request = "NO HDCP";
 			break;
 		}
 
@@ -555,7 +558,10 @@ static void *video_player_thread(void *arg)
 		y = draw_text_right(cr, font_size / 2.0, x, y, timer_str );
 
 		/* Draw HDCP status above timer */
-		y = draw_text_right(cr, font_size, x, y, hdcp_str );
+		y = draw_text_right(cr, font_size, x, y, hdcp_status );
+
+		/* Draw HDCP request above status */
+		y = draw_text_right(cr, font_size, x, y, hdcp_request );
 
 		cairo_destroy(cr);
 
@@ -598,8 +604,8 @@ static void stop_video_player(data_t *data)
 
 static void enable_hdcp_type(data_t *data, enum hdcp_type type)
 {
-		set_hdcp_prop(data, CP_DESIRED, type, data->selected_connector);
 		pthread_mutex_lock(&data->lock);
+		set_hdcp_prop(data, CP_DESIRED, type, data->selected_connector);
 		data->hdcp_type = type;
 		data->video_start_time = time(NULL);
 		pthread_mutex_unlock(&data->lock);
-- 
2.43.0

