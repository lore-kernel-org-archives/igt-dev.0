Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57045C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095A510E043;
	Wed, 16 Sep 2026 11:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGWLZWxM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A814A10E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789557109; x=1821093109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SnYZ1k0WWPsa1dFehDKKRrFBoGiyUdIxl7Y1mm1bZBE=;
 b=KGWLZWxMVOzq2iEV7Q/rRCXDRx9q+PgSxx4PQQ68EmJzTYioi6ZBUi8B
 +iouU6dGnpaDEDbWKGEFH3A1e4LZwpQn5pHgdCPuKo9PxA8Xjcd+3rin2
 O0lQ0hUUDvHLanlzMAH2kHWu0OiuoqYhZm0BegQ8jWj6fwa7qSEpsmrPN
 bY0gQi8WIyMNf0PlkIqq8pdlN02ib5mIWQ9+ELq3LnLznxinSOo6neuHb
 gYIhH8TTkuEZgC/TBOWz1+TNx5JbZM+7y4YCpTKQHv5Rv4QeXfw1tdAHB
 f4Lh8mdm4fRlv3qLFHqBaw8Q8NF0VDn0YS5Fxnm313qA1gaK4nMbIrB7b A==;
X-CSE-ConnectionGUID: GxLnIfywSg2XJ4AOHvOmXg==
X-CSE-MsgGUID: NgX5V/JlTMKyDDzn128JHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="440549"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="440549"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:11:49 -0700
X-CSE-ConnectionGUID: pJtr0NHnRnaHI+lbk2gIRQ==
X-CSE-MsgGUID: 9NXPhITZSnmyMHaYJ6suJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="296800915"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:11:46 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, swati2.sharma@intel.com,
 santhoshguddati@gmail.com, ankit.k.nautiyal@intel.com,
 karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 08/16] tools/intel_hdcp: Print a session summary on
 exit
Date: Wed, 16 Sep 2026 16:37:01 +0530
Message-ID: <20260916110718.596603-9-santhosh.reddy.guddati@intel.com>
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

Print a session summary and the full transition log on exit. Include
authentication and link-drop counts, total protected time, and the tool
version, so the output can be pasted into a bug report.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tools/intel_hdcp.c | 107 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 93 insertions(+), 14 deletions(-)

diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
index bc1daa07a0..e9c51cf373 100644
--- a/tools/intel_hdcp.c
+++ b/tools/intel_hdcp.c
@@ -66,6 +66,7 @@ typedef struct data {
 	/* Owned by the tracker thread; read by others only after it joins. */
 	struct cp_transition transitions[MAX_CP_TRANSITIONS];
 	unsigned int num_transitions;
+	uint64_t protected_ms;
 } data_t;
 
 static volatile sig_atomic_t quit_requested;
@@ -317,6 +318,13 @@ static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
 						 IGT_CONNECTOR_CONTENT_PROTECTION));
 }
 
