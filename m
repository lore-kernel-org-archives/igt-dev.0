Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07339CCF2F6
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 12:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B511810E430;
	Mon, 19 Jan 2026 12:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGjx7mlt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB6B10E430
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 12:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768826123; x=1800362123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EsiQa3b+nXYbINVjWZ1HjGRk5RWqn40fhtpFB8vxn50=;
 b=HGjx7mltaivLLvNCnHNlL5YqlsKILbwvBGTQwY5FjEteBAhDluQy/5xb
 MyybmCHZwdcx5Yvip6WO7TXWhfKuySdX6LdkrTuVhOYSoSDrH4B+j5Y/O
 SkU2IgbMrc8SO0145BIwymn6tuNPtbRCUq+jmYADcfWwudcv/4jNm1Mls
 mbeb+V0ypIxnx8RVc0EM8ZQjagsbUYmkkYKt6Q1r6Z0uHUjQ17CStB1q1
 Zpe2T4t5gUGFpSQf5zE1uXdfFnQAjAQUzYZJPqTQmcV6g7nLny92AEinB
 d9LSQw7v0uej3DKTKvdRJzOnRSVRNPCHtDMzsf54EdNsDkHGvuEvaqTBc w==;
X-CSE-ConnectionGUID: StAxTfNDRWeLERj0j4xUiA==
X-CSE-MsgGUID: P4cNgaocQgeodEXX7RVdfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69769799"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="69769799"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:35:23 -0800
X-CSE-ConnectionGUID: WvdBwGnxSJCEGbFb8LYmCA==
X-CSE-MsgGUID: u5ggyorCR42ZWjsfkHeUhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="206211488"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 04:35:21 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 09/10] tools/intel_hdcp: Add interactive control with
 playback
Date: Mon, 19 Jan 2026 18:01:41 +0530
Message-Id: <20260119123142.504623-10-santhosh.reddy.guddati@intel.com>
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

