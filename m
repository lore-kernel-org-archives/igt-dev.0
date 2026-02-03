Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592A2E87824
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 12:54:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DE210E644;
	Tue,  3 Feb 2026 12:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJQqcNlD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BF910E648
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 12:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770123290; x=1801659290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Drq/Qwd+RAOm0OLWckQQ7oPXyIRw9KupKf1/uXER7O8=;
 b=hJQqcNlDreOn2J4sb2EPBi8/HY3CLcjol2YZo6HtjDlc6qYNzdzteubf
 UQOSrderXi9tXaaFFrxn0h0Jz91osWnm83qq8gi6zRrihvHpvKU7Tkxwj
 GNO3c08k11LoTD7Hbv6YqIBjeKXbuengyblviMdq6qZx7BN/XMI23v54a
 NeN6+Out+xal/Fs6KwEK3rkeKzlFFj/M8Hjf3SBDESvAjBlzuPSUGcLi/
 SMie6TWhv4C0PapXyGoYGyLNgQDi5KI5nNshNF7XOr+liYd2nomJMeVgT
 hjlZk9uEp8/Jg/69a9ZhBMU7drpxjtmCoIABE4ui8HJ/DUR49HV/5tt7w Q==;
X-CSE-ConnectionGUID: uYSuWeGxTaO/eApw9BW29Q==
X-CSE-MsgGUID: wqIZcawXTEavNYtSUK6bEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="73889295"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="73889295"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 04:54:49 -0800
X-CSE-ConnectionGUID: itnAFWKXRISqPnn3lTNj+Q==
X-CSE-MsgGUID: jknvvxSTTvOIyG1RkyPRRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209631349"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.46])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 04:54:49 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 3/3] tests/xe_eudebug_online: Improve cleanup on test
 fail
