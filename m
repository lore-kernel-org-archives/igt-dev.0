Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADD4C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683EF10FCE2;
	Wed, 27 Mar 2024 12:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAym7bg0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CF810FCE1
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542536; x=1743078536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GAIZMeG1Rw+T8BCwPvsG11rhanqYJSFiYOQWhRFSPKQ=;
 b=QAym7bg0owD2zBZgOUdbe/1xHwDMPiFzkx4aAkqnZpREhEZY+xnogXML
 QYAIndZZp+DstvPIuAtECQN9UdlVFqUQQ8u+uR5IQZ0gvJXZduHpYaxg2
 TGrCXxIlz83DXqrKtd2Xlrv/d8bOasqdSPdKvOHM35TIntrtipByhkKPR
 2Tk4L/ghXHIBrRAAa9tu8uZZ0Z7bkvf1ag3+G6USipK2AUYCS1cGGZ66j
 bixg624e5lnHaT63RQ16psmhcL7UAEtsWAfY57TOuJN6GncJ5t8GHYs7T
 bJJK5vcd4JJ798RQdnXdlzJAvkcPKUQS+OWPwba5DnqpZtYZSoYjUCnm1 w==;
X-CSE-ConnectionGUID: 8V1Ox7PESMK/0MlZjI/8Ng==
X-CSE-MsgGUID: 0WZ+7YiSRuCit1OMP9AHzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6771298"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6771298"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16118513"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:28:53 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t 08/16] tests/intel: Introduce SysMan mega feature
Date: Wed, 27 Mar 2024 12:27:23 +0000
Message-Id: <20240327122731.2104614-9-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
References: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
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

Add tests to SysMan mega feature.
Group:
	SUBTEST
	Description
	Category
	Mega feature
	Sub-category
	Functionality

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
---
 tests/device_reset.c                   | 3 ++-
 tests/intel/sysfs_heartbeat_interval.c | 7 ++++---
 tests/intel/sysfs_preempt_timeout.c    | 7 ++++---
 tests/intel/sysfs_timeslice_duration.c | 7 ++++---
 tests/intel/xe_sysfs_defaults.c        | 6 ++++--
 tests/intel/xe_sysfs_scheduler.c       | 3 ++-
 6 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 2e1619f60..036000640 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -38,7 +38,8 @@
  *   Unbinds driver from device, initiates reset then rebinds driver to device
  *   validating device resets
  * Category: Infrastructure
- * Sub-category: SysMan
+ * Mega feature: SysMan
+ * Sub-category: SysMan tests
  * Feature: reset, sriov-reset
  */
 
diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/sysfs_heartbeat_interval.c
index 5f82185bc..0af8879f6 100644
--- a/tests/intel/sysfs_heartbeat_interval.c
+++ b/tests/intel/sysfs_heartbeat_interval.c
@@ -43,11 +43,12 @@
 #include "sw_sync.h"
 /**
  * TEST: sysfs heartbeat interval
- * Feature: SMI, cmd_submission
- * Test category: SysMan
- * Sub-category: SysMan
  * Category: Desktop \ Server
+ * Mega feature: SysMan
+ * Sub-category: SysMan tests
  * Functionality: sysfs heartbeat
+ * Feature: SMI, cmd_submission
+ * Test category: SysMan
  *
  * SUBTEST: idempotent
  * Description: Test to check whether the heartbeat parameter reports the values set.
diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
index 84f8ba7d3..88f2cdfcd 100644
--- a/tests/intel/sysfs_preempt_timeout.c
+++ b/tests/intel/sysfs_preempt_timeout.c
@@ -42,11 +42,12 @@
 #include "sw_sync.h"
 /**
  * TEST: sysfs preempt timeout
- * Feature: SMI, context
- * Test category: SysMan
- * Sub-category: SysMan
  * Category: Desktop \ Server
+ * Mega feature: SysMan
+ * Sub-category: SysMan tests
  * Functionality: sysfs preempt timeout
+ * Feature: SMI, context
+ * Test category: SysMan
  *
  * SUBTEST: idempotent
  * Description: Test to check whether the preempt_timeout parameter reports the
diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
index b48152ecc..6baa000df 100644
--- a/tests/intel/sysfs_timeslice_duration.c
+++ b/tests/intel/sysfs_timeslice_duration.c
@@ -45,11 +45,12 @@
 #include "sw_sync.h"
 /**
  * TEST: sysfs timeslice duration
+ * Category: Desktop \ Server
+ * Mega feature: SysMan
+ * Sub-category: SysMan tests
+ * Functionality: timeslise sysfs
  * Feature: SMI, cmd_submission
  * Test category: SysMan
- * Functionality: timeslise sysfs
- * Sub-category: SysMan
- * Category: Desktop \ Server
  *
  * SUBTEST: duration
  * Description: Test to measure the timeslice duration by watching the
diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
index b1ab36589..a90b2f3b3 100644
--- a/tests/intel/xe_sysfs_defaults.c
+++ b/tests/intel/xe_sysfs_defaults.c
@@ -5,12 +5,14 @@
 
 /**
  * TEST: xe sysfs defaults
+ * Description: check if the sysfs engine .defaults node has all values.
  * Category: Infrastructure
+ * Mega feature: SysMan
+ * Sub-category: SysMan tests
  * Functionality: sysman defaults
- * Sub-category: SysMan
  * Test category: functionality test
+ *
  * SUBTEST: engine-defaults
- * Description: check if the sysfs engine .defaults node has all values.
  */
 
 #include <dirent.h>
diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index d1ef422f4..5c4fb1114 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -6,7 +6,8 @@
 /**
  * TEST: xe sysfs scheduler
  * Category: Infrastructure
- * Sub-category: SysMan
+ * Mega feature: SysMan
+ * Sub-category: SysMan tests
  * Functionality: scheduler control interface
  *
  * SUBTEST: %s-invalid
-- 
2.34.1

