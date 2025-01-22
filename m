Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6633C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 14:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E25810E254;
	Wed, 22 Jan 2025 14:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RWLo9y2u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BC210E254
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 14:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737557079; x=1769093079;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fHyMykSXTJ8AxcL+FObfabIqXTyzHJjkw8VaJALSXGA=;
 b=RWLo9y2usyr8+XQJw25iOD3i5oWn3HvZ9sqVhMBnn9s+YE5HXS1pUlgm
 8me4GufM6Q4wGgmP3hEj6W3eYPhetBmGaVsuy8mfzb7B9gw68k/Paf5m7
 35iDe+uJQmFi2OKx5dY/4jKw5oa71akrl7lz+X5f/7PJvW8UW1lAGTJuS
 mmIJyHBdBBW6mHSQO47+fZTPrv9yHrsq9dIRjCw1l23wipjCYdc0l+fK8
 PrXoCGolDp764I5CkdmpgzxqRkoz5bEcs2zEmZxlXIhj5E56Q8Ok7LHG+
 wtLL9Si3RsckLh1kQDM68aY1kr5SjA6zKJ9ulWXq4itjD/Fhi4ST62iji g==;
X-CSE-ConnectionGUID: aqkO67OCTnm68WxcROsnaQ==
X-CSE-MsgGUID: eXiP3mbrQ0ysMAAtoc3CKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48612185"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="48612185"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:44:39 -0800
X-CSE-ConnectionGUID: Rq2hZQ33RQWP8hpyfzYN2w==
X-CSE-MsgGUID: kr5eJeDxQzSlB2+Ai8OSOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="112175407"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO dgrzegor-mobl2..)
 ([10.245.244.100])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:44:35 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jordan.l.justen@intel.com, christoph.manszewski@intel.com,
 kamil.konieczny@linux.intel.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 1/3] lib/xe_eudebug: Fix 32b compilation warnings/errors
Date: Wed, 22 Jan 2025 15:44:17 +0100
Message-Id: <20250122144419.327706-1-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fix instances casting using proper from_user_pointer macro and
correct all debug prints which were causing compilation warnings
on 32b archs.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 24062e399..19bec2d25 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -324,14 +324,14 @@ static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
 
 	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
 	igt_assert_f(ret > 0,
-		     "Pipe read timeout waiting for token '%s:(%ld)'\n",
+		     "Pipe read timeout waiting for token '%s:(%" PRId64 ")'\n",
 		     token_to_str(token), token);
 
 	igt_assert_eq(in, token);
 
 	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
 	igt_assert_f(ret > 0,
-		     "Pipe read timeout waiting for token value '%s:(%ld)'\n",
+		     "Pipe read timeout waiting for token value '%s:(%" PRId64 ")'\n",
 		     token_to_str(token), token);
 
 	return in;
@@ -828,7 +828,8 @@ xe_eudebug_event_log_find_seqno(struct xe_eudebug_event_log *l, uint64_t seqno)
 	xe_eudebug_for_each_event(e, l) {
 		if (e->seqno == seqno) {
 			if (found) {
-				igt_warn("Found multiple events with the same seqno %lu\n", seqno);
+				igt_warn("Found multiple events with the same seqno %" PRIu64 "\n",
+					 seqno);
 				xe_eudebug_event_log_print(l, false);
 				igt_assert(!found);
 			}
@@ -1238,7 +1239,7 @@ int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d,
 	d->p_client[0] = c->p_in[0];
 	d->p_client[1] = c->p_in[1];
 
-	igt_debug("debugger connected to %lu\n", d->target_pid);
+	igt_debug("debugger connected to %" PRIu64 "\n", d->target_pid);
 
 	return 0;
 }
@@ -1391,11 +1392,11 @@ void xe_eudebug_debugger_wait_stage(struct xe_eudebug_session *s, uint64_t stage
 {
 	u64 stage_in;
 
-	igt_debug("debugger xe client fd: %d pausing for stage %lu\n", s->debugger->master_fd,
+	igt_debug("debugger xe client fd: %d pausing for stage %" PRIu64 "\n", s->debugger->master_fd,
 		  stage);
 
 	stage_in = wait_from_client(s->client, DEBUGGER_STAGE);
-	igt_debug("debugger xe client fd: %d stage %lu, expected %lu, stage\n",
+	igt_debug("debugger xe client fd: %d stage %" PRIu64 ", expected %" PRIu64 ", stage\n",
 		  s->debugger->master_fd, stage_in, stage);
 
 	igt_assert_eq(stage_in, stage);
@@ -1584,14 +1585,15 @@ void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c, uint64_t stage)
 	u64 stage_in;
 
 	if (c->done) {
-		igt_warn("client: %d already done before %lu\n", c->pid, stage);
+		igt_warn("client: %d already done before %" PRIu64 "\n", c->pid, stage);
 		return;
 	}
 
-	igt_debug("client: %d pausing for stage %lu\n", c->pid, stage);
+	igt_debug("client: %d pausing for stage %" PRIu64 "\n", c->pid, stage);
 
 	stage_in = client_wait_token(c, CLIENT_STAGE);
-	igt_debug("client: %d stage %lu, expected %lu, stage\n", c->pid, stage_in, stage);
+	igt_debug("client: %d stage %" PRIu64 ", expected %" PRIu64 ", stage\n", c->pid,
+		  stage_in, stage);
 
 	igt_assert_eq(stage_in, stage);
 }
@@ -1949,7 +1951,7 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
 	igt_assert(c);
 	igt_assert(create);
 
-	instances = (struct drm_xe_engine_class_instance *)(create->instances);
+	instances = from_user_pointer(create->instances);
 	class = instances[0].engine_class;
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, create), 0);
@@ -1988,6 +1990,7 @@ uint32_t xe_eudebug_client_exec_queue_create(struct xe_eudebug_client *c, int fd
 void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
 					  struct drm_xe_exec_queue_create *create)
 {
+	struct drm_xe_engine_class_instance *instances;
 	struct drm_xe_exec_queue_destroy destroy = {};
 	struct drm_xe_ext_set_property *ext;
 	bool send = false;
@@ -1997,7 +2000,8 @@ void xe_eudebug_client_exec_queue_destroy(struct xe_eudebug_client *c, int fd,
 	igt_assert(create);
 
 	destroy.exec_queue_id = create->exec_queue_id;
-	class = ((struct drm_xe_engine_class_instance *)(create->instances))[0].engine_class;
+	instances = from_user_pointer(create->instances);
+	class = instances[0].engine_class;
 
 	for (ext = from_user_pointer(create->extensions); ext;
 	     ext = from_user_pointer(ext->base.next_extension))
-- 
2.34.1