+static void print_transition(const struct cp_transition *t)
+{
+	printf("[%7.3f] Content Protection: %-9s -> %-9s (after %" PRIu64 " ms)\n",
+	       t->ms / 1000.0, cp_state_name(t->from), cp_state_name(t->to),
+	       t->dwell_ms);
+}
+
 /*
  * Only the tracker thread touches the transition array, so no lock is needed
  * here; everyone else reads it after that thread has been joined.
@@ -324,26 +332,90 @@ static const char *get_hdcp_status(data_t *data, uint32_t connector_id)
 static void record_transition(data_t *data, uint64_t from, uint64_t to,
 			      uint64_t at_ms, uint64_t dwell_ms)
 {
-	uint64_t rel_ms = at_ms - data->start_ms;
-
-	if (data->num_transitions < ARRAY_SIZE(data->transitions)) {
-		struct cp_transition *t =
-			&data->transitions[data->num_transitions];
+	struct cp_transition t = {
+		.ms = at_ms - data->start_ms,
+		.dwell_ms = dwell_ms,
+		.from = from,
+		.to = to,
+	};
 
-		t->ms = rel_ms;
-		t->dwell_ms = dwell_ms;
-		t->from = from;
-		t->to = to;
-	}
+	if (data->num_transitions < ARRAY_SIZE(data->transitions))
+		data->transitions[data->num_transitions] = t;
 
 	data->num_transitions++;
 
-	printf("[%7.3f] Content Protection: %s -> %s (after %" PRIu64 " ms)\n",
-	       rel_ms / 1000.0, cp_state_name(from), cp_state_name(to),
-	       dwell_ms);
+	if (from == CP_ENABLED)
+		data->protected_ms += dwell_ms;
+
+	print_transition(&t);
 	fflush(stdout);
 }
 
+/*
+ * What the session looked like, in the form someone can paste into a bug
+ * report. Called once both worker threads have joined.
+ */
+static void print_session_summary(data_t *data)
+{
+	unsigned int i, recorded, auths = 0, drops = 0;
+	double duration_ms = now_ms() - data->start_ms;
+
+	printf("\n=== Session summary: %s ===\n", version_str);
+	printf("Duration:         %.1f s\n", duration_ms / 1000.0);
+
+	if (!data->num_transitions) {
+		printf("No Content Protection state changes were observed\n");
+		return;
+	}
+
+	recorded = data->num_transitions;
+	if (recorded > ARRAY_SIZE(data->transitions))
+		recorded = ARRAY_SIZE(data->transitions);
+
+	for (i = 0; i < recorded; i++) {
+		const struct cp_transition *t = &data->transitions[i];
+
+		/*
+		 * The kernel is the only writer of ENABLED, so any arrival at
+		 * it is an authentication. It cannot be narrowed to DESIRED ->
+		 * ENABLED: the kernel sends no uevent when userspace writes
+		 * DESIRED - userspace already knows, there is nothing to
+		 * notify - so the tracker does not wake until the kernel has
+		 * moved the property on, and what it records is usually
+		 * UNDESIRED -> ENABLED.
+		 *
+		 * Falling back from ENABLED to DESIRED is the kernel giving up
+		 * on a link it had already brought up, i.e. a drop.
+		 */
+		if (t->to == CP_ENABLED && t->from != CP_ENABLED) {
+			auths++;
+		} else if (t->from == CP_ENABLED && t->to == CP_DESIRED) {
+			drops++;
+		}
+	}
+
+	printf("Transitions:      %u\n", data->num_transitions);
+
+	if (auths)
+		printf("Authentications:  %u\n", auths);
+	else
+		printf("Authentications:  0 (the link never reached ENABLED)\n");
+
+	printf("Link drops:       %u\n", drops);
+	printf("Time protected:   %.1f s (%.1f%%)\n",
+	       data->protected_ms / 1000.0,
+	       duration_ms > 0 ? data->protected_ms * 100.0 / duration_ms : 0.0);
+
+	printf("\nTransition log:\n");
+	for (i = 0; i < recorded; i++)
+		print_transition(&data->transitions[i]);
+
+	if (data->num_transitions > recorded)
+		printf("... %u more not recorded (log holds %zu)\n",
+		       data->num_transitions - recorded,
+		       ARRAY_SIZE(data->transitions));
+}
+
 /*
  * Watch the kernel's connector uevents and report every Content Protection
  * state change along with how long the previous state lasted.
@@ -435,6 +507,10 @@ static void *cp_tracker_thread(void *arg)
 		igt_connector_event_detected(mon, conn_id, prop_id, 1);
 	}
 
+	/* Close out the final state so "time protected" covers the whole run. */
+	if (last_state == CP_ENABLED)
+		data->protected_ms += now_ms() - last_ms;
+
 	igt_cleanup_uevents(mon);
 
 	return NULL;
@@ -930,6 +1006,7 @@ static void test_init(data_t *data)
 	data->video_running = false;
 	data->start_ms = now_ms();
 	data->num_transitions = 0;
+	data->protected_ms = 0;
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
@@ -1037,8 +1114,10 @@ int main(int argc, char **argv)
 	pthread_join(tid, NULL);
 
 	/* Joins within a second: the tracker's uevent wait times out. */
-	if (data.tracking)
+	if (data.tracking) {
 		pthread_join(data.track_tid, NULL);
+		print_session_summary(&data);
+	}
 
 	cleanup(&data);
 
-- 
2.43.0

