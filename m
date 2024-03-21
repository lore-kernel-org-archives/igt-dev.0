Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D414BC54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA2F10ED24;
	Thu, 21 Mar 2024 15:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcm56809";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CA110ED52
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035705; x=1742571705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0r9k0FKraOBJ+qSxZglbqcYZBkyh2ryRlwDnCBe9bXk=;
 b=kcm56809fxptTX7SlZMdWeeN/ozLzbYutSCQkXDkiVv7V+d/21vMjsId
 YjQ/alHhTvEzkUXaiWCr+Bmmf5DL9PqyI9rsX424V9aEbWVQM2d5haNFL
 WEwg7adhFpS/a3b9wvUHfDQMs9d7CZkEhCk7vz5vkQMPpPnCjs3LFKfnS
 a3XmnuTzIqKdMH3Kv5Srqukh5V1o9Jm8sRBlgngVOvR9DRQgwlU0UFdIP
 hI3nTSZpApAJqQ89L0Ct1SoMX8LQK/aszOglolhWMbjy8nH4sx1QIC92d
 jfPrO+KnVm1nar0wa/N+V4UDsheU82qSXSDRQd3OlV841ZFpbPq+i6T98 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17174464"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="17174464"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:41:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14581930"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:41:38 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v5 16/24] tests: Introduce Core subcategory
Date: Thu, 21 Mar 2024 15:38:39 +0000
Message-Id: <20240321153847.1787625-17-katarzyna.piecielska@intel.com>
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
index e36ea3ed3..ece34f656 100644
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

