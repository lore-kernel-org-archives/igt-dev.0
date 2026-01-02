Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9BCEEB57A
	for <igt-dev@archiver.kernel.org>; Fri,  2 Jan 2026 06:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4347410E046;
	Fri,  2 Jan 2026 06:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihihOcOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0D410E046
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jan 2026 06:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767334240; x=1798870240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ijCa+BLxu9o3HJjrNCnDX+BjnR/vqYr73aIsejw+uWI=;
 b=ihihOcOQjpxs0Zgsdeqe677Z2Rt2XPDkboHfgdFaAtyUMyDSsYHu7+5R
 T6hs5E5YFJqCqRPV3qsHpwLnPu04ju3cMk5B+oWnIvMJAQyk8ynlPxq7x
 A5tQS6R6nM15jfX/tbc683WWSQyBfFJ5OLkSUf3IL8ARmJKONfxyfp3ML
 vHiipIE0K7PZsd/VQcuK3U1KQgO5cVRr8jX8G4Dil6JEaZFkO6tvDFNlu
 IQPicG4se7Oe9VjQ+GoJ597k5dpIGWbQhDaeTJRkyHCyUHBK5YTHqCBk4
 aeF/YYHq0KSjDm8e1BHPNIKPQpgQnQQt7Enb+jG2aV5BAXbxylbTZK4NX A==;
X-CSE-ConnectionGUID: PDEFJtpdQzuYrtBzHO5EqA==
X-CSE-MsgGUID: q5ISgLGuS32DUNTFSQKq3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72684673"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="72684673"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2026 22:10:40 -0800
X-CSE-ConnectionGUID: 2+ryIQWzRKOz8VrxH3Cj1A==
X-CSE-MsgGUID: yBodXp3dRi6hYgsR0nbxug==
X-ExtLoop1: 1
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 22:10:38 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, kamil.konieczny@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 4/6] tools/intel_hdcp: Add video playback loop with
 thread
Date: Fri,  2 Jan 2026 11:38:33 +0530
Message-Id: <20260102060835.89725-5-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260102060835.89725-1-santhosh.reddy.guddati@intel.com>
References: <20260102060835.89725-1-santhosh.reddy.guddati@intel.com>
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
index 9cfbc0576..3dc128531 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -35,6 +35,7 @@ typedef struct data {
 	pthread_mutex_t lock;
 	pthread_t video_tid;
 	int selected_connector;
+	bool video_running;
 } data_t;
 
 static void set_hdcp_prop(data_t *data, int property, int type, int connector_id)
@@ -342,6 +343,101 @@ static void *keypress_thread(void *arg)
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

