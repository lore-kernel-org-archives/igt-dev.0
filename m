Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6141C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E6410E432;
	Mon, 29 Jul 2024 16:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maw1SEJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423D510E434
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269149; x=1753805149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IT4oIEfQC3FvLfUWEqfKiL++a6Qo3uwN06T2g5Afq9g=;
 b=maw1SEJ6eKSyFQ4I6mFodKoA/t5Ld7qllvgu+RbbcykHmRvDBxUAnH/Y
 6aKIlJaV4pZbmchZn7rcHjEjssGmIYHvM87ySJNI8OO9a69QQJRgw99XP
 sGpniZ13hQ30a80Uz54cadT0sUY7q0nsQiHHsvQrn2KGIfosoJQmxocQ8
 C5kQ80qd4wpRHjZeMwDJDZf9eb+iQtnnkUqIfng3+chMnQ5dk3fTc9yn4
 6g2QrMaSOeado2AWVGwk9J07/cbbTxt4PMPqCabgTKvSRVeXrpDisQpAi
 oKGazkubjrEzX0q3F9D2aj32C+xmU6BQl1cuLHnt41C0g/wGqn1YDlby/ g==;
X-CSE-ConnectionGUID: otozyARDRWG2JUTRpxok7g==
X-CSE-MsgGUID: zLFN6chYStO14gkpmfA/nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427919"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427919"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:34 -0700
X-CSE-ConnectionGUID: Fc50qpWXQfKLrmEo0dsOWA==
X-CSE-MsgGUID: Fg48TiYjTh6LVMM/1Acrfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53739892"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:31 -0700
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
Subject: [PATCH 61/66] tests/xe_eudebug_online: Adds debugger-reopen test
Date: Mon, 29 Jul 2024 18:01:54 +0200
Message-Id: <20240729160159.37036-62-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>

Introducing a test which will close and reopen the debugger after
resume on each breakpoint to make sure that the debugger is able to
capture the further events after reopening it.

Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 68 +++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 8361b6db4..c3c82b061 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -25,6 +25,7 @@
 #define SHADER_SINGLE_STEP		(1 << 2)
 #define SIP_SINGLE_STEP			(1 << 3)
 #define DISABLE_DEBUG_MODE		(1 << 4)
+#define SHADER_N_NOOP_BREAKPOINT	(1 << 5)
 #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
 #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
 #define TRIGGER_RECONNECT		(1 << 27)
@@ -35,6 +36,7 @@
 
 #define DEBUGGER_REATTACHED	1
 
+#define SHADER_LOOP_N		3
 #define SINGLE_STEP_COUNT	16
 #define STEERING_SINGLE_STEP	0
 #define STEERING_CONTINUE	0x00c0ffee
@@ -128,6 +130,11 @@ static struct gpgpu_shader *get_shader(int fd, const unsigned int flags)
 		gpgpu_shader__breakpoint(shader);
 		for (int i = 0; i < SINGLE_STEP_COUNT; i++)
 			gpgpu_shader__nop(shader);
+	} else if (flags & SHADER_N_NOOP_BREAKPOINT) {
+		for (int i = 0; i < SHADER_LOOP_N; i++) {
+			gpgpu_shader__nop(shader);
+			gpgpu_shader__breakpoint(shader);
+		}
 	}
 
 	gpgpu_shader__eot(shader);
@@ -525,6 +532,7 @@ static int get_stepped_threads_count(struct online_debug_data *data, int threads
 }
 
 #define MAX_PREEMPT_TIMEOUT 10ull
+static int is_client_resumed;
 static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 					struct drm_xe_eudebug_event *e)
 {
@@ -583,6 +591,7 @@ static void eu_attention_resume_trigger(struct xe_eudebug_debugger *d,
 						    att->exec_queue_handle, att->lrc_handle,
 						    bitmask, att->bitmask_size);
 
+	is_client_resumed = 1;
 	free(bitmask);
 }
 
