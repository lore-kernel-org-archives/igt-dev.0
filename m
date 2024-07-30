Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C150C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A6B10E513;
	Tue, 30 Jul 2024 11:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ILurHPk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D695C10E516
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340177; x=1753876177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S6MZv2oNV+hK5npuqSLPcIrP3/1xThRj25OywL2QLjo=;
 b=ILurHPk+6dBMbgdxErphqMB8HY3ZEhpHgT9C28LClOzVVw8B3lhUqTMR
 HVQ09yOelxMe2FizfgfKOyhydiZqN4+85h0f9f22wlJ8Vme2P4vEmPAio
 V7kBOrvJT3uNDmnlu/LexW8bVuXBWjr/mJ5OZznrr10Sy5tXWqgu7PLi0
 oWps5y1gW7CHiW9Kd+HUy+bKSbBRtDXi7OCUO0NR1Y4G8nXmw12VWaFCF
 Dx3vs3/lkrb+nOAHW1joR1pdWOLH43Yxj194hFMgLF2NWc3pybATNV3z/
 jmmcDFQes9uwPkAHFB1qa84/QjY+5EvFeFgKy4HSxIrFyXomrcBeXIaZD g==;
X-CSE-ConnectionGUID: MJ552hhfSRWamD1phR8ruA==
X-CSE-MsgGUID: ip3e5qUqRsayvntpP9VRdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20286751"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20286751"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:37 -0700
X-CSE-ConnectionGUID: ftgZK2fLQrO0V3ukdMudXg==
X-CSE-MsgGUID: LFTGMd2MTui3AKhzqWuHDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217654"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:34 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH i-g-t v2 58/66] tests/xe_eudebug_online: Add
 interrupt-reconnect test
Date: Tue, 30 Jul 2024 13:45:15 +0200
Message-Id: <20240730114523.334156-59-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730114523.334156-1-christoph.manszewski@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
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

From: Karolina Stolarek <karolina.stolarek@intel.com>

Introduce interrupt-reconnect test case where the debugger is
closed and reopened on attention event. Check if the workload
is reset when there is no active debugger detected.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug_online.c | 126 +++++++++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index c101bde2f..9f55cec74 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -22,11 +22,14 @@
 
 #define SHADER_BREAKPOINT	(1 << 0)
 #define SHADER_LOOP		(1 << 1)
+#define TRIGGER_RECONNECT	(1 << 27)
 #define TRIGGER_RESUME_SET_BP	(1 << 28)
 #define TRIGGER_RESUME_DELAYED	(1 << 29)
 #define TRIGGER_RESUME_DSS	(1 << 30)
 #define TRIGGER_RESUME_ONE	(1 << 31)
 
+#define DEBUGGER_REATTACHED	1
+
 #define STEERING_END_LOOP	0xdeadca11
 
 #define SHADER_CANARY 0x01010101
@@ -682,9 +685,12 @@ static void run_online_client(struct xe_eudebug_client *c)
 
 	intel_bb_sync(ibb);
 
-	/* Make sure it wasn't the timeout. */
-	igt_assert(igt_nsec_elapsed(&ts) <
-		   XE_EUDEBUG_DEFAULT_TIMEOUT_MS / MSEC_PER_SEC * NSEC_PER_SEC);
+	if (c->flags & TRIGGER_RECONNECT)
+		xe_eudebug_client_wait_stage(c, DEBUGGER_REATTACHED);
+	else
+		/* Make sure it wasn't the timeout. */
+		igt_assert(igt_nsec_elapsed(&ts) <
+			   XE_EUDEBUG_DEFAULT_TIMEOUT_MS / MSEC_PER_SEC * NSEC_PER_SEC);
 
 	ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size, PROT_READ);
 	data->threads_count = count_canaries_neq(ptr, w_dim, 0);
@@ -1158,6 +1164,117 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 	online_debug_data_destroy(data);
 }
 
