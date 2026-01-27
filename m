Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C55D2D8DE
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BBC10E501;
	Tue, 27 Jan 2026 09:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bzxb5WCu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD9F10E501
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507215; x=1801043215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V8vtjXqX4K6Q7sVQ00yQ3qA/exQSo1U0iNZgTZ/GAfk=;
 b=Bzxb5WCuVNEVvsvoXDDBd6J6nflRJaDF1r4rrz3wN6DNAtU6LAkjAh0A
 HRR37RvZq55Q88TVEDU3i69VqTMDxAxpPkP9qMvFdUAuHkaZUwtwtDHsI
 chYxrklHh70C0eXWmVpMDpfeTr9EX/O9KAHbq6S5TAD4p8u/VtXcOcv6d
 JLRArETgXWoHjYQj1DBP5388NVHSM3fk5O2JjFiRQhAXGd/ij2YXDbEcP
 paHpWd+NdtFN3oDbkvmeinUXgAu4v2sSiOEKIwpSCfFMrujihPCpXCh+M
 yozfJLCNDkMAEka3eR51LD1tMBwU2vWIHb2tfTTtHq2fvpH8Ci6x/z8Q/ w==;
X-CSE-ConnectionGUID: 8memS3f2T7+dA9Bq0HJxAA==
X-CSE-MsgGUID: CfPEtQbGQQGzcQmocNw2BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81420961"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81420961"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:46:55 -0800
X-CSE-ConnectionGUID: PrssqvCvTDq2qg1ACS4heQ==
X-CSE-MsgGUID: +FHqbZthQVadWbvrNMEq7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="208172709"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:46:53 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v9 11/11] tools/intel_hdcp: Implement timer to the video
 playback
Date: Tue, 27 Jan 2026 15:12:57 +0530
Message-Id: <20260127094257.572736-12-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127094257.572736-1-santhosh.reddy.guddati@intel.com>
References: <20260127094257.572736-1-santhosh.reddy.guddati@intel.com>
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
 tools/intel_hdcp.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index bb4361d74..a4c73c0e3 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -478,10 +478,17 @@ static void *video_player_thread(void *arg)
 	const char *hdcp_str;
 	double bg_r = 0.0, bg_g = 0.0, bg_b = 0.0;
 	cairo_text_extents_t ext;
-	enum hdcp_type cur_type;
-	data_t *data = (data_t *)arg;
+	enum hdcp_type cur_type, prev_type;
+	data_t *data;
+	char timer_str[32];
+	time_t current_time, elapsed;
+	int minutes, seconds;
 
+	data = (data_t *)arg;
 	cur_type = data->hdcp_type;
+	prev_type = cur_type;
+
+	data->video_start_time = time(NULL);
 	igt_create_color_fb(data->fd, data->width, data->height, DRM_FORMAT_XRGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0, &fb);
 
@@ -490,6 +497,12 @@ static void *video_player_thread(void *arg)
 
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
@@ -540,6 +553,18 @@ static void *video_player_thread(void *arg)
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
@@ -562,6 +587,7 @@ static void start_video_player(data_t *data)
 		return;
 
 	data->video_running = true;
+	data->video_start_time = time(NULL);
 	if (pthread_create(&data->video_tid, NULL, video_player_thread, data) != 0) {
 		fprintf(stderr, "Failed to create video player thread\n");
 		data->video_running = false;
-- 
2.34.1

