Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B03C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE76310E144;
	Wed, 16 Sep 2026 11:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4I/32Yp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2C610E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557097; x=1821093097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jG9jC/Je90uIFqCmxb4iN2bJ/Yiu8F8HWGvy6gPNVQs=;
 b=e4I/32YpRKJyPOWpKAvJ6svUiCPuOjslwNoH5eg6t/HUW8FKiDc+TdTn
 TPFHkpaCjksb6lQQmY3u4d5hC5CeQeJu1BHDHDuqaCFIwlW5vdco8edsi
 KnxMwFN5ZK1LKSG2q9kjSyFjgf5pXdol1o8qI25L0Q2jdAANu6cMZUf4G
 8XwzJGW273DiRA6ayrxJ4GFgSO+TPUKIlnvQl2w8wkenSjdex2Mim1Pif
 ObvIXXC7CY5U31aRqjyOeZgsQau8//5qz0jnGws/1CkAlKJxXtiver/VX
 jnJbBaQNCJR2tt0AkQKAt9Fb32+sWDP/eHBD6PpfRuvp71lIqNu3b0PTU w==;
X-CSE-ConnectionGUID: jp3WATUcT3m1Tk1hDwtWqg==
X-CSE-MsgGUID: gM6pGUBkToq+LzRVg7EiQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440521"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440521"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:11:37 -0700
X-CSE-ConnectionGUID: skWekoKkRrGWFr3pUY0hHg==
X-CSE-MsgGUID: MeYNDRntQpW6NzXhR6aowg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296800731"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:34 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 03/16] tools/intel_hdcp: Exit cleanly on quit and on
 Ctrl-C
Date: Wed, 16 Sep 2026 16:36:56 +0530
Message-ID: <20260916110718.596603-4-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
References: <20260916110718.596603-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
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

Teardown used pthread_cancel() on the input thread. fgets() and printf()
are cancellation points and the thread can be holding data->lock at one
of them, so the mutex could be left locked forever: the video player
thread then blocks on it and pthread_join() never returns.

Shut down cooperatively instead:

  - Reads go through read_line(), which polls stdin with a short timeout
    so the input thread notices a shutdown request on its own.
  - SIGINT and SIGTERM set a quit flag, so Ctrl-C unwinds through the
    normal teardown path instead of killing the process mid-modeset.
  - EOF on stdin stops the tool. It used to leave the main loop spinning
    forever, which made the tool unusable from a pipe or a script.
  - cleanup() sets Content Protection back to UNDESIRED, so the tool no
    longer exits leaving the link protected.

The two shutdown flags are volatile: they are polled by threads other
than the one that writes them.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 77 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 68 insertions(+), 9 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index 6350cf486b..bd44ad94d5 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -3,9 +3,12 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <ctype.h>
+#include <errno.h>
 #include <fcntl.h>
+#include <poll.h>
+#include <signal.h>
 #include <stdio.h>
-#include <ctype.h>
 
 #include "igt.h"
 
@@ -31,14 +34,48 @@ typedef struct data {
 	igt_crtc_t *crtc;
 	enum hdcp_type hdcp_type;
 	int user_cmd;
-	bool running;
+	volatile bool running;
 	pthread_mutex_t lock;
 	pthread_t video_tid;
 	int selected_connector;
-	bool video_running;
+	volatile bool video_running;
 	time_t video_start_time;
 } data_t;
 
+static volatile sig_atomic_t quit_requested;
+
+static void sighandler(int sig)
+{
+	quit_requested = 1;
+}
+
+/*
+ * fgets() on stdin, but wake up periodically so a shutdown request is not
+ * missed while the operator is not typing. Returns false on EOF, on error
+ * or when the tool is shutting down.
+ */
+static bool read_line(data_t *data, char *buf, size_t len)
+{
+	struct pollfd pfd = { .fd = STDIN_FILENO, .events = POLLIN };
+
+	while (data->running && !quit_requested) {
+		int ret = poll(&pfd, 1, 200);
+
+		if (ret < 0) {
+			if (errno == EINTR)
+				continue;
+			return false;
+		}
+
+		if (ret == 0)
+			continue;
+
+		return fgets(buf, len, stdin) != NULL;
+	}
+
+	return false;
+}
+
 static igt_output_t *get_hdcp_output(data_t *data, uint32_t connector_id, bool *is_valid)
 {
 	drmModeConnector *connector = drmModeGetConnectorCurrent(data->fd, connector_id);
@@ -377,11 +414,11 @@ static bool select_connector(data_t *data, int *valid_connectors, int valid_coun
 	}
 	printf("\n");
 
-	while (data->running) {
+	while (data->running && !quit_requested) {
 		printf("Enter connector id (blank to cancel): ");
 		fflush(stdout);
 
-		if (!fgets(input, sizeof(input), stdin)) {
+		if (!read_line(data, input, sizeof(input))) {
 			fprintf(stderr, "No input; aborting action\n");
 			return false;
 		}
@@ -443,11 +480,11 @@ static void *keypress_thread(void *arg)
 
 	print_menu();
 
-	while (data->running) {
+	while (data->running && !quit_requested) {
 		printf("Enter input 1-5 or q: ");
 		fflush(stdout);
 
-		if (!fgets(input, sizeof(input), stdin)) {
+		if (!read_line(data, input, sizeof(input))) {
 			printf("\nExiting...\n");
 			break;
 		}
@@ -484,6 +521,11 @@ static void *keypress_thread(void *arg)
 		pthread_mutex_unlock(&data->lock);
 	}
 
+	/* Also covers EOF on stdin, which used to leave the tool spinning. */
+	pthread_mutex_lock(&data->lock);
+	data->running = false;
+	pthread_mutex_unlock(&data->lock);
+
 	return NULL;
 }
 
@@ -676,6 +718,12 @@ static void test_init(data_t *data)
 static void cleanup(data_t *data)
 {
 	stop_video_player(data);
+
+	/* Don't leave the link protected behind us. */
+	if (data->selected_connector != -1)
+		set_hdcp_prop(data, CP_UNDESIRED, HDCP_TYPE_NONE,
+			      data->selected_connector);
+
 	igt_remove_fb(data->fd, &data->fb);
 	igt_display_fini(&data->display);
 	close(data->fd);
@@ -688,6 +736,9 @@ int main(int argc, char **argv)
 	pthread_t tid;
 	igt_plane_t *primary;
 
+	signal(SIGINT, sighandler);
+	signal(SIGTERM, sighandler);
+
 	data.selected_connector = -1;
 	test_init(&data);
 
@@ -698,7 +749,7 @@ int main(int argc, char **argv)
 
 	pthread_create(&tid, NULL, keypress_thread, &data);
 
-	while (data.running) {
+	while (data.running && !quit_requested) {
 		int cmd;
 
 		pthread_mutex_lock(&data.lock);
@@ -736,8 +787,16 @@ int main(int argc, char **argv)
 		usleep(200 * 1000);
 	}
 
-	pthread_cancel(tid);
+	/*
+	 * Tell the input thread to wind down and wait for it. Cancelling it
+	 * could leave data->lock held forever, wedging the join below.
+	 */
+	pthread_mutex_lock(&data.lock);
+	data.running = false;
+	pthread_mutex_unlock(&data.lock);
+
 	pthread_join(tid, NULL);
 	cleanup(&data);
+
 	return 0;
 }
-- 
2.43.0

