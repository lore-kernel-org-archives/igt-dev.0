Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59C4CFD376
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 14:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65DA10E8FF;
	Fri, 28 Nov 2025 14:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQMgYtAS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821B910E914
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764339271; x=1795875271;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=0cYMNv6pK0sKffXPeyoklbrgcb19Jc0rD0An3PfHDrA=;
 b=AQMgYtASENG7YoOsRUz+2zlnzGCLAVkwJk28hJ/fNK4L5Ge2Fr1nd1Sq
 NezjTMbJkKf+lDTwKcw05eya3ObRyGa8Ylz2TMeNgOZHIvQtoh8UUb7Cr
 jjQ5qTpN5RenpxYZ0cLrAvMfmvxKgWdky15Cjg/6/SZxvDxvQb9zQqb7p
 PFufnnIEB4OAPwxVrKXgrghYeyRRGatdjRw0jbDm+3N6M5rtw/UWsDqY1
 tZF0ENn/KKSzZOmoUL0aWwuMvmsmd6SW67c26CvaY20PiXy2o3jybTbpB
 EbIv9x7orzyPsPvBZen8WM79okC+0wXauItrHIUMfv00agN7VxtSaCWHF A==;
X-CSE-ConnectionGUID: QaEHcPTOSHqWjtCPc6BhdQ==
X-CSE-MsgGUID: O+HvN2lkQ8KJEk74XsJQyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66261613"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="66261613"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:31 -0800
X-CSE-ConnectionGUID: jyghKDdrRB+6UjSTXYvolg==
X-CSE-MsgGUID: 2f+d1PTwRl6NyiyLdw3AbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224173678"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:30 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 28 Nov 2025 15:12:11 +0100
Subject: [PATCH 07/11] tests/intel/xe_eudebug_online: add fd and flags to
 online_debug_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-pagefault-one-of-many-v1-7-a8377a93da8f@intel.com>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
In-Reply-To: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Jan Maslak <jan.maslak@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=8194;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=0cYMNv6pK0sKffXPeyoklbrgcb19Jc0rD0An3PfHDrA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpKa31gR/u1IN9fOqfq6aidxSUHwcbAjCLVGPnY
 hQc5jXE/SWJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSmt9QAKCRAjYrKT3hD9
 12vWC/9SbfsZCbW7L4TmozkE/2eu7uOYu+PytlanHyNKHDEmbWVfWANutYGJ9FMxhOZrDgDdJyR
 FjpwxuQ2gVwD7FpeIoDLWfEf3hzfeWmP2S/R62x8JNHUeqNEOpCcxHCb1DhcAaVoxBmduTDqH1q
 rLhaI3JUjCPF5ytznkW1nDFM1MrjVqUPMjD3jAurNtE4/A0GEwbdEJ9OYJnpIt6pHY5o8rXIrAQ
 DFGfCCofEs1LnfBzmKj1NTcoWcQ0E6GeqPLd1VWO74tb+Dxh7DCWfwFHDFY1FogKMmAPl/AgWOh
 JDe8JQmFp53tPGDIoHaSkuXnl04QUz39n3Djzy7f4hsc1A9fUkAT5EeMlCWyMVNOsQhiIW9No9y
 Q1Y7sf1Q7cm6M+0S6NxNyc4P5VhNIjTpLxAyFhHzCdwWEBB6io00OWjWIx7z6CqcVVRPRKMOp6z
 ewLBUoK4IwPsUKwrU3b/wjZM5ikwueAARXHXzNgSiUq7WpV5r8y2am8FabFC8cPEIgFpE=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Some helpers (get_shader, get_number_of_threads) will need more input
