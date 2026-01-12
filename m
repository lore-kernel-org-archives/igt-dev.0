Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7FAC9EC82
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F3710E3CC;
	Mon, 12 Jan 2026 13:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axlBsAZL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573A010E3C9
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222871; x=1799758871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eA3CrTujzoqPHOZqcH9Wdjx4639OO2gv6arQuiMV3y4=;
 b=axlBsAZLMojpWfnphq0DkM80fqS1MJZ4nbRxCpms+5AMnE4FoItIfdLL
 PLgMmbKrPGjtmo150+utceWoI5a4ZYUlf8OgFsGDKmjbwohIypRcB59Oj
 Gevw8b0N9Nk2J+z62apSJNQPn0Fp8jdAvofQcg75Q7TXASJTSUkXiwtmX
 c6e6w+iS41OdLtFQc9F+SKOKznczI4RtNJP6qzQ6ZmjZ/85e7fAAQnqzk
 +BbddubZa9wn209DJe/nePcACid9U2BV4glKcUS8mzY7xG7UvVCP8SbVk
 S4t1cb7u+WkhFaUxg7GlbB1GTSC9A2gjn6ENZNJURKHSaVA+89Crimzg3 w==;
X-CSE-ConnectionGUID: yOatMAMBRsWaLb22AkQUUA==
X-CSE-MsgGUID: R5jWVZg9QH+up313xuL6Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545612"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545612"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:01:10 -0800
X-CSE-ConnectionGUID: avwjITjkSPG2cOxdq6uXsw==
X-CSE-MsgGUID: avhDGjoZTw2g5hQNd0D6cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204095098"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:01:08 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 19/21] lib/xe/xe_eudebug: Add callback for session work
Date: Mon, 12 Jan 2026 15:00:05 +0200
Message-ID: <20260112130008.1649357-20-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
References: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
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

If there was a need for special handling during session,
multiple tests baked in the session setup and teardown
into their own boilerplates.

Instead of this, introduce a callback to handle session
work so that tests can avoid the same boilerplate just
in order to have control during the session.

make test_basic_ufence to showcase the new functionality.

