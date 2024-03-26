Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3732CD11DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 09:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324FF10EDC8;
	Tue, 26 Mar 2024 09:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5OZmXud";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DFF10E8C0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 09:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711445394; x=1742981394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M+IWhkVM2PdgcJD6IsMYejCLciax8W7RNTWYfl9U6CQ=;
 b=D5OZmXudjKuu0pfBnnS1Mcbr5GItNOBIVB1Bevgx0IVEA9H5qtxwSXoL
 zT7PFs4T2PcCG8v+vqB4ZfrXaSUAxbB2Np9OI7VprZWg0WhrUR/L61Bxl
 c+YarjhrbvYwcwrdPS0KIkDD8PvR/lB3CVyrdcMW57s9HToyliCJhMWgs
 hVpXRK1Y5/KVYvV+PqRNPa2PzQyw/zC8kD6IaV3qDaDM2+ZDa4eZ1UEJ6
 6BU4s7hNkY76WFuhamaQB8EjyVJAi4nyLrKd0uxFPWNvtjyXWMBBnIKbr
 dpUjTd6ztvsnTI750Grn4MDcuKlLhLL50z84kL4eT8g+5NOJUgFd38Lfj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6378580"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6378580"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="15964927"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 02:29:51 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t v2 04/13] tests/intel: Adjust Xe
 Sub-category/Functionality to i915 test docs
Date: Tue, 26 Mar 2024 09:28:58 +0000
Message-Id: <20240326092907.1979345-5-katarzyna.piecielska@intel.com>
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

Let's fix:
	- s/frequency/Power management/
	- s/evict/eviction/
	- s/BO creation/bo/
	- s/fill surface with media block/fill media/

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_create.c     | 2 +-
 tests/intel/xe_gt_freq.c    | 2 +-
 tests/intel/xe_media_fill.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 1d3918663..fd5d71d8a 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -273,7 +273,7 @@ static void create_massive_size(int fd)
 
 /**
  * SUBTEST: create-big-vram
- * Functionality: BO creation
+ * Functionality: bo
  * Test category: functionality test
  * Description: Verifies the creation of substantial BO within VRAM,
  *		constituting all available CPU-visible VRAM.
diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index f0de341cb..c12f6c52c 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Test Xe GT frequency request functionality
  * Category: Infrastructure
- * Sub-category: frequency
+ * Sub-category: Power management
  * Functionality: frequency request
  * Test category: functionality test
  */
diff --git a/tests/intel/xe_media_fill.c b/tests/intel/xe_media_fill.c
index ddda1b535..e6b5aaf73 100644
--- a/tests/intel/xe_media_fill.c
+++ b/tests/intel/xe_media_fill.c
@@ -29,9 +29,9 @@
  * TEST: xe media fill
  * Category: Hardware building block
  * Sub-category: Media
- * Functionality: fill surface with media block
+ * Functionality: fill media
  * Description: Basic tests for the media_fill() function.
- * Feature: media
+ * Feature: media feature
  * Test category: functionality test
  *
  * SUBTEST: media-fill
-- 
2.34.1

