Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34767E83823
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 18:44:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE9810E3DE;
	Mon, 16 Feb 2026 18:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U3mNkILs";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDF310E03C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 18:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QQ5UpSTKhJRGWkWmtbbV4kQiA13/ZTvhig04xGrfGJM=; b=U3mNkILsYtLgOcjfT88IV+QEc3
 VOiMbQmFCBHTUugbhHiQaHiaAKGAgefUq2JwyFKg+jxEErRbhR0xpIxyNwy3Cyxk4L7doAc2jzJtX
 b61nRvD7kxqSNsz8L783vQeU2d8ceu23nOLO5zYOvGJF3tyLK0fFhVRC3W4NWmoH/cYouZMGQKd9S
 lPx7xb8HfVUKSe7baQ4ajxJoeeQ69oo2P3l2KGwu5YeQ/sg7kIe2iCY9hx9JHeqILoBBCiv4KvBdh
 MDBtTlU5sAwOKIDXryw6PQodPXiwcaWYdI8c7frez7sh7yo5JMlX+tdBuGH3F26OWr1ZzW32cl8sa
 Jbu6soqA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vs3Zg-001Ohv-77; Mon, 16 Feb 2026 19:44:00 +0100
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
Date: Mon, 16 Feb 2026 10:43:40 -0800
Message-ID: <20260216184341.437722-2-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216184341.437722-1-John.Harrison@Igalia.com>
References: <20260216184341.437722-1-John.Harrison@Igalia.com>
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

CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: John Harrison <John.Harrison@Igalia.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_hdcp.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index cd5d2b6be..8e29c5e32 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -482,6 +482,7 @@ static void *video_player_thread(void *arg)
 	char timer_str[32];
 	time_t current_time, elapsed;
 	int minutes, seconds;
+	const char *status = NULL;
 
 	data = (data_t *)arg;
 	cur_type = data->hdcp_type;
@@ -502,6 +503,8 @@ static void *video_player_thread(void *arg)
 			prev_type = cur_type;
 		}
 
+		status = get_hdcp_status(data, data->selected_connector);
+
 		switch (cur_type) {
 		case HDCP_TYPE_1_4:
 			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0;
@@ -544,10 +547,18 @@ static void *video_player_thread(void *arg)
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
@@ -605,8 +616,8 @@ static void stop_video_player(data_t *data)
 
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

