Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACF8C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C4110ECC4;
	Thu, 21 Mar 2024 15:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UfCQ01t1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C67410ECCA
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711035596; x=1742571596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T4moPWjz/f2Bn7r8csLKKoRRgTnY1nEfI/XCBUwn2fw=;
 b=UfCQ01t1MhhRalWtY4SS3PeJF6fQK5HECXs3GqZjTNFVgCtVebEr/2Mw
 Yg4ZhP842GHcewMKYxx6AfVLA4BvDcJs/qL3EGsXKJQ+c/G5zyulbMreA
 PmuSbv3IWRFjyvlmJR7dF6gAqFiN2VLxkCLa0pR0W+L7ycuy3AoJV23IT
 +PjhS7bUcgoTmVMLpUOyVR/iFg6wfxk01GOElqJLymwKPsQBxT6GtA4de
 ZVwzfCVtWdv0gdycrVmdHAyB93uX3FjgxWWL1FuX0NeZiMT4xETIq+ZYP
 btKikXcnbDYHefv2CST0UPoVqBl5EkBbf/ovV8vSOxBXaAYe2TaZ2Uv74 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6146376"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="6146376"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19266813"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:39:54 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v5 05/24] tests/intel: Add tests to Compute subcategory
Date: Thu, 21 Mar 2024 15:38:28 +0000
Message-Id: <20240321153847.1787625-6-katarzyna.piecielska@intel.com>
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

Let's add to Compute subcategory:
 - tests/intel/gem_compute.c
 - tests/intel/gem_vm_create.c

v2: Make Sub-category/Functionality/Feature unique values. (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_compute.c         | 2 +-
 tests/intel/gem_ctx_persistence.c | 2 +-
 tests/intel/gem_vm_create.c       | 7 ++++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/gem_compute.c b/tests/intel/gem_compute.c
index 8d0214c4d..8bd9635ae 100644
--- a/tests/intel/gem_compute.c
+++ b/tests/intel/gem_compute.c
@@ -6,7 +6,7 @@
 /**
  * TEST: Check compute-related functionality
  * Category: Hardware building block
- * Sub-category: compute
+ * Sub-category: Compute
  * Test category: functionality test
  * Run type: BAT
  */
diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persistence.c
index 3f10c0fa3..6528e0f9c 100644
--- a/tests/intel/gem_ctx_persistence.c
+++ b/tests/intel/gem_ctx_persistence.c
@@ -47,7 +47,7 @@
 #include "sw_sync.h"
 /**
  * TEST: gem ctx persistence
- * Feature: context
+ * Feature: context feature
  * Category: Server
  * Functionality: context
  * Sub-category: Compute
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index 8834c987f..cb73828da 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -30,10 +30,11 @@
 /**
  * TEST: gem vm create
  * Category: Server
- * Functionality: context management
- * Run type: FULL
+ * Functionality: context
  * Sub-category: Compute
+ * Feature: mapping
  * Test category: GEM_Legacy
+ * Run type: FULL
  *
  * SUBTEST: create-ext
  * Feature: mapping
@@ -48,7 +49,7 @@
  * Feature: mapping
  *
  * SUBTEST: isolation
- * Feature: context, mapping
+ * Feature: context feature, mapping
  */
 
 static int vm_create_ioctl(int i915, struct drm_i915_gem_vm_control *ctl)
-- 
2.34.1

