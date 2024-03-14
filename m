Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50696C54E67
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF9A10E93E;
	Thu, 14 Mar 2024 14:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E103OhQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A61810E93E
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710427081; x=1741963081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ztCZ6n7q2bVuZHZb7VKG6R8W66fdf+GMm2vlWrh7Boo=;
 b=E103OhQF+EJupl/pr7FWd6dvZ9a/q+EtqB2/potlYTyfWy/m0ZpB+L5B
 FYUlhZzAoBWC2X3iEiwHJfkY9ppe85rhht/H928N2igY/ZMb5bDZhar2u
 6xhQSgin9+z8jVIcVSpYyJw+RoYw4YI0BMNOSrDwj+pn2EtZoaB2RVAnV
 iUlWwwqgFjn3DB+MdA3pNGTfmVknnT3pJUabf6k5p46WHDJUpl40euTVX
 5K7+YHijxK51qiNZeKcbYVyRXwi1VyFAZuXLmka11xpcxVdILkwKbuyOs
 UAnsAM6AuY/xjbrISzzGH0Hixe5gMhqluBH/5tkEa6j1l8qWuCeyr6bIv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5098974"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5098974"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:38:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12376276"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:38:00 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v4 18/25] tests: Introduce Synchronization subcategory
Date: Thu, 14 Mar 2024 14:34:48 +0000
Message-Id: <20240314143455.1436688-19-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
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

v2: Make Sub-category/Functionality/Feature unique values. (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_sync.c | 4 ++--
 tests/sw_sync.c        | 1 +
 tests/syncobj_basic.c  | 6 +++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
index d3de2e77e..02fba38e4 100644
--- a/tests/intel/gem_sync.c
+++ b/tests/intel/gem_sync.c
@@ -36,9 +36,9 @@
  * TEST: gem sync
  * Category: Infrastructure
  * Description: Basic check of ring<->ring write synchronisation.
- * Feature: synchronization
+ * Feature: synchronization_
  * Functionality: semaphore
- * Sub-category: i915
+ * Sub-category: Synchronization
  * Test category: GEM_Legacy
  * Run type: FULL
  *
diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index a276c4a22..8ea3dbe6c 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -44,6 +44,7 @@
  * Description: Test SW Sync Framework
  * Feature: semaphore
  * Functionality: sw sync framework
+ * Run type: FULL
  * Sub-category: uapi
  * Test category: GEM_Legacy
  *
diff --git a/tests/syncobj_basic.c b/tests/syncobj_basic.c
index f079baf09..18bef7c5c 100644
--- a/tests/syncobj_basic.c
+++ b/tests/syncobj_basic.c
@@ -30,10 +30,10 @@
  * TEST: syncobj basic
  * Category: Infrastructure
  * Description: Basic check for drm sync objects.
- * Feature: synchronization
- * Functionality: semaphore
+ * Feature: semaphore
+ * Functionality: drm sync object
  * Run type: FULL
- * Sub-category: DRM
+ * Sub-category: Synchronization
  * Test category: GEM_Legacy
  *
  * SUBTEST: bad-create-flags
-- 
2.34.1

