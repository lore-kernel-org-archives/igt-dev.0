Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A909C28B30
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 13:56:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C471810E5B5;
	Tue, 11 Mar 2025 13:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8JGyLLC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FD810E5B3
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741701358; x=1773237358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/5rxUiJ9QwzNZaoEnbgv6wy3qE36FEcBSQqy5Sx7w6U=;
 b=D8JGyLLClbkKHXscbuoTdrZABWkVlPcUCtH8tWLspstwHk5udT5UFvSg
 NUwftX3xzlrRBQ/A9SEBWVXJINsco9rB6g6Vi62K0FTvTKRBj06rE9D8a
 7slts1MCPMFvU2ChMaiKQ88wgjOxG9wR91nZew6bWrvHt+xV1ofwSEeR7
 VRvpuopPyUhcRdY0qmTH35TCtScs7idWSFpWDQCyf73TDl3dRGKZ8+wH/
 WdkqUEIXxz6z61QCNhfaG9e3oNkHSe2FnLJ4fs+xbdVxPygN4knBv1VQg
 2nwhC9SCKlsGMq+AXw1ZGQnjbb1HJK1ri4MrtvSDDyIKq3wh9KWtmNJOd g==;
X-CSE-ConnectionGUID: KbS/EPzhSziQyZbfd2qEAg==
X-CSE-MsgGUID: AoBYzkfFQgSpfzlgJDdt6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42616262"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="42616262"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:55:58 -0700
X-CSE-ConnectionGUID: cV2oqyu3SWm3scCd4MhJFg==
X-CSE-MsgGUID: UPEewggcQIGQtLGCml3fIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="151131532"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.177])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 06:55:57 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 3/3] tests/xe_eudebug_online: Add
 set-breakpoint-sigint-debugger test
Date: Tue, 11 Mar 2025 14:55:29 +0100
Message-Id: <20250311135529.5425-4-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311135529.5425-1-dominik.karol.piatkowski@intel.com>
References: <20250311135529.5425-1-dominik.karol.piatkowski@intel.com>
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

Add a test that sends SIGINT to the debugger thread with random timing
and checks if nothing breaks, exercising the scenario multiple times.

v2: Count correctly timed SIGINTs and assert that they happened (Mika)

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 96 +++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 472013fe1..0ec1f2156 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1506,6 +1506,98 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
 	online_debug_data_destroy(data);
 }
 
+/**
+ * SUBTEST: set-breakpoint-sigint-debugger
+ * Description:
+ *	A variant of set-breakpoint that sends SIGINT to the debugger thread with random timing
+ *	and checks if nothing breaks, exercising the scenario multiple times.
+ */
+static void test_set_breakpoint_online_sigint_debugger(int fd,
+						       struct drm_xe_engine_class_instance *hwe,
+						       int flags)
+{
+	struct xe_eudebug_session *s;
+	struct online_debug_data *data;
+	struct timespec ts = { };
+	int loop_count = 0;
+	uint64_t sleep_time;
+	uint64_t set_breakpoint_time;
+	uint64_t max_sleep_time;
+	uint64_t events_max = 0;
+	int sigints_during_test = 0;
+
+	/*
+	 * Measure the average time required for basic set-breakpoint variant,
+	 * so sleep_time range is correct.
+	 */
+	igt_nsec_elapsed(&ts);
+	for (int i = 0; i < 10; i++)
+		test_set_breakpoint_online(fd, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
+	set_breakpoint_time = igt_nsec_elapsed(&ts) / (NSEC_PER_MSEC / USEC_PER_MSEC) / 10;
+	igt_info("Average set-breakpoint execution time: %" PRIu64 " us\n", set_breakpoint_time);
+	max_sleep_time = set_breakpoint_time * 11 / 10;
+	igt_info("Maximum sleep_time: %" PRIu64 " us\n", max_sleep_time);
+
+	ts = (struct timespec) { };
+	igt_nsec_elapsed(&ts);
+
+	while (igt_seconds_elapsed(&ts) < 60) {
+		uint64_t event_count;
+
+		sleep_time = rand() % max_sleep_time;
+		igt_debug("Loop %d: SIGINT after %" PRIu64 " us\n", ++loop_count, sleep_time);
+
+		data = online_debug_data_create(hwe);
+		s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
+						open_trigger);
+		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+						exec_queue_trigger);
+		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM,
+						vm_open_trigger);
+		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_METADATA,
+						create_metadata_trigger);
+		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+						ufence_ack_set_bp_trigger);
+		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+						eu_attention_resume_trigger);
+
+		igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
+		xe_eudebug_debugger_start_worker(s->debugger);
+		igt_assert_eq(READ_ONCE(s->debugger->event_count), 0);
+		xe_eudebug_client_start(s->client);
+
+		/* Sample max events without SIGINT */
+		if (loop_count == 1)
+			xe_eudebug_client_wait_done(s->client);
+		else
+			usleep(sleep_time);
+
+		event_count = READ_ONCE(s->debugger->event_count);
+		if (event_count > events_max)
+			events_max = event_count;
+		else if (event_count > 0 && event_count < events_max)
+			sigints_during_test++;
+
+		igt_assert_eq(pthread_kill(s->debugger->worker_thread, SIGINT), 0);
+		close(s->debugger->fd);
+
+		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
+		WRITE_ONCE(s->debugger->worker_state, DEBUGGER_WORKER_INACTIVE);
+
+		xe_eudebug_client_wait_done(s->client);
+
+		xe_eudebug_event_log_print(s->debugger->log, true);
+		xe_eudebug_event_log_print(s->client->log, true);
+
+		xe_eudebug_session_destroy(s);
+		online_debug_data_destroy(data);
+	}
+
+	igt_info("%d correctly timed SIGINTs in %d loops\n", sigints_during_test, loop_count);
+	igt_assert_lt(0, sigints_during_test);
+}
+
 /**
  * SUBTEST: pagefault-read
  * Description:
@@ -2426,6 +2518,10 @@ igt_main
 	test_gt_render_or_compute("set-breakpoint", fd, hwe)
 		test_set_breakpoint_online(fd, hwe, SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
 
+	test_gt_render_or_compute("set-breakpoint-sigint-debugger", fd, hwe)
+		test_set_breakpoint_online_sigint_debugger(fd, hwe,
+							   SHADER_NOP | TRIGGER_UFENCE_SET_BREAKPOINT);
+
 	test_gt_render_or_compute("breakpoint-not-in-debug-mode", fd, hwe)
 		test_basic_online(fd, hwe, SHADER_BREAKPOINT | DISABLE_DEBUG_MODE);
 
-- 
2.34.1

