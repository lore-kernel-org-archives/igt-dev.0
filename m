Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E627C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B077B10FBC4;
	Thu, 14 Mar 2024 14:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcHQjXLy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BC910FBC4
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710427065; x=1741963065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O+S0RGaqxQyUTv229EFCXTCQPloO5EVTvf+WYHqPSkU=;
 b=lcHQjXLyQTSXoCWe1bl83ELWIKXkyiIgwXqX+mpy+hmUtaktJyyktTNg
 o7gfERGwxFgVUOb6XFw36hP/bF7G6esWBPHpYSg3l6POgMia6iHA0lKwK
 jxeJjN9qf7dy4cBJkBqBAwBIsm1mSz+sAiwQ84vZNcWQQdKh14R8StBjU
 O2VF39TqxA/T1m7Wbkc6O9te9FYybI3uMFqr5sL59GwS1JNFki2Tj+7SQ
 GS884UZYyjHanTkmHrJ+E8JqHh5UV6+y9CfPxYgimq4x3Ehyp4wy9RupL
 jzD1ag+xNL+6PI56t4/2ES0aUmHEGzEpCdGuBDgxVJnfa6yvAzF+iRxUk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15801153"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="15801153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:37:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12196848"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:37:43 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t v4 16/25] tests/intel: Introduce SysMan subcategory
Date: Thu, 14 Mar 2024 14:34:46 +0000
Message-Id: <20240314143455.1436688-17-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
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

Let's put e.g. sysfs heartbeat, sysfs preempt timeout, timeslise sysfs
under SysMan subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/sysfs_heartbeat_interval.c | 3 +++
 tests/intel/sysfs_preempt_timeout.c    | 3 +++
 tests/intel/sysfs_timeslice_duration.c | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/sysfs_heartbeat_interval.c
index 09dbc4129..8c6c448fa 100644
--- a/tests/intel/sysfs_heartbeat_interval.c
+++ b/tests/intel/sysfs_heartbeat_interval.c
@@ -45,6 +45,9 @@
  * TEST: sysfs heartbeat interval
  * Feature: SMI, cmd_submission
  * Test category: SysMan
+ * Sub-category: SysMan
+ * Category: Desktop \ Server
+ * Functionality: sysfs heartbeat
  * Run type: FULL
  *
  * SUBTEST: idempotent
diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
index 606491c34..0663c347a 100644
--- a/tests/intel/sysfs_preempt_timeout.c
+++ b/tests/intel/sysfs_preempt_timeout.c
@@ -44,6 +44,9 @@
  * TEST: sysfs preempt timeout
  * Feature: SMI, context
  * Test category: SysMan
+ * Sub-category: SysMan
+ * Category: Desktop \ Server
+ * Functionality: sysfs preempt timeout
  * Run type: FULL
  *
  * SUBTEST: idempotent
diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
index cceac94f2..e8dd2677e 100644
--- a/tests/intel/sysfs_timeslice_duration.c
+++ b/tests/intel/sysfs_timeslice_duration.c
@@ -47,6 +47,9 @@
  * TEST: sysfs timeslice duration
  * Feature: SMI, cmd_submission
  * Test category: SysMan
+ * Functionality: timeslise sysfs
+ * Sub-category: SysMan
+ * Category: Desktop \ Server
  * Run type: FULL
  *
  * SUBTEST: duration
-- 
2.34.1

