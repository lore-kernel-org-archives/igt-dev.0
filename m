Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BE6C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2EE10F119;
	Mon,  4 Mar 2024 11:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EM7/IMAc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE4E10F119
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551167; x=1741087167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uiuEEAQ8FTDy+GCJAlXCHg1xTqBP9mAfe4eIp3xy98Q=;
 b=EM7/IMAcQ0o8Kdr8CFOAIp+RtqNrQ8i1A9tC4tFDAxkyHWFBKaH/m2BM
 /5t791VuJuO5OrtdLZ7xb4YSc9SGieOyAYRCVb48xI/xYMUKPntQ31iAu
 XmOeR9kJy64mL6PVruKmHeJGCfy/FI8VokfbM3OxkMp0nm8vbRWePCzpy
 HuX4KoXOocF5zNcPusS3hR5HFtKsjGmF41uTeo/dGYiHHXkoeKN7aORho
 PSTvW7P013iJQaQgO9D0cyb2StOKODoqHjYchpS4A8da4+ay+CrgSH8w4
 4tUeGBw53BnIBdKrB2vnBfZbm/fim916Aqvaaay4Ct1/Yd39xb5pSyUWR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4199178"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4199178"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:19:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="32125268"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:19:25 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t 17/24] tests: Introduce Core subcategory
Date: Mon,  4 Mar 2024 11:16:10 +0000
Message-Id: <20240304111617.849785-18-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
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

