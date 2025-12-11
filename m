Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CDFD41D64
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 16:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8882A10E889;
	Thu, 11 Dec 2025 16:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W88a4M/k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E8B10E890
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 16:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765471234; x=1797007234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k0ebw06MK5d5NjWhYeIBiSjOp/corjcu+MS//heiOLc=;
 b=W88a4M/kCL4Xkou8PG89t1v5OzE1Uu+BKw9ymILXEVnAY3vlSaQLPif2
 ijOo4xIPEUG7v+bJhaqUKaGEMwOugCpMhstvoUP6pHBvMfVevuq7G9+Va
 RWlfWm8+xursGeuEDQfZEvUhCvbwf2RFcfdERdUwdprnwnInsPw60+BZY
 lU/U/rke9rTwBV+0TEEv0aL/7R817sjxfZdfZfjFGo4AWZMhiWNLjrIF9
 HKhnfQyUTIISzNoN3Ri9VzzSPSTk/cg72jGyzgyOTxVdP+j5ygtRzBajy
 vNjO2CmIPL5RQxACQ7ykETZPlE4vyqgHvV5hz8+UW9k6UeFqrAGu8VxMv Q==;
X-CSE-ConnectionGUID: eiqOWvhyT8iY7U8XA0NGqw==
X-CSE-MsgGUID: V6Hc872iR0qjj4+BHxMhpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67500115"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67500115"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 08:40:30 -0800
X-CSE-ConnectionGUID: Mt8twLnwTZei774UHCsomg==
X-CSE-MsgGUID: Vkdh04VMSxKOGGV38Y3Agw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="201314903"
Received: from krybak-mobl1.ger.corp.intel.com (HELO mkuoppal-desk.lan)
 ([10.245.246.5])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 08:40:28 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 2/3] lib/xe/xe_eudebug: Make sure debugger drains events
Date: Thu, 11 Dec 2025 18:40:19 +0200
Message-ID: <20251211164020.1065880-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211164020.1065880-1-mika.kuoppala@linux.intel.com>
References: <20251211164020.1065880-1-mika.kuoppala@linux.intel.com>
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
---
 lib/xe/xe_eudebug.c             | 66 ++++++++++++++++++++++++---------
 lib/xe/xe_eudebug.h             |  7 ++--
 tests/intel/xe_eudebug_online.c |  4 +-
 3 files changed, 54 insertions(+), 23 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 0f09bc8a1..7c2c9505d 100644
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
index f1a2da4d8..ef9dacf0d 100644
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
index ff6c5ff19..e59b99ee9 100644
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

