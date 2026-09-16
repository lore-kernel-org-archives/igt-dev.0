Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F794C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA71810E3B2;
	Wed, 16 Sep 2026 11:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDVuCV+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0F310E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557107; x=1821093107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F712BZrmkLW4iwr5HTaAPa7kpCt92uC9q7Ffr4K3XRo=;
 b=dDVuCV+sFEgG/mWSdWj1y9YN+FUX0X+0GkN2RX4T0Jr8+l3NM3jGQCmH
 azP/vjv8TkzsS8KDEQWY4DrF3iZytiBy3NCPWcQuWWHgx7x7t4nJcnY84
 YVO1z6SdZWDQsPU5GmznoUq4Y8dBDgZnJWbNtAU0wJ3CUVruIbkqW003y
 TAB2KEQ7tlCjVb3IUv/pxFpxrorFdEnmUpO7P6sl0XFbCVcYalHfSdVqW
 U1UeomVIxspeeS+6K8bAMK74Yth+tDNWE7VaBRzlwLVVPkIOsAoSTnG6d
 m5aD7deLVteA2L7BHuua0OjSA+7a0pPSIiOyyjNCg69PzTt8LCJKwaKhW w==;
X-CSE-ConnectionGUID: WApRdP+CS8u1he1ktVO2pw==
X-CSE-MsgGUID: Ha3/qfz1SRySXlBuIeLNTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440543"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440543"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:11:47 -0700
X-CSE-ConnectionGUID: i2rAGFh4QeWqI2FCFmafeA==
X-CSE-MsgGUID: EedYnBpcQXm4X851fqwXNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296800862"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:43 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 07/16] tools/intel_hdcp: Report content protection
 changes as they happen
Date: Wed, 16 Sep 2026 16:37:00 +0530
Message-ID: <20260916110718.596603-8-santhosh.reddy.guddati@intel.com>
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

Track Content Protection changes for the selected connector and report
each transition with the time spent in the previous state. Use connector
uevents to wake the tracker, fall back to polling when needed, and record
the transitions for the session summary.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 193 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 182 insertions(+), 11 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index d561a50947..bc1daa07a0 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -6,15 +6,20 @@
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <inttypes.h>
 #include <poll.h>
 #include <signal.h>
 #include <stdio.h>
+#include <time.h>
 
 #include "igt.h"
 #include "version.h"
 
 #define MAX_HDCP_BUF_LEN	5000
 
+/* Enough to cover a bring-up session; the counter keeps going past it. */
+#define MAX_CP_TRANSITIONS	64
+
 /*
  * Bumped by hand when the operator-visible behaviour changes, so a log or a
  * photo of the screen can be tied back to a known build of the tool.
@@ -33,6 +38,13 @@ enum hdcp_type {
 	HDCP_TYPE_2_2_TYPE_1
 };
 
+/* One observed change of the Content Protection property. */
+struct cp_transition {
+	uint64_t ms;		/* when, relative to tool start */
+	uint64_t dwell_ms;	/* how long the previous state lasted */
+	uint64_t from, to;
+};
+
 typedef struct data {
 	int fd;
 	igt_display_t display;
@@ -48,6 +60,12 @@ typedef struct data {
 	int selected_connector;
 	volatile bool video_running;
 	time_t video_start_time;
+	pthread_t track_tid;
+	bool tracking;
+	uint64_t start_ms;
+	/* Owned by the tracker thread; read by others only after it joins. */
+	struct cp_transition transitions[MAX_CP_TRANSITIONS];
+	unsigned int num_transitions;
 } data_t;
 
 static volatile sig_atomic_t quit_requested;
@@ -93,6 +111,33 @@ static bool read_line(data_t *data, char *buf, size_t len)
 	return false;
 }
 
