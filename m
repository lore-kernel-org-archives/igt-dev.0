Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA42CCD18E
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 09:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1666210E58B;
	Tue, 14 Oct 2025 09:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8ZiAtlo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A38510E58B
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 09:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760434758; x=1791970758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2aF+rknyh8a3ogaByHr5BpZNRxNvrvZ4toWSvA7zI4A=;
 b=h8ZiAtloEsz1EjvDZCqZYCqr1KEspgPfhLMFFv0rGV+9qprESObKTObY
 6M4ClMnKmXmaKHPkHBFfAyQk10PoZerkg6FaryxvbsfLP91Fs3xcClwIB
 N6oWllhJAfO0nt+S8iWMLvHG2AtO34rwP6R39uj64fNKyP8qRNGNn0Zbb
 /rDsT/eXeJm3HvV9RUWNuZ+bqdwACaYL54zEwjtPABRHthU3pZihpojwS
 AMAO0810cXzXtG7KNQmwoN3seChODunZhZquP9wFqVpPz5tEhlAunoggO
 Z6ZMXBKdYSi0bC8SCmUxygkpTUiWakMb8ESSeKwMMTdR41W6B2kCCgGg0 A==;
X-CSE-ConnectionGUID: 2MEdSGj+QBSSsAdRsL9lxQ==
X-CSE-MsgGUID: WrD0ySfzR0i1GEDzbx9/zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73192509"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73192509"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:18 -0700
X-CSE-ConnectionGUID: nuJ4ar51T/iHs81H+NEwNg==
X-CSE-MsgGUID: 7TcWnUdoTNaCHH7YCfDs/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181066516"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.244.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:17 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 7/7] lib/xe/xe_eudebug: Don't take timeout for debugger
 stop
Date: Tue, 14 Oct 2025 12:38:48 +0300
Message-ID: <20251014093848.2394531-8-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
References: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
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

The worker expects certain poll intervals. Forcing stop in arbitrary
granularity will wreck the assumptions on poll timeouts for worker
graceful exit.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c             |  8 ++++----
 lib/xe/xe_eudebug.h             |  2 +-
 tests/intel/xe_eudebug.c        | 16 ++++++++--------
 tests/intel/xe_eudebug_online.c | 12 ++++++------
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 68ab9dc320..c3a3207aa5 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1252,7 +1252,7 @@ static void debugger_destroy_triggers(struct xe_eudebug_debugger *d)
 void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d)
 {
 	if (d->worker_state != DEBUGGER_WORKER_INACTIVE)
-		xe_eudebug_debugger_stop_worker(d, 1);
+		xe_eudebug_debugger_stop_worker(d);
 
 	if (d->target_pid)
 		xe_eudebug_debugger_detach(d);
@@ -1389,9 +1389,9 @@ void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d)
  *
  * Stops the debugger worker. Event log is sorted by seqno after closure.
  */
-void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d,
-				     int timeout_s)
+void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d)
 {
+	const int timeout_s = 3;
 	struct timespec t = {};
 	int ret;
 
@@ -1715,7 +1715,7 @@ void xe_eudebug_session_run(struct xe_eudebug_session *s)
 	xe_eudebug_client_start(client);
 	xe_eudebug_client_wait_done(client);
 
-	xe_eudebug_debugger_stop_worker(debugger, 1);
+	xe_eudebug_debugger_stop_worker(debugger);
 
 	xe_eudebug_event_log_print(debugger->log, true);
 	xe_eudebug_event_log_print(client->log, true);
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 2a0110fe92..f1a2da4d84 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -194,7 +194,7 @@ xe_eudebug_debugger_create(int xe, uint64_t flags, void *data);
 void xe_eudebug_debugger_destroy(struct xe_eudebug_debugger *d);
 int xe_eudebug_debugger_attach(struct xe_eudebug_debugger *d, struct xe_eudebug_client *c);
 void xe_eudebug_debugger_start_worker(struct xe_eudebug_debugger *d);
-void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d, int timeout_s);
+void xe_eudebug_debugger_stop_worker(struct xe_eudebug_debugger *d);
 void xe_eudebug_debugger_detach(struct xe_eudebug_debugger *d);
 void xe_eudebug_debugger_set_data(struct xe_eudebug_debugger *c, void *ptr);
 void xe_eudebug_debugger_add_trigger(struct xe_eudebug_debugger *d, int type,
diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 4a2c436350..59aca526e6 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1015,7 +1015,7 @@ static void test_basic_discovery(int fd, unsigned int flags, bool match_opposite
 
 	xe_eudebug_client_wait_done(c);
 
-	xe_eudebug_debugger_stop_worker(d, 1);
+	xe_eudebug_debugger_stop_worker(d);
 
 	xe_eudebug_event_log_print(d->log, true);
 	xe_eudebug_event_log_print(c->log, true);
@@ -1155,7 +1155,7 @@ static void *discovery_race_thread(void *data)
 			igt_assert(READ_ONCE(s->debugger->event_count));
 			}
 
-			xe_eudebug_debugger_stop_worker(s->debugger, 1);
+			xe_eudebug_debugger_stop_worker(s->debugger);
 
 			igt_debug("Resources discovered: %" PRIu64 "\n", s->debugger->event_count);
 			if (!s->client->done) {
@@ -1225,7 +1225,7 @@ static void *discovery_race_thread(void *data)
 		if (READ_ONCE(s->debugger->event_count) != expected)
 			sleep(5);
 
-		xe_eudebug_debugger_stop_worker(s->debugger, 1);
+		xe_eudebug_debugger_stop_worker(s->debugger);
 		xe_eudebug_debugger_detach(s->debugger);
 	}
 
@@ -1304,7 +1304,7 @@ static void *attach_dettach_thread(void *data)
 
 		if (random() % 2 == 0) {
 			xe_eudebug_debugger_start_worker(s->debugger);
-			xe_eudebug_debugger_stop_worker(s->debugger, 1);
+			xe_eudebug_debugger_stop_worker(s->debugger);
 		}
 
 		xe_eudebug_debugger_detach(s->debugger);
@@ -1343,7 +1343,7 @@ static void test_empty_discovery(int fd, unsigned int flags, int clients)
 		igt_assert_eq(xe_eudebug_debugger_attach(s[i]->debugger, s[i]->client), 0);
 
 		xe_eudebug_debugger_start_worker(s[i]->debugger);
-		xe_eudebug_debugger_stop_worker(s[i]->debugger, 5);
+		xe_eudebug_debugger_stop_worker(s[i]->debugger);
 		xe_eudebug_debugger_detach(s[i]->debugger);
 
 		igt_assert_eq(s[i]->debugger->event_count, expected);
@@ -2190,7 +2190,7 @@ static void test_basic_ufence(int fd, unsigned int flags)
 	}
 
 	xe_eudebug_client_wait_done(c);
