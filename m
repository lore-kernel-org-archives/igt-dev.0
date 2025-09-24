Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E750CAC5B0
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 07:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D031010E226;
	Wed, 24 Sep 2025 07:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Skd6gbTd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151D210E6AE
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 07:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758699159; x=1790235159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4EsMutt8ZqYELm9CZhIQrj0rWgbylrgDNCBZSB51x3M=;
 b=Skd6gbTdibQqOyfKjTq0w232vqC3+JQ/4DkCDPtODtmL/Gn7Yjlp+6v1
 ONo91DM5VJ3AykF/btJk036w5aIqlxNvSwfzyj6QyGg8MQpgN8D335fdR
 E2GDSKF4SdqCnPgZTnEukfV+n+GTtz9ocB0OszPxpqZo9APCw5ai/m6jJ
 Y6oehJHOpELjLLsh2IdWRdtWVC0dH8TOZY/759W61yAU1oZ3gveT3+7vt
 cc7138o4zH72pR84vZRM84b66hPosWMtvbVWggsGSCJzXNKOacZR7ASVi
 +vHMHY5DDYIhMhZvutlOWAkEJS1D6S7qyEPGVLFRp1LXP7sjkOh05KeFG w==;
X-CSE-ConnectionGUID: 8Ax2rr8iSTOfxt81efw4jQ==
X-CSE-MsgGUID: X8FeBxdZTnS3TX4tO7xAyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86432601"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="86432601"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:39 -0700
X-CSE-ConnectionGUID: qz2SJ6erQN6Urfv5ZZFJLA==
X-CSE-MsgGUID: ePzDd0tZQB60Z1r80eRA5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="214092908"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 00:32:37 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, ankit.k.nautiyal@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 6/6] tools/intel_hdcp: Add interactive control with
 playback
Date: Wed, 24 Sep 2025 12:59:40 +0530
Message-Id: <20250924072940.413695-7-santhosh.reddy.guddati@intel.com>
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

Replace static handling with an interactive loop for HDCP control.
Add video playback thread, dynamic menu updates.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 99 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 83 insertions(+), 16 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 6920d0655..9b9dbf556 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -34,8 +34,8 @@ typedef struct data {
 	bool running;
 	pthread_mutex_t lock;
 	pthread_t video_tid;
-	int selected_connector;
 	bool video_running;
+	int sel_conn;
 } data_t;
 
 static void draw_menu(data_t *data, const char *status)
@@ -312,7 +312,7 @@ static void *keypress_thread(void *arg)
 			data->user_cmd = choice - '0';
 			/* connector id validated below */
 			if (data->user_cmd >= 2 && data->user_cmd <= 5 &&
-			    data->selected_connector == -1) {
+			    data->sel_conn == -1) {
 				int cid = -1;
 				bool valid = false;
 
@@ -345,14 +345,14 @@ static void *keypress_thread(void *arg)
 					if (!connector) {
 						fprintf(stderr, "Connector %d not found\n", cid);
 						get_hdcp_info(data);
-						data->selected_connector = -1;
+						data->sel_conn = -1;
 						continue;
 					}
 
 					drmModeFreeConnector(connector);
-					data->selected_connector = cid;
+					data->sel_conn = cid;
 					valid = true;
-					printf("Using connector: %d\n", data->selected_connector);
+					printf("Using connector: %d\n", data->sel_conn);
 				}
 			}
 		} else {
@@ -487,38 +487,105 @@ static void test_init(data_t *data)
 
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
 
+	data.sel_conn = -1;
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
+			set_hdcp_prop(&data, CP_DESIRED, HDCP_TYPE_1_4, data.sel_conn);
+			data.hdcp_type = HDCP_TYPE_1_4;
+			start_video_player(&data);
+			break;
+		case 3:
+			/* Enable HDCP2.2 Type 0 */
+			set_hdcp_prop(&data, CP_DESIRED, HDCP_TYPE_2_2_TYPE_0, data.sel_conn);
+			data.hdcp_type = HDCP_TYPE_2_2_TYPE_0;
+			start_video_player(&data);
+			break;
+		case 4:
+			/* Enable HDCP2.2 Type 1 */
+			set_hdcp_prop(&data, CP_DESIRED, HDCP_TYPE_2_2_TYPE_1, data.sel_conn);
+			data.hdcp_type = HDCP_TYPE_2_2_TYPE_1;
+			start_video_player(&data);
+			break;
+		case 5:
+			/* Disable HDCP */
+			stop_video_player(&data);
+			set_hdcp_prop(&data, CP_UNDESIRED, HDCP_TYPE_2_2_TYPE_1, data.sel_conn);
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
+			status = get_hdcp_status(&data, data.sel_conn);
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

