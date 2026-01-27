Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF2ED2D8DA
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 09:46:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABEB10E500;
	Tue, 27 Jan 2026 09:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HLjlvGMy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109C510E501
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 09:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769507210; x=1801043210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QYvS/EyXjv7tsFIP8Q3UdfVHXv7g9/wWuG4FtaTT4FM=;
 b=HLjlvGMyUub1AQgny+fMsmk+EyzrXP98fFzW83IWYzsUHMBI6fsQvs90
 Ptml6RoBPrNh6EmGibaw6azM8OSgVeu15HONEa+XF9skw6NjBlrFuXK8h
 PmH0PqBC6MjnLsANyHWw+gwItkhn5u88S/csrfqxKQk23m1ZM+36Kcly2
 7Qlc3oWKLLS2lF1AuEXyywvOpCzJUKOXO9czJjhvXrCVvyxdjHBdWvgkq
 OwXd03iJ+38ps31tQUp5Dkh/i89KFwxAE0iKYAxLD+hQ2Z2pFe47eFotp
 Xz+agXBSfm5yUTM2qR8Pr7GhU2eaNVtI74MDLGgafprqewzOGAxYRwnAZ A==;
X-CSE-ConnectionGUID: InnabsGwSqWmOsskSE0hkg==
X-CSE-MsgGUID: IWm7+lyCQmmlcZV7gyNf5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81420953"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81420953"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 01:46:50 -0800
X-CSE-ConnectionGUID: NMv2XzWQTDO9aP5K+aYC1w==
X-CSE-MsgGUID: 8VLy49ykSwe5EIlJqTrr9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="208172699"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:46:48 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, mohammed.thasleem@intel.com,
 suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v9 09/11] tools/intel_hdcp: Add video playback loop with
 thread
Date: Tue, 27 Jan 2026 15:12:55 +0530
Message-Id: <20260127094257.572736-10-santhosh.reddy.guddati@intel.com>
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

The thread dynamically updates the framebuffer with HDCP status visual
(e.g., HDCP1.4, HDCP2.2 Type 0/1) using color-coded backgrounds and text.
Use start_video_player() and stop_video_player() functions
to manage the thread lifecycle.

v2: Avoid declarations at mid of code. (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tools/intel_hdcp.c | 96 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 53eda713d..4bcee675c 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -35,6 +35,7 @@ typedef struct data {
 	pthread_mutex_t lock;
 	pthread_t video_tid;
 	int selected_connector;
+	bool video_running;
 } data_t;
 
 static igt_output_t *get_hdcp_output(data_t *data, uint32_t connector_id, bool *is_valid)
@@ -423,6 +424,101 @@ static void *keypress_thread(void *arg)
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
+	enum hdcp_type cur_type;
+	data_t *data = (data_t *)arg;
+
+	cur_type = data->hdcp_type;
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

