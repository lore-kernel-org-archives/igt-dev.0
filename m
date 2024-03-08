Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AB7C54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 08:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B88F1136E8;
	Fri,  8 Mar 2024 08:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEhbBXOS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5D51136E8
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 08:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709887197; x=1741423197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4sMvq69kcccj3D3XOELjRgtDEQbx4C/ZyvlRl9YxE4Y=;
 b=ZEhbBXOStJfuJFf6xyH114Ik2AGDM4LHFuAeA3eJNIMudBSe6r+3uQv9
 4xnKwbCdMroV3+gQAQ2N788EHe+F60i9vKEBhCybRcYqe9EYvuat9rSRH
 N4UBL4URmnaRWLCqc+FoR8V9ZVVBR3cWvSy07PFPcb4whxj74zMmi94He
 Mifh2GnFv0P0FuR5JWhlgWZINMCiI0+xP7tD+RIm1NifsnkwmHiEhB99R
 8gPiPQNGdEnvBEdJ6Z1YHDzmZNArN+0Zg2eBFacj7grBMI0xJ4HlcYDuG
 tZMSY8SgGudvFMS7OampsVD/mT6m8jIHCePYeE27FJ6LpyRxvomF5SMRB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4767336"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4767336"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:39:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10411342"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 00:39:55 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v2 17/25] tests: Introduce Core subcategory
Date: Fri,  8 Mar 2024 08:36:49 +0000
Message-Id: <20240308083657.1092049-18-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
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

Let's have Core subcategory instead of 'i915' or 'drm'.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/dmabuf_sync_file.c | 18 ++++++++++++++++++
 tests/intel/i915_pciid.c |  2 +-
 tests/vgem_basic.c       |  1 +
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
index cfa73117b..57f1ce2bc 100644
--- a/tests/dmabuf_sync_file.c
+++ b/tests/dmabuf_sync_file.c
@@ -10,6 +10,24 @@
 
 IGT_TEST_DESCRIPTION("Tests for sync_file support in dma-buf");
 
+/**
+ * TEST: dmabuf_sync_file
+ * Category: Infrastructure
+ * Description: Tests for sync_file support in dma-buf
+ * Functionality: dmabuf
+ * Sub-category: Core
+ * Run type: FULL
+ *
+ * SUBTEST: export-basic
+ * SUBTEST: export-before-signal
+ * SUBTEST: export-multiwait
+ * SUBTEST: export-wait-after-attach
+ * SUBTEST: import-basic
+ * SUBTEST: import-multiple-read-only
+ * SUBTEST: import-multiple-read-write
+ *
+ */
+
 static void test_export_basic(int fd)
 {
 	struct vgem_bo bo;
diff --git a/tests/intel/i915_pciid.c b/tests/intel/i915_pciid.c
index 8322bd564..436acdaeb 100644
--- a/tests/intel/i915_pciid.c
+++ b/tests/intel/i915_pciid.c
@@ -35,7 +35,7 @@
  * Feature: core
  * Functionality: device management
  * Run type: BAT
- * Sub-category: i915
+ * Sub-category: Core
  * Test category: GEM_Legacy
  *
  * SUBTEST:
diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
index 6cfb02e82..fe201908c 100644
--- a/tests/vgem_basic.c
+++ b/tests/vgem_basic.c
@@ -36,6 +36,7 @@
  * Category: Infrastructure
  * Description: Basic sanity check of Virtual GEM module (vGEM).
  * Functionality: mock device
+ * Sub-category: Core
  * Test category: GEM_Legacy
  * Feature: vgem
  * Run type: FULL
-- 
2.34.1