+static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
+						 struct drm_xe_eudebug_event *event)
+{
+	struct online_debug_data *data = d->ptr;
+	unsigned int max_size;
+	uint64_t c_pid;
+	int ret;
+
+	c_pid = d->target_pid;
+
+	/* Reset VM data so the re-triggered VM open handler works properly */
+	data->vm_fd = -1;
+
+	xe_eudebug_debugger_dettach(d);
+
+	/* Let the KMD scan function notice unhandled EU attention */
+	sleep(1);
+
+	/*
+	 * New session that is created by EU debugger on reconnect restarts
+	 * seqno, causing isses with log sorting. To avoid that, create
+	 * a new event log.
+	 */
+	max_size = d->log->max_size;
+	xe_eudebug_event_log_destroy(d->log);
+	d->log = xe_eudebug_event_log_create("debugger-reconnect", max_size);
+
+	ret = xe_eudebug_connect(d->master_fd, c_pid, 0);
+	igt_assert(ret >= 0);
+	d->fd = ret;
+	d->target_pid = c_pid;
+
+	/* Let the discovery worker discover resources */
+	sleep(2);
+
+	xe_eudebug_debugger_signal_stage(d, DEBUGGER_REATTACHED);
+}
+
+/**
+ * SUBTEST: interrupt-reconnect
+ * Description:
+ *	Schedules EU workload which should last about a few seconds,
+ *	interrupts all threads and detaches debugger when attention is
+ *	raised. The test checks if KMD resets the workload when there's
+ *	no debugger attached and does the event playback on discovery.
+ */
+static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+{
+	struct drm_xe_eudebug_event *e = NULL;
+	struct online_debug_data *data;
+	struct xe_eudebug_session *s;
+	uint32_t val;
+
+	data = online_debug_data_create(hwe);
+	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_OPEN,
+					open_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
+					exec_queue_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_debug_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_debugger_detach_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_METADATA,
+					create_metadata_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					ufence_ack_trigger);
+
+	igt_assert_eq(xe_eudebug_debugger_attach(s->d, s->c), 0);
+	xe_eudebug_debugger_start_worker(s->d);
+	xe_eudebug_client_start(s->c);
+
+	/* wait for workload to start */
+	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
+		/* collect needed data from triggers */
+		if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data->target_size) == 0)
+			continue;
+
+		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset) == sizeof(val))
+			if (val != 0)
+				break;
+	}
+
+	pthread_mutex_lock(&data->mutex);
+	igt_assert(data->client_handle != -1);
+	igt_assert(data->exec_queue_handle != -1);
+	eu_ctl_interrupt_all(s->d->fd, data->client_handle,
+			     data->exec_queue_handle, data->lrc_handle);
+	pthread_mutex_unlock(&data->mutex);
+
+	xe_eudebug_client_wait_done(s->c);
+
+	xe_eudebug_debugger_stop_worker(s->d, 1);
+
+	xe_eudebug_event_log_print(s->d->log, true);
+	xe_eudebug_event_log_print(s->c->log, true);
+
+	xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
+					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
+					  XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
+
+	/* We expect workload reset, so no attention should be raised */
+	xe_eudebug_for_each_event(e, s->d->log)
+		igt_assert(e->type != DRM_XE_EUDEBUG_EVENT_EU_ATTENTION);
+
+	xe_eudebug_session_destroy(s);
+	online_debug_data_destroy(data);
+}
+
 static struct drm_xe_engine_class_instance *pick_compute(int fd, int gt)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -1220,6 +1337,9 @@ igt_main
 	test_gt_render_or_compute("reset-with-attention", fd, hwe)
 		test_reset_with_attention_online(fd, hwe, SHADER_BREAKPOINT);
 
+	test_gt_render_or_compute("interrupt-reconnect", fd, hwe)
+		test_interrupt_reconnect(fd, hwe, SHADER_LOOP | TRIGGER_RECONNECT);
+
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 
-- 
2.34.1

