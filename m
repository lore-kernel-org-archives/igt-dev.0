Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EA5CD3445
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 23:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10DD10E031;
	Fri,  8 May 2026 23:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCdP5wm+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB6410E35A
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 23:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778283564; x=1809819564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rq7doAYWpC5DEmz0amtwzUd/x9m7f3G5FOP5zJaStRs=;
 b=mCdP5wm+gQM0niV85SnLnLE2g/TK8VDi4dITHvsb86PfApO+2MYfmt+D
 ZIoetx3ttM/H28ZbMdSOBzOC8XxSShKJ1olDkT/X5TYegnXTj5VrFUF3T
 6YfbNt1h/rfngedrPuuNzfRn5yQgx+Jr9f5u2Fe9ayO0SRc5TgTnPWTI7
 oUgU4ItXFi9IWx39RS1NCTppNv4AHuD/FaqQ1uD76baCgj0ZRBMcXnwZP
 zeQ+u8FFpYE0TZu/P0munsW3SHD/TqwDKwJ/LHXf7/9ib4OWsqq00tFwW
 7p4IRxS0yVq69Wn7v6ugcqtl42uO2H8RWAQQIWBYmG+RNHPCJDe2Itxwv w==;
X-CSE-ConnectionGUID: kK+V4MVdSAuurHjBmlbKQQ==
X-CSE-MsgGUID: 7+IvzFPUQJilqDhufClrCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89852624"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="89852624"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 16:39:23 -0700
X-CSE-ConnectionGUID: hu5Aq5hZQWii7RKVh+SQ+w==
X-CSE-MsgGUID: oLj+b0DZR1ecuO5kJ2JeYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="241253825"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 16:39:23 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v3 3/3] tests/intel/xe_exec_reset: Add multi-queue long spin
 tests
Date: Fri,  8 May 2026 16:39:19 -0700
Message-ID: <20260508233917.87720-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508233917.87720-5-niranjana.vishwanathapura@intel.com>
References: <20260508233917.87720-5-niranjana.vishwanathapura@intel.com>
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

Add the following multi-queue tests and update xe_legacy_test_mode()
function to use queue_timestamp and multi_queue_switch spinner options
for the multi-queue scenarios.

multi-queue-long-spin-many-queue-switch
multi-queue-long-spin-reuse-many-queue-switch

v2: Change test name and add documentation (Stuart)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 lib/xe/xe_legacy.c          |  2 ++
 tests/intel/xe_exec_reset.c | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

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
index a3cf290abf..89a47d236f 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -330,6 +330,12 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * SUBTEST: long-spin-reuse-many-preempt-media
  * Description: Test long spinners with many preemptable jobs, use queues again spinners complete on media GT
  *
+ * SUBTEST: multi-queue-long-spin-many-queue-switch
+ * Description: Test long spinners with many jobs with multi-queue switching
+ *
+ * SUBTEST: multi-queue-long-spin-reuse-many-queue-switch
+ * Description: Test long spinners with many jobs with multi-queue switching, use queues again once spinners complete
+ *
  * SUBTEST: gt-reset
  * Description: Test GT reset
  *
@@ -1179,6 +1185,23 @@ int igt_main()
 					  MULTI_QUEUE);
 	}
 
+	igt_subtest("multi-queue-long-spin-many-queue-switch")
+		xe_for_each_multi_queue_engine(fd, hwe) {
+			xe_legacy_test_mode(fd, hwe, 4, 8,
+					    LONG_SPIN | MULTI_QUEUE,
+					    LEGACY_MODE_ADDR, false);
+			break;
+		}
+
+	igt_subtest("multi-queue-long-spin-reuse-many-queue-switch")
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

