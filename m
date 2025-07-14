Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6960FC83F1B
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 17:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0203910E08E;
	Mon, 14 Jul 2025 17:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="meu+s7p4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAA910E02F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752512490; x=1784048490;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hPHBHvkl3x0e1XFhalmqUo+MM3EzM6B6R0+hvq78CY4=;
 b=meu+s7p4GE5BI4/Gm4Mg6X4WIkAP2KNSG4pcnB+hwMkidF1BkQQ0SXp0
 /hvhHubN4NYgUGafktnoFKaJ7qrrMyd9o5cO83E/36xuhMVNRpd/XYOvT
 d2ZHasViV2sYkY1q2iUtoFCsm0BfA/sWfCzpZc8GDdLd+am8is1NBUtJ1
 PDK/2UEqC/L783+xeMrW5tFz1U/H9wru/68QB6OxVjwfdqb6NJ+Uy3YG6
 Gi1HEbSI3e5RhDfOIDmxucWGia2SA1ZFbbGc4oSB7xeMJFXhTxPg4lqc6
 q9Y2o5JKfYEmok4fe1A0Z5TFm7ToJCwAjCwL/Zp/QWtEiAxWJt8Zuyq7o A==;
X-CSE-ConnectionGUID: DC0jIF+dRzeVCQLQQ61trw==
X-CSE-MsgGUID: Ys86FaHORLuzrbQVqwUE3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54802183"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54802183"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:01:30 -0700
X-CSE-ConnectionGUID: ZjoQkn3pQUSf5P4CtnJTDQ==
X-CSE-MsgGUID: iZsqI0jYQSqJJQMnc5qySw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161306012"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:01:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 1/5] tests/intel/xe_exec_system_allocator: Add section to
 trigger 64k fault
Date: Mon, 14 Jul 2025 10:03:05 -0700
Message-Id: <20250714170309.2949211-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714170309.2949211-1-matthew.brost@intel.com>
References: <20250714170309.2949211-1-matthew.brost@intel.com>
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

64K is the fault size in Xe. Add sections to explicitly trigger these
faults, as they are interesting and having dedicated sections helps with
profiling the KMD.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 2a99bd435a..65d281c784 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -806,6 +806,10 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
  * Description: Run %arg[1] system allocator test many times with large allocations
  * Test category: stress test
  *
+ * SUBTEST: many-64k-%s
+ * Description: Run %arg[1] system allocator test many times with large allocations
+ * Test category: stress test
+ *
  * SUBTEST: many-large-execqueues-%s
  * Description: Run %arg[1] system allocator test on many exec_queues with large allocations
  *
@@ -1741,6 +1745,11 @@ igt_main
 				test_exec(fd, hwe, 1, 128, SZ_2M, 0, 0, NULL,
 					  NULL, s->flags);
 
+		igt_subtest_f("many-64k-%s", s->name)
+			xe_for_each_engine(fd, hwe)
+				test_exec(fd, hwe, 1, 128, SZ_64K, 0, 0, NULL,
+					  NULL, s->flags);
+
 		igt_subtest_f("many-large-execqueues-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 16, 128, SZ_2M, 0, 0, NULL,
-- 
2.34.1

