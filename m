Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EED210ED663
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 12:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C55610EDEA;
	Fri, 27 Mar 2026 12:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ehPZKRa3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF6310EDEA
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 12:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774613715; x=1806149715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q943DVF0xpZ9aF50NtimQxXEGSUBSFZbRmXTVE/z1ys=;
 b=ehPZKRa3PJ31cxJ2E7bC/MnLDyrYoWf2xFNiY69d9xZsmRO2Vy6n2GBM
 D8HfhewaCG8mT7Dr7uBU2gi33C25zp4p015JK8VX8QgdZzBxieICiekOh
 a5v3AgGnrFB/UvaXNExuduLWwqEAOm/MMzjCT8ZBnFgbscAKyBDOW1e2z
 dKnpkQwRHr9YAKZbAEolcckMjTZM0r84jXES0syn4GiFjEojclOqmIJlO
 jo1DXE843Y5v0suqp+zfhA2FDHV+7u2gopGFnPSdjMHtIh2WeUw/g6/mz
 otifbXTkd+L58cAse2ty8SY/1057l8XGHCcMwBOxBiy8R8pbGTnSZzIpp A==;
X-CSE-ConnectionGUID: CZwZ2ZXSRgixE52oRUp7/w==
X-CSE-MsgGUID: nko6HB3jTRG8A+Y8RQJdIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75752679"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75752679"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 05:15:15 -0700
X-CSE-ConnectionGUID: mjOLUFHCQEWCqiyOYE7I+A==
X-CSE-MsgGUID: OHz9sUqKQXyh+TNcN1lJVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="255794149"
Received: from intel.igk.intel.com ([10.211.135.221])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 05:15:14 -0700
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>
Subject: [PATCH i-g-t 1/2] lib/xe/eudebug: add dead-peer context logging for
 token waits
Date: Fri, 27 Mar 2026 13:10:41 +0100
Message-ID: <20260327121042.1133617-2-piotr.rudnicki@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327121042.1133617-1-piotr.rudnicki@intel.com>
References: <20260327121042.1133617-1-piotr.rudnicki@intel.com>
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

When token synchronization fails due to a dead peer (crashed client),
log the token, pipe name, and last events from client and debugger logs to
aid diagnosis of synchronization failures.

Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
---
 lib/xe/xe_eudebug.c | 92 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 6 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 3bffda561..b80d9bebd 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -375,6 +375,76 @@ static void pipe_close(int pipe[2])
 
 #define DEAD_CLIENT 0xccccdead
 
