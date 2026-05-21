Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F504CD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 17:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A28C10E4AC;
	Thu, 21 May 2026 17:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CatMbuXp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7C310E54D
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779385728; x=1810921728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8B7Kmg4eTcjnPSwrS1jL10qJ8zTpVqyzrY3PZ4RGiVY=;
 b=CatMbuXpl0tbf1eyTLSlMvSyXUpzgsVyGApDFmRRxGOkHpjtKSUYk0B+
 Jx8KQ4OXFK2G0z74CdKJ+qg75H44VKthViZ2aQ9B3URq8ZQvPmn04EA2W
 3x+Iwzir3McU8lCJvYy6+PvQODH+gbxM3hyItgYdWkK9hzpDV8qqZ1IVy
 yxiqFgFzhPAjCvUyKvkgBaj1lWHRIX/2gXqqzxTxq15aWMg2h62wqUY1R
 DGPrwwo/ns/9u/eepbvW3D88EGy2rq3UL4GS4FnfqeFQqSNf4QlqyDjV+
 +1gADf94B6Q3dV0iVv5viZGLe7/qNmrMeXlxUox0clfCD0mr/R8dInmXT A==;
X-CSE-ConnectionGUID: tvG5FkpwRiCzk0ZD0HuI0A==
X-CSE-MsgGUID: 4xUwrdDDTcOjb08MLxGkYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="97883825"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="97883825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:48:47 -0700
X-CSE-ConnectionGUID: b5j/6utTRkO3WEm/PodyTw==
X-CSE-MsgGUID: NJ32S5WmT6mk+FkH7zs6Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="244612400"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.74])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 10:48:46 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 5/5] tests/prime_udl: Move into intel/ and add
 documentation
Date: Thu, 21 May 2026 19:48:20 +0200
Message-ID: <20260521174820.167237-6-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521174820.167237-1-kamil.konieczny@linux.intel.com>
References: <20260521174820.167237-1-kamil.konieczny@linux.intel.com>
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

This is an i915 test so move it to tests/intel/ folder.
Add also documentation so build will not become broken.

v3: keep old name, add documentation in subject (Kamil)

Cc: Karthik B S <karthik.b.s@intel.com>
Suggested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/{ => intel}/prime_udl.c | 17 +++++++++++++++++
 tests/meson.build             |  2 +-
 2 files changed, 18 insertions(+), 1 deletion(-)
 rename tests/{ => intel}/prime_udl.c (88%)

diff --git a/tests/prime_udl.c b/tests/intel/prime_udl.c
similarity index 88%
rename from tests/prime_udl.c
rename to tests/intel/prime_udl.c
index db83152fc..c6ef4a750 100644
--- a/tests/prime_udl.c
+++ b/tests/intel/prime_udl.c
@@ -13,6 +13,23 @@
 
 #include "i915/gem_create.h"
 
+/**
+ * TEST: prime udl
+ * Category: Display
+ * Description: Basic set of prime tests between Intel and DisplayLink.
+ * Driver requirement: i915
+ * Mega feature: General Display Features
+ * Sub-category: Memory management tests
+ * Functionality: prime import/export
+ * Test category: GEM_Legacy
+ * Feature: prime
+ *
+ * SUBTEST: share-import
+ *
+ * SUBTEST: share-import-addfb
+ *
+ */
+
 IGT_TEST_DESCRIPTION("Basic set of prime tests between Intel and DisplayLink");
 
 int intel_fd = -1, udl_fd = -1;
diff --git a/tests/meson.build b/tests/meson.build
index fe0818118..0207b7da8 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -72,7 +72,6 @@ test_progs = [
 	'kms_vrr',
 	'kms_writeback',
 	'meta_test',
-	'prime_udl',
 	'prime_vgem',
 	'sriov_basic',
 	'syncobj_basic',
@@ -239,6 +238,7 @@ intel_i915_progs = [
 	'prime_mmap_coherency',
 	'prime_mmap_kms',
 	'prime_self_import',
+	'prime_udl',
 	'sysfs_defaults',
 	'sysfs_heartbeat_interval',
 	'sysfs_preempt_timeout',
-- 
2.54.0

