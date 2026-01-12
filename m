Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BEEC9EC88
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70C510E3C8;
	Mon, 12 Jan 2026 13:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+oYJgr6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECB310E3C8
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222827; x=1799758827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S8MPMIOBpmTeAw907h7isio3YO9z3bmYnWSJGQ8AzYc=;
 b=a+oYJgr6ntwj/8zeRACGZPI5yt4C06CUZBO961yNfORKbqG/poH/FGII
 2R0oDRi7daYhe7ucYVRugaTAVr1E4knOfYh7yNyG0UgMqcfp0c8MlDytT
 aK2jDW0K5xciqsktlXektqmHlcM5hBX7eMjl391Y8uTtwUX9cmfHxQTfY
 eeP1IMRZtthq4AKu3TPLhqa40jt7S74GW4uoDV29Z7aXYUC0rlx8I9/FL
 lsSiUG29qbaA0ToF5QbCzvMG6w4xwyWycsFP8nRSMVN/G/TubLFvuJChR
 2AmUp+6FmoYlsS9muCcD3F2v2wpn7tbUOakAHhSAb1/taG73AYSc+B2ER w==;
X-CSE-ConnectionGUID: rPmoFH9NR2ujQ9BdwgHGYQ==
X-CSE-MsgGUID: Nv5PPxxyTc6WorNBRNEi6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545518"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545518"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:27 -0800
X-CSE-ConnectionGUID: 6PIbF11WTK66XdBXiMQifQ==
X-CSE-MsgGUID: aMgQWiz2T7KJG9pTybDcGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204094919"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:24 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 02/21] lib/xe/xe_eudebug: Make sure debugger drains
 events
Date: Mon, 12 Jan 2026 14:59:48 +0200
Message-ID: <20260112130008.1649357-3-mika.kuoppala@linux.intel.com>
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

Do not exit from debugger worker until poll timeouts
as otherwise session can nuke the worker too early
and some events might get dropped.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.c             | 66 ++++++++++++++++++++++++---------
 lib/xe/xe_eudebug.h             |  7 ++--
 tests/intel/xe_eudebug_online.c |  4 +-
 3 files changed, 54 insertions(+), 23 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 0f09bc8a19..7c2c9505d1 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1146,8 +1146,12 @@ static void *debugger_worker_loop(void *data)
 	sa.sa_flags |= SA_SIGINFO;
 	igt_assert_eq(sigaction(SIGTERM, &sa, NULL), 0);
 
+	WRITE_ONCE(d->worker_state, DEBUGGER_WORKER_RUNNING);
+
 	do {
 		p.fd = d->fd;
+		p.revents = 0;
+
 		ret = poll(&p, 1, timeout_ms);
 		if (d->received_sigint) {
 			d->handled_sigint = true;
@@ -1163,10 +1167,18 @@ static void *debugger_worker_loop(void *data)
 			}
 
 			igt_info("poll failed with errno %d\n", errno);
-			break;
+			goto out;
+		}
+
+		/* only exit after timeout to not miss events */
+		if (ret == 0 &&
+		    READ_ONCE(d->worker_state) != DEBUGGER_WORKER_RUNNING) {
+			igt_debug("debugger worker quitting with state %d\n",
+				  READ_ONCE(d->worker_state));
+			goto out;
 		}
 
-		if (ret == 1 && (p.revents & POLLIN)) {
+		if (ret == 1 && p.revents & POLLIN) {
 			int err = xe_eudebug_read_event(d->fd, e);
 
 			if (!err) {
@@ -1178,10 +1190,22 @@ static void *debugger_worker_loop(void *data)
 				igt_info("xe_eudebug_read_event returned %d\n", ret);
 			}
 		}
-	} while ((ret && READ_ONCE(d->worker_state) == DEBUGGER_WORKER_QUITTING) ||
-		 READ_ONCE(d->worker_state) == DEBUGGER_WORKER_ACTIVE);
 
-	d->worker_state = DEBUGGER_WORKER_INACTIVE;
+		if (ret == 1 && p.revents & POLLHUP) {
+			igt_info("debugger connection hangup\n");
+			goto out;
+		}
+
+		if (ret == 1 && p.revents & POLLNVAL) {
+			igt_info("debugger fd invalid\n");
+			goto out;
+		}
+	} while (1);
+
+out:
+	WRITE_ONCE(d->worker_state, DEBUGGER_WORKER_FINISHED);
+
+	igt_debug("debugger worker finished\n");
 
 	return NULL;
 }
