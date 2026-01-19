Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EF5CCF2EF
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 12:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A286B10E42E;
	Mon, 19 Jan 2026 12:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1hNRpUJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EAD10E433
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 12:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768826126; x=1800362126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WQQzY0AFWBIGQ5ckUtRQJ5dASwG2URFDvLehdtzWiy4=;
 b=k1hNRpUJ1GVPiMdQ4Dokr1zyuotAtU9SYR0IwLgzk8+n5/rm/BzexF1F
 pbi6ZK8RZUjTC3TWtQae5t0mp7eKbgqArQBG8KxjQnUdT/ERekevlaFW/
 yr2PVwvn/EtKSVYjVmXwF6tEJ93KKSKfFwBCbKIlrF0h7tQYs4FStjSNj
 EwVe8LMnaGSlUrcs5XVuN44M1nyT3Zko/mDcXYV8IU9NJByKwRSPqP2zb
 /GBO1i4sSlCwDBkEYwp4E/wEJ68dwaKvfv8UV3ShvPZf8N1Cfuqv+wE6t
 O8nSZjnOWSiqBQzb0V2RJQXX661L95DX7Ad7MX21ZxbGx20emSlWN6axu A==;
X-CSE-ConnectionGUID: m+yS0EIQQYWqJV0Lwm3KaQ==
X-CSE-MsgGUID: jV5qb5qeQb2mYwHakVRI7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69769809"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69769809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:35:26 -0800
X-CSE-ConnectionGUID: Nw5V5stfSV2Qx+3L9For/w==
X-CSE-MsgGUID: qwmUPuQLS9KaH9CjjqlDYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="206211492"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:35:23 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 10/10] tools/intel_hdcp: Implement timer to the video
 playback
Date: Mon, 19 Jan 2026 18:01:42 +0530
Message-Id: <20260119123142.504623-11-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
References: <20260119123142.504623-1-santhosh.reddy.guddati@intel.com>
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

Introduce a timer to the video playback UI to indicate the current
playback session and duration of the HDCP session with type that has
been running.
This keeps the timer align with the active HDCP state and reset upon
switching modes.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tools/intel_hdcp.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 9366fd5f9..84725ab76 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -488,9 +488,15 @@ static void *video_player_thread(void *arg)
 	const char *hdcp_str;
 	double bg_r = 0.0, bg_g = 0.0, bg_b = 0.0;
 	cairo_text_extents_t ext;
+	char timer_str[32];
+	time_t current_time, elapsed;
+	int minutes, seconds;
 
 	data_t *data = (data_t *)arg;
 	enum hdcp_type cur_type = data->hdcp_type;
+	enum hdcp_type prev_type = cur_type;
+
+	data->video_start_time = time(NULL);
 
 	igt_create_color_fb(data->fd, data->width, data->height, DRM_FORMAT_XRGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0, &fb);
@@ -500,6 +506,12 @@ static void *video_player_thread(void *arg)
 
 		cur_type = data->hdcp_type;
 
+		/* Reset timer if HDCP type changed */
+		if (cur_type != prev_type) {
+			data->video_start_time = time(NULL);
+			prev_type = cur_type;
+		}
+
 		switch (cur_type) {
 		case HDCP_TYPE_1_4:
 			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0;
@@ -552,6 +564,18 @@ static void *video_player_thread(void *arg)
 		cairo_move_to(cr, x, y);
 		cairo_show_text(cr, hdcp_str);
 
+		/* Add timer in bottom-right corner */
+		current_time = time(NULL);
+		elapsed = current_time - data->video_start_time;
+		minutes = elapsed / 60;
+		seconds = elapsed % 60;
+		snprintf(timer_str, sizeof(timer_str), "%02d:%02d", minutes, seconds);
+
+		cairo_set_font_size(cr, font_size / 2.0);
+		cairo_text_extents(cr, timer_str, &ext);
+		cairo_move_to(cr, data->width - ext.width - 20, data->height - 20);
+		cairo_show_text(cr, timer_str);
+
 		cairo_destroy(cr);
 
 		primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
@@ -574,6 +598,7 @@ static void start_video_player(data_t *data)
 		return;
 
 	data->video_running = true;
+	data->video_start_time = time(NULL);
 	if (pthread_create(&data->video_tid, NULL, video_player_thread, data) != 0) {
 		fprintf(stderr, "Failed to create video player thread\n");
 		data->video_running = false;
-- 
2.34.1

