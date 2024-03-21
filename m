Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFA9CD11C2
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F66E10ED31;
	Thu, 21 Mar 2024 15:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGWN/jdz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69EA10ED24
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035692; x=1742571692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O+S0RGaqxQyUTv229EFCXTCQPloO5EVTvf+WYHqPSkU=;
 b=VGWN/jdzDyqYg2d5/rceOsBgw0a3t+oXlJ2LY+anylKHZV5uu8ZFF8ZO
 D85fNnm47SGUSwmEOmGAhNHQCwXBfPltym87EpA3xTXGZap57IgB4KvvS
 mmwIkxWom2kGz3h/MG7ZwJ7sRmSvhGg8OHtBf4IfTBwFCC2eEkwkj0pQX
 BYO5Vzb6PV0eDs8E7qorM5VFEM/bOmeJFfMkvYhaL4nb6YBeS12e3wj6W
 8IOOd/ywX1cuRqnQrrTPsMZtgoS/42WmNORut1YABu7C1RtieGSrOr6Gl
 gh2VtUClTCpKBpow7VWuWfY8tIOmSDtvLBmPDNboOIPwTLwdLQwCQtqlm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17174418"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="17174418"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:41:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14581924"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:41:29 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t v5 15/24] tests/intel: Introduce SysMan subcategory
Date: Thu, 21 Mar 2024 15:38:38 +0000
Message-Id: <20240321153847.1787625-16-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
References: <20240321153847.1787625-1-katarzyna.piecielska@intel.com>
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

