Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE8DC88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D08D10E043;
	Wed, 16 Sep 2026 11:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gc9CR3qU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316B710E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557114; x=1821093114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gzJ5w47jCU+feu9mxedEJC/SxHV5AObISElcB/MRgyI=;
 b=gc9CR3qUYXe81DeIj/nYVrronEeFSVTm+1t7q1rIQxafhneL9D7JacJT
 IYZceFc1YEqvsmxo9S5FLIO3vNFK68m7P2fIo9qC22tSwmksGTCQi2HAe
 qH6P8PK36JuVEVAswV319I5LBwa5aV8OmnZd+2tLXmgXHLIJBj4ZA1d3H
 zU4MwOGxhxUxGCt8XOPQDMT6UiIt2ucRGaM2+CP1X2Myr2REAW18TBSxS
 w4/sOO4n8NqYN1gr4NpxaoYeZ54nL4qL+pfRa/UBwmeCCb7jBojPQapX0
 L0HqBRYXFVQru0MqKklj4HKUHr1F9RycDoNRA3WL27yyC93hY+iqnUmqa A==;
X-CSE-ConnectionGUID: PdHoayerTBu8N94xGqazdQ==
X-CSE-MsgGUID: cNpBp8D2RYS+KjjEZ+Fefw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440557"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440557"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:11:54 -0700
X-CSE-ConnectionGUID: ydcViJBOS0WH2adbXp/Z3w==
X-CSE-MsgGUID: 97D59yaaR1SmfQqzfFTjzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296801013"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:51 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 10/16] tools/intel_hdcp: Rework the on-screen overlay
Date: Wed, 16 Sep 2026 16:37:03 +0530
Message-ID: <20260916110718.596603-11-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
References: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
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

The overlay repeated the console menu on the panel, coloured the screen
by the HDCP type that was requested rather than the state the kernel
reported - so it turned green whether or not the link came up - and drew
into a single framebuffer that was being scanned out while cairo wrote
to it.

Redraw it around what an operator watches during a demo:

  - The Content Protection value in a badge across the middle, coloured
    by the reported state: green only at ENABLED, amber while
    authentication is in flight.
  - A title bar naming the output, connector id and sink capability, and
    a status bar with elapsed time, frame count and a key legend, so the
    panel can be read without looking back at the terminal.
  - A band sweeping across the picture, so a live frame can be told from
    a frozen one.
  - Two framebuffers, drawn into alternately, at 20 fps.

Connector selection becomes its own menu entry ('6') instead of being
triggered by the first command that happens to need it, and
data->selected_connector is written under the lock, because the overlay
and the tracker read it from other threads.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 425 +++++++++++++++++++++++++++++----------------
 1 file changed, 277 insertions(+), 148 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 0e5ae49b04..7109508d53 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -7,6 +7,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <inttypes.h>
+#include <math.h>
 #include <poll.h>
 #include <signal.h>
 #include <stdio.h>
@@ -38,6 +39,12 @@ enum hdcp_type {
 	HDCP_TYPE_2_2_TYPE_1
 };
 
