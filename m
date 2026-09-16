Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A8CC88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4173510E330;
	Wed, 16 Sep 2026 11:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGGYurVI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5435610E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557121; x=1821093121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gbiwtvp/o7/UZRuf2L60ky6+aokqulkoJuex+NiayK4=;
 b=AGGYurVIaytJlZIy0Hg7JZFJwOW+3Ypswifx3CnYf1iYHQBtxNXDbS9u
 6o1YhR65npYBoCfsWMb6vtkUoPYuBf3iDY7tx22e01Kbe6ew9O13BhF2m
 fKdq0aVKiiXI1QUn0ZlmoAKTXrpShOQEu2cGVNgDkcHnqouXUiUFtUvPt
 UBHwgWI75eWRNsGJ5ZVW271XyoLyA7ud91n5r6NcaPJukMVNBS4NDyWJF
 gRXm56qOJkJNkEYQ7BJPU+vH5ltJ6Z5S2RChGqgcSebfqEVD8GLwVSpPZ
 fK5/HB3c44bVuTV5vIZEOnYeIWjhh+GmID4XgvsSvEvDyYw1FX6y4GRky A==;
X-CSE-ConnectionGUID: 9Haen0SnRRO01IATAFpFmA==
X-CSE-MsgGUID: 4cAGnf9aRcGbfdp5fUMX2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440572"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440572"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:12:01 -0700
X-CSE-ConnectionGUID: yxUZ0ymtQLyHX8ENb1Il4Q==
X-CSE-MsgGUID: sM6nRWwdReiV087cla+hPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296801046"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:58 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 13/16] tools/intel_hdcp: Report authentication time
Date: Wed, 16 Sep 2026 16:37:06 +0530
Message-ID: <20260916110718.596603-14-santhosh.reddy.guddati@intel.com>
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

A transition line reports how long the property sat in the previous
state, which is not the number of interest: how long the kernel took to
authenticate once this tool asked for protection.

Stamp the request in enable_hdcp_type() before the commit - the commit
blocks, and on a link that comes up quickly the kernel can have written
ENABLED by the time it returns - and report the delta on the ENABLED
transition, in the console line, the on-screen log and the session
summary, which gains min/avg/max.

