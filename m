Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054A9C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B1110EE25;
	Tue, 26 Mar 2024 09:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qtc4QL+q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93AA10EE25
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711445476; x=1742981476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5lExDwMmMd178OYtJLkNvbzuMFEW6mn1SaPIqoK69uk=;
 b=Qtc4QL+qJ6QHFVcYq9d14pXFGOBOqcD/JXZGY/tf+6yPcZgfI+LXdoTT
 cxEWhQO0varPoEppCboi3jCSA48/6dkJbXAbUpOiM9TsGl5GjEbp18NnM
 nboMCfk9Akv7m/OvX9dEv6yg3dMwEeJVE8yIw+kBTrYbr+MIu+EGSf5ab
 tj+R1h/Gy5fw6OjaQdI16wDK5DlAA8HO79zvMXDdBn2lZvv68QLLEXX1h
 ey5MQzhJu8RSzlIV8RB4Pen1iCk7cHEBdVxFg4LTScjqa/4cVPOc5ZhCz
 f6mWeRo735buQq/+0FE9KR4CIxrqQxQ0JjtCldxjB+H/TU9v7kHmkU9YP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6351272"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6351272"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="15875748"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:31:14 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v2 13/13] tests/intel: Move xe_exec_reset.c to Reset
 Sub-category
Date: Tue, 26 Mar 2024 09:29:07 +0000
Message-Id: <20240326092907.1979345-14-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
References: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
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

It looks like Sub-category=Reset and Functionality=gt reset is better
for xe_exec_reset.c test.

v2: Change Functionality s/reset/sysfs reset/ in device_reset.c,
gem_reset_stats.c, gem_eio.c (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/device_reset.c          | 1 -
 tests/intel/gem_eio.c         | 2 +-
 tests/intel/gem_reset_stats.c | 2 +-
 tests/intel/xe_exec_reset.c   | 4 ++--
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index e19e672ce..583a59039 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -39,7 +39,6 @@
  *   validating device resets
  * Category: Infrastructure
  * Sub-category: SysMan
- * Functionality: reset
  * Feature: reset, sriov-reset
  */
 
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index 4661a8959..c2fdff7c0 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -58,7 +58,7 @@
  * Description: Test that specific ioctls report a wedged GPU (EIO).
  * Category: Infrastructure
  * Feature: reset uapi
- * Functionality: reset
+ * Functionality: sysfs reset
  * Sub-category: uapi
  * Test category: GEM_Legacy
  *
diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
index 18875a530..fdad7600c 100644
--- a/tests/intel/gem_reset_stats.c
+++ b/tests/intel/gem_reset_stats.c
@@ -51,7 +51,7 @@
  * TEST: gem reset stats
  * Sub-category: uapi
  * Category: Desktop client
- * Functionality: reset
+ * Functionality: sysfs reset
  *
  * SUBTEST: ban-blt
  *
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 22735688a..cc10900d9 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -6,8 +6,8 @@
 /**
  * TEST: Basic tests for execbuf functionality for virtual and parallel exec_queues
  * Category: Hardware building block
- * Sub-category: CMD submission
- * Functionality: reset
+ * Sub-category: Reset
+ * Functionality: gt reset
  * Test category: functionality test
  */
 
-- 
2.34.1