TODO: convert other tests

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c             | 20 ++++++---
 lib/xe/xe_eudebug.h             | 15 +++++--
 tests/intel/xe_eudebug.c        | 75 +++++++++++++++++----------------
 tests/intel/xe_eudebug_online.c | 35 ++++++++-------
 4 files changed, 84 insertions(+), 61 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index f441a3c824..7c1ac38d9c 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1744,7 +1744,8 @@ void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c, uint64_t stage)
 /**
  * xe_eudebug_session_create:
  * @fd: Xe file descriptor
- * @work: function passed to the xe_eudebug_client_create
+ * @client_work: function passed to the xe_eudebug_client_create
+ * @session_work: function to add extra session handling (if any)
  * @flags: flags passed to client and debugger
  * @test_private: test's  data, allocated with MAP_SHARED | MAP_ANONYMOUS,
  * passed to client and debugger. Can be NULL.
@@ -1752,7 +1753,8 @@ void xe_eudebug_client_wait_stage(struct xe_eudebug_client *c, uint64_t stage)
  * Creates session together with client and debugger structures.
  */
 struct xe_eudebug_session *xe_eudebug_session_create(int fd,
-						     xe_eudebug_client_work_fn work,
+						     xe_eudebug_client_work_fn client_work,
+						     xe_eudebug_session_work_fn session_work,
 						     unsigned int flags,
 						     void *test_private)
 {
@@ -1761,9 +1763,11 @@ struct xe_eudebug_session *xe_eudebug_session_create(int fd,
 	s = calloc(1, sizeof(*s));
 	igt_assert(s);
 
-	s->client = xe_eudebug_client_create(fd, work, flags, test_private);
+	s->client = xe_eudebug_client_create(fd, client_work, flags, test_private);
 	s->debugger = xe_eudebug_debugger_create(fd, flags, test_private);
+	s->priv = test_private;
 	s->flags = flags;
+	s->session_work = session_work;
 
 	return s;
 }
@@ -1773,8 +1777,10 @@ struct xe_eudebug_session *xe_eudebug_session_create(int fd,
  * @s: pointer to xe_eudebug_session structure
  *
  * Attaches debugger to client's proccess, starts debugger's
- * async event reader, starts client and once client finish
- * it stops debugger worker.
+ * async event reader, starts client. If session work was provided,
+ * it will do extra session work with that callback.
+ * Then session will wait client to finish and stop debugger
+ * and the proceeding with teardown.
  */
 void xe_eudebug_session_run(struct xe_eudebug_session *s)
 {
@@ -1786,6 +1792,10 @@ void xe_eudebug_session_run(struct xe_eudebug_session *s)
 	xe_eudebug_debugger_start_worker(debugger);
 
 	xe_eudebug_client_start(client);
+
+	if (s->session_work)
+		s->session_work(s);
+
 	xe_eudebug_client_wait_done(client);
 
 	xe_eudebug_debugger_stop_worker(debugger);
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index acf5bf601d..95d0d023b8 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -79,16 +79,22 @@ struct xe_eudebug_client {
 	pthread_mutex_t lock;
 };
 
+struct xe_eudebug_session;
+
+typedef void (*xe_eudebug_client_work_fn)(struct xe_eudebug_client *);
+typedef void (*xe_eudebug_trigger_fn)(struct xe_eudebug_debugger *,
+				      struct drm_xe_eudebug_event *);
+typedef void (*xe_eudebug_session_work_fn)(struct xe_eudebug_session *);
+
 struct xe_eudebug_session {
 	uint64_t flags;
+	xe_eudebug_session_work_fn session_work;
+	void *priv;
+
 	struct xe_eudebug_client *client;
 	struct xe_eudebug_debugger *debugger;
 };
 
-typedef void (*xe_eudebug_client_work_fn)(struct xe_eudebug_client *);
-typedef void (*xe_eudebug_trigger_fn)(struct xe_eudebug_debugger *,
-				      struct drm_xe_eudebug_event *);
-
 #define xe_eudebug_for_each_engine(fd__, hwe__) \
 	xe_for_each_engine(fd__, hwe__) \
 		if (hwe__->engine_class == DRM_XE_ENGINE_CLASS_RENDER || \
@@ -261,6 +267,7 @@ void xe_eudebug_client_vm_bind_unmap_with_debug_data(struct xe_eudebug_client *c
 
 struct xe_eudebug_session *xe_eudebug_session_create(int fd,
 						     xe_eudebug_client_work_fn work,
+						     xe_eudebug_session_work_fn session_work,
 						     unsigned int flags,
 						     void *test_private);
 void xe_eudebug_session_destroy(struct xe_eudebug_session *s);
diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 9e40f61fcf..4e7ba0348d 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -890,7 +890,7 @@ static void test_basic_sessions(int fd, unsigned int flags, int count, bool matc
 	igt_assert(s);
 
 	for (i = 0; i < count; i++)
-		s[i] = xe_eudebug_session_create(fd, run_basic_client, flags, NULL);
+		s[i] = xe_eudebug_session_create(fd, run_basic_client, NULL, flags, NULL);
 
 	for (i = 0; i < count; i++)
 		xe_eudebug_session_run(s[i]);
@@ -922,7 +922,8 @@ static void test_basic_discovery(int fd, unsigned int flags, bool match_opposite
 	struct xe_eudebug_session *s;
 	struct xe_eudebug_client *c;
 
-	s = xe_eudebug_session_create(fd, run_basic_client, flags | TEST_DISCOVERY, NULL);
+	s = xe_eudebug_session_create(fd, run_basic_client, NULL,
+				      flags | TEST_DISCOVERY, NULL);
 
 	c = s->client;
 	d = s->debugger;
@@ -1212,7 +1213,8 @@ static void test_empty_discovery(int fd, unsigned int flags, int clients)
 	threads = calloc(clients, sizeof(*threads));
 
 	for (i = 0; i < clients; i++)
-		s[i] = xe_eudebug_session_create(fd, run_discovery_client, flags, NULL);
+		s[i] = xe_eudebug_session_create(fd, run_discovery_client,
+						 NULL, flags, NULL);
 
 	for (i = 0; i < clients; i++) {
 		xe_eudebug_client_start(s[i]->client);
@@ -1262,7 +1264,7 @@ static void test_client_with_trigger(int fd, unsigned int flags, int count,
 	igt_assert(s);
 
 	for (i = 0; i < count; i++)
-		s[i] = xe_eudebug_session_create(fd, client_fn, flags, hwe);
+		s[i] = xe_eudebug_session_create(fd, client_fn, NULL, flags, hwe);
 
 	if (trigger_fn)
 		for (i = 0; i < count; i++)
@@ -1864,6 +1866,31 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
 	return ret;
 }
 
+static void ufence_session_work(struct xe_eudebug_session *s)
+{
+	struct ufence_priv *priv = s->priv;
+	struct xe_eudebug_debugger *d = s->debugger;
+	struct xe_eudebug_client *c = s->client;
+
+	xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
+	xe_eudebug_assert_f(d,
+			    wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC) == 0,
+			    "missing ufence events\n");
+
+	if (s->flags & VM_BIND_DELAY_UFENCE_ACK)
+		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
+
+	if (s->flags & VM_BIND_UFENCE_SIGINT_CLIENT) {
+		kill(c->pid, SIGINT);
+		c->pid = 0;
+		c->done = 1;
+	} else if (s->flags & VM_BIND_UFENCE_DISCONNECT) {
+		close(d->fd);
+	} else {
+		ack_fences(d);
+	}
+}
+
 /**
  * SUBTEST: basic-vm-bind-ufence
  * Functionality: VM bind event
@@ -1890,47 +1917,23 @@ static void test_basic_ufence(int fd, unsigned int flags)
 {
 	struct xe_eudebug_debugger *d;
 	struct xe_eudebug_session *s;
-	struct xe_eudebug_client *c;
 	struct ufence_priv *priv;
 	uint32_t filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE;
 
 	priv = ufence_priv_create();
-	s = xe_eudebug_session_create(fd, basic_ufence_client, flags, priv);
-	c = s->client;
+	s = xe_eudebug_session_create(fd, basic_ufence_client,
+				      ufence_session_work, flags, priv);
 	d = s->debugger;
 
 	xe_eudebug_debugger_add_trigger(d,
 					DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					basic_ufence_trigger);
 
-	igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
-	xe_eudebug_debugger_start_worker(d);
-	xe_eudebug_client_start(c);
-
-	xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
-	xe_eudebug_assert_f(d, wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC) == 0,
-			    "missing ufence events\n");
-
-	if (flags & VM_BIND_DELAY_UFENCE_ACK)
-		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
+	xe_eudebug_session_run(s);
 
-	if (flags & VM_BIND_UFENCE_SIGINT_CLIENT) {
-		filter = XE_EUDEBUG_FILTER_ALL;
-		kill(c->pid, SIGINT);
-		c->pid = 0;
-		c->done = 1;
-	} else if (flags & VM_BIND_UFENCE_DISCONNECT) {
+	if (s->flags & VM_BIND_UFENCE_SIGINT_CLIENT ||
+	    s->flags & VM_BIND_UFENCE_DISCONNECT)
 		filter = XE_EUDEBUG_FILTER_ALL;
-		close(s->debugger->fd);
-	} else {
-		ack_fences(d);
-	}
-
-	xe_eudebug_client_wait_done(c);
-	xe_eudebug_debugger_stop_worker(d);
-
-	xe_eudebug_event_log_print(d->log, true);
-	xe_eudebug_event_log_print(c->log, true);
 
 	xe_eudebug_session_check(s, true, filter);
 
@@ -2211,7 +2214,7 @@ static void test_vm_bind_clear(int fd, uint32_t flags)
 	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
 
 	priv = vm_bind_clear_priv_create();
-	s = xe_eudebug_session_create(fd, vm_bind_clear_client, flags, priv);
+	s = xe_eudebug_session_create(fd, vm_bind_clear_client, NULL, flags, priv);
 
 	xe_eudebug_debugger_add_trigger(s->debugger,
 					DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
@@ -2443,7 +2446,7 @@ static void test_vma_ufence(int fd, unsigned int flags)
 	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
 
 	priv = ufence_priv_create();
-	s = xe_eudebug_session_create(fd, vma_ufence_client, flags, priv);
+	s = xe_eudebug_session_create(fd, vma_ufence_client, NULL, flags, priv);
 
 	xe_eudebug_debugger_add_trigger(s->debugger,
 					DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
@@ -2685,7 +2688,7 @@ static void test_debug_data(int fd)
 
 	priv = ufence_priv_create();
 
-	s = xe_eudebug_session_create(fd, debug_data_ufence_client, 0, priv);
+	s = xe_eudebug_session_create(fd, debug_data_ufence_client, NULL, 0, priv);
 
 	xe_eudebug_debugger_add_trigger(s->debugger,
 					DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_DEBUG_DATA,
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 473c362470..b1690a7397 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1487,8 +1487,9 @@ static void test_basic_online(int fd, struct drm_xe_engine_class_instance *hwe,
 	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 
+
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
@@ -1524,7 +1525,8 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
 	igt_require(!(flags & FAULTABLE_VM) || !xe_supports_faults(fd));
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data);
+
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
@@ -1585,7 +1587,8 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 		igt_debug("Loop %d: SIGINT after %" PRIu64 " us\n", loop_count, sleep_time);
 
 		data = online_debug_data_create(fd, hwe, flags);
-		s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+		s = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data);
+
 		s->client->allow_dead_client = true;
 
 		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
@@ -1709,7 +1712,7 @@ static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *h
 
 		data->max_subslices_per_slice = DIV_ROUND_UP(max_ss, max_sl);
 	}
-	s = xe_eudebug_session_create(fd, run_online_client, data->flags, data);
+	s = xe_eudebug_session_create(fd, run_online_client, NULL, data->flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
@@ -1747,7 +1750,8 @@ static void test_preemption(int fd, struct drm_xe_engine_class_instance *hwe)
 	struct xe_eudebug_client *other;
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data);
+
 	other = xe_eudebug_client_create(fd, run_online_client, SHADER_NOP, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
@@ -1792,7 +1796,7 @@ static void test_reset_with_attention_online(int fd, struct drm_xe_engine_class_
 	struct online_debug_data *data;
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s1 = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s1 = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s1->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_reset_trigger);
@@ -1802,7 +1806,7 @@ static void test_reset_with_attention_online(int fd, struct drm_xe_engine_class_
 	xe_eudebug_session_run(s1);
 	xe_eudebug_session_destroy(s1);
 
-	s2 = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s2 = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data);
 	xe_eudebug_debugger_add_trigger(s2->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
 	xe_eudebug_debugger_add_trigger(s2->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
@@ -1846,7 +1850,7 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	igt_require(!(flags & FAULTABLE_VM) || !xe_supports_faults(fd));
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
@@ -1934,7 +1938,7 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	int val;
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
@@ -2021,7 +2025,7 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 	igt_assert(attention_bitmask);
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
@@ -2164,7 +2168,7 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
 	uint32_t val;
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
@@ -2238,7 +2242,7 @@ static void test_single_step(int fd, struct drm_xe_engine_class_instance *hwe, i
 	struct online_debug_data *data;
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
@@ -2286,8 +2290,7 @@ static void test_debugger_reopen(int fd, struct drm_xe_engine_class_instance *hw
 	struct online_debug_data *data;
 
 	data = online_debug_data_create(fd, hwe, flags);
-
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
@@ -2337,7 +2340,7 @@ static void test_caching(int fd, struct drm_xe_engine_class_instance *hwe, int f
 		igt_skip_on_f(!xe_has_vram(fd), "Device does not have VRAM.\n");
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
@@ -2463,7 +2466,7 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
 
 	for (i = 0; i < n; i++) {
 		data[i] = online_debug_data_create(fd, hwe[i], flags);
-		s[i] = xe_eudebug_session_create(fd, run_online_client, flags, data[i]);
+		s[i] = xe_eudebug_session_create(fd, run_online_client, NULL, flags, data[i]);
 
 		xe_eudebug_debugger_add_trigger(s[i]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 						eu_attention_debug_trigger);
-- 
2.43.0

