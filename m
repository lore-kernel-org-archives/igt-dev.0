Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9249C3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 16:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F0610E420;
	Mon, 29 Jul 2024 16:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NcN9Kas6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF4310E420
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 16:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722269146; x=1753805146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kEdIixnlp9ftYTAmvJX97HvSF3PxXT+4h6Ye16Py9tc=;
 b=NcN9Kas6E/aBXMiQJKoNRbjK8Z/zWW4BUwqPn2q1bVsGJAXHhjznQyKJ
 bHtGXZ9Rzr21POzl5QIiDRrGW9k33uPEWu7dC63QFz0eG7nx9Peq42l8z
 KPRFsGuTLDdYi9eQX8IeSSi2A/liiELH5zkDYaV1A8loSRMJNkUEodgNv
 r+nDRsImvOVTGeT/4tn5bpZ74y+TA9PyoWGhdNePTV6Xol5fdpLqWZ7Bb
 mV5QpKq4/0RPLUoI/8YY+1yTVyc7IjKt663rD0fgWQeDfQVyC45VtmhF2
 fs1El/HA07Z3d0CRMCmzd2s/JaXSo24/PdXrSD1CtllIBOP5LKZh546Hy Q==;
X-CSE-ConnectionGUID: czwpM/uOSJSK0Lt+5zLg1A==
X-CSE-MsgGUID: L7XZDUHAQBeD0USeztMlIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="31427897"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="31427897"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:31 -0700
X-CSE-ConnectionGUID: e6DEjzSySvKFEjUM92CE4Q==
X-CSE-MsgGUID: iX2C00KnQcWtdqvA2PgT9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53739867"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 09:05:27 -0700
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH 60/66] tests/xe_eudebug_online: What if user does not set
 debug mode?
Date: Mon, 29 Jul 2024 18:01:53 +0200
Message-Id: <20240729160159.37036-61-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729160159.37036-1-christoph.manszewski@intel.com>
References: <20240729160159.37036-1-christoph.manszewski@intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Implement test proving that workload is terminated if we hit
exception without having exec queue in debug mode.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index cabe2101e..8361b6db4 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -24,6 +24,7 @@
 #define SHADER_LOOP			(1 << 1)
 #define SHADER_SINGLE_STEP		(1 << 2)
 #define SIP_SINGLE_STEP			(1 << 3)
+#define DISABLE_DEBUG_MODE		(1 << 4)
 #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
 #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
 #define TRIGGER_RECONNECT		(1 << 27)
@@ -813,7 +814,7 @@ static void run_online_client(struct xe_eudebug_client *c)
 		.instances = to_user_pointer(&hwe),
 		.width = 1,
 		.num_placements = 1,
-		.extensions = to_user_pointer(&ext)
+		.extensions = c->flags & DISABLE_DEBUG_MODE ? 0 : to_user_pointer(&ext)
 	};
 	struct dim_t w_dim = walker_dimensions(threads);
 	struct dim_t s_dim = surface_dimensions(threads);
@@ -880,7 +881,8 @@ static void run_online_client(struct xe_eudebug_client *c)
 	data->threads_count = count_canaries_neq(ptr, w_dim, 0);
 	igt_assert_f(data->threads_count, "No canaries found, nothing executed?\n");
 
-	if (c->flags & SHADER_BREAKPOINT || c->flags & TRIGGER_RESUME_SET_BP) {
+	if ((c->flags & SHADER_BREAKPOINT || c->flags & TRIGGER_RESUME_SET_BP) &&
+	    !(c->flags & DISABLE_DEBUG_MODE)) {
 		uint32_t aip = ptr[0];
 
 		igt_assert_f(aip != SHADER_CANARY, "Workload executed but breakpoint not hit!\n");
@@ -1049,6 +1051,7 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
 	struct drm_xe_eudebug_event_eu_attention *ea = NULL;
 	struct drm_xe_eudebug_event *event = NULL;
 	struct online_debug_data *data = s->c->ptr;
+	bool expect_exception = flags & DISABLE_DEBUG_MODE ? false : true;
 	int sum = 0;
 	int bitmask_size;
 
@@ -1076,7 +1079,10 @@ static void online_session_check(struct xe_eudebug_session *s, int flags)
 	if (flags == SHADER_BREAKPOINT)
 		igt_assert_eq(sum, data->threads_count);
 
-	igt_assert(sum > 0);
+	if (expect_exception)
+		igt_assert(sum > 0);
+	else
+		igt_assert(sum == 0);
 }
 
 static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
@@ -1092,7 +1098,12 @@ static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
  * SUBTEST: basic-breakpoint
  * Description:
  *	Check whether KMD sends attention events
- *	for runalone workload stopped on breakpoint.
+ *	for workload in debug mode stopped on breakpoint.
+ *
+ * SUBTEST: breakpoint-not-in-debug-mode
+ * Description:
+ *	Check whether KMD resets the GPU when it spots an attention
+ *	coming from workload not in debug mode.
  *
  * SUBTEST: stopped-thread
  * Description:
@@ -1540,6 +1551,9 @@ igt_main
 	test_gt_render_or_compute("basic-breakpoint", fd, hwe)
 		test_basic_online(fd, hwe, SHADER_BREAKPOINT);
 
+	test_gt_render_or_compute("breakpoint-not-in-debug-mode", fd, hwe)
+		test_basic_online(fd, hwe, SHADER_BREAKPOINT | DISABLE_DEBUG_MODE);
+
 	test_gt_render_or_compute("stopped-thread", fd, hwe)
 		test_basic_online(fd, hwe, SHADER_BREAKPOINT | TRIGGER_RESUME_DELAYED);
 
-- 
2.34.1

