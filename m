Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F201C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 07:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929BF10E078;
	Thu, 29 Feb 2024 06:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOTfPBmD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5129A10E0AE
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 06:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709189998; x=1740725998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=ImarCmG9llSEAyb4tkhpnLlolZkXSVGNKC19zV0gDYU=;
 b=hOTfPBmDQUzhdpFTpso05PnWmlRVlQqQiw2R2yEmU/nDL+b5LYJgknx7
 vsgeebclyd9xf8MvTSuDokBnxzTYBsiKLid7zkJt323amN7622us1+rBN
 lH9JurOfYdLMf+wrtWqgCuYwYmBUP+rSX+xzQ+GGkWDl0TPasYq+Y+Uzt
 VcfQM0oFoqB7xVOptgvbmi6QC+8hSEUe1+B0AIBawU563H8n8v0NX96Mw
 /HdFPC7gJgHLAJB8pIVa4cQ1trSlTKmOQ75pE1p31MTes0CRCXrV5hOXv
 5FIXDzVjaRXOtwqZFXUoTv6odYKuWmYZngDS/Ha9GODplhPALY/Vjv299 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14789755"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="14789755"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 22:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="45232554"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 22:59:57 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 46C6D580DEF;
 Wed, 28 Feb 2024 22:59:57 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rfaOY-00000002GEm-3jgc; Thu, 29 Feb 2024 07:59:54 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 2/4] tests: use Infrastructure category for all sysman
 tests
Date: Thu, 29 Feb 2024 07:56:17 +0100
Message-ID: <20240229065953.538861-3-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
References: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Currently, they're defined on different places under different
categories. Unify them under Infrastrucuture one.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/device_reset.c             | 7 ++++---
 tests/intel/xe_sysfs_scheduler.c | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index ef08164aad41..13bd5ab5fdb1 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -16,6 +16,7 @@
 #include "igt_kmod.h"
 /**
  * TEST: device reset
+ * Category: Hardware building block
  * Description: Examine behavior of a driver on device sysfs reset
  * Run type: FULL
  *
@@ -32,13 +33,13 @@
  * Feature: reset
  *
  * SUBTEST: unbind-reset-rebind
- * Category: Server
  * Description:
  *   Unbinds driver from device, initiates reset then rebinds driver to device
  *   validating device resets
- * Feature: reset, sriov-reset
- * Functionality: reset
+ * Category: Infrastructure
  * Sub-category: sysman
+ * Functionality: reset
+ * Feature: reset, sriov-reset
  * Test category: GEM_Legacy
  */
 
diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 954dad1305f1..5a22abbf14bb 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -5,7 +5,7 @@
 
 /**
  * TEST: xe sysfs scheduler
- * Category: Software building block
+ * Category: Infrastructure
  * Sub-category: sysman
  * Functionality: scheduler control interface
  *
-- 
2.43.2