@@ -881,8 +890,8 @@ static void run_online_client(struct xe_eudebug_client *c)
 	data->threads_count = count_canaries_neq(ptr, w_dim, 0);
 	igt_assert_f(data->threads_count, "No canaries found, nothing executed?\n");
 
-	if ((c->flags & SHADER_BREAKPOINT || c->flags & TRIGGER_RESUME_SET_BP) &&
-	    !(c->flags & DISABLE_DEBUG_MODE)) {
+	if ((c->flags & SHADER_BREAKPOINT || c->flags & TRIGGER_RESUME_SET_BP ||
+	     c->flags & SHADER_N_NOOP_BREAKPOINT) && !(c->flags & DISABLE_DEBUG_MODE)) {
 		uint32_t aip = ptr[0];
 
 		igt_assert_f(aip != SHADER_CANARY, "Workload executed but breakpoint not hit!\n");
@@ -1375,7 +1384,8 @@ static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
 	xe_eudebug_debugger_dettach(d);
 
 	/* Let the KMD scan function notice unhandled EU attention */
-	sleep(1);
+	if (!(d->flags & SHADER_N_NOOP_BREAKPOINT))
+		sleep(1);
 
 	/*
 	 * New session that is created by EU debugger on reconnect restarts
@@ -1394,7 +1404,8 @@ static void eu_attention_debugger_detach_trigger(struct xe_eudebug_debugger *d,
 	/* Let the discovery worker discover resources */
 	sleep(2);
 
-	xe_eudebug_debugger_signal_stage(d, DEBUGGER_REATTACHED);
+	if (!(d->flags & SHADER_N_NOOP_BREAKPOINT))
+		xe_eudebug_debugger_signal_stage(d, DEBUGGER_REATTACHED);
 }
 
 /**
@@ -1510,6 +1521,52 @@ static void test_single_step(int fd, struct drm_xe_engine_class_instance *hwe, i
 	online_debug_data_destroy(data);
 }
 
+static int debugger_detach_count;
+static void eu_attention_debugger_ndetach_trigger(struct xe_eudebug_debugger *d,
+						 struct drm_xe_eudebug_event *event)
+{
+	if (debugger_detach_count < (SHADER_LOOP_N - 1)) {
+		/* Make sure the resume command has issued before detaching the debugger */
+		if (!is_client_resumed)
+			return;
+		eu_attention_debugger_detach_trigger(d, event);
+		debugger_detach_count++;
+	} else {
+		igt_debug("Reached Nth breakpoint hence preventing the debugger detach\n");
+	}
+	is_client_resumed = 0;
+}
+
+/**
+ * SUBTEST: debugger-reopen
+ * Description:
+ *	Check whether the debugger is able to reopen the connection and
+ *	capture the events of already running client.
+ */
+static void test_debugger_reopen(int fd, struct drm_xe_engine_class_instance *hwe, int flags)
+{
+	struct xe_eudebug_session *s;
+	struct online_debug_data *data;
+
+	data = online_debug_data_create(hwe);
+
+	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
+
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_debug_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_resume_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
+					eu_attention_debugger_ndetach_trigger);
+	xe_eudebug_debugger_add_trigger(s->d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
+					ufence_ack_trigger);
+
+	xe_eudebug_session_run(s);
+
+	xe_eudebug_session_destroy(s);
+	online_debug_data_destroy(data);
+}
+
 static struct drm_xe_engine_class_instance *pick_compute(int fd, int gt)
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -1586,6 +1643,9 @@ igt_main
 		test_single_step(fd, hwe, SHADER_SINGLE_STEP | SIP_SINGLE_STEP |
 				 TRIGGER_RESUME_SINGLE_WALK);
 
+	test_gt_render_or_compute("debugger-reopen", fd, hwe)
+		test_debugger_reopen(fd, hwe, SHADER_N_NOOP_BREAKPOINT);
+
 	igt_fixture {
 		xe_eudebug_enable(fd, was_enabled);
 
-- 
2.34.1