+static uint64_t now_ms(void)
+{
+	struct timespec ts;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+
+	return (uint64_t)ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
+}
+
+/*
+ * Spell the states the way the uAPI does, so what the operator sees on screen
+ * and in the log is what they would put in a bug report.
+ */
+static const char *cp_state_name(uint64_t state)
+{
+	switch (state) {
+	case CP_UNDESIRED:
+		return "UNDESIRED";
+	case CP_DESIRED:
+		return "DESIRED";
+	case CP_ENABLED:
+		return "ENABLED";
+	default:
+		return "UNKNOWN";
+	}
+}
+
 static igt_output_t *get_hdcp_output(data_t *data, uint32_t connector_id, bool *is_valid)
 {
 	drmModeConnector *connector = drmModeGetConnectorCurrent(data->fd, connector_id);
@@ -260,7 +305,6 @@ static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
 {
 	igt_output_t *output;
 	bool is_valid;
-	uint64_t prop_value;
 
 	output = get_hdcp_output(data, connector_id, &is_valid);
 	if (!output || !is_valid)
@@ -269,17 +313,131 @@ static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
 	if (!igt_output_has_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION))
 		return "N/A";
 
-	prop_value = igt_output_get_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION);
-	switch (prop_value) {
-	case CP_UNDESIRED:
-		return "Disabled";
-	case CP_DESIRED:
-		return "Desired";
-	case CP_ENABLED:
-		return "Enabled";
-	default:
-		return "Unknown";
+	return cp_state_name(igt_output_get_prop(output,
+						 IGT_CONNECTOR_CONTENT_PROTECTION));
+}
+
+/*
+ * Only the tracker thread touches the transition array, so no lock is needed
+ * here; everyone else reads it after that thread has been joined.
+ */
+static void record_transition(data_t *data, uint64_t from, uint64_t to,
+			      uint64_t at_ms, uint64_t dwell_ms)
+{
+	uint64_t rel_ms = at_ms - data->start_ms;
+
+	if (data->num_transitions < ARRAY_SIZE(data->transitions)) {
+		struct cp_transition *t =
+			&data->transitions[data->num_transitions];
+
+		t->ms = rel_ms;
+		t->dwell_ms = dwell_ms;
+		t->from = from;
+		t->to = to;
 	}
+
+	data->num_transitions++;
+
+	printf("[%7.3f] Content Protection: %s -> %s (after %" PRIu64 " ms)\n",
+	       rel_ms / 1000.0, cp_state_name(from), cp_state_name(to),
+	       dwell_ms);
+	fflush(stdout);
+}
+
+/*
+ * Watch the kernel's connector uevents and report every Content Protection
+ * state change along with how long the previous state lasted.
+ *
+ * The overlay already polls the property ten times a second, which is enough
+ * to show the current state but not to time authentication, and it silently
+ * misses a link drop that the kernel re-authenticates inside one poll
+ * interval. The uevent is the same signal a real player acts on, so the
+ * timings it produces are the ones that matter.
+ *
+ * The property is still what is read for the value: the uevent only says
+ * something changed.
+ */
+static void *cp_tracker_thread(void *arg)
+{
+	data_t *data = arg;
+	struct udev_monitor *mon;
+	uint64_t last_state = CP_UNDESIRED, last_ms = now_ms();
+	int watched = -1;
+	sigset_t set;
+
+	/*
+	 * Keep SIGINT/SIGTERM off this thread. It spends most of its time
+	 * inside igt_connector_event_detected(), which polls udev; a signal
+	 * delivered here would surface as an interrupted poll deep in the
+	 * library rather than in code this tool controls.
+	 */
+	sigemptyset(&set);
+	sigaddset(&set, SIGINT);
+	sigaddset(&set, SIGTERM);
+	pthread_sigmask(SIG_BLOCK, &set, NULL);
+
+	mon = igt_watch_uevents();
+	igt_flush_uevents(mon);
+
+	while (data->running && !quit_requested) {
+		igt_output_t *output;
+		bool is_valid = false;
+		uint64_t state = CP_UNDESIRED, now;
+		uint32_t prop_id = 0;
+		int conn_id;
+
+		/*
+		 * Resolving a connector walks the display state, so it has to
+		 * be done under the lock. The blocking wait below is not.
+		 */
+		pthread_mutex_lock(&data->lock);
+
+		conn_id = data->selected_connector;
+		output = conn_id == -1 ? NULL :
+			 get_hdcp_output(data, conn_id, &is_valid);
+
+		if (output && is_valid &&
+		    igt_output_has_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION)) {
+			prop_id = output->props[IGT_CONNECTOR_CONTENT_PROTECTION];
+			state = igt_output_get_prop(output,
+						    IGT_CONNECTOR_CONTENT_PROTECTION);
+		}
+
+		pthread_mutex_unlock(&data->lock);
+
+		/* Nothing selected yet, or it cannot be protected. */
+		if (!prop_id) {
+			usleep(100 * 1000);
+			continue;
+		}
+
+		now = now_ms();
+
+		if (conn_id != watched) {
+			/* Newly selected connector: take its state as given. */
+			watched = conn_id;
+			last_state = state;
+			last_ms = now;
+		} else if (state != last_state) {
+			record_transition(data, last_state, state, now,
+					  now - last_ms);
+			last_state = state;
+			last_ms = now;
+		}
+
+		/*
+		 * Sleep until the kernel says the property moved. The timeout
+		 * is in seconds, despite being named timeout_msecs in
+		 * igt_kms.h; one second keeps shutdown responsive. A timeout
+		 * is not an error - the loop re-reads the property either way,
+		 * so a missed uevent costs latency, not correctness.
+		 */
+		igt_connector_event_detected(mon, conn_id, prop_id, 1);
+	}
+
+	igt_cleanup_uevents(mon);
+
+	return NULL;
 }
 
 static const char *get_hdcp_version(int fd, char *connector_name)
@@ -770,6 +928,8 @@ static void test_init(data_t *data)
 	data->hdcp_type = 0;
 	data->running = true;
 	data->video_running = false;
+	data->start_ms = now_ms();
+	data->num_transitions = 0;
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
@@ -822,6 +982,12 @@ int main(int argc, char **argv)
 
 	pthread_create(&tid, NULL, keypress_thread, &data);
 
+	data.tracking = pthread_create(&data.track_tid, NULL,
+				       cp_tracker_thread, &data) == 0;
+	if (!data.tracking)
+		fprintf(stderr,
+			"Failed to start the state tracker; transitions will not be reported\n");
+
 	while (data.running && !quit_requested) {
 		int cmd;
 
@@ -869,6 +1035,11 @@ int main(int argc, char **argv)
 	pthread_mutex_unlock(&data.lock);
 
 	pthread_join(tid, NULL);
+
+	/* Joins within a second: the tracker's uevent wait times out. */
+	if (data.tracking)
+		pthread_join(data.track_tid, NULL);
+
 	cleanup(&data);
 
 	return 0;
-- 
2.43.0

