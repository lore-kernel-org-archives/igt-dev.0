Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44728E87822
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 12:54:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA5010E320;
	Tue,  3 Feb 2026 12:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EuaNmd+a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060DB10E320
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 12:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770123288; x=1801659288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4GGBw10+hp1j851XjX88AaGF/TUlxLRUBaImz98tQq8=;
 b=EuaNmd+ah5Vh0UjAr4pk+0SS5V7jspwV0ZKHJovVWWK0tTlMjUGcwIFi
 bo9iXze77lM/vG+ZX8y9mQpEyU3ayS9227oeBMDzPbw16wJfLgtEt4g9z
 8b23WiwX1J79YdwwKNwA6qvMPXLLi6CgQJqfSsLz5KBCuq+mKbFiKLi+K
 Raq1tWMqh+os+P87U3kz8HFxTrL4MSFHhbJfPcAIrvFf1skCa0YsKwW4q
 nt7Q0PPED4MjVQmoUtCxoVMeLCvRFSiJNrtkigEhK1k+dsvsBUXBgT+yk
 WHzZtkRIA7pezJTa4NxgD7D9ZjJf+y9h218tD45IfW8sKULEoIj+uSll4 Q==;
X-CSE-ConnectionGUID: c3gpVLtiS+KLOJ85+djqbA==
X-CSE-MsgGUID: 7nYMZNXCT8SU7Gdjl7qw0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="73889293"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="73889293"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 04:54:47 -0800
X-CSE-ConnectionGUID: LJI8C7CCRvKQa+iX29rNiA==
X-CSE-MsgGUID: zeYehghXSz6EOkAPaF8aqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209631345"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.46])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 04:54:47 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 2/3] tests/xe_eudebug: Improve cleanup on test fail
Date: Tue,  3 Feb 2026 13:54:21 +0100
Message-Id: <20260203125422.32880-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203125422.32880-1-dominik.karol.piatkowski@intel.com>
References: <20260203125422.32880-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When there is a debugger fd open and an assert fails, there is a problem
with environment cleanup. If enable_eudebug toggle was previously off,
it is impossible to turn it off in case there is _any_ open debugger fd.

Keep track of all opened debugger fds in igt_main and close any leftover
ones before attempting to restore enable_eudebug state.

Change pthread_join to pthread_timedjoin_np in discovery-race* tests to
avoid hang before reaching cleanup.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug.c | 297 ++++++++++++++++++++++-----------------
 1 file changed, 171 insertions(+), 126 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 134f31766..9f60e3d3c 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -797,7 +797,7 @@ static void test_close(int fd)
  *	Synchronously exercise eu debugger event polling and reading.
  */
 #define MAX_EVENT_SIZE (32 * 1024)
-static void test_read_event(int fd)
+static void test_read_event(int fd, struct xe_eudebug_session **s)
 {
 	struct drm_xe_eudebug_event *event;
 	struct xe_eudebug_debugger *d;
@@ -806,8 +806,9 @@ static void test_read_event(int fd)
 	event = calloc(1, MAX_EVENT_SIZE);
 	igt_assert(event);
 
-	c = xe_eudebug_client_create(fd, run_basic_client, 0, NULL);
-	d = xe_eudebug_debugger_create(fd, 0, NULL);
+	s[0] = xe_eudebug_session_create(fd, run_basic_client, 0, NULL);
+	c = s[0]->client;
+	d = s[0]->debugger;
 
 	igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
 	igt_assert_eq(poll_event(d->fd, 500), 0);
@@ -880,8 +881,8 @@ static void test_read_event(int fd)
 	igt_assert_eq(poll_event(d->fd, 500), 0);
 	igt_assert_eq(__read_event(d->fd, event), -EAGAIN);
 
-	xe_eudebug_debugger_destroy(d);
-	xe_eudebug_client_destroy(c);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 
 	free(event);
 }
@@ -945,15 +946,11 @@ static void test_read_event(int fd)
  *	Each process opens and closes xe drm client and creates few resources.
  */
 