arguments, also some data can be cached instead of constant recalculation.
online_debug_data is a good candidate for both purposes. For starters
let's cache there most common inupt arguments.
This patch does not add functional changes.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_eudebug_online.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 3ed079b74216..e3aa13a39082 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -377,7 +377,9 @@ static inline uint64_t eu_ctl_interrupt_all(int debugfd, uint64_t client,
 struct online_debug_data {
 	pthread_mutex_t mutex;
 	/* client in */
+	int drm_fd;
 	struct drm_xe_engine_class_instance hwe;
+	uint64_t flags;
 	/* client out */
 	int threads_count;
 	/* debugger internals */
@@ -402,7 +404,7 @@ struct online_debug_data {
 };
 
 static struct online_debug_data *
-online_debug_data_create(struct drm_xe_engine_class_instance *hwe)
+online_debug_data_create(int drm_fd, struct drm_xe_engine_class_instance *hwe, uint64_t flags)
 {
 	struct online_debug_data *data;
 
@@ -410,7 +412,9 @@ online_debug_data_create(struct drm_xe_engine_class_instance *hwe)
 		    PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(data);
 
+	data->drm_fd = drm_fd;
 	memcpy(&data->hwe, hwe, sizeof(*hwe));
+	data->flags = flags;
 	pthread_mutex_init(&data->mutex, NULL);
 	data->client_handle = -1ULL;
 	data->exec_queue_handle = -1ULL;
@@ -1439,7 +1443,7 @@ static void test_basic_online(int fd, struct drm_xe_engine_class_instance *hwe,
 	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 
-	data = online_debug_data_create(hwe);
+	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
@@ -1475,7 +1479,7 @@ static void test_set_breakpoint_online(int fd, struct drm_xe_engine_class_instan
 
 	igt_require(!(flags & FAULTABLE_VM) || !xe_supports_faults(fd));
 
-	data = online_debug_data_create(hwe);
+	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
 					open_trigger);
@@ -1538,7 +1542,7 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 		sleep_time = rand() % max_sleep_time;
 		igt_debug("Loop %d: SIGINT after %" PRIu64 " us\n", loop_count, sleep_time);
 
-		data = online_debug_data_create(hwe);
+		data = online_debug_data_create(fd, hwe, flags);
 		s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 		s->client->allow_dead_client = true;
 		xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
@@ -1632,7 +1636,7 @@ static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *h
 	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 
-	data = online_debug_data_create(hwe);
+	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
@@ -1672,7 +1676,7 @@ static void test_preemption(int fd, struct drm_xe_engine_class_instance *hwe)
 	struct online_debug_data *data;
 	struct xe_eudebug_client *other;
 
-	data = online_debug_data_create(hwe);
+	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 	other = xe_eudebug_client_create(fd, run_online_client, SHADER_NOP, data);
 
@@ -1717,7 +1721,7 @@ static void test_reset_with_attention_online(int fd, struct drm_xe_engine_class_
 	struct xe_eudebug_session *s1, *s2;
 	struct online_debug_data *data;
 
-	data = online_debug_data_create(hwe);
+	data = online_debug_data_create(fd, hwe, flags);
 	s1 = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s1->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
@@ -1771,7 +1775,7 @@ static void test_interrupt_all(int fd, struct drm_xe_engine_class_instance *hwe,
 
 	igt_require(!(flags & FAULTABLE_VM) || !xe_supports_faults(fd));
 
-	data = online_debug_data_create(hwe);
+	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
@@ -1862,7 +1866,7 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	int debugee_flags = SHADER_LOOP | DO_NOT_EXPECT_CANARIES;
 	int val;
 
-	data = online_debug_data_create(hwe);
+	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN, open_trigger);
@@ -1892,7 +1896,7 @@ static void test_interrupt_other(int fd, struct drm_xe_engine_class_instance *hw
 	xe_eudebug_debugger_detach(s->debugger);
 	reset_debugger_log(s->debugger);
 
-	debugee_data = online_debug_data_create(hwe);
+	debugee_data = online_debug_data_create(fd, hwe, flags);
 	s->debugger->ptr = debugee_data;
 	debugee = xe_eudebug_client_create(fd, run_online_client, debugee_flags, debugee_data);
 	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, debugee), 0);
@@ -1953,7 +1957,7 @@ static void test_tdctl_parameters(int fd, struct drm_xe_engine_class_instance *h
 
 	igt_assert(attention_bitmask);
 
-	data = online_debug_data_create(hwe);
+	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
@@ -2103,7 +2107,7 @@ static void test_interrupt_reconnect(int fd, struct drm_xe_engine_class_instance
 	struct xe_eudebug_session *s;
 	uint32_t val;
 
-	data = online_debug_data_create(hwe);
+	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
@@ -2182,7 +2186,7 @@ static void test_single_step(int fd, struct drm_xe_engine_class_instance *hwe, i
 	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 
-	data = online_debug_data_create(hwe);
+	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
@@ -2232,7 +2236,7 @@ static void test_debugger_reopen(int fd, struct drm_xe_engine_class_instance *hw
 	struct xe_eudebug_session *s;
 	struct online_debug_data *data;
 
-	data = online_debug_data_create(hwe);
+	data = online_debug_data_create(fd, hwe, flags);
 
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
@@ -2283,7 +2287,7 @@ static void test_caching(int fd, struct drm_xe_engine_class_instance *hwe, int f
 	if (flags & SHADER_CACHING_VRAM || flags & BB_IN_VRAM || flags & TARGET_IN_VRAM)
 		igt_skip_on_f(!xe_has_vram(fd), "Device does not have VRAM.\n");
 
-	data = online_debug_data_create(hwe);
+	data = online_debug_data_create(fd, hwe, flags);
 	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
 
 	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_OPEN,
@@ -2411,7 +2415,7 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
 	igt_require_f(n > 1, "Test requires at least two parallel compute engines!\n");
 
 	for (i = 0; i < n; i++) {
-		data[i] = online_debug_data_create(hwe[i]);
+		data[i] = online_debug_data_create(fd, hwe[i], flags);
 		s[i] = xe_eudebug_session_create(fd, run_online_client, flags, data[i]);
 
 		xe_eudebug_debugger_add_trigger(s[i]->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,

-- 
2.43.0