+static struct drm_xe_eudebug_event *__event_log_last_event(struct xe_eudebug_event_log *log)
+{
+	struct drm_xe_eudebug_event *event = NULL, *last = NULL;
+
+	if (!log || !log->head)
+		return NULL;
+
+	xe_eudebug_for_each_event(event, log)
+		last = event;
+
+	return last;
+}
+
+static const char *event_log_last_event_to_str(struct xe_eudebug_event_log *log,
+					       char *buf, size_t len)
+{
+	struct drm_xe_eudebug_event *last;
+
+	if (!log || !buf || !len)
+		return NULL;
+
+	pthread_mutex_lock(&log->lock);
+	last = __event_log_last_event(log);
+	if (last)
+		xe_eudebug_event_to_str(last, buf, len);
+	pthread_mutex_unlock(&log->lock);
+
+	if (!last)
+		return NULL;
+
+	return buf;
+}
+
+static void log_dead_client_context(struct xe_eudebug_client *c,
+				    struct xe_eudebug_event_log *debugger_log,
+				    bool waiter_is_client,
+				    const char *pipe_name,
+				    uint64_t token)
+{
+	char event_str[XE_EUDEBUG_EVENT_STRING_MAX_LEN];
+	char dbg_event_str[XE_EUDEBUG_EVENT_STRING_MAX_LEN];
+	const char *client_ctx;
+	const char *client_ctx_prefix;
+	const char *last_client_event;
+	const char *token_str;
+	const char *last_dbg_event;
+
+	token_str = token_to_str(token);
+	last_dbg_event = waiter_is_client ? NULL :
+		event_log_last_event_to_str(debugger_log, dbg_event_str, sizeof(dbg_event_str));
+
+	last_client_event = event_log_last_event_to_str(c->log, event_str, sizeof(event_str));
+	if (last_client_event) {
+		client_ctx_prefix = "last client event: ";
+		client_ctx = last_client_event;
+	} else {
+		client_ctx_prefix = "";
+		client_ctx = !c->done ?
+			(waiter_is_client ?
+			 "log has no events yet" :
+			 "log may be incomplete") :
+			"no client events";
+	}
+
+	igt_info("dead peer while waiting on token '%s' via %s; %s%s%s%s\n",
+		 token_str, pipe_name, client_ctx_prefix, client_ctx,
+		 last_dbg_event ? "; last dbg event:\n\t" : "",
+		 last_dbg_event ? last_dbg_event : "");
+}
+
 static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
 {
 	uint64_t in;
@@ -412,21 +482,31 @@ static uint64_t client_wait_token(struct xe_eudebug_client *c, const uint64_t to
 	igt_debug("client: %d waiting for token '%s'\n", getpid(), token_to_str(token));
 
 	ret = __wait_token(c->p_in, token, c->timeout_ms);
-	if (ret == DEAD_CLIENT)
+	if (ret == DEAD_CLIENT) {
+		if (!c->allow_dead_client)
+			log_dead_client_context(c, NULL, true, "c->p_in", token);
+
 		igt_assert(c->allow_dead_client);
+	}
 
 	return ret;
 }
 
-static uint64_t wait_from_client(struct xe_eudebug_client *c, const uint64_t token)
+static uint64_t wait_from_client(struct xe_eudebug_client *c,
+				 struct xe_eudebug_event_log *debugger_log,
+				 const uint64_t token)
 {
 	uint64_t ret = 0;
 
 	igt_debug("debugger: %d waiting for token '%s'\n", getpid(), token_to_str(token));
 
 	ret = __wait_token(c->p_out, token, c->timeout_ms);
-	if (ret == DEAD_CLIENT)
+	if (ret == DEAD_CLIENT) {
+		if (!c->allow_dead_client)
+			log_dead_client_context(c, debugger_log, false, "c->p_out", token);
+
 		igt_assert(c->allow_dead_client);
+	}
 
 	return ret;
 }
@@ -1518,7 +1598,7 @@ void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage
 	igt_debug("debugger xe client fd: %d pausing for stage %" PRIu64 "\n", s->debugger->master_fd,
 		  stage);
 
-	stage_in = wait_from_client(s->client, DEBUGGER_STAGE);
+	stage_in = wait_from_client(s->client, s->debugger->log, DEBUGGER_STAGE);
 	igt_debug("debugger xe client fd: %d stage %" PRIu64 ", expected %" PRIu64 ", stage\n",
 		  s->debugger->master_fd, stage_in, stage);
 
@@ -1608,7 +1688,7 @@ struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
 	close(c->p_in[0]);
 	c->p_in[0] = -1;
 
-	c->pid = wait_from_client(c, CLIENT_PID);
+	c->pid = wait_from_client(c, NULL, CLIENT_PID);
 
 	igt_info("client running with pid %d\n", c->pid);
 
@@ -1694,7 +1774,7 @@ void xe_eudebug_client_start(struct xe_eudebug_client *c)
 void xe_eudebug_client_wait_done(struct xe_eudebug_client *c)
 {
 	if (!c->done) {
-		c->seqno = wait_from_client(c, CLIENT_FINI);
+		c->seqno = wait_from_client(c, NULL, CLIENT_FINI);
 		event_log_read_from_fd(c->log, c->p_out[0]);
 		c->done = 1;
 	}
-- 
2.43.0

