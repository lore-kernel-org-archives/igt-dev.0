Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFCEFA1FC7
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 15:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BA410E04D;
	Wed, 22 Apr 2026 15:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQhkJ8my";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E6C10E04D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 15:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776872689; x=1808408689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=la3Z+LlYP+YBmg2V8U7DZQIAyDkIh6zK7NvHSDmPiLc=;
 b=QQhkJ8my2FFZf8rxaFCgfzM4icI3QtBBcTa/RdeLGRMxtTuaL8cJU62X
 8rE2Kj0yCDJ4KEyMYEbXTSYes4aFCltXFmIFY1IQpZENYaJjpFLXSnG4z
 XhK4dsj3CGOG0OOqVTMhnnrVq9XiC2b+xmPWqeo2WDgfUWjPqgJyYYwjp
 wZon2y6t04aUPDWro58yiE4yVBRgI85kFqvVYokMvT72iYjxwW4KIcXlT
 dcXRIt+UUMNPXMkgsK/5moR7md0ZAkCnu7MIT9OU2x3BOqodHsSoaxsuY
 jhulGeU2DswgkKGm5QkAqUXjDwofQ3uBzvCmKGCVhTCcM6j7old/Lqapy A==;
X-CSE-ConnectionGUID: UOH+WGWWTeyQpArMDMKMFg==
X-CSE-MsgGUID: dKGVue7rT4yBrDk+ppGudg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81692684"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="81692684"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:44:49 -0700
X-CSE-ConnectionGUID: GlDyxFqOQIuAcvN47nlS0g==
X-CSE-MsgGUID: M4AEa7KDQlqvTXMtfGNE+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="236762681"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 08:44:48 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 5/5] tests/prime_udl: Rename into i915_prime_udl
Date: Wed, 22 Apr 2026 17:44:23 +0200
Message-ID: <20260422154423.141908-6-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
References: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
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

This is an i915 test so rename it and move it to tests/intel/.
Add documentation so build will not become broken.

Cc: Karthik B S <karthik.b.s@intel.com>
Suggested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/{prime_udl.c => intel/i915_prime_udl.c} | 17 +++++++++++++++++
 tests/meson.build                             |  2 +-
 2 files changed, 18 insertions(+), 1 deletion(-)
 rename tests/{prime_udl.c => intel/i915_prime_udl.c} (88%)

diff --git a/tests/prime_udl.c b/tests/intel/i915_prime_udl.c
similarity index 88%
rename from tests/prime_udl.c
rename to tests/intel/i915_prime_udl.c
index db83152fc..0f2dd50c0 100644
--- a/tests/prime_udl.c
+++ b/tests/intel/i915_prime_udl.c
@@ -13,6 +13,23 @@
 
 #include "i915/gem_create.h"
 
+/**
+ * TEST: i915 prime udl
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
index 4c1a39e9e..196fff8ca 100644
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
@@ -231,6 +230,7 @@ intel_i915_progs = [
 	'i915_pm_rps',
 	'i915_pm_sseu',
 	'i915_power',
+	'i915_prime_udl',
 	'i915_query',
 	'i915_selftest',
 	'i915_suspend',
-- 
2.54.0

