Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7A9C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A5F112E69;
	Tue, 12 Mar 2024 14:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBcoCJgE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75A1112E66
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710253036; x=1741789036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/RMp2+Xa7nmnNUMJTgG+kUmsIvzPRbSPS819o8zxk0g=;
 b=lBcoCJgE2TeVViZ038BIeUvz/JdULxF9mlGyyiKAY7JYTC6TxcxyV0aw
 9rI1ZSFrBHL2ub+MkIillAuCIjtDkNPsA118eNcXvhJ0NPB2QMp8yAJkx
 WnS3NsUpXrlLnRZiAOJaw5yi5gVaGLDED6bBCWhdt8HgvuE2HJF5B6ZmZ
 xd4xj90wyxK83Kg0bulMGsDFjW8dZWb89DbDclsI+c4YIqm0MC9UCiA+b
 Rnl8Zcl06uQI/iMidq6XPGh2Ilqykl1QYtmkxThHl0Amae1w7nrIxCvE4
 yAJhfg8pK3pVg8YcspgqYAOTe+2AI/9NKuIUHPIHoepRDEcEsg0cUrjy9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15519010"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="15519010"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11627415"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:17:14 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v3 18/25] tests: Introduce Synchronization subcategory
Date: Tue, 12 Mar 2024 14:14:12 +0000
Message-Id: <20240312141419.1277931-19-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
References: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
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

DRM and i915 subcategories seems to be too wide and general. Let's use
Synchronization subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_sync.c   | 2 +-
 tests/intel/gem_wait.c   | 2 +-
 tests/sw_sync.c          | 2 +-
 tests/syncobj_basic.c    | 2 +-
 tests/syncobj_timeline.c | 2 +-
 tests/syncobj_wait.c     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index d3de2e77e..129ee3b68 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -38,7 +38,7 @@
  * Description: Basic check of ring<->ring write synchronisation.
  * Feature: synchronization
  * Functionality: semaphore
- * Sub-category: i915
+ * Sub-category: Synchronization
  * Test category: GEM_Legacy
  * Run type: FULL
  *
diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
index e2a598c64..0d4a959b1 100644
--- a/tests/intel/gem_wait.c
+++ b/tests/intel/gem_wait.c
@@ -37,7 +37,7 @@
  * Description: Tests the GEM_WAIT ioctl
  * Feature: synchronization
  * Functionality: semaphore
- * Sub-category: i915
+ * Sub-category: Synchronization
  * Test category: GEM_Legacy
  * Run type: FULL
  *
diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index 6c476ff46..40ecec665 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -45,7 +45,7 @@
  * Feature: synchronization
  * Functionality: semaphore
  * Run type: FULL
- * Sub-category: DRM
+ * Sub-category: Synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: alloc_fence
diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
index f079baf09..6c75fce96 100644
--- a/tests/syncobj_basic.c
+++ b/tests/syncobj_basic.c
@@ -33,7 +33,7 @@
  * Feature: synchronization
  * Functionality: semaphore
  * Run type: FULL
- * Sub-category: DRM
+ * Sub-category: Synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: bad-create-flags
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index ea8341a30..083091583 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -37,7 +37,7 @@
  * Feature: synchronization
  * Functionality: semaphore
  * Run type: FULL
- * Sub-category: DRM
+ * Sub-category: Synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: 32bits-limit
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index e0ff69b79..687f2613e 100644
--- a/tests/syncobj_wait.c
+++ b/tests/syncobj_wait.c
@@ -37,7 +37,7 @@
  * Feature: synchronization
  * Functionality: semaphore
  * Run type: FULL
- * Sub-category: DRM
+ * Sub-category: Synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-multi-wait-all-unsubmitted
-- 
2.34.1