Replace static handling with an interactive loop for HDCP control.
Add video playback thread, dynamic menu updates.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 173 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 157 insertions(+), 16 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index fdaa7d931..9366fd5f9 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -36,6 +36,7 @@ typedef struct data {
 	pthread_t video_tid;
 	int selected_connector;
 	bool video_running;
+	time_t video_start_time;
 } data_t;
 
 static const char * const menu_lines[] = {
@@ -48,6 +49,58 @@ static const char * const menu_lines[] = {
 	"q. Quit"
 };
 
+static void draw_menu_text(cairo_t *cr, data_t *data)
+{
+	cairo_text_extents_t ext;
+	double x_center, total_height, y_start, y;
+	int num_lines = ARRAY_SIZE(menu_lines);
+
+	cairo_select_font_face(cr, "Helvetica", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD);
+	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
+
+	x_center = data->width / 2.0;
+	total_height = 0;
+	for (int i = 0; i < num_lines; i++) {
+		cairo_set_font_size(cr, 52);
+		cairo_text_extents(cr, menu_lines[i], &ext);
+		total_height += ext.height;
+	}
+
+	y_start = (data->height - total_height) / 2.0;
+	y = y_start;
+	for (int i = 0; i < num_lines; i++) {
+		cairo_set_font_size(cr, 52);
+		cairo_text_extents(cr, menu_lines[i], &ext);
+		cairo_move_to(cr, x_center - ext.width / 2, y);
+		cairo_show_text(cr, menu_lines[i]);
+		y += ext.height + 10;
+	}
+}
+
+static void draw_menu(data_t *data, const char *status)
+{
+	cairo_t *cr = igt_get_cairo_ctx(data->fd, &data->fb);
+
+	/* Background color and text color based on HDCP status */
+	if (strcmp(status, "INIT") == 0) {
+		cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
+		cairo_paint(cr);
+		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
+	} else if (strcmp(status, "Enabled") == 0) {
+		cairo_set_source_rgb(cr, 0.0, 1.0, 0.0);
+		cairo_paint(cr);
+		cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
+	} else {
+		cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);
+		cairo_paint(cr);
+		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
+	}
+
+	draw_menu_text(cr, data);
+
+	cairo_destroy(cr);
+}
+
 static void set_hdcp_prop(data_t *data, int property, int type, int connector_id)
 {
 	drmModeConnector *drm_connector = drmModeGetConnectorCurrent(data->fd, connector_id);
@@ -471,18 +524,34 @@ static void *video_player_thread(void *arg)
 		cairo_set_source_rgb(cr, bg_r, bg_g, bg_b);
 		cairo_paint(cr);
 
+		/* Draw menu */
+		draw_menu_text(cr, data);
+
+		/* Draw timer at bottom-right corner */
+		current_time = time(NULL);
+		elapsed = current_time - data->video_start_time;
+		minutes = elapsed / 60;
+		seconds = elapsed % 60;
+		snprintf(timer_str, sizeof(timer_str), "%02d:%02d", minutes, seconds);
+
 		cairo_select_font_face(cr, "Helvetica", CAIRO_FONT_SLANT_NORMAL,
 				       CAIRO_FONT_WEIGHT_BOLD);
+		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
 		font_size = data->height / 12.0;
-		cairo_set_font_size(cr, font_size);
+		cairo_set_font_size(cr, font_size / 2.0);
+		cairo_text_extents(cr, timer_str, &ext);
+		cairo_move_to(cr, data->width - ext.width - 20, data->height - 20);
+		cairo_show_text(cr, timer_str);
 
+		/* Draw HDCP status above timer */
+		cairo_set_font_size(cr, font_size);
 		cairo_text_extents(cr, hdcp_str, &ext);
-		x = (data->width - ext.width) / 2.0 - ext.x_bearing;
-		y = (data->height - ext.height) / 2.0 - ext.y_bearing;
+		x = data->width - ext.width - 20;
+		y = data->height - ext.height - 60;
 
-		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
-		cairo_move_to(cr, x, y + ext.height);
+		cairo_move_to(cr, x, y);
 		cairo_show_text(cr, hdcp_str);
+
 		cairo_destroy(cr);
 
 		primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
@@ -521,6 +590,16 @@ static void stop_video_player(data_t *data)
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
+static void enable_hdcp_type(data_t *data, enum hdcp_type type)
+{
+		set_hdcp_prop(data, CP_DESIRED, type, data->selected_connector);
+		pthread_mutex_lock(&data->lock);
+		data->hdcp_type = type;
+		data->video_start_time = time(NULL);
+		pthread_mutex_unlock(&data->lock);
+		start_video_player(data);
+}
+
 static void test_init(data_t *data)
 {
 	drmModeModeInfo *mode;
@@ -550,38 +629,100 @@ static void test_init(data_t *data)
 
 		break;
 	}
+
+	pthread_mutex_init(&data->lock, NULL);
+	data->user_cmd = 0;
+	data->hdcp_type = 0;
+	data->running = true;
+	data->video_running = false;
+
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
 static void cleanup(data_t *data)
 {
+	stop_video_player(data);
 	igt_remove_fb(data->fd, &data->fb);
 	igt_display_fini(&data->display);
 	close(data->fd);
+	pthread_mutex_destroy(&data->lock);
 }
 
 int main(int argc, char **argv)
 {
 	data_t data;
-	int option;
-	static const char optstr[] = "hi";
-	struct option long_opts[] = {
-		{"help",	no_argument,	NULL, 'h'},
-		{"info",	no_argument,	NULL, 'i'},
-		{NULL,		0,		NULL,  0 }
-	};
+	pthread_t tid;
+	const char *status = NULL;
+	igt_plane_t *primary;
 
+	data.selected_connector = -1;
 	test_init(&data);
 
-	while ((option = getopt_long(argc, argv, optstr, long_opts, NULL)) != -1) {
-		switch (option) {
-		case 'i':
+	draw_menu(&data, "INIT");
+	primary = igt_output_get_plane_type(data.output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, &data.fb);
+	igt_display_commit2(&data.display, COMMIT_ATOMIC);
+
+	pthread_create(&tid, NULL, keypress_thread, &data);
+
+	while (data.running) {
+		int cmd;
+
+		pthread_mutex_lock(&data.lock);
+		cmd = data.user_cmd;
+		data.user_cmd = 0;
+		pthread_mutex_unlock(&data.lock);
+
+		if (cmd == 0) {
+			usleep(100 * 1000);
+			continue;
+		}
+
+		switch (cmd) {
+		case 1:
+			/* Get HDCP Status */
 			get_hdcp_info(&data);
 			break;
-		case 'h':
+		case 2:
+			/* Enable HDCP 1.4 */
+			enable_hdcp_type(&data, HDCP_TYPE_1_4);
+			break;
+		case 3:
+			/* Enable HDCP2.2 Type 0 */
+			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_0);
+			break;
+		case 4:
+			/* Enable HDCP2.2 Type 1 */
+			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_1);
+			break;
+		case 5:
+			/* Disable HDCP */
+			stop_video_player(&data);
+			set_hdcp_prop(&data, CP_UNDESIRED, HDCP_TYPE_2_2_TYPE_1,
+				      data.selected_connector);
+			data.hdcp_type = HDCP_TYPE_NONE;
+			break;
 		default:
 			break;
 		}
+
+		/* Update menu display */
+		if (cmd == 1) {
+			draw_menu(&data, "INIT");
+		} else {
+			status = get_hdcp_status(&data, data.selected_connector);
+			draw_menu(&data, status);
+		}
+
+		primary = igt_output_get_plane_type(data.output, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(primary, &data.fb);
+		igt_display_commit2(&data.display, COMMIT_ATOMIC);
+
+		usleep(200 * 1000);
 	}
+
+	pthread_cancel(tid);
+	pthread_join(tid, NULL);
 	cleanup(&data);
+	return 0;
 }
-- 
2.34.1

