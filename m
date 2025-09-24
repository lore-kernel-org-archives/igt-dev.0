Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3AACAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 07:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A3610E222;
	Wed, 24 Sep 2025 07:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nj5AEtby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1CF10E6AE
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758699157; x=1790235157;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qlNjH9Kviplvxwhe+yi3sW9h5/AtT8L0f5/jkP6Alk0=;
 b=Nj5AEtbyiaVSrII5LTwrs9EBgbKW2yPOKkb9H3+SrGs9Fqlm20uc4EH5
 pbXfpelM/QsNlBqhvy9+IXlWMTkpGmy8U/J5LQrvOhzVAEcLQfQiT97ta
 c7ErVfbmbX/aZ2SP9KpJLc9EpzurZGMZna6GQE9VAoYynoqmEezYJsGfu
 Y0bHN6cUFlYfZQQlW6ua50+AZpJ2gxageMjxLvx8wjdX3jNRr0QHpvLCy
 pxYEb1nnV+HPEs7st9bMZAHAToxqZzgbY3yrC8EuquSl0fvsltukCKxBW
 dpzkpIyGCCKXba7Jf1UtBwyGJvMZeR68NyJj5Ody5rh0j8idPpIdmcpWB A==;
X-CSE-ConnectionGUID: pBsIABJ8RS+L8eBNQG5tlg==
X-CSE-MsgGUID: 3yNr+lcXRyGXoCxZ6Nf+tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86432584"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="86432584"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:36 -0700
X-CSE-ConnectionGUID: aIrbIQyYSk+2qhlocJu0zA==
X-CSE-MsgGUID: PvGAuIqpR+i3k9Gv5Jl4gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="214092889"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:35 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, ankit.k.nautiyal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 5/6] tools/intel_hdcp: Add video playback loop with
 thread
Date: Wed, 24 Sep 2025 12:59:39 +0530
Message-Id: <20250924072940.413695-6-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924072940.413695-1-santhosh.reddy.guddati@intel.com>
References: <20250924072940.413695-1-santhosh.reddy.guddati@intel.com>
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

The thread dynamically updates the framebuffer with HDCP status visual
(e.g., HDCP1.4, HDCP2.2 Type 0/1) using color-coded backgrounds and text.
Use start_video_player() and stop_video_player() functions
to manage the thread lifecycle.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 96 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 7babcf694..6920d0655 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -35,6 +35,7 @@ typedef struct data {
 	pthread_mutex_t lock;
 	pthread_t video_tid;
 	int selected_connector;
+	bool video_running;
 } data_t;
 
 static void draw_menu(data_t *data, const char *status)
@@ -362,6 +363,101 @@ static void *keypress_thread(void *arg)
 	return NULL;
 }
 
+static void *video_player_thread(void *arg)
+{
+	double font_size, x, y;
+	struct igt_fb fb;
+	cairo_t *cr;
+	igt_plane_t *primary;
+	const char *hdcp_str;
+	double bg_r = 0.0, bg_g = 0.0, bg_b = 0.0;
+	cairo_text_extents_t ext;
+
+	data_t *data = (data_t *)arg;
+	enum hdcp_type cur_type = data->hdcp_type;
+
+	igt_create_color_fb(data->fd, data->width, data->height, DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0, &fb);
+
+	while (data->video_running) {
+		pthread_mutex_lock(&data->lock);
+
+		cur_type = data->hdcp_type;
+
+		switch (cur_type) {
+		case HDCP_TYPE_1_4:
+			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0;
+			hdcp_str = "HDCP1.4";
+			break;
+		case HDCP_TYPE_2_2_TYPE_0:
+			bg_r = 0.0; bg_g = 0.45; bg_b = 0.45;
+			hdcp_str = "HDCP2.2 TYPE 0";
+			break;
+		case HDCP_TYPE_2_2_TYPE_1:
+			bg_r = 0.45; bg_g = 0.15; bg_b = 0.6;
+			hdcp_str = "HDCP2.2 TYPE 1";
+			break;
+		default:
+			bg_r = 0.0; bg_g = 0.0; bg_b = 0.0;
+			hdcp_str = "NO HDCP";
+			break;
+		}
+
+		cr = igt_get_cairo_ctx(data->fd, &fb);
+
+		cairo_set_source_rgb(cr, bg_r, bg_g, bg_b);
+		cairo_paint(cr);
+
+		cairo_select_font_face(cr, "Helvetica", CAIRO_FONT_SLANT_NORMAL,
+				       CAIRO_FONT_WEIGHT_BOLD);
+		font_size = data->height / 12.0;
+		cairo_set_font_size(cr, font_size);
+
+		cairo_text_extents(cr, hdcp_str, &ext);
+		x = (data->width - ext.width) / 2.0 - ext.x_bearing;
+		y = (data->height - ext.height) / 2.0 - ext.y_bearing;
+
+		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
+		cairo_move_to(cr, x, y + ext.height);
+		cairo_show_text(cr, hdcp_str);
+		cairo_destroy(cr);
+
+		primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(primary, &fb);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+		pthread_mutex_unlock(&data->lock);
+
+		usleep(100 * 1000);
+	}
+
+	igt_remove_fb(data->fd, &fb);
+
+	return NULL;
+}
+
+static void start_video_player(data_t *data)
+{
+	if (data->video_running)
+		return;
+
+	data->video_running = true;
+	if (pthread_create(&data->video_tid, NULL, video_player_thread, data) != 0) {
+		fprintf(stderr, "Failed to create video player thread\n");
+		data->video_running = false;
+	}
+}
+
+static void stop_video_player(data_t *data)
+{
+	if (!data->video_running)
+		return;
+
+	data->video_running = false;
+	pthread_join(data->video_tid, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
 static void test_init(data_t *data)
 {
 	drmModeModeInfo *mode;
-- 
2.34.1

