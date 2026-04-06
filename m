Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD9AEF4ED4
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 12:10:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2048C89864;
	Mon,  6 Apr 2026 12:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKKlOr9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645A889864
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 12:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775477421; x=1807013421;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4vy7I6I7IrJvtqGmC1ZmYQZF6IOiWcKts98QC25qap8=;
 b=JKKlOr9BDzFixIVI1XdqihB07K6ZofDqUQYniisa7C1pbNMTa0JgI6vv
 p9wgNi2oCohrCA5NF2zji6JNUYHiE/L7Zj3pWfvjOX5oVjFyDQsOFsFOQ
 6QQKfhtgwVG8fy3C9LZ2LEp/1DrYxujxtSGYfJRDRnf/00p6fiSzbExIw
 xzVv/OFVm/S2BVnbWc6D0dl8HrFBlD5xXt0vDh1xnZu21B8qdz06nGY4H
 ImBN5z8LPtA3xfRZZRHejfmIJ+6TS0l6wjHCHcwpDqwTuLbxPmE6GTTOn
 PxMrsPcUmdY6XBZGNBLF0Vlreudhijmw1P5tXe95rrjIZWQyiiyUuWrAI Q==;
X-CSE-ConnectionGUID: qMliMmQkQPey+aDk4tGdIw==
X-CSE-MsgGUID: gKKoMz53QkK1TGib0ALiIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="63976059"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="63976059"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 05:10:21 -0700
X-CSE-ConnectionGUID: S3eE4TUgSEa+U72qsw7Dhw==
X-CSE-MsgGUID: 7ofsFtsGSkKnd7Kh6PFm8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="231915357"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa003.jf.intel.com with ESMTP; 06 Apr 2026 05:10:20 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com,
	igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel: Adjust test documentation
Date: Mon,  6 Apr 2026 17:40:18 +0530
Message-ID: <20260406121018.19963-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Fix multiple-parent warnings in test list generation by correcting
Category and Mega feature metadata fields across test files

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel/xe_multigpu_svm.c             | 2 +-
 tests/intel/xe_sysfs_preempt_timeout.c    | 2 +-
 tests/intel/xe_sysfs_timeslice_duration.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
index 2ae0b950f..e04e9692e 100644
--- a/tests/intel/xe_multigpu_svm.c
+++ b/tests/intel/xe_multigpu_svm.c
@@ -27,7 +27,7 @@
  * Description: Validate multi-GPU Shared Virtual Memory (SVM) features,
  *		including cross-GPU access, atomic operations, coherency
  *
- * Category: Multi-GPU
+ * Category: Core
  * Mega feature: MultiGPU
  * Sub-category: SVM, memory management, performance
  * Functionality: Multi-GPU SVM, migration, coherency, atomic ops
diff --git a/tests/intel/xe_sysfs_preempt_timeout.c b/tests/intel/xe_sysfs_preempt_timeout.c
index 725707bf6..9ddedf98f 100644
--- a/tests/intel/xe_sysfs_preempt_timeout.c
+++ b/tests/intel/xe_sysfs_preempt_timeout.c
@@ -6,7 +6,7 @@
 /**
  * TEST: sysfs preempt timeout
  * Category: Core
- * Mega feature: SysMan
+ * Mega feature: General Core features
  * Sub-category: SysMan tests
  * Functionality: sysfs preempt timeout
  * Feature: SMI, context
diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
index 93b97f805..6aad2902b 100644
--- a/tests/intel/xe_sysfs_timeslice_duration.c
+++ b/tests/intel/xe_sysfs_timeslice_duration.c
@@ -9,7 +9,7 @@
 /**
  * TEST: sysfs timeslice duration
  * Category: Core
- * Mega feature: SysMan
+ * Mega feature: General Core features
  * Sub-category: SysMan tests
  * Functionality: sysfs timslice duration
  * Feature: SMI, context
-- 
2.50.1

