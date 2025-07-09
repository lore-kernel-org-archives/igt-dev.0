Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62777C83F03
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 03:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C6D10E1EF;
	Wed,  9 Jul 2025 03:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcDrDRRu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8AD10E1EF
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jul 2025 03:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752033400; x=1783569400;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hPHBHvkl3x0e1XFhalmqUo+MM3EzM6B6R0+hvq78CY4=;
 b=PcDrDRRuZr6sGmLrgCYW3LxrUv9ug783TgsD3Uigm83ENtCm0NTgp9nV
 BKNDOQlWNbkcMfR6KEsDIoOZQHauTdb25vL9lsUwif/4Ygf9Dd8ZvZZ+C
 tC3GxwV6N3v7saSUDWF2bYhGRpjfvNpjLCq7mx7vn6E1nQwwOkDsjQBny
 mCLl5hTTIfw0w8LBc40ar7QeiAqsVLgm+lwaVjlxJzjpl0NT8XLr4bZIv
 09zgpnfbgKhjhlWOsKQqxDx2R5zpJJwnl2M9jivoJ+QbKsKZ1I2hyOa22
 nWgC1XSPSXeiMh7W/J4wXgdqxXU3KVyqJkg67QUWAfPHOkzT8CpXfL+7K A==;
X-CSE-ConnectionGUID: DXWul2WsQ660egDEN7YajA==
X-CSE-MsgGUID: /XPUUBTiQj22j2h1j4IsDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54003572"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54003572"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 20:56:40 -0700
X-CSE-ConnectionGUID: vvBMXFFOQaWQSk9tCtBARg==
X-CSE-MsgGUID: QboxqDt/TAG/GRg6G1QEBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155749816"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 20:56:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 1/3] tests/intel/xe_exec_system_allocator: Add section to
 trigger 64k fault
Date: Tue,  8 Jul 2025 20:58:19 -0700
Message-Id: <20250709035821.712973-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