-	xe_eudebug_debugger_stop_worker(d, 1);
+	xe_eudebug_debugger_stop_worker(d);
 
 	xe_eudebug_event_log_print(d->log, true);
 	xe_eudebug_event_log_print(c->log, true);
@@ -2485,7 +2485,7 @@ static void test_vm_bind_clear(int fd, uint32_t flags)
 	xe_eudebug_client_start(s->client);
 
 	xe_eudebug_client_wait_done(s->client);
-	xe_eudebug_debugger_stop_worker(s->debugger, 1);
+	xe_eudebug_debugger_stop_worker(s->debugger);
 
 	igt_assert_eq(priv->bind_count, priv->unbind_count);
 	igt_assert_eq(priv->sum * 2, priv->bind_count);
@@ -2715,7 +2715,7 @@ static void test_vma_ufence(int fd, unsigned int flags)
 	xe_eudebug_client_start(s->client);
 
 	xe_eudebug_client_wait_done(s->client);
-	xe_eudebug_debugger_stop_worker(s->debugger, 1);
+	xe_eudebug_debugger_stop_worker(s->debugger);
 
 	xe_eudebug_event_log_print(s->debugger->log, true);
 	xe_eudebug_event_log_print(s->client->log, true);
diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 4c6c31da3a..e1516c202f 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1712,7 +1712,7 @@ static void test_preemption(int fd, struct drm_xe_engine_class_instance *hwe)
 	xe_eudebug_client_wait_done(s->client);
 	xe_eudebug_client_wait_done(other);
 
-	xe_eudebug_debugger_stop_worker(s->debugger, 1);
+	xe_eudebug_debugger_stop_worker(s->debugger);
 
 	xe_eudebug_session_destroy(s);
 	xe_eudebug_client_destroy(other);
@@ -1831,7 +1831,7 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
 
 	xe_eudebug_client_wait_done(s->client);
 
-	xe_eudebug_debugger_stop_worker(s->debugger, 1);
+	xe_eudebug_debugger_stop_worker(s->debugger);
 
 	xe_eudebug_event_log_print(s->debugger->log, true);
 	xe_eudebug_event_log_print(s->client->log, true);
@@ -1938,7 +1938,7 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	xe_force_gt_reset_async(s->debugger->master_fd, debugee_data->hwe.gt_id);
 
 	xe_eudebug_client_wait_done(debugee);
-	xe_eudebug_debugger_stop_worker(s->debugger, 1);
+	xe_eudebug_debugger_stop_worker(s->debugger);
 
 	xe_eudebug_event_log_print(s->debugger->log, true);
 	xe_eudebug_event_log_print(debugee->log, true);
@@ -2052,7 +2052,7 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 
 	xe_eudebug_client_wait_done(s->client);
 
-	xe_eudebug_debugger_stop_worker(s->debugger, 1);
+	xe_eudebug_debugger_stop_worker(s->debugger);
 
 	xe_eudebug_event_log_print(s->debugger->log, true);
 	xe_eudebug_event_log_print(s->client->log, true);
@@ -2163,7 +2163,7 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
 
 	xe_eudebug_client_wait_done(s->client);
 
-	xe_eudebug_debugger_stop_worker(s->debugger, 1);
+	xe_eudebug_debugger_stop_worker(s->debugger);
 
 	xe_eudebug_event_log_print(s->debugger->log, true);
 	xe_eudebug_event_log_print(s->client->log, true);
@@ -2497,7 +2497,7 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
 
 	for (i = 0; i < n; i++) {
 		xe_eudebug_client_wait_done(s[i]->client);
-		xe_eudebug_debugger_stop_worker(s[i]->debugger, 1);
+		xe_eudebug_debugger_stop_worker(s[i]->debugger);
 
 		xe_eudebug_event_log_print(s[i]->debugger->log, true);
 		online_session_check(s[i], flags);
-- 
2.43.0