+enum text_align {
+	ALIGN_LEFT,
+	ALIGN_CENTER,
+	ALIGN_RIGHT
+};
+
 /* One observed change of the Content Protection property. */
 struct cp_transition {
 	uint64_t ms;		/* when, relative to tool start */
@@ -63,6 +70,7 @@ typedef struct data {
 	pthread_t track_tid;
 	bool tracking;
 	uint64_t start_ms;
+	const char *sink_caps;
 	/* Owned by the tracker thread; read by others only after it joins. */
 	struct cp_transition transitions[MAX_CP_TRANSITIONS];
 	unsigned int num_transitions;
@@ -171,50 +179,10 @@ static const char * const menu_lines[] = {
 	"3. Enable HDCP2.2 Type 0",
 	"4. Enable HDCP2.2 Type 1",
 	"5. Disable HDCP",
+	"6. Select connector",
 	"q. Quit"
 };
 
-static void draw_menu_text(cairo_t *cr, data_t *data)
-{
-	cairo_text_extents_t ext;
-	double x_center, total_height, y_start, y;
-	int num_lines = ARRAY_SIZE(menu_lines);
-
-	cairo_select_font_face(cr, "Helvetica", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_BOLD);
-	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
-
-	x_center = data->width / 2.0;
-	total_height = 0;
-	for (int i = 0; i < num_lines; i++) {
-		cairo_set_font_size(cr, 52);
-		cairo_text_extents(cr, menu_lines[i], &ext);
-		total_height += ext.height;
-	}
-
-	y_start = (data->height - total_height) / 2.0;
-	y = y_start;
-	for (int i = 0; i < num_lines; i++) {
-		cairo_set_font_size(cr, 52);
-		cairo_text_extents(cr, menu_lines[i], &ext);
-		cairo_move_to(cr, x_center - ext.width / 2, y);
-		cairo_show_text(cr, menu_lines[i]);
-		y += ext.height + 10;
-	}
-}
-
-static void draw_menu(data_t *data)
-{
-	cairo_t *cr = igt_get_cairo_ctx(data->fd, &data->fb);
-
-	cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
-	cairo_paint(cr);
-	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
-
-	draw_menu_text(cr, data);
-
-	cairo_destroy(cr);
-}
-
 static void set_hdcp_prop(data_t *data, int property, int type, int connector_id)
 {
 	igt_output_t *output;
@@ -663,7 +631,8 @@ static int get_valid_hdcp_connectors(data_t *data, int *valid_connectors)
 	return valid_count;
 }
 
-static bool select_connector(data_t *data, int *valid_connectors, int valid_count)
+static bool select_connector(data_t *data, int *valid_connectors, int valid_count,
+			     int *out)
 {
 	char input[256];
 	int cid;
@@ -704,8 +673,7 @@ static bool select_connector(data_t *data, int *valid_connectors, int valid_coun
 		/* Verify connector is in valid list */
 		for (int i = 0; i < valid_count; i++) {
 			if (valid_connectors[i] == cid) {
-				data->selected_connector = cid;
-				printf("Using connector: %d\n", data->selected_connector);
+				*out = cid;
 				return true;
 			}
 		}
@@ -716,14 +684,10 @@ static bool select_connector(data_t *data, int *valid_connectors, int valid_coun
 	return false;
 }
 
-static bool handle_connector_selection(data_t *data, int cmd)
+static bool select_hdcp_connector(data_t *data)
 {
 	int valid_connectors[32];
-	int valid_count;
-
-	/* Commands 2-5 need connector selection if not already set */
-	if (cmd < 2 || cmd > 5 || data->selected_connector != -1)
-		return true;
+	int valid_count, cid;
 
 	valid_count = get_valid_hdcp_connectors(data, valid_connectors);
 
@@ -732,17 +696,18 @@ static bool handle_connector_selection(data_t *data, int cmd)
 		return false;
 	}
 
-	/*
-	 * Only ask when there is a real choice to make. The usual case is a
-	 * single HDCP-capable connector, which is also the one test_init()
-	 * has modeset.
-	 */
-	if (valid_count == 1) {
-		data->selected_connector = valid_connectors[0];
-		printf("Using connector: %d\n", data->selected_connector);
-	} else if (!select_connector(data, valid_connectors, valid_count)) {
+	/* Nothing to choose between; say which one is in use and move on. */
+	if (valid_count == 1)
+		cid = valid_connectors[0];
+	else if (!select_connector(data, valid_connectors, valid_count, &cid))
 		return false;
-	}
+
+	/* The overlay and the tracker both read this on other threads. */
+	pthread_mutex_lock(&data->lock);
+	data->selected_connector = cid;
+	pthread_mutex_unlock(&data->lock);
+
+	printf("Using connector: %d\n", cid);
 
 	/*
 	 * The tool only paints on the output it modeset. Protecting some other
@@ -750,10 +715,10 @@ static bool handle_connector_selection(data_t *data, int cmd)
 	 * are on different displays, so say so rather than letting the
 	 * operator read the overlay as belonging to the protected output.
 	 */
-	if (data->selected_connector != (int)data->output->id)
+	if (cid != (int)data->output->id)
 		fprintf(stderr,
 			"Warning: protecting connector %d, but the picture is on %s\n",
-			data->selected_connector, igt_output_name(data->output));
+			cid, igt_output_name(data->output));
 
 	return true;
 }
@@ -767,7 +732,7 @@ static void *keypress_thread(void *arg)
 	print_menu();
 
 	while (data->running && !quit_requested) {
-		printf("Enter input 1-5 or q: ");
+		printf("Enter input 1-6 or q: ");
 		fflush(stdout);
 
 		if (!read_line(data, input, sizeof(input))) {
@@ -785,7 +750,7 @@ static void *keypress_thread(void *arg)
 			continue;
 		}
 
-		if (choice < '1' || choice > '5') {
+		if (choice < '1' || choice > '6') {
 			fprintf(stderr, "Invalid choice: %c\n", choice);
 			continue;
 		}
@@ -793,14 +758,16 @@ static void *keypress_thread(void *arg)
 		cmd = choice - '0';
 
 		/*
-		 * Connector selection reads from stdin, so it has to happen
-		 * before the lock is taken. Holding the lock across a blocking
-		 * read stalls the video player thread, which needs it for
-		 * every frame, and the display freezes until the operator
-		 * finishes typing.
+		 * Connector selection reads from stdin, so it is done here
+		 * rather than in the command loop, and without the lock:
+		 * holding the lock across a blocking read stalls the video
+		 * player thread, which needs it for every frame, and the
+		 * display freezes until the operator finishes typing.
 		 */
-		if (!handle_connector_selection(data, cmd))
+		if (cmd == 6) {
+			select_hdcp_connector(data);
 			continue;
+		}
 
 		pthread_mutex_lock(&data->lock);
 		data->user_cmd = cmd;
@@ -815,114 +782,277 @@ static void *keypress_thread(void *arg)
 	return NULL;
 }
 
-static double draw_text_right(cairo_t *cr, double font_size, double x, double y, const char *str)
+static void draw_text(cairo_t *cr, double size, double x, double y,
+		      enum text_align align, const char *str)
 {
 	cairo_text_extents_t ext;
 
-	cairo_set_font_size(cr, font_size);
+	cairo_set_font_size(cr, size);
 	cairo_text_extents(cr, str, &ext);
-	cairo_move_to(cr, x - ext.width, y);
+
+	if (align == ALIGN_CENTER)
+		x -= ext.width / 2;
+	else if (align == ALIGN_RIGHT)
+		x -= ext.width;
+
+	cairo_move_to(cr, x, y);
 	cairo_show_text(cr, str);
+}
 
-	return y - ext.height - (font_size / 4);
+static const char *hdcp_type_name(enum hdcp_type type)
+{
+	switch (type) {
+	case HDCP_TYPE_1_4:
+		return "HDCP1.4";
+	case HDCP_TYPE_2_2_TYPE_0:
+		return "HDCP2.2 Type 0";
+	case HDCP_TYPE_2_2_TYPE_1:
+		return "HDCP2.2 Type 1";
+	default:
+		return "none";
+	}
 }
 
-static void *video_player_thread(void *arg)
+/*
+ * Colour follows the state the kernel reports, not the one that was asked
+ * for: amber while authentication is in flight, green only once the kernel
+ * has moved the property to ENABLED. Keying the colour off the request, as
+ * this used to, turned the screen green whether or not the link came up.
+ */
+static void cp_state_color(int state, double *r, double *g, double *b)
 {
-	double font_size, x, y, edge_gap;
-	struct igt_fb fb;
+	switch (state) {
+	case CP_ENABLED:
+		*r = 0.04; *g = 0.38; *b = 0.16;
+		break;
+	case CP_DESIRED:
+		*r = 0.55; *g = 0.34; *b = 0.04;
+		break;
+	case CP_UNDESIRED:
+		*r = 0.11; *g = 0.12; *b = 0.15;
+		break;
+	default:
+		*r = 0.25; *g = 0.05; *b = 0.05;
+		break;
+	}
+}
+
+static void rounded_rect(cairo_t *cr, double x, double y, double w, double h,
+			 double radius)
+{
+	cairo_new_sub_path(cr);
+	cairo_arc(cr, x + w - radius, y + radius, radius, -M_PI / 2, 0);
+	cairo_arc(cr, x + w - radius, y + h - radius, radius, 0, M_PI / 2);
+	cairo_arc(cr, x + radius, y + h - radius, radius, M_PI / 2, M_PI);
+	cairo_arc(cr, x + radius, y + radius, radius, M_PI, 3 * M_PI / 2);
+	cairo_close_path(cr);
+}
+
+/*
+ * The state name in a box the size of a caption, so it can be read from the
+ * back of a room and photographed off the panel. Returns the bottom of the
+ * box, for whatever is laid out under it.
+ */
+static double draw_state_badge(cairo_t *cr, data_t *data, int state, double cy)
+{
+	const char *name = state < 0 ? "NO PROPERTY" : cp_state_name(state);
+	double w = data->width, h = data->height;
+	double size = h * 0.115, pad = h * 0.035;
+	cairo_text_extents_t ext;
+	double bw, bh, bx, by;
+	double r, g, b;
+
+	cairo_set_font_size(cr, size);
+	cairo_text_extents(cr, name, &ext);
+
+	bw = ext.width + 2 * pad;
+	bh = size + 2 * pad;
+	bx = (w - bw) / 2;
+	by = cy - bh / 2;
+
+	cp_state_color(state, &r, &g, &b);
+
+	rounded_rect(cr, bx, by, bw, bh, h * 0.02);
+	cairo_set_source_rgba(cr, r, g, b, 0.92);
+	cairo_fill_preserve(cr);
+	cairo_set_source_rgba(cr, 1.0, 1.0, 1.0, 0.5);
+	cairo_set_line_width(cr, h * 0.0025);
+	cairo_stroke(cr);
+
+	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
+	draw_text(cr, size, w / 2, by + pad + size * 0.78, ALIGN_CENTER, name);
+
+	return by + bh;
+}
+
+/*
+ * The same keys the console menu offers, on the display. Someone watching the
+ * panel during a demo should not have to look back at the terminal to know
+ * what can be pressed.
+ */
+static void draw_key_legend(cairo_t *cr, data_t *data, double y)
+{
+	static const char * const keys[] = {
+		"1 info", "2 HDCP1.4", "3 2.2 Type 0", "4 2.2 Type 1",
+		"5 disable", "6 connector", "q quit"
+	};
+	double w = data->width, h = data->height;
+	double size = h * 0.021, gap = w * 0.018;
+	cairo_text_extents_t ext;
+	double total = 0, x;
+	unsigned int i;
+
+	cairo_set_font_size(cr, size);
+
+	for (i = 0; i < ARRAY_SIZE(keys); i++) {
+		cairo_text_extents(cr, keys[i], &ext);
+		total += ext.width + (i ? gap : 0);
+	}
+
+	x = (w - total) / 2;
+	for (i = 0; i < ARRAY_SIZE(keys); i++) {
+		cairo_text_extents(cr, keys[i], &ext);
+		cairo_set_source_rgba(cr, 1.0, 1.0, 1.0, 0.75);
+		cairo_move_to(cr, x, y);
+		cairo_show_text(cr, keys[i]);
+		x += ext.width + gap;
+	}
+}
+
+static void draw_video_frame(data_t *data, struct igt_fb *fb, int state,
+			     uint64_t frame)
+{
+	double w = data->width, h = data->height;
+	double bar = h * 0.085;		/* title and status bars */
+	double pad = w * 0.022;		/* margin text keeps from the edge */
+	double band_w = w * 0.05;
+	double r, g, b, band_x, y;
 	cairo_t *cr;
-	igt_plane_t *primary;
-	const char *hdcp_request;
-	const char *hdcp_status;
-	double bg_r = 0.0, bg_g = 0.0, bg_b = 0.0;
-	enum hdcp_type cur_type, prev_type;
-	data_t *data;
-	char timer_str[32];
-	time_t current_time, elapsed;
-	int minutes, seconds;
-
-	data = (data_t *)arg;
-	cur_type = data->hdcp_type;
-	prev_type = cur_type;
+	char buf[192];
+	time_t elapsed;
 
-	data->video_start_time = time(NULL);
-	igt_create_color_fb(data->fd, data->width, data->height, DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 0.0, 0.0, 0.0, &fb);
+	cr = igt_get_cairo_ctx(data->fd, fb);
 
-	while (data->video_running) {
-		pthread_mutex_lock(&data->lock);
+	cp_state_color(state, &r, &g, &b);
+	cairo_set_source_rgb(cr, r * 0.5, g * 0.5, b * 0.5);
+	cairo_paint(cr);
 
-		cur_type = data->hdcp_type;
+	/*
+	 * A band sweeping across the picture. Without something moving there
+	 * is no way to tell a live picture from a frozen one, and "the
+	 * content keeps running while the link is renegotiated" is the point
+	 * the tool exists to show.
+	 */
+	band_x = fmod(frame * (w / 40.0), w + band_w) - band_w;
+	cairo_set_source_rgba(cr, 1.0, 1.0, 1.0, 0.06);
+	cairo_rectangle(cr, band_x, bar, band_w, h - 2 * bar);
+	cairo_fill(cr);
 
-		/* Reset timer if HDCP type changed */
-		if (cur_type != prev_type) {
-			data->video_start_time = time(NULL);
-			prev_type = cur_type;
-		}
+	/* Bars behind the text, so it stays legible on any background. */
+	cairo_set_source_rgba(cr, 0.0, 0.0, 0.0, 0.62);
+	cairo_rectangle(cr, 0, 0, w, bar);
+	cairo_rectangle(cr, 0, h - bar, w, bar);
+	cairo_fill(cr);
 
-		hdcp_status = get_hdcp_status(data, data->selected_connector);
+	cairo_select_font_face(cr, "Helvetica", CAIRO_FONT_SLANT_NORMAL,
+			       CAIRO_FONT_WEIGHT_BOLD);
 
-		switch (cur_type) {
-		case HDCP_TYPE_1_4:
-			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0;
-			hdcp_request = "HDCP1.4";
-			break;
-		case HDCP_TYPE_2_2_TYPE_0:
-			bg_r = 0.0; bg_g = 0.45; bg_b = 0.45;
-			hdcp_request = "HDCP2.2 TYPE 0";
-			break;
-		case HDCP_TYPE_2_2_TYPE_1:
-			bg_r = 0.45; bg_g = 0.15; bg_b = 0.6;
-			hdcp_request = "HDCP2.2 TYPE 1";
-			break;
-		default:
-			bg_r = 0.0; bg_g = 0.0; bg_b = 0.0;
-			hdcp_request = "NO HDCP";
-			break;
-		}
+	/* Title bar: what this is on the left, what it is looking at on the right. */
+	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
+	draw_text(cr, bar * 0.40, pad, bar * 0.46, ALIGN_LEFT,
+		  "HDCP CONTENT PROTECTION");
+	cairo_set_source_rgba(cr, 1.0, 1.0, 1.0, 0.65);
+	draw_text(cr, bar * 0.26, pad, bar * 0.80, ALIGN_LEFT, version_str);
+
+	snprintf(buf, sizeof(buf), "%s   connector %d",
+		 igt_output_name(data->output), data->selected_connector);
+	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
+	draw_text(cr, bar * 0.40, w - pad, bar * 0.46, ALIGN_RIGHT, buf);
+
+	snprintf(buf, sizeof(buf), "%dx%d   sink: %s",
+		 data->width, data->height, data->sink_caps);
+	cairo_set_source_rgba(cr, 1.0, 1.0, 1.0, 0.65);
+	draw_text(cr, bar * 0.26, w - pad, bar * 0.80, ALIGN_RIGHT, buf);
+
+	/*
+	 * The property value, given the whole middle of the screen. This is
+	 * the one thing on the display worth reading from a distance.
+	 */
+	cairo_set_source_rgba(cr, 1.0, 1.0, 1.0, 0.55);
+	draw_text(cr, h * 0.024, w / 2, h * 0.30, ALIGN_CENTER,
+		  "Content Protection");
+
+	y = draw_state_badge(cr, data, state, h * 0.42);
+
+	snprintf(buf, sizeof(buf), "requested %s      negotiated content type %s",
+		 hdcp_type_name(data->hdcp_type),
+		 get_hdcp_content_type(data, data->selected_connector));
+	cairo_set_source_rgba(cr, 1.0, 1.0, 1.0, 0.85);
+	draw_text(cr, h * 0.026, w / 2, y + h * 0.06, ALIGN_CENTER, buf);
+
+	/* Status bar: elapsed time and frame counter flanking the key legend. */
+	elapsed = time(NULL) - data->video_start_time;
+	snprintf(buf, sizeof(buf), "%02d:%02d",
+		 (int)(elapsed / 60), (int)(elapsed % 60));
+	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
+	draw_text(cr, bar * 0.38, pad, h - bar * 0.36, ALIGN_LEFT, buf);
 
-		cr = igt_get_cairo_ctx(data->fd, &fb);
+	snprintf(buf, sizeof(buf), "frame %" PRIu64, frame);
+	cairo_set_source_rgba(cr, 1.0, 1.0, 1.0, 0.65);
+	draw_text(cr, bar * 0.30, w - pad, h - bar * 0.36, ALIGN_RIGHT, buf);
 
-		cairo_set_source_rgb(cr, bg_r, bg_g, bg_b);
-		cairo_paint(cr);
+	draw_key_legend(cr, data, h - bar * 0.36);
 
-		draw_menu_text(cr, data);
+	igt_put_cairo_ctx(cr);
+}
 
-		cairo_select_font_face(cr, "Helvetica", CAIRO_FONT_SLANT_NORMAL,
-				       CAIRO_FONT_WEIGHT_BOLD);
-		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
-		font_size = data->height / 12.0;
-		edge_gap = font_size / 5;
-		x = data->width - edge_gap;
-		y = data->height - edge_gap;
+static void *video_player_thread(void *arg)
+{
+	data_t *data = arg;
+	struct igt_fb fb[2];
+	igt_plane_t *primary;
+	enum hdcp_type prev_type;
+	uint64_t frame = 0;
+	unsigned int cur = 0;
 
-		/* Add timer in bottom-right corner */
-		current_time = time(NULL);
-		elapsed = current_time - data->video_start_time;
-		minutes = elapsed / 60;
-		seconds = elapsed % 60;
-		snprintf(timer_str, sizeof(timer_str), "%02d:%02d", minutes, seconds);
-		y = draw_text_right(cr, font_size / 2.0, x, y, timer_str);
+	prev_type = data->hdcp_type;
+	data->video_start_time = time(NULL);
 
-		/* Draw HDCP status above timer */
-		y = draw_text_right(cr, font_size, x, y, hdcp_status);
+	for (unsigned int i = 0; i < ARRAY_SIZE(fb); i++)
+		igt_create_color_fb(data->fd, data->width, data->height,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    0.0, 0.0, 0.0, &fb[i]);
 
-		/* Draw HDCP request above status */
-		y = draw_text_right(cr, font_size, x, y, hdcp_request);
+	while (data->video_running) {
+		int state;
 
-		cairo_destroy(cr);
+		pthread_mutex_lock(&data->lock);
 
-		primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
-		igt_plane_set_fb(primary, &fb);
+		/* Restart the timer when a different type is requested. */
+		if (data->hdcp_type != prev_type) {
+			data->video_start_time = time(NULL);
+			prev_type = data->hdcp_type;
+		}
+
+		state = get_cp_state(data, data->selected_connector);
+		draw_video_frame(data, &fb[cur], state, frame);
+
+		primary = igt_output_get_plane_type(data->output,
+						    DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(primary, &fb[cur]);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		pthread_mutex_unlock(&data->lock);
 
-		usleep(100 * 1000);
+		/* The commit above has landed, so the other buffer is free. */
+		cur ^= 1;
+		frame++;
+
+		usleep(50 * 1000);
 	}
 
-	igt_remove_fb(data->fd, &fb);
+	for (unsigned int i = 0; i < ARRAY_SIZE(fb); i++)
+		igt_remove_fb(data->fd, &fb[i]);
 
 	return NULL;
 }
@@ -1057,7 +1187,6 @@ int main(int argc, char **argv)
 	data.selected_connector = -1;
 	test_init(&data);
 
-	draw_menu(&data);
 	primary = igt_output_get_plane_type(data.output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &data.fb);
 	igt_display_commit2(&data.display, COMMIT_ATOMIC);
-- 
2.43.0