The timestamp is consumed once it has been used, so a later
kernel-initiated re-authentication is reported as untimed instead of
being measured from a request that has already been answered.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 80 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 69 insertions(+), 11 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index a77facf2f6..1fdbd459e4 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -52,6 +52,8 @@ enum text_align {
 struct cp_transition {
 	uint64_t ms;		/* when, relative to tool start */
 	uint64_t dwell_ms;	/* how long the previous state lasted */
+	/* Time from this tool's request to ENABLED, or 0 if not known. */
+	uint64_t since_request_ms;
 	uint64_t from, to;
 };
 
@@ -73,6 +75,7 @@ typedef struct data {
 	pthread_t track_tid;
 	bool tracking;
 	uint64_t start_ms;
+	uint64_t request_ms;
 	const char *sink_caps;
 	/* Owned by the tracker thread; read by others only after it joins. */
 	struct cp_transition transitions[MAX_CP_TRANSITIONS];
@@ -304,9 +307,15 @@ static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
 
 static void print_transition(const struct cp_transition *t)
 {
-	printf("[%7.3f] Content Protection: %-9s -> %-9s (after %" PRIu64 " ms)\n",
+	char auth[40] = "";
+
+	if (t->since_request_ms)
+		snprintf(auth, sizeof(auth), "  [auth %" PRIu64 " ms]",
+			 t->since_request_ms);
+
+	printf("[%7.3f] Content Protection: %-9s -> %-9s (after %" PRIu64 " ms)%s\n",
 	       t->ms / 1000.0, cp_state_name(t->from), cp_state_name(t->to),
-	       t->dwell_ms);
+	       t->dwell_ms, auth);
 }
 
 /*
@@ -314,11 +323,13 @@ static void print_transition(const struct cp_transition *t)
  * here; everyone else reads it after that thread has been joined.
  */
 static void record_transition(data_t *data, uint64_t from, uint64_t to,
-			      uint64_t at_ms, uint64_t dwell_ms)
+			      uint64_t at_ms, uint64_t dwell_ms,
+			      uint64_t since_request_ms)
 {
 	struct cp_transition t = {
 		.ms = at_ms - data->start_ms,
 		.dwell_ms = dwell_ms,
+		.since_request_ms = since_request_ms,
 		.from = from,
 		.to = to,
 	};
@@ -347,7 +358,8 @@ static void record_transition(data_t *data, uint64_t from, uint64_t to,
  */
 static void print_session_summary(data_t *data)
 {
-	unsigned int i, recorded, auths = 0, drops = 0;
+	unsigned int i, recorded, auths = 0, drops = 0, timed = 0;
+	uint64_t min_auth = 0, max_auth = 0, total_auth = 0;
 	double duration_ms = now_ms() - data->start_ms;
 
 	printf("\n=== Session summary: %s ===\n", version_str);
@@ -379,6 +391,16 @@ static void print_session_summary(data_t *data)
 		 */
 		if (t->to == CP_ENABLED && t->from != CP_ENABLED) {
 			auths++;
+
+			/* Only the ones this tool asked for are timed. */
+			if (t->since_request_ms) {
+				if (!timed || t->since_request_ms < min_auth)
+					min_auth = t->since_request_ms;
+				if (t->since_request_ms > max_auth)
+					max_auth = t->since_request_ms;
+				total_auth += t->since_request_ms;
+				timed++;
+			}
 		} else if (t->from == CP_ENABLED && t->to == CP_DESIRED) {
 			drops++;
 		}
@@ -386,10 +408,15 @@ static void print_session_summary(data_t *data)
 
 	printf("Transitions:      %u\n", data->num_transitions);
 
-	if (auths)
-		printf("Authentications:  %u\n", auths);
-	else
+	if (!auths)
 		printf("Authentications:  0 (the link never reached ENABLED)\n");
+	else if (timed)
+		printf("Authentications:  %u (request -> ENABLED: min %" PRIu64
+		       " ms, avg %" PRIu64 " ms, max %" PRIu64 " ms)\n",
+		       auths, min_auth, total_auth / timed, max_auth);
+	else
+		printf("Authentications:  %u (untimed: not requested from here)\n",
+		       auths);
 
 	printf("Link drops:       %u\n", drops);
 	printf("Time protected:   %.1f s (%.1f%%)\n",
@@ -444,7 +471,7 @@ static void *cp_tracker_thread(void *arg)
 	while (data->running && !quit_requested) {
 		igt_output_t *output;
 		bool is_valid = false;
-		uint64_t state = CP_UNDESIRED, now;
+		uint64_t state = CP_UNDESIRED, now, req;
 		uint32_t prop_id = 0;
 		int conn_id;
 
@@ -455,6 +482,7 @@ static void *cp_tracker_thread(void *arg)
 		pthread_mutex_lock(&data->lock);
 
 		conn_id = data->selected_connector;
+		req = data->request_ms;
 		output = conn_id == -1 ? NULL :
 			 get_hdcp_output(data, conn_id, &is_valid);
 
@@ -481,8 +509,27 @@ static void *cp_tracker_thread(void *arg)
 			last_state = state;
 			last_ms = now;
 		} else if (state != last_state) {
+			uint64_t since = 0;
+
+			/*
+			 * How long the authentication took is a question about
+			 * the request, not about whatever state the property
+			 * happened to be sitting in beforehand. Consume the
+			 * timestamp once it has been used, so a later
+			 * kernel-initiated re-authentication is reported as
+			 * untimed instead of being measured from a request that
+			 * has already been answered.
+			 */
+			if (state == CP_ENABLED && req && now > req) {
+				since = now - req;
+
+				pthread_mutex_lock(&data->lock);
+				data->request_ms = 0;
+				pthread_mutex_unlock(&data->lock);
+			}
+
 			record_transition(data, last_state, state, now,
-					  now - last_ms);
+					  now - last_ms, since);
 			last_state = state;
 			last_ms = now;
 		}
@@ -974,11 +1021,16 @@ static void draw_transition_log(cairo_t *cr, data_t *data, double y)
 	for (i = 0; i < n; i++) {
 		const struct cp_transition *t =
 			&data->recent[(first + i) % ARRAY_SIZE(data->recent)];
+		char auth[32] = "";
+
+		if (t->since_request_ms)
+			snprintf(auth, sizeof(auth), "   auth %" PRIu64 " ms",
+				 t->since_request_ms);
 
 		snprintf(line[i], sizeof(line[i]),
-			 "%8.3fs  %-9s -> %-9s  after %5" PRIu64 " ms",
+			 "%8.3fs  %-9s -> %-9s  after %5" PRIu64 " ms%s",
 			 t->ms / 1000.0, cp_state_name(t->from),
-			 cp_state_name(t->to), t->dwell_ms);
+			 cp_state_name(t->to), t->dwell_ms, auth);
 
 		cairo_text_extents(cr, line[i], &ext);
 		if (ext.width > widest)
@@ -1169,6 +1221,12 @@ static void stop_video_player(data_t *data)
 static void enable_hdcp_type(data_t *data, enum hdcp_type type)
 {
 	pthread_mutex_lock(&data->lock);
+	/*
+	 * Stamp the request before the commit, not after: the commit blocks,
+	 * and on a link that comes up quickly the kernel can have written
+	 * ENABLED by the time it returns.
+	 */
+	data->request_ms = now_ms();
 	set_hdcp_prop(data, CP_DESIRED, type, data->selected_connector);
 	data->hdcp_type = type;
 	data->video_start_time = time(NULL);
-- 
2.43.0

