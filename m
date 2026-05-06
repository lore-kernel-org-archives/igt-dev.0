Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A127CD3439
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 18:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298C210E275;
	Wed,  6 May 2026 18:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWrcBXUT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECE310E275
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 18:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778092304; x=1809628304;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5ZYDFEWqhrSAER69nHieCy86zVzPtufC0aqyq33tV1o=;
 b=ZWrcBXUT4/Blu8X2DWV/AXLWBPy3CIpzuEN0UmnuQ7fcZRQi8WaLmjVm
 wtS1NLTl/vXgIONfMDkhCUdVO9d61Gvhiy/iE5bh2VderleXbj7WPpopv
 1r6W0DEdc/xiVzYZkWfJKuY4hBr7oHaV/FG4WcOjOrRYtzpeH00CSTzE3
 w5KUuR8wCmdV3hLtPTjKQN/RRU+2feh/0ED7BX2t4ETDRlLQTSJIlHpgB
 iROKBICD2G+ckwBczu9rQznsncjSOHV8cQNuDel2y0dEOw4fYih1A8ipn
 oHMOYcS1tqJ8FoVoi+DgAWs0FmPlLSBGhYaheKDz7x5PSXqwSY5i97aec Q==;
X-CSE-ConnectionGUID: v9yt4v0MSjWh5xxLBGEc7A==
X-CSE-MsgGUID: GGxkZlF0QhWI3ITEGcc1sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="66564517"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="66564517"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 11:31:43 -0700
X-CSE-ConnectionGUID: VvMGPORbQkmLS4U+GNa1Ng==
X-CSE-MsgGUID: WP1TMABtQnyq1YPjAzm2Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="259658729"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 11:31:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 3/3] tests/intel/xe_exec_reset: Add multi-queue long spin tests
Date: Wed,  6 May 2026 11:31:39 -0700
Message-ID: <20260506183137.51479-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
References: <20260506183137.51479-5-niranjana.vishwanathapura@intel.com>
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

From: gta <gta@DUT4637NVLP.fm.intel.com>

Add the following multi-queue tests and update xe_legacy_test_mode()
function to use queue_timestamp and multi_queue_switch spinner options
for the multi-queue scenarios.

multi-queue-long-spin-many-preempt
multi-queue-long-spin-reuse-many-preempt

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/xe/xe_legacy.c          |  2 ++
 tests/intel/xe_exec_reset.c | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index f9bd5bcb61..b7054756cd 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -67,6 +67,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	} *data;
 	struct xe_spin_opts spin_opts = {
 		.preempt = flags & PREEMPT,
+		.multi_queue_switch = flags & MULTI_QUEUE,
+		.use_queue_timestamp = flags & MULTI_QUEUE,
 #define THREE_SEC	(3 * 1000000000ull)
 		.ctx_ticks = flags & LONG_SPIN ?
 			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index a3cf290abf..f7ae94a424 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -1179,6 +1179,23 @@ int igt_main()
 					  MULTI_QUEUE);
 	}
 
+	igt_subtest("multi-queue-long-spin-many-preempt")
+		xe_for_each_multi_queue_engine(fd, hwe) {
+			xe_legacy_test_mode(fd, hwe, 4, 8,
+					    LONG_SPIN | MULTI_QUEUE,
+					    LEGACY_MODE_ADDR, false);
+			break;
+		}
+
+	igt_subtest("multi-queue-long-spin-reuse-many-preempt")
+		xe_for_each_multi_queue_engine(fd, hwe) {
+			xe_legacy_test_mode(fd, hwe, 4, 8,
+					    LONG_SPIN | MULTI_QUEUE |
+					    LONG_SPIN_REUSE_QUEUE,
+					    LEGACY_MODE_ADDR, false);
+			break;
+		}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.43.0