-static void test_basic_sessions(int fd, unsigned int flags, int count, bool match_opposite)
+static void test_basic_sessions(int fd, struct xe_eudebug_session **s, unsigned int flags,
+				int count, bool match_opposite)
 {
-	struct xe_eudebug_session **s;
 	int i;
 
-	s = calloc(count, sizeof(*s));
-
-	igt_assert(s);
-
 	for (i = 0; i < count; i++)
 		s[i] = xe_eudebug_session_create(fd, run_basic_client, flags, NULL);
 
@@ -963,8 +960,10 @@ static void test_basic_sessions(int fd, unsigned int flags, int count, bool matc
 	for (i = 0; i < count; i++)
 		xe_eudebug_session_check(s[i], match_opposite, 0);
 
-	for (i = 0; i < count; i++)
+	for (i = 0; i < count; i++) {
 		xe_eudebug_session_destroy(s[i]);
+		s[i] = NULL;
+	}
 }
 
 /**
@@ -994,19 +993,19 @@ static void test_basic_sessions(int fd, unsigned int flags, int count, bool matc
  *	partial unbind, and unbind all operations before attaching. Ensure that
  *	we get a only a singe 'VM_BIND' event from the discovery worker.
  */
-static void test_basic_discovery(int fd, unsigned int flags, bool match_opposite)
+static void test_basic_discovery(int fd, struct xe_eudebug_session **s, unsigned int flags,
+				 bool match_opposite)
 {
 	struct xe_eudebug_debugger *d;
-	struct xe_eudebug_session *s;
 	struct xe_eudebug_client *c;
 
-	s = xe_eudebug_session_create(fd, run_basic_client, flags | TEST_DISCOVERY, NULL);
+	s[0] = xe_eudebug_session_create(fd, run_basic_client, flags | TEST_DISCOVERY, NULL);
 
-	c = s->client;
-	d = s->debugger;
+	c = s[0]->client;
+	d = s[0]->debugger;
 
 	xe_eudebug_client_start(c);
-	xe_eudebug_debugger_wait_stage(s, STAGE_PRE_DEBUG_RESOURCES_DONE);
+	xe_eudebug_debugger_wait_stage(s[0], STAGE_PRE_DEBUG_RESOURCES_DONE);
 
 	igt_assert_eq(xe_eudebug_debugger_attach(d, c), 0);
 	xe_eudebug_debugger_start_worker(d);
@@ -1022,8 +1021,9 @@ static void test_basic_discovery(int fd, unsigned int flags, bool match_opposite
 	xe_eudebug_event_log_print(d->log, true);
 	xe_eudebug_event_log_print(c->log, true);
 
-	xe_eudebug_session_check(s, match_opposite, 0);
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_check(s[0], match_opposite, 0);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 }
 
 #define RESOURCE_COUNT 16
@@ -1234,57 +1234,62 @@ static void *discovery_race_thread(void *data)
 	return NULL;
 }
 
-static void test_race_discovery(int fd, unsigned int flags, int clients)
+static void test_race_discovery(int fd, struct xe_eudebug_session **s, unsigned int flags,
+				int clients)
 {
 	const int debuggers_per_client = 3;
 	int count = clients * debuggers_per_client;
-	struct xe_eudebug_session *sessions, *s;
 	struct xe_eudebug_client *c;
 	pthread_t *threads;
 	int i, j;
+	struct timespec t = {};
 
-	sessions = calloc(count, sizeof(*sessions));
 	threads = calloc(count, sizeof(*threads));
 
 	for (i = 0; i < clients; i++) {
 		c = xe_eudebug_client_create(fd, run_discovery_client, flags, NULL);
 		for (j = 0; j < debuggers_per_client; j++) {
-			s = &sessions[i * debuggers_per_client + j];
-			s->client = c;
-			s->debugger = xe_eudebug_debugger_create(fd, flags, NULL);
-			s->flags = flags | (!j ? PRIMARY_THREAD : 0);
+			s[i * debuggers_per_client + j] = calloc(1, sizeof(**s));
+			igt_assert(s[i * debuggers_per_client + j]);
+			s[i * debuggers_per_client + j]->client = c;
+			s[i * debuggers_per_client + j]->debugger = xe_eudebug_debugger_create(fd, flags, NULL);
+			s[i * debuggers_per_client + j]->flags = flags | (!j ? PRIMARY_THREAD : 0);
 		}
 	}
 
 	for (i = 0; i < count; i++) {
-		if (sessions[i].flags & PRIMARY_THREAD)
-			xe_eudebug_client_start(sessions[i].client);
+		if (s[i]->flags & PRIMARY_THREAD)
+			xe_eudebug_client_start(s[i]->client);
 
-		pthread_create(&threads[i], NULL, discovery_race_thread, &sessions[i]);
+		pthread_create(&threads[i], NULL, discovery_race_thread, s[i]);
 	}
 
 	if (flags & DISCOVERY_SIGINT) {
 		sleep(2);
-		sessions[0].client->done = 1;
-		kill(sessions[0].client->pid, SIGINT);
+		s[0]->client->done = 1;
+		kill(s[0]->client->pid, SIGINT);
 	}
 
 	for (i = 0; i < count; i++) {
-		pthread_join(threads[i], NULL);
+		igt_assert_eq(clock_gettime(CLOCK_REALTIME, &t), 0);
+		t.tv_sec += XE_EUDEBUG_DEFAULT_TIMEOUT_SEC;
+		igt_assert_eq(pthread_timedjoin_np(threads[i], NULL, &t), 0);
 	}
 
 	for (i = count - 1; i > 0; i--) {
-		if (sessions[i].flags & PRIMARY_THREAD) {
-			igt_assert_eq(sessions[i].client->seqno - 1,
-				      sessions[i].debugger->event_count);
+		if (s[i]->flags & PRIMARY_THREAD) {
+			igt_assert_eq(s[i]->client->seqno - 1,
+				      s[i]->debugger->event_count);
 
-			xe_eudebug_event_log_compare(sessions[0].debugger->log,
-						     sessions[i].debugger->log,
+			xe_eudebug_event_log_compare(s[0]->debugger->log,
+						     s[i]->debugger->log,
 						     XE_EUDEBUG_FILTER_EVENT_VM_BIND);
 
-			xe_eudebug_client_destroy(sessions[i].client);
+			xe_eudebug_client_destroy(s[i]->client);
 		}
-		xe_eudebug_debugger_destroy(sessions[i].debugger);
+		xe_eudebug_debugger_destroy(s[i]->debugger);
+		free(s[i]);
+		s[i] = NULL;
 	}
 }
 
@@ -1317,15 +1322,14 @@ static void *attach_dettach_thread(void *data)
 	return NULL;
 }
 
-static void test_empty_discovery(int fd, unsigned int flags, int clients)
+static void test_empty_discovery(int fd, struct xe_eudebug_session **s, unsigned int flags,
+				 int clients)
 {
-	struct xe_eudebug_session **s;
 	pthread_t *threads;
 	int i, expected = flags & DISCOVERY_CLOSE_CLIENT ? 0 : RESOURCE_COUNT;
 
 	igt_assert(flags & (DISCOVERY_DESTROY_RESOURCES | DISCOVERY_CLOSE_CLIENT));
 
-	s = calloc(clients, sizeof(struct xe_eudebug_session *));
 	threads = calloc(clients, sizeof(*threads));
 
 	for (i = 0; i < clients; i++)
@@ -1351,6 +1355,7 @@ static void test_empty_discovery(int fd, unsigned int flags, int clients)
 		igt_assert_eq(s[i]->debugger->event_count, expected);
 
 		xe_eudebug_session_destroy(s[i]);
+		s[i] = NULL;
 	}
 }
 
@@ -1365,19 +1370,14 @@ static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
 
 typedef void (*client_run_t)(struct xe_eudebug_client *);
 
-static void test_client_with_trigger(int fd, unsigned int flags, int count,
-				     client_run_t client_fn, int type,
+static void test_client_with_trigger(int fd, struct xe_eudebug_session **s, unsigned int flags,
+				     int count, client_run_t client_fn, int type,
 				     xe_eudebug_trigger_fn trigger_fn,
 				     struct drm_xe_engine_class_instance *hwe,
 				     bool match_opposite, uint32_t event_filter)
 {
-	struct xe_eudebug_session **s;
 	int i;
 
-	s = calloc(count, sizeof(*s));
-
-	igt_assert(s);
-
 	for (i = 0; i < count; i++)
 		s[i] = xe_eudebug_session_create(fd, client_fn, flags, hwe);
 
@@ -1395,8 +1395,10 @@ static void test_client_with_trigger(int fd, unsigned int flags, int count,
 	for (i = 0; i < count; i++)
 		xe_eudebug_session_check(s[i], match_opposite, event_filter);
 
-	for (i = 0; i < count; i++)
+	for (i = 0; i < count; i++) {
 		xe_eudebug_session_destroy(s[i]);
+		s[i] = NULL;
+	}
 }
 
 struct thread_fn_args {
@@ -1459,9 +1461,10 @@ static void run_basic_client_th(struct xe_eudebug_client *c)
 	free(threads);
 }
 
-static void test_basic_sessions_th(int fd, unsigned int flags, int num_clients, bool match_opposite)
+static void test_basic_sessions_th(int fd, struct xe_eudebug_session **s, unsigned int flags,
+				   int num_clients, bool match_opposite)
 {
-	test_client_with_trigger(fd, flags, num_clients, run_basic_client_th, 0, NULL, NULL,
+	test_client_with_trigger(fd, s, flags, num_clients, run_basic_client_th, 0, NULL, NULL,
 				 match_opposite, 0);
 }
 
@@ -1611,14 +1614,15 @@ static void vm_trigger(struct xe_eudebug_debugger *d,
  * Description:
  *      Fault variation of test basic-vm-access-userptr.
  */
-static void test_vm_access(int fd, unsigned int flags, int num_clients)
+static void test_vm_access(int fd, struct xe_eudebug_session **s, unsigned int flags,
+			   int num_clients)
 {
 	struct drm_xe_engine_class_instance *hwe;
 
 	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
 
 	xe_eudebug_for_each_engine(fd, hwe)
-		test_client_with_trigger(fd, flags, num_clients,
+		test_client_with_trigger(fd, s, flags, num_clients,
 					 vm_access_client,
 					 DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
 					 vm_trigger, hwe,
@@ -1773,14 +1777,15 @@ static void vm_trigger_access_parameters(struct xe_eudebug_debugger *d,
  * Description:
  *      Fault variation of test basic-vm-access-parameters-userptr.
  */
-static void test_vm_access_parameters(int fd, unsigned int flags, int num_clients)
+static void test_vm_access_parameters(int fd, struct xe_eudebug_session **s, unsigned int flags,
+				      int num_clients)
 {
 	struct drm_xe_engine_class_instance *hwe;
 
 	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
 
 	xe_eudebug_for_each_engine(fd, hwe)
-		test_client_with_trigger(fd, flags, num_clients,
+		test_client_with_trigger(fd, s, flags, num_clients,
 					 vm_access_client,
 					 DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
 					 vm_trigger_access_parameters, hwe,
@@ -1902,9 +1907,10 @@ static void metadata_read_on_vm_bind_trigger(struct xe_eudebug_debugger *d,
  * Description:
  *      Exercise DRM_XE_EUDEBUG_IOCTL_READ_METADATA and debug metadata create|destroy events.
  */
-static void test_metadata_read(int fd, unsigned int flags, int num_clients)
+static void test_metadata_read(int fd, struct xe_eudebug_session **s, unsigned int flags,
+			       int num_clients)
 {
-	test_client_with_trigger(fd, flags, num_clients, metadata_access_client,
+	test_client_with_trigger(fd, s, flags, num_clients, metadata_access_client,
 				 DRM_XE_EUDEBUG_EVENT_METADATA, metadata_read_trigger,
 				 NULL, true, 0);
 }
@@ -1915,9 +1921,10 @@ static void test_metadata_read(int fd, unsigned int flags, int num_clients)
  * Description:
  *      Read debug metadata when vm_bind has it attached.
  */
-static void test_metadata_attach(int fd, unsigned int flags, int num_clients)
+static void test_metadata_attach(int fd, struct xe_eudebug_session **s, unsigned int flags,
+				 int num_clients)
 {
-	test_client_with_trigger(fd, flags, num_clients, metadata_access_client,
+	test_client_with_trigger(fd, s, flags, num_clients, metadata_access_client,
 				 DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA,
 				 metadata_read_on_vm_bind_trigger,
 				 NULL, true, 0);
@@ -2148,18 +2155,17 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
  * Description:
  *	Give user fence in application, hold it, send SIGINT to client and check if anything breaks.
  */
-static void test_basic_ufence(int fd, unsigned int flags)
+static void test_basic_ufence(int fd, struct xe_eudebug_session **s, unsigned int flags)
 {
 	struct xe_eudebug_debugger *d;
-	struct xe_eudebug_session *s;
 	struct xe_eudebug_client *c;
 	struct ufence_priv *priv;
 	uint32_t filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE;
 
 	priv = ufence_priv_create();
-	s = xe_eudebug_session_create(fd, basic_ufence_client, flags, priv);
-	c = s->client;
-	d = s->debugger;
+	s[0] = xe_eudebug_session_create(fd, basic_ufence_client, flags, priv);
+	c = s[0]->client;
+	d = s[0]->debugger;
 
 	xe_eudebug_debugger_add_trigger(d,
 					DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
@@ -2169,7 +2175,7 @@ static void test_basic_ufence(int fd, unsigned int flags)
 	xe_eudebug_debugger_start_worker(d);
 	xe_eudebug_client_start(c);
 
-	xe_eudebug_debugger_wait_stage(s, STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
+	xe_eudebug_debugger_wait_stage(s[0], STAGE_CLIENT_WAIT_ON_UFENCE_DONE);
 	xe_eudebug_assert_f(d, wait_for_ufence_events(priv, XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC) == 0,
 			    "missing ufence events\n");
 
@@ -2197,9 +2203,10 @@ static void test_basic_ufence(int fd, unsigned int flags)
 	xe_eudebug_event_log_print(d->log, true);
 	xe_eudebug_event_log_print(c->log, true);
 
-	xe_eudebug_session_check(s, true, filter);
+	xe_eudebug_session_check(s[0], true, filter);
 
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	ufence_priv_destroy(priv);
 }
 
@@ -2467,32 +2474,32 @@ static void vm_bind_clear_ack_trigger(struct xe_eudebug_debugger *d,
  * Description:
  *      Fault variation of test vm-bind-clear.
  */
-static void test_vm_bind_clear(int fd, uint32_t flags)
+static void test_vm_bind_clear(int fd, struct xe_eudebug_session **s, uint32_t flags)
 {
 	struct vm_bind_clear_priv *priv;
-	struct xe_eudebug_session *s;
 
 	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
 
 	priv = vm_bind_clear_priv_create();
-	s = xe_eudebug_session_create(fd, vm_bind_clear_client, flags, priv);
+	s[0] = xe_eudebug_session_create(fd, vm_bind_clear_client, flags, priv);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
 					vm_bind_clear_test_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					vm_bind_clear_ack_trigger);
 
-	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
-	xe_eudebug_debugger_start_worker(s->debugger);
-	xe_eudebug_client_start(s->client);
+	igt_assert_eq(xe_eudebug_debugger_attach(s[0]->debugger, s[0]->client), 0);
+	xe_eudebug_debugger_start_worker(s[0]->debugger);
+	xe_eudebug_client_start(s[0]->client);
 
-	xe_eudebug_client_wait_done(s->client);
-	xe_eudebug_debugger_stop_worker(s->debugger);
+	xe_eudebug_client_wait_done(s[0]->client);
+	xe_eudebug_debugger_stop_worker(s[0]->debugger);
 
 	igt_assert_eq(priv->bind_count, priv->unbind_count);
 	igt_assert_eq(priv->sum * 2, priv->bind_count);
 
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	vm_bind_clear_priv_destroy(priv);
 }
 
@@ -2695,36 +2702,36 @@ static void vma_ufence_trigger(struct xe_eudebug_debugger *d,
  * Description:
  *      Fault variation of test vma-ufence.
  */
-static void test_vma_ufence(int fd, unsigned int flags)
+static void test_vma_ufence(int fd, struct xe_eudebug_session **s, unsigned int flags)
 {
-	struct xe_eudebug_session *s;
 	struct ufence_priv *priv;
 
 	igt_require(!(flags & TEST_FAULTABLE) || !xe_supports_faults(fd));
 
 	priv = ufence_priv_create();
-	s = xe_eudebug_session_create(fd, vma_ufence_client, flags, priv);
+	s[0] = xe_eudebug_session_create(fd, vma_ufence_client, flags, priv);
 
-	xe_eudebug_debugger_add_trigger(s->debugger,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger,
 					DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
 					vma_ufence_op_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger,
 					DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					vma_ufence_trigger);
 
-	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
-	xe_eudebug_debugger_start_worker(s->debugger);
-	xe_eudebug_client_start(s->client);
+	igt_assert_eq(xe_eudebug_debugger_attach(s[0]->debugger, s[0]->client), 0);
+	xe_eudebug_debugger_start_worker(s[0]->debugger);
+	xe_eudebug_client_start(s[0]->client);
 
-	xe_eudebug_client_wait_done(s->client);
-	xe_eudebug_debugger_stop_worker(s->debugger);
+	xe_eudebug_client_wait_done(s[0]->client);
+	xe_eudebug_debugger_stop_worker(s[0]->debugger);
 
-	xe_eudebug_event_log_print(s->debugger->log, true);
-	xe_eudebug_event_log_print(s->client->log, true);
+	xe_eudebug_event_log_print(s[0]->debugger->log, true);
+	xe_eudebug_event_log_print(s[0]->client->log, true);
 
-	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
+	xe_eudebug_session_check(s[0], true, XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
 
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	ufence_priv_destroy(priv);
 }
 
@@ -2799,11 +2806,16 @@ int igt_main()
 	bool was_enabled;
 	bool *multigpu_was_enabled;
 	int fd, gpu_count;
+	struct xe_eudebug_session **s;
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		was_enabled = xe_eudebug_enable(fd, true);
 
+		/* Should be enough for any scenario */
+		s = calloc(PAGE_SIZE / sizeof(*s), sizeof(*s));
+		igt_assert(s);
+
 		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 		update_debug_mask_if_ci(DRM_UT_KMS);
 	}
@@ -2821,13 +2833,13 @@ int igt_main()
 		test_close(fd);
 
 	igt_subtest("basic-read-event")
-		test_read_event(fd);
+		test_read_event(fd, s);
 
 	igt_subtest("basic-client")
-		test_basic_sessions(fd, 0, 1, true);
+		test_basic_sessions(fd, s, 0, 1, true);
 
 	igt_subtest("basic-client-th")
-		test_basic_sessions_th(fd, 0, 1, true);
+		test_basic_sessions_th(fd, s, 0, 1, true);
 
 
 	igt_subtest_group() {
@@ -2836,94 +2848,108 @@ int igt_main()
 
 		for (int i = 0; i < ARRAY_SIZE(flags); i++) {
 			igt_subtest_f("basic-vm-access%s", suffix[i])
-				test_vm_access(fd, flags[i], 1);
+				test_vm_access(fd, s, flags[i], 1);
 
 			igt_subtest_f("basic-vm-access-userptr%s", suffix[i])
-				test_vm_access(fd, VM_BIND_OP_MAP_USERPTR | flags[i], 1);
+				test_vm_access(fd, s, VM_BIND_OP_MAP_USERPTR | flags[i], 1);
 
 			igt_subtest_f("basic-vm-access-parameters%s", suffix[i])
-				test_vm_access_parameters(fd, flags[i], 1);
+				test_vm_access_parameters(fd, s, flags[i], 1);
 
 			igt_subtest_f("basic-vm-access-parameters-userptr%s", suffix[i])
-				test_vm_access_parameters(fd, VM_BIND_OP_MAP_USERPTR | flags[i], 1);
+				test_vm_access_parameters(fd, s, VM_BIND_OP_MAP_USERPTR | flags[i], 1);
 
 			igt_subtest_f("vma-ufence%s", suffix[i])
-				test_vma_ufence(fd, flags[i]);
+				test_vma_ufence(fd, s, flags[i]);
 
 			igt_subtest_f("vm-bind-clear%s", suffix[i])
-				test_vm_bind_clear(fd, flags[i]);
+				test_vm_bind_clear(fd, s, flags[i]);
 		}
 	}
 
 	igt_subtest("multiple-sessions")
-		test_basic_sessions(fd, CREATE_VMS | CREATE_EXEC_QUEUES, 4, true);
+		test_basic_sessions(fd, s, CREATE_VMS | CREATE_EXEC_QUEUES, 4, true);
 
 	igt_subtest("basic-vms")
-		test_basic_sessions(fd, CREATE_VMS, 1, true);
+		test_basic_sessions(fd, s, CREATE_VMS, 1, true);
 
 	igt_subtest("basic-exec-queues-enable")
 		test_basic_exec_queues_enable(fd);
 
 	igt_subtest("basic-exec-queues")
-		test_basic_sessions(fd, CREATE_EXEC_QUEUES, 1, true);
+		test_basic_sessions(fd, s, CREATE_EXEC_QUEUES, 1, true);
 
 	igt_subtest("basic-vm-bind")
-		test_basic_sessions(fd, VM_BIND, 1, true);
+		test_basic_sessions(fd, s, VM_BIND, 1, true);
 
 	igt_subtest("basic-vm-bind-ufence")
-		test_basic_ufence(fd, 0);
+		test_basic_ufence(fd, s, 0);
 
 	igt_subtest("basic-vm-bind-ufence-delay-ack")
-		test_basic_ufence(fd, VM_BIND_DELAY_UFENCE_ACK);
+		test_basic_ufence(fd, s, VM_BIND_DELAY_UFENCE_ACK);
 
 	igt_subtest("basic-vm-bind-ufence-reconnect")
-		test_basic_ufence(fd, VM_BIND_UFENCE_RECONNECT);
+		test_basic_ufence(fd, s, VM_BIND_UFENCE_RECONNECT);
 
 	igt_subtest("basic-vm-bind-ufence-sigint-client")
-		test_basic_ufence(fd, VM_BIND_UFENCE_SIGINT_CLIENT);
+		test_basic_ufence(fd, s, VM_BIND_UFENCE_SIGINT_CLIENT);
 
 	igt_subtest("basic-vm-bind-discovery")
-		test_basic_discovery(fd, VM_BIND, true);
+		test_basic_discovery(fd, s, VM_BIND, true);
 
 	igt_subtest("basic-vm-bind-metadata-discovery")
-		test_basic_discovery(fd, VM_BIND_METADATA, true);
+		test_basic_discovery(fd, s, VM_BIND_METADATA, true);
 
 	igt_subtest("basic-vm-bind-vm-destroy")
-		test_basic_sessions(fd, VM_BIND_VM_DESTROY, 1, false);
+		test_basic_sessions(fd, s, VM_BIND_VM_DESTROY, 1, false);
 
 	igt_subtest("basic-vm-bind-vm-destroy-discovery")
-		test_basic_discovery(fd, VM_BIND_VM_DESTROY, false);
+		test_basic_discovery(fd, s, VM_BIND_VM_DESTROY, false);
 
 	igt_subtest("basic-vm-bind-extended")
-		test_basic_sessions(fd, VM_BIND_EXTENDED, 1, true);
+		test_basic_sessions(fd, s, VM_BIND_EXTENDED, 1, true);
 
 	igt_subtest("basic-vm-bind-extended-discovery")
-		test_basic_discovery(fd, VM_BIND_EXTENDED, true);
+		test_basic_discovery(fd, s, VM_BIND_EXTENDED, true);
 
 	igt_subtest("read-metadata")
-		test_metadata_read(fd, 0, 1);
+		test_metadata_read(fd, s, 0, 1);
 
 	igt_subtest("attach-debug-metadata")
-		test_metadata_attach(fd, 0, 1);
+		test_metadata_attach(fd, s, 0, 1);
 
 	igt_subtest("discovery-race")
-		test_race_discovery(fd, 0, 4);
+		test_race_discovery(fd, s, 0, 4);
 
 	igt_subtest("discovery-race-vmbind")
-		test_race_discovery(fd, DISCOVERY_VM_BIND, 4);
+		test_race_discovery(fd, s, DISCOVERY_VM_BIND, 4);
 
 	igt_subtest("discovery-race-sigint")
-		test_race_discovery(fd, DISCOVERY_SIGINT, 1);
+		test_race_discovery(fd, s, DISCOVERY_SIGINT, 1);
 
 	igt_subtest("discovery-empty")
-		test_empty_discovery(fd, DISCOVERY_CLOSE_CLIENT, 16);
+		test_empty_discovery(fd, s, DISCOVERY_CLOSE_CLIENT, 16);
 
 	igt_subtest("discovery-empty-clients")
-		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
+		test_empty_discovery(fd, s, DISCOVERY_DESTROY_RESOURCES, 16);
 
 	igt_fixture() {
+		/*
+		 * If we reach here with any leftover sessions, something already went wrong.
+		 * Let's make sure we are able to do cleanup successfully - actions like destroying
+		 * the client can trip over asserts, which means that we don't reach
+		 * xe_eudebug_enable - keep the bare minimum required for the cleanup, that is,
+		 * close all debugger fds.
+		 */
+		for (int i = 0; i < (PAGE_SIZE / sizeof(*s)); i++)
+			if (READ_ONCE(s)[i])
+				if (s[i]->debugger->target_pid)
+					xe_eudebug_debugger_detach(s[i]->debugger);
+
 		xe_eudebug_enable(fd, was_enabled);
 		drm_close_driver(fd);
+
+		free(s);
 	}
 
 	igt_subtest_group() {
@@ -2937,6 +2963,11 @@ int igt_main()
 				multigpu_was_enabled[i] = xe_eudebug_enable(fd, true);
 				close(fd);
 			}
+
+			/* Should be enough for any scenario */
+			s = mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE,
+				 MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+			igt_assert(s != MAP_FAILED);
 		}
 
 		igt_subtest("multigpu-basic-client") {
@@ -2947,7 +2978,7 @@ int igt_main()
 					     child, errno);
 				igt_assert(is_xe_device(fd));
 
-				test_basic_sessions(fd, 0, 1, true);
+				test_basic_sessions(fd, s + child, 0, 1, true);
 				close(fd);
 			}
 			igt_waitchildren();
@@ -2961,13 +2992,27 @@ int igt_main()
 					     child, errno);
 				igt_assert(is_xe_device(fd));
 
-				test_basic_sessions(fd, 0, 4, true);
+				test_basic_sessions(fd, s + child * 4, 0, 4, true);
 				close(fd);
 			}
 			igt_waitchildren();
 		}
 
 		igt_fixture() {
+			/*
+			 * If we reach here with any leftover sessions, something already went
+			 * wrong. Let's make sure we are able to do cleanup successfully - actions
+			 * like destroying the client can trip over asserts, which means that we
+			 * don't reach xe_eudebug_enable - keep the bare minimum required for the
+			 * cleanup, that is, close all debugger fds.
+			 */
+			for (int i = 0; i < (PAGE_SIZE / sizeof(*s)); i++)
+				if (READ_ONCE(s)[i])
+					if (s[i]->debugger->target_pid)
+						xe_eudebug_debugger_detach(s[i]->debugger);
+
+			munmap(s, PAGE_SIZE);
+
 			for (int i = 0; i < gpu_count; i++) {
 				fd = drm_open_filtered_card(i);
 				xe_eudebug_enable(fd, multigpu_was_enabled[i]);
-- 
2.34.1