Date: Tue,  3 Feb 2026 13:54:22 +0100
Message-Id: <20260203125422.32880-4-dominik.karol.piatkowski@intel.com>
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

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 529 +++++++++++++++++---------------
 1 file changed, 278 insertions(+), 251 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 39ecca479..4ea44e5fd 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1572,25 +1572,26 @@ static void pagefault_trigger(struct xe_eudebug_debugger *d,
  * @one:	one thread
  * @dss:	threads running on one subslice
  */
-static void test_basic_online(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+static void test_basic_online(int fd, struct xe_eudebug_session **s,
+			      struct drm_xe_engine_class_instance *hwe, int flags)
 {
-	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s[0] = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
-	xe_eudebug_session_run(s);
-	online_session_check(s, s->flags);
+	xe_eudebug_session_run(s[0]);
+	online_session_check(s[0], s[0]->flags);
 
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	online_debug_data_destroy(data);
 }
 
@@ -1606,31 +1607,32 @@ static void test_basic_online(int fd, struct drm_xe_engine_class_instance *hwe,
  *	Faultable variation of test set-breakpoint.
  */
 
-static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+static void test_set_breakpoint_online(int fd, struct xe_eudebug_session **s,
+				       struct drm_xe_engine_class_instance *hwe, int flags)
 {
-	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 
 	igt_require(!(flags & FAULTABLE_VM) || !xe_supports_faults(fd));
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
+	s[0] = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
 					open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
 					create_metadata_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_set_bp_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
 
-	xe_eudebug_session_run(s);
-	online_session_check(s, s->flags);
+	xe_eudebug_session_run(s[0]);
+	online_session_check(s[0], s[0]->flags);
 
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	online_debug_data_destroy(data);
 }
 
@@ -1641,11 +1643,10 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
  *	A variant of set-breakpoint that sends SIGINT to the debugger thread with random timing
  *	and checks if nothing breaks, exercising the scenario multiple times.
  */
-static void test_set_breakpoint_online_sigint_debugger(int fd,
+static void test_set_breakpoint_online_sigint_debugger(int fd, struct xe_eudebug_session **s,
 						       struct drm_xe_engine_class_instance *hwe,
 						       int flags)
 {
-	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 	struct timespec ts = { };
 	int loop_count = 0;
@@ -1661,7 +1662,7 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 	 */
 	igt_nsec_elapsed(&ts);
 	for (int i = 0; i < 10; i++)
-		test_set_breakpoint_online(fd, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
+		test_set_breakpoint_online(fd, s, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
 	set_breakpoint_time = igt_nsec_elapsed(&ts) / (NSEC_PER_MSEC / USEC_PER_MSEC) / 10;
 	igt_info("Average set-breakpoint execution time: %" PRIu64 " us\n", set_breakpoint_time);
 	max_sleep_time = set_breakpoint_time * 11 / 10;
@@ -1677,33 +1678,33 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 		igt_debug("Loop %d: SIGINT after %" PRIu64 " us\n", loop_count, sleep_time);
 
 		data = online_debug_data_create(fd, hwe, flags);
-		s = xe_eudebug_session_create(fd, run_online_client, flags, data);
-		s->client->allow_dead_client = true;
-		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
+		s[0] = xe_eudebug_session_create(fd, run_online_client, flags, data);
+		s[0]->client->allow_dead_client = true;
+		xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
 						open_trigger);
-		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+		xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 						exec_queue_trigger);
-		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM,
+		xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM,
 						vm_open_trigger);
-		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
+		xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
 						create_metadata_trigger);
-		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+		xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 						ufence_ack_set_bp_trigger);
-		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+		xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 						eu_attention_resume_trigger);
 
-		igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
-		xe_eudebug_debugger_start_worker(s->debugger);
-		igt_assert_eq(READ_ONCE(s->debugger->event_count), 0);
-		xe_eudebug_client_start(s->client);
+		igt_assert_eq(xe_eudebug_debugger_attach(s[0]->debugger, s[0]->client), 0);
+		xe_eudebug_debugger_start_worker(s[0]->debugger);
+		igt_assert_eq(READ_ONCE(s[0]->debugger->event_count), 0);
+		xe_eudebug_client_start(s[0]->client);
 
 		/* Sample max events without SIGINT */
 		if (!loop_count++)
-			xe_eudebug_client_wait_done(s->client);
+			xe_eudebug_client_wait_done(s[0]->client);
 		else
 			usleep(sleep_time);
 
-		event_count = READ_ONCE(s->debugger->event_count);
+		event_count = READ_ONCE(s[0]->debugger->event_count);
 		if (event_count > events_max)
 			events_max = event_count;
 		else if (event_count > 0 && event_count < events_max)
@@ -1714,24 +1715,26 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 		 * to raise the odds of hitting the ioctl
 		 */
 		for (int i = 0; i < SIGTERM_COUNT; i++) {
-			xe_eudebug_debugger_kill(s->debugger, SIGTERM);
+			xe_eudebug_debugger_kill(s[0]->debugger, SIGTERM);
 			usleep(rand() % 1000);
 		}
-		xe_eudebug_debugger_kill(s->debugger, SIGINT);
+		xe_eudebug_debugger_kill(s[0]->debugger, SIGINT);
 		/* Don't close debugger fd before it dies */
-		while (!s->debugger->handled_sigint)
+		while (!s[0]->debugger->handled_sigint)
 			usleep(1000);
-		close(s->debugger->fd);
+		close(s[0]->debugger->fd);
+		s[0]->debugger->target_pid = 0;
 
-		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
-		WRITE_ONCE(s->debugger->worker_state, DEBUGGER_WORKER_INACTIVE);
+		igt_assert_eq(READ_ONCE(s[0]->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
+		WRITE_ONCE(s[0]->debugger->worker_state, DEBUGGER_WORKER_INACTIVE);
 
-		xe_eudebug_client_wait_done(s->client);
+		xe_eudebug_client_wait_done(s[0]->client);
 
-		xe_eudebug_event_log_print(s->debugger->log, true);
-		xe_eudebug_event_log_print(s->client->log, true);
+		xe_eudebug_event_log_print(s[0]->debugger->log, true);
+		xe_eudebug_event_log_print(s[0]->client->log, true);
 
-		xe_eudebug_session_destroy(s);
+		xe_eudebug_session_destroy(s[0]);
+		s[0] = NULL;
 		online_debug_data_destroy(data);
 	}
 
@@ -1776,10 +1779,9 @@ static int getenv_int(const char *var, int def_val)
  *     exception handling reports correct thread, if only one thread causes exception
  *     and other threads are spinning.
  */
-static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *hwe,
-				  int flags)
+static void test_pagefault_online(int fd, struct xe_eudebug_session **s,
+				  struct drm_xe_engine_class_instance *hwe, int flags)
 {
-	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 
 	data = online_debug_data_create(fd, hwe, flags);
@@ -1802,28 +1804,29 @@ static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *h
 
 		data->max_subslices_per_slice = DIV_ROUND_UP(max_ss, max_sl);
 	}
-	s = xe_eudebug_session_create(fd, run_online_client, data->flags, data);
+	s[0] = xe_eudebug_session_create(fd, run_online_client, data->flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
 					open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
 					create_metadata_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
 					pagefault_trigger);
 
-	xe_eudebug_session_run(s);
-	online_session_check(s, s->flags);
+	xe_eudebug_session_run(s[0]);
+	online_session_check(s[0], s[0]->flags);
 
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	online_debug_data_destroy(data);
 }
 
@@ -1834,37 +1837,38 @@ static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *h
  *	Verify that eu debugger disables preemption timeout to
  *	prevent reset of workload stopped on breakpoint.
  */
