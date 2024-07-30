Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF892C3DA7F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B0510E516;
	Tue, 30 Jul 2024 11:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIBIxN3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9464910E50D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722340183; x=1753876183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kEdIixnlp9ftYTAmvJX97HvSF3PxXT+4h6Ye16Py9tc=;
 b=TIBIxN3Kx1nyFCe37RaXux+9Flmn53C0ulfMmZ+YcH5t/DREHUqzbjD3
 4YmLTDdKrNiWsz+RNrStSTeuJAWBiL4XhRs70+wNcT2v+6jFZzompjIE5
 piI5RIrkMqBVeS9MlN0n3g6x+edJDJfc22yw4bSkZWobD6vxOPUHyw1/K
 dCwOvIjMboIfTNqx5aXFYg0Ub7UAmAZpWjH7yLrcootS5w0JaPPLKE4i5
 //FJo0OJYCImVifnhw5nZNWqkKc4eczXLJ+vIyJFgU0kAPv2QGWl4NAF/
 vmJRvUDhLM/DZ4iUlpYXZHTwoRZ2cg914ZCr/8tK75UerEHzVPeATTlKT g==;
X-CSE-ConnectionGUID: 9aT/9YowRpKYhDxu9DcgPQ==
X-CSE-MsgGUID: h7wkV4aiROWvRRAnsQUXHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20286760"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20286760"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:42 -0700
X-CSE-ConnectionGUID: x5Ah4GFeRveSY9VUde5uHQ==
X-CSE-MsgGUID: HC3H0PVqTIGfdhm98vuGgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54217705"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.43])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:49:39 -0700
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
Subject: [PATCH i-g-t v2 60/66] tests/xe_eudebug_online: What if user does not
 set debug mode?
Date: Tue, 30 Jul 2024 13:45:17 +0200
Message-Id: <20240730114523.334156-61-christoph.manszewski@intel.com>
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