@@ -1234,6 +1258,8 @@ xe_eudebug_debugger_create(int master_fd, uint64_t flags, void *data)
 	d->handled_sigint = false;
 	d->received_signal = false;
 
+	WRITE_ONCE(d->worker_state, DEBUGGER_WORKER_INIT);
+
 	return d;
 }
 
@@ -1254,7 +1280,7 @@ static void debugger_destroy_triggers(struct xe_eudebug_debugger *d)
  */
 void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d)
 {
-	if (d->worker_state != DEBUGGER_WORKER_INACTIVE)
+	if (READ_ONCE(d->worker_state) != DEBUGGER_WORKER_FINISHED)
 		xe_eudebug_debugger_stop_worker(d);
 
 	if (d->target_pid)
@@ -1380,10 +1406,12 @@ void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d)
 {
 	int ret;
 
-	d->worker_state = DEBUGGER_WORKER_ACTIVE;
 	ret = pthread_create(&d->worker_thread, NULL, &debugger_worker_loop, d);
 
 	igt_assert_f(ret == 0, "Debugger worker thread creation failed!");
+
+	while(READ_ONCE(d->worker_state) != DEBUGGER_WORKER_RUNNING)
+		;
 }
 
 /**
@@ -1396,23 +1424,23 @@ void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d)
 {
 	const int timeout_s = 3;
 	struct timespec t = {};
-	int ret;
-
-	igt_assert_neq(d->worker_state, DEBUGGER_WORKER_INACTIVE);
+	int ret = 0;
 
-	d->worker_state = DEBUGGER_WORKER_QUITTING; /* First time be polite. */
-	igt_assert_eq(clock_gettime(CLOCK_REALTIME, &t), 0);
-	t.tv_sec += timeout_s;
+	if (READ_ONCE(d->worker_state) == DEBUGGER_WORKER_RUNNING) {
+		/* First time be polite. */
+		WRITE_ONCE(d->worker_state, DEBUGGER_WORKER_SHOULD_QUIT);
+		igt_assert_eq(clock_gettime(CLOCK_REALTIME, &t), 0);
+		t.tv_sec += timeout_s;
 
-	ret = pthread_timedjoin_np(d->worker_thread, NULL, &t);
+		ret = pthread_timedjoin_np(d->worker_thread, NULL, &t);
+	}
 
 	if (ret == ETIMEDOUT) {
-		d->worker_state = DEBUGGER_WORKER_INACTIVE;
-		ret = pthread_join(d->worker_thread, NULL);
+		igt_info("DEBUGGER STATE %d FORCING\n", READ_ONCE(d->worker_state));
+		WRITE_ONCE(d->worker_state, DEBUGGER_WORKER_FINISHED);
 	}
 
-	igt_assert_f(ret == 0 || ret != ESRCH,
-		     "pthread join failed with error %d!\n", ret);
+	pthread_join(d->worker_thread, NULL);
 
 	event_log_sort(d->log);
 }
@@ -1720,6 +1748,8 @@ void xe_eudebug_session_run(struct xe_eudebug_session *s)
 
 	xe_eudebug_debugger_stop_worker(debugger);
 
+	xe_eudebug_client_stop(client);
+
 	xe_eudebug_event_log_print(debugger->log, true);
 	xe_eudebug_event_log_print(client->log, true);
 }
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index f1a2da4d84..ef9dacf0d2 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -20,9 +20,10 @@ struct xe_eudebug_event_log {
 };
 
 enum xe_eudebug_debugger_worker_state {
-	DEBUGGER_WORKER_INACTIVE = 0,
-	DEBUGGER_WORKER_ACTIVE,
-	DEBUGGER_WORKER_QUITTING,
+	DEBUGGER_WORKER_INIT = 0,
+	DEBUGGER_WORKER_RUNNING,
+	DEBUGGER_WORKER_SHOULD_QUIT,
+	DEBUGGER_WORKER_FINISHED,
 };
 
 struct xe_eudebug_debugger {
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index ff6c5ff19b..e59b99ee99 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1690,8 +1690,8 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 			usleep(1000);
 		close(s->debugger->fd);
 
-		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
-		WRITE_ONCE(s->debugger->worker_state, DEBUGGER_WORKER_INACTIVE);
+		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_RUNNING);
+		WRITE_ONCE(s->debugger->worker_state, DEBUGGER_WORKER_SHOULD_QUIT);
 
 		xe_eudebug_client_wait_done(s->client);
 
-- 
2.43.0

