Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D0CC4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 18:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E523A10E121;
	Wed,  7 Feb 2024 18:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRQXyjA1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D64710E121
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 18:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707332349; x=1738868349;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cevvZqJ0YEGUFwJ/hxzb0cIHV19YZpoFgNu01xpLGEs=;
 b=IRQXyjA1A9nSelayfeqNxTFktxwApzDrK5p1NrzyhuijppyIREPVqOku
 qxouetr1p4R3lmVge4Hok58parReIM/3iAg8oH4iECyPFjVxTpzyzjhQO
 CTqGLBlTYRp994ri6mjsmWZ16cId+OuC3cQRQDUV5p/K/wwMfiJ9hFA94
 khj+4SC8tbon61DpbEq87y0dbWkWpCezF6JUmEkLJQLTgZhzSwLoWBvph
 o1wrb7ix7IEjmrmsGZrqgvp4FQT+NnwfNwvzcsPUuqLYXuM3Rdq7q20zG
 fAKuw036zD8rkeuz5orE+RqFjA1scjxVAG7o7nazJiaaEH0QpQZqiD+tW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="935757"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="935757"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 10:59:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="6055591"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 10:59:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_live_ktest: Rename subtest to match suite
Date: Wed,  7 Feb 2024 10:56:59 -0800
Message-ID: <20240207185925.235046-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

The test suite name in the kernel modules contain an xe_ prefix.
Upcoming changes for filtering will make the match more strict,
so rename the subtests to match the test suite name.

References: https://lore.kernel.org/igt-dev/3267150.N7aMVyhfb1@jkrzyszt-mobl2.ger.corp.intel.com/
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

build tested only, let's see what CI returns

 tests/intel-ci/xe-fast-feedback.testlist |  6 +++---
 tests/intel/xe_live_ktest.c              | 16 ++++++++--------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d8fd66a45..b5e96d536 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -228,9 +228,9 @@ igt@kms_psr@psr-sprite-plane-onoff
 igt@core_hotunplug@unbind-rebind
 
 # Run KUnit tests at the end
-igt@xe_live_ktest@bo
-igt@xe_live_ktest@dmabuf
-igt@xe_live_ktest@migrate
+igt@xe_live_ktest@xe_bo
+igt@xe_live_ktest@xe_dmabuf
+igt@xe_live_ktest@xe_migrate
 
 # Move fault_mode tests at the end to unblock execution
 igt@xe_exec_fault_mode@twice-basic
diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index 5f5f1dff7..4b8e60676 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -9,23 +9,23 @@
  * Functionality: kunit
  * Test category: functionality test
  *
- * SUBTEST: bo
+ * SUBTEST: xe_bo
  * Description:
  *	Kernel dynamic selftests to check if GPU buffer objects are
  *	being handled properly.
  * Functionality: bo
  *
- * SUBTEST: dmabuf
+ * SUBTEST: xe_dmabuf
  * Description: Kernel dynamic selftests for dmabuf functionality.
  * Functionality: dmabuf
  *
- * SUBTEST: migrate
+ * SUBTEST: xe_migrate
  * Description:
  *	Kernel dynamic selftests to check if page table migrations
  *	are working properly.
  * Functionality: migrate
  *
- * SUBTEST: mocs
+ * SUBTEST: xe_mocs
  * Description:
  *	Kernel dynamic selftests to check mocs configuration.
  * Functionality: mocs
@@ -37,10 +37,10 @@ struct kunit_tests {
 };
 
 static const struct kunit_tests live_tests[] = {
-	{ "xe_bo_test",		"bo" },
-	{ "xe_dma_buf_test",	"dmabuf" },
-	{ "xe_migrate_test",	"migrate" },
-	{ "xe_mocs_test",	"mocs" },
+	{ "xe_bo_test",		"xe_bo" },
+	{ "xe_dma_buf_test",	"xe_dmabuf" },
+	{ "xe_migrate_test",	"xe_migrate" },
+	{ "xe_mocs_test",	"xe_mocs" },
 };
 
 igt_main
-- 
2.43.0