-static void test_preemption(int fd, struct drm_xe_engine_class_instance *hwe)
+static void test_preemption(int fd, struct xe_eudebug_session **s,
+			    struct drm_xe_engine_class_instance *hwe)
 {
 	int flags = SHADER_BREAKPOINT | TRIGGER_RESUME_DELAYED;
-	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 	struct xe_eudebug_client *other;
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s[0] = xe_eudebug_session_create(fd, run_online_client, flags, data);
 	other = xe_eudebug_client_create(fd, run_online_client, SHADER_NOP, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
-	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
-	xe_eudebug_debugger_start_worker(s->debugger);
+	igt_assert_eq(xe_eudebug_debugger_attach(s[0]->debugger, s[0]->client), 0);
+	xe_eudebug_debugger_start_worker(s[0]->debugger);
 
-	xe_eudebug_client_start(s->client);
-	sleep(1); /* make sure s->client starts first */
+	xe_eudebug_client_start(s[0]->client);
+	sleep(1); /* make sure s[0]->client starts first */
 	xe_eudebug_client_start(other);
 
-	xe_eudebug_client_wait_done(s->client);
+	xe_eudebug_client_wait_done(s[0]->client);
 	xe_eudebug_client_wait_done(other);
 
-	xe_eudebug_debugger_stop_worker(s->debugger);
+	xe_eudebug_debugger_stop_worker(s[0]->debugger);
 
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	xe_eudebug_client_destroy(other);
 
 	igt_assert_f(data->last_eu_control_seqno != 0,
@@ -1880,34 +1884,35 @@ static void test_preemption(int fd, struct drm_xe_engine_class_instance *hwe)
  *	Check whether GPU is usable after resetting with attention raised
  *	(stopped on breakpoint) by running the same workload again.
  */
-static void test_reset_with_attention_online(int fd, struct drm_xe_engine_class_instance *hwe,
-					     int flags)
+static void test_reset_with_attention_online(int fd, struct xe_eudebug_session **s,
+					     struct drm_xe_engine_class_instance *hwe, int flags)
 {
-	struct xe_eudebug_session *s1, *s2;
 	struct online_debug_data *data;
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s1 = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s[0] = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s1->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_reset_trigger);
-	xe_eudebug_debugger_add_trigger(s1->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
-	xe_eudebug_session_run(s1);
-	xe_eudebug_session_destroy(s1);
+	xe_eudebug_session_run(s[0]);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 
-	s2 = xe_eudebug_session_create(fd, run_online_client, flags, data);
-	xe_eudebug_debugger_add_trigger(s2->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	s[1] = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	xe_eudebug_debugger_add_trigger(s[1]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
-	xe_eudebug_debugger_add_trigger(s2->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[1]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
-	xe_eudebug_session_run(s2);
+	xe_eudebug_session_run(s[1]);
 
-	online_session_check(s2, s2->flags);
+	online_session_check(s[1], s[1]->flags);
 
-	xe_eudebug_session_destroy(s2);
+	xe_eudebug_session_destroy(s[1]);
+	s[1] = NULL;
 	online_debug_data_destroy(data);
 }
 
@@ -1932,53 +1937,54 @@ static void test_reset_with_attention_online(int fd, struct drm_xe_engine_class_
  * Description:
  *	Faultable variation of test interrupt-all-set-breakpoint.
  */
-static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+static void test_interrupt_all(int fd, struct xe_eudebug_session **s,
+			       struct drm_xe_engine_class_instance *hwe, int flags)
 {
-	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 
 	igt_require(!(flags & FAULTABLE_VM) || !xe_supports_faults(fd));
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s[0] = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
 					open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
 					create_metadata_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
-	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
-	xe_eudebug_debugger_start_worker(s->debugger);
-	xe_eudebug_client_start(s->client);
+	igt_assert_eq(xe_eudebug_debugger_attach(s[0]->debugger, s[0]->client), 0);
+	xe_eudebug_debugger_start_worker(s[0]->debugger);
+	xe_eudebug_client_start(s[0]->client);
 
 	wait_for_workload_start(data);
 
 	pthread_mutex_lock(&data->mutex);
 	igt_assert(data->client_handle != -1);
 	igt_assert(data->exec_queue_handle != -1);
-	eu_ctl_interrupt_all(s->debugger->fd, data->client_handle,
+	eu_ctl_interrupt_all(s[0]->debugger->fd, data->client_handle,
 			     data->exec_queue_handle, data->lrc_handle);
 	pthread_mutex_unlock(&data->mutex);
 
-	xe_eudebug_client_wait_done(s->client);
+	xe_eudebug_client_wait_done(s[0]->client);
 
-	xe_eudebug_debugger_stop_worker(s->debugger);
+	xe_eudebug_debugger_stop_worker(s[0]->debugger);
 
-	xe_eudebug_event_log_print(s->debugger->log, true);
-	xe_eudebug_event_log_print(s->client->log, true);
+	xe_eudebug_event_log_print(s[0]->debugger->log, true);
+	xe_eudebug_event_log_print(s[0]->client->log, true);
 
-	online_session_check(s, s->flags);
+	online_session_check(s[0], s[0]->flags);
 
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	online_debug_data_destroy(data);
 }
 
@@ -2012,39 +2018,39 @@ static void reset_debugger_log(struct xe_eudebug_debugger *d)
  *	configured for debugging, tries to interrupt all threads using the client
  *	attached to debugger.
  */
-static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+static void test_interrupt_other(int fd, struct xe_eudebug_session **s,
+				 struct drm_xe_engine_class_instance *hwe, int flags)
 {
 	struct online_debug_data *data;
 	struct online_debug_data *debugee_data;
-	struct xe_eudebug_session *s;
 	struct xe_eudebug_client *debugee;
 	int debugee_flags = SHADER_LOOP | DO_NOT_EXPECT_CANARIES;
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s[0] = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN, open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_OPEN, open_trigger);
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
 					create_metadata_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
-	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
-	xe_eudebug_debugger_start_worker(s->debugger);
-	xe_eudebug_client_start(s->client);
+	igt_assert_eq(xe_eudebug_debugger_attach(s[0]->debugger, s[0]->client), 0);
+	xe_eudebug_debugger_start_worker(s[0]->debugger);
+	xe_eudebug_client_start(s[0]->client);
 
 	wait_for_workload_start(data);
 
-	xe_eudebug_debugger_detach(s->debugger);
-	reset_debugger_log(s->debugger);
+	xe_eudebug_debugger_detach(s[0]->debugger);
+	reset_debugger_log(s[0]->debugger);
 
 	debugee_data = online_debug_data_create(fd, hwe, flags);
-	s->debugger->ptr = debugee_data;
+	s[0]->debugger->ptr = debugee_data;
 	debugee = xe_eudebug_client_create(fd, run_online_client, debugee_flags, debugee_data);
-	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, debugee), 0);
+	igt_assert_eq(xe_eudebug_debugger_attach(s[0]->debugger, debugee), 0);
 	xe_eudebug_client_start(debugee);
 
 	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
@@ -2060,15 +2066,15 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	 * Interrupting the other client should return invalid state
 	 * as it is running in runalone mode
 	 */
-	igt_assert_eq(__eu_ctl(s->debugger->fd, debugee_data->client_handle,
+	igt_assert_eq(__eu_ctl(s[0]->debugger->fd, debugee_data->client_handle,
 		      debugee_data->exec_queue_handle, debugee_data->lrc_handle, NULL, 0,
 		      DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL), -EINVAL);
 	pthread_mutex_unlock(&debugee_data->mutex);
 
-	xe_force_gt_reset_async(s->debugger->master_fd, debugee_data->hwe.gt_id);
+	xe_force_gt_reset_async(s[0]->debugger->master_fd, debugee_data->hwe.gt_id);
 
 	/* First client should complete because of the reset */
-	xe_eudebug_client_wait_done(s->client);
+	xe_eudebug_client_wait_done(s[0]->client);
 
 	/* Check if second workload was started and is running */
 	wait_for_workload_start(debugee_data);
@@ -2081,9 +2087,9 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	debugee->done = 1;
 	debugee->pid = 0;
 
-	xe_eudebug_debugger_stop_worker(s->debugger);
+	xe_eudebug_debugger_stop_worker(s[0]->debugger);
 
-	xe_eudebug_event_log_print(s->debugger->log, true);
+	xe_eudebug_event_log_print(s[0]->debugger->log, true);
 	xe_eudebug_event_log_print(debugee->log, true);
 
 	/*
@@ -2092,7 +2098,8 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	 */
 
 	xe_eudebug_client_destroy(debugee);
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	online_debug_data_destroy(data);
 	online_debug_data_destroy(debugee_data);
 }
@@ -2105,9 +2112,9 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
  *	checks negative scenarios of EU_THREADS ioctl usage, interrupts all threads,
  *	checks whether attention event came, and resumes stopped threads back.
  */
-static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+static void test_tdctl_parameters(int fd, struct xe_eudebug_session **s,
+				  struct drm_xe_engine_class_instance *hwe, int flags)
 {
-	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 	uint32_t random_command;
 	uint32_t bitmask_size = query_attention_bitmask_size(fd, hwe->gt_id);
@@ -2116,25 +2123,25 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 	igt_assert(attention_bitmask);
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s[0] = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
 					open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
 					create_metadata_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
-	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
-	xe_eudebug_debugger_start_worker(s->debugger);
-	xe_eudebug_client_start(s->client);
+	igt_assert_eq(xe_eudebug_debugger_attach(s[0]->debugger, s[0]->client), 0);
+	xe_eudebug_debugger_start_worker(s[0]->debugger);
+	xe_eudebug_client_start(s[0]->client);
 
 	wait_for_workload_start(data);
 
@@ -2144,19 +2151,19 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 	igt_assert(data->lrc_handle != -1);
 
 	/* fail on invalid lrc_handle */
-	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle,
+	igt_assert(__eu_ctl(s[0]->debugger->fd, data->client_handle,
 			    data->exec_queue_handle, data->lrc_handle + 1,
 			    attention_bitmask, &bitmask_size,
 			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL) == -EINVAL);
 
 	/* fail on invalid exec_queue_handle */
-	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle,
+	igt_assert(__eu_ctl(s[0]->debugger->fd, data->client_handle,
 			    data->exec_queue_handle + 1, data->lrc_handle,
 			    attention_bitmask, &bitmask_size,
 			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL) == -EINVAL);
 
 	/* fail on invalid client */
-	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle + 1,
+	igt_assert(__eu_ctl(s[0]->debugger->fd, data->client_handle + 1,
 			    data->exec_queue_handle, data->lrc_handle,
 			    attention_bitmask, &bitmask_size,
 			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL, NULL) == -EINVAL);
@@ -2166,7 +2173,7 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 	 * and be zero for interrupt all
 	 */
 	bitmask_size = sizeof(uint32_t) - 1;
-	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle,
+	igt_assert(__eu_ctl(s[0]->debugger->fd, data->client_handle,
 			    data->exec_queue_handle, data->lrc_handle,
 			    attention_bitmask, &bitmask_size,
 			    DRM_XE_EUDEBUG_EU_CONTROL_CMD_STOPPED, NULL) == -EINVAL);
@@ -2174,26 +2181,27 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 
 	/* fail on invalid command */
 	random_command = random() | (DRM_XE_EUDEBUG_EU_CONTROL_CMD_RESUME + 1);
-	igt_assert(__eu_ctl(s->debugger->fd, data->client_handle,
+	igt_assert(__eu_ctl(s[0]->debugger->fd, data->client_handle,
 			    data->exec_queue_handle, data->lrc_handle,
 			    attention_bitmask, &bitmask_size, random_command, NULL) == -EINVAL);
 
 	free(attention_bitmask);
 
-	eu_ctl_interrupt_all(s->debugger->fd, data->client_handle,
+	eu_ctl_interrupt_all(s[0]->debugger->fd, data->client_handle,
 			     data->exec_queue_handle, data->lrc_handle);
 	pthread_mutex_unlock(&data->mutex);
 
-	xe_eudebug_client_wait_done(s->client);
+	xe_eudebug_client_wait_done(s[0]->client);
 
-	xe_eudebug_debugger_stop_worker(s->debugger);
+	xe_eudebug_debugger_stop_worker(s[0]->debugger);
 
-	xe_eudebug_event_log_print(s->debugger->log, true);
-	xe_eudebug_event_log_print(s->client->log, true);
+	xe_eudebug_event_log_print(s[0]->debugger->log, true);
+	xe_eudebug_event_log_print(s[0]->client->log, true);
 
-	online_session_check(s, s->flags);
+	online_session_check(s[0], s[0]->flags);
 
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	online_debug_data_destroy(data);
 }
 
@@ -2249,58 +2257,59 @@ static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
  *	raised. The test checks if KMD resets the workload when there's
  *	no debugger attached and does the event playback on discovery.
  */
-static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+static void test_interrupt_reconnect(int fd, struct xe_eudebug_session **s,
+				     struct drm_xe_engine_class_instance *hwe, int flags)
 {
 	struct drm_xe_eudebug_event *e = NULL;
 	struct online_debug_data *data;
-	struct xe_eudebug_session *s;
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s[0] = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
 					open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
 					exec_queue_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debugger_detach_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
 					create_metadata_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
-	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
-	xe_eudebug_debugger_start_worker(s->debugger);
-	xe_eudebug_client_start(s->client);
+	igt_assert_eq(xe_eudebug_debugger_attach(s[0]->debugger, s[0]->client), 0);
+	xe_eudebug_debugger_start_worker(s[0]->debugger);
+	xe_eudebug_client_start(s[0]->client);
 
 	wait_for_workload_start(data);
 
 	pthread_mutex_lock(&data->mutex);
 	igt_assert(data->client_handle != -1);
 	igt_assert(data->exec_queue_handle != -1);
-	eu_ctl_interrupt_all(s->debugger->fd, data->client_handle,
+	eu_ctl_interrupt_all(s[0]->debugger->fd, data->client_handle,
 			     data->exec_queue_handle, data->lrc_handle);
 	pthread_mutex_unlock(&data->mutex);
 
-	xe_eudebug_client_wait_done(s->client);
+	xe_eudebug_client_wait_done(s[0]->client);
 
-	xe_eudebug_debugger_stop_worker(s->debugger);
+	xe_eudebug_debugger_stop_worker(s[0]->debugger);
 
-	xe_eudebug_event_log_print(s->debugger->log, true);
-	xe_eudebug_event_log_print(s->client->log, true);
+	xe_eudebug_event_log_print(s[0]->debugger->log, true);
+	xe_eudebug_event_log_print(s[0]->client->log, true);
 
-	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
-					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
-					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
+	xe_eudebug_session_check(s[0], true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
+					     XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
+					     XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
 
 	/* We expect workload reset, so no attention should be raised */
-	xe_eudebug_for_each_event(e, s->debugger->log)
+	xe_eudebug_for_each_event(e, s[0]->debugger->log)
 		igt_assert(e->type != DRM_XE_EUDEBUG_EVENT_EU_ATTENTION);
 
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	online_debug_data_destroy(data);
 }
 
@@ -2320,29 +2329,30 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
  *	thread advanced every step. Due to the time constraint, only first two
  *	shader instructions after breakpoint are validated.
  */
-static void test_single_step(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+static void test_single_step(int fd, struct xe_eudebug_session **s,
+			     struct drm_xe_engine_class_instance *hwe, int flags)
 {
-	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s[0] = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
 					open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_single_step_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
 					create_metadata_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
-	xe_eudebug_session_run(s);
-	online_session_check(s, s->flags);
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_run(s[0]);
+	online_session_check(s[0], s[0]->flags);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	online_debug_data_destroy(data);
 }
 
@@ -2370,27 +2380,28 @@ static void eu_attention_debugger_ndetach_trigger(struct xe_eudebug_debugger *d,
  *	Check whether the debugger is able to reopen the connection and
  *	capture the events of already running client.
  */
-static void test_debugger_reopen(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+static void test_debugger_reopen(int fd, struct xe_eudebug_session **s,
+				 struct drm_xe_engine_class_instance *hwe, int flags)
 {
-	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 
 	data = online_debug_data_create(fd, hwe, flags);
 
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s[0] = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debugger_ndetach_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
-	xe_eudebug_session_run(s);
+	xe_eudebug_session_run(s[0]);
 
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	online_debug_data_destroy(data);
 }
 
@@ -2418,32 +2429,33 @@ static void test_debugger_reopen(int fd, struct drm_xe_engine_class_instance *hw
  * @sram:	Target surface in SRAM
  * @vram:	Target surface in VRAM
  */
-static void test_caching(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+static void test_caching(int fd, struct xe_eudebug_session **s,
+			 struct drm_xe_engine_class_instance *hwe, int flags)
 {
-	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 
 	if (flags & SHADER_CACHING_VRAM || flags & BB_IN_VRAM || flags & TARGET_IN_VRAM)
 		igt_skip_on_f(!xe_has_vram(fd), "Device does not have VRAM.\n");
 
 	data = online_debug_data_create(fd, hwe, flags);
-	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+	s[0] = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
 					open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_debug_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
 					eu_attention_resume_caching_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
 					create_metadata_trigger);
-	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+	xe_eudebug_debugger_add_trigger(s[0]->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
 					ufence_ack_trigger);
 
-	xe_eudebug_session_run(s);
-	online_session_check(s, s->flags);
-	xe_eudebug_session_destroy(s);
+	xe_eudebug_session_run(s[0]);
+	online_session_check(s[0], s[0]->flags);
+	xe_eudebug_session_destroy(s[0]);
+	s[0] = NULL;
 	online_debug_data_destroy(data);
 }
 
@@ -2535,10 +2547,9 @@ static uint64_t timespecs_diff_us(struct timespec *ts1, struct timespec *ts2)
  *      engines, with one per tile. Checks if each context hit breakpoint and
  *      resumes them.
  */
-static void test_many_sessions_on_tiles(int fd, bool multi_tile)
+static void test_many_sessions_on_tiles(int fd, struct xe_eudebug_session **s, bool multi_tile)
 {
 	int n = 0, flags = SHADER_BREAKPOINT | SHADER_MIN_THREADS;
-	struct xe_eudebug_session **s;
 	struct online_debug_data **data;
 	struct drm_xe_engine_class_instance **hwe;
 	struct drm_xe_eudebug_event_eu_attention *eus;
@@ -2546,7 +2557,6 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
 	int attempt_mask = 0, final_mask, should_break;
 	int i;
 
-	s = malloc(sizeof(*s) * xe_number_engines(fd));
 	data = malloc(sizeof(*data) * xe_number_engines(fd));
 	hwe = malloc(sizeof(*hwe) * xe_number_engines(fd));
 	n = find_suitable_engines(hwe, fd, multi_tile);
@@ -2627,10 +2637,10 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
 		online_session_check(s[i], flags);
 
 		xe_eudebug_session_destroy(s[i]);
+		s[i] = NULL;
 		online_debug_data_destroy(data[i]);
 	}
 
-	free(s);
 	free(data);
 	free(hwe);
 }
@@ -2682,48 +2692,53 @@ int igt_main()
 	int fd;
 	uint16_t engine_class = 0xFFFF;
 	uint32_t preempt_timeout = 0xFFFFFFFF;
+	struct xe_eudebug_session **s;
 
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		intel_allocator_multiprocess_start();
 		igt_srandom();
 		was_enabled = xe_eudebug_enable(fd, true);
+
+		/* Should be enough for any scenario */
+		s = calloc(PAGE_SIZE / sizeof(*s), sizeof(*s));
+		igt_assert(s);
 	}
 
 	test_gt_render_or_compute("basic-breakpoint", fd, hwe)
-		test_basic_online(fd, hwe, SHADER_BREAKPOINT);
+		test_basic_online(fd, s, hwe, SHADER_BREAKPOINT);
 
 	test_gt_render_or_compute("preempt-breakpoint", fd, hwe)
-		test_preemption(fd, hwe);
+		test_preemption(fd, s, hwe);
 
 	test_gt_render_or_compute("set-breakpoint", fd, hwe)
-		test_set_breakpoint_online(fd, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
+		test_set_breakpoint_online(fd, s, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
 
 	test_gt_render_or_compute("set-breakpoint-faultable", fd, hwe)
-		test_set_breakpoint_online(fd, hwe,
+		test_set_breakpoint_online(fd, s, hwe,
 					   SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT | FAULTABLE_VM);
 
 	test_gt_render_or_compute("set-breakpoint-sigint-debugger", fd, hwe)
-		test_set_breakpoint_online_sigint_debugger(fd, hwe,
+		test_set_breakpoint_online_sigint_debugger(fd, s, hwe,
 							   SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
 
 	test_gt_render_or_compute("breakpoint-not-in-debug-mode", fd, hwe)
-		test_basic_online(fd, hwe, SHADER_BREAKPOINT | DISABLE_DEBUG_MODE);
+		test_basic_online(fd, s, hwe, SHADER_BREAKPOINT | DISABLE_DEBUG_MODE);
 
 	test_gt_render_or_compute("stopped-thread", fd, hwe)
-		test_basic_online(fd, hwe, SHADER_BREAKPOINT | TRIGGER_RESUME_DELAYED);
+		test_basic_online(fd, s, hwe, SHADER_BREAKPOINT | TRIGGER_RESUME_DELAYED);
 
 	test_gt_render_or_compute("resume-one", fd, hwe)
-		test_basic_online(fd, hwe, SHADER_BREAKPOINT | TRIGGER_RESUME_ONE);
+		test_basic_online(fd, s, hwe, SHADER_BREAKPOINT | TRIGGER_RESUME_ONE);
 
 	test_gt_render_or_compute("resume-dss", fd, hwe)
-		test_basic_online(fd, hwe, SHADER_BREAKPOINT | TRIGGER_RESUME_DSS);
+		test_basic_online(fd, s, hwe, SHADER_BREAKPOINT | TRIGGER_RESUME_DSS);
 
 	test_gt_render_or_compute("interrupt-all", fd, hwe)
-		test_interrupt_all(fd, hwe, SHADER_LOOP);
+		test_interrupt_all(fd, s, hwe, SHADER_LOOP);
 
 	test_gt_render_or_compute("interrupt-other-debuggable", fd, hwe)
-		test_interrupt_other(fd, hwe, SHADER_LOOP);
+		test_interrupt_other(fd, s, hwe, SHADER_LOOP);
 
 	igt_subtest_group() {
 		test_gt_render_or_compute("interrupt-other", fd, hwe) {
@@ -2732,7 +2747,7 @@ int igt_main()
 			igt_skip_on(!set_preempt_timeout_to_max(fd, engine_class,
 								&preempt_timeout));
 
-			test_interrupt_other(fd, hwe, SHADER_LOOP | DISABLE_DEBUG_MODE);
+			test_interrupt_other(fd, s, hwe, SHADER_LOOP | DISABLE_DEBUG_MODE);
 		}
 
 		igt_fixture() {
@@ -2743,73 +2758,85 @@ int igt_main()
 	}
 
 	test_gt_render_or_compute("interrupt-all-set-breakpoint", fd, hwe)
-		test_interrupt_all(fd, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP);
+		test_interrupt_all(fd, s, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP);
 
 	test_gt_render_or_compute("interrupt-all-set-breakpoint-faultable", fd, hwe)
-		test_interrupt_all(fd, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP | FAULTABLE_VM);
+		test_interrupt_all(fd, s, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP | FAULTABLE_VM);
 
 	test_gt_render_or_compute("tdctl-parameters", fd, hwe)
-		test_tdctl_parameters(fd, hwe, SHADER_LOOP);
+		test_tdctl_parameters(fd, s, hwe, SHADER_LOOP);
 
 	test_gt_render_or_compute("reset-with-attention", fd, hwe)
-		test_reset_with_attention_online(fd, hwe, SHADER_BREAKPOINT);
+		test_reset_with_attention_online(fd, s, hwe, SHADER_BREAKPOINT);
 
 	test_gt_render_or_compute("interrupt-reconnect", fd, hwe)
-		test_interrupt_reconnect(fd, hwe, SHADER_LOOP | TRIGGER_RECONNECT);
+		test_interrupt_reconnect(fd, s, hwe, SHADER_LOOP | TRIGGER_RECONNECT);
 
 	test_gt_render_or_compute("single-step", fd, hwe)
-		test_single_step(fd, hwe, SHADER_SINGLE_STEP | SIP_SINGLE_STEP |
+		test_single_step(fd, s, hwe, SHADER_SINGLE_STEP | SIP_SINGLE_STEP |
 				 TRIGGER_RESUME_PARALLEL_WALK);
 
 	test_gt_render_or_compute("single-step-one", fd, hwe)
-		test_single_step(fd, hwe, SHADER_SINGLE_STEP | SIP_SINGLE_STEP |
+		test_single_step(fd, s, hwe, SHADER_SINGLE_STEP | SIP_SINGLE_STEP |
 				 TRIGGER_RESUME_SINGLE_WALK);
 
 	test_gt_render_or_compute("debugger-reopen", fd, hwe)
-		test_debugger_reopen(fd, hwe, SHADER_N_NOOP_BREAKPOINT);
+		test_debugger_reopen(fd, s, hwe, SHADER_N_NOOP_BREAKPOINT);
 
 	test_gt_render_or_compute("writes-caching-sram-bb-sram-target-sram", fd, hwe)
-		test_caching(fd, hwe, SHADER_CACHING_SRAM | BB_IN_SRAM | TARGET_IN_SRAM);
+		test_caching(fd, s, hwe, SHADER_CACHING_SRAM | BB_IN_SRAM | TARGET_IN_SRAM);
 
 	test_gt_render_or_compute("writes-caching-sram-bb-sram-target-vram", fd, hwe)
-		test_caching(fd, hwe, SHADER_CACHING_SRAM | BB_IN_SRAM | TARGET_IN_VRAM);
+		test_caching(fd, s, hwe, SHADER_CACHING_SRAM | BB_IN_SRAM | TARGET_IN_VRAM);
 
 	test_gt_render_or_compute("writes-caching-sram-bb-vram-target-sram", fd, hwe)
-		test_caching(fd, hwe, SHADER_CACHING_SRAM | BB_IN_VRAM | TARGET_IN_SRAM);
+		test_caching(fd, s, hwe, SHADER_CACHING_SRAM | BB_IN_VRAM | TARGET_IN_SRAM);
 
 	test_gt_render_or_compute("writes-caching-sram-bb-vram-target-vram", fd, hwe)
-		test_caching(fd, hwe, SHADER_CACHING_SRAM | BB_IN_VRAM | TARGET_IN_VRAM);
+		test_caching(fd, s, hwe, SHADER_CACHING_SRAM | BB_IN_VRAM | TARGET_IN_VRAM);
 
 	test_gt_render_or_compute("writes-caching-vram-bb-sram-target-sram", fd, hwe)
-		test_caching(fd, hwe, SHADER_CACHING_VRAM | BB_IN_SRAM | TARGET_IN_SRAM);
+		test_caching(fd, s, hwe, SHADER_CACHING_VRAM | BB_IN_SRAM | TARGET_IN_SRAM);
 
 	test_gt_render_or_compute("writes-caching-vram-bb-sram-target-vram", fd, hwe)
-		test_caching(fd, hwe, SHADER_CACHING_VRAM | BB_IN_SRAM | TARGET_IN_VRAM);
+		test_caching(fd, s, hwe, SHADER_CACHING_VRAM | BB_IN_SRAM | TARGET_IN_VRAM);
 
 	test_gt_render_or_compute("writes-caching-vram-bb-vram-target-sram", fd, hwe)
-		test_caching(fd, hwe, SHADER_CACHING_VRAM | BB_IN_VRAM | TARGET_IN_SRAM);
+		test_caching(fd, s, hwe, SHADER_CACHING_VRAM | BB_IN_VRAM | TARGET_IN_SRAM);
 
 	test_gt_render_or_compute("writes-caching-vram-bb-vram-target-vram", fd, hwe)
-		test_caching(fd, hwe, SHADER_CACHING_VRAM | BB_IN_VRAM | TARGET_IN_VRAM);
+		test_caching(fd, s, hwe, SHADER_CACHING_VRAM | BB_IN_VRAM | TARGET_IN_VRAM);
 
 	igt_subtest("breakpoint-many-sessions-single-tile")
-		test_many_sessions_on_tiles(fd, false);
+		test_many_sessions_on_tiles(fd, s, false);
 
 	igt_subtest("breakpoint-many-sessions-tiles")
-		test_many_sessions_on_tiles(fd, true);
+		test_many_sessions_on_tiles(fd, s, true);
 
 	test_gt_render_or_compute("pagefault-read", fd, hwe)
-		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ);
+		test_pagefault_online(fd, s, hwe, SHADER_PAGEFAULT_READ);
 	test_gt_render_or_compute("pagefault-write", fd, hwe)
-		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
+		test_pagefault_online(fd, s, hwe, SHADER_PAGEFAULT_WRITE);
 	test_gt_render_or_compute("pagefault-read-stress", fd, hwe)
-		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ | PAGEFAULT_STRESS_TEST);
+		test_pagefault_online(fd, s, hwe, SHADER_PAGEFAULT_READ | PAGEFAULT_STRESS_TEST);
 	test_gt_render_or_compute("pagefault-write-stress", fd, hwe)
-		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE | PAGEFAULT_STRESS_TEST);
+		test_pagefault_online(fd, s, hwe, SHADER_PAGEFAULT_WRITE | PAGEFAULT_STRESS_TEST);
 	test_gt_render_or_compute("pagefault-one-of-many", fd, hwe)
-		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_ONE_OF_MANY);
+		test_pagefault_online(fd, s, hwe, SHADER_PAGEFAULT_ONE_OF_MANY);
 
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
 
 		intel_allocator_multiprocess_stop();
-- 
2.34.1

