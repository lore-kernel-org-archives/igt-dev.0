Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F14C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:19:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A655D10F21A;
	Mon,  4 Mar 2024 11:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+GuRbpd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C712510F21A
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551176; x=1741087176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5o9jW91UNNQFnNTl9NSOJiiX8XMNRHJfznwQMqosbX8=;
 b=E+GuRbpdoQojFoYu/8Xt1Awu+1Ml3/FZP5/KqQHij6ObUaa8lkciudCU
 8ofXX6CmGmqscteSbpcAeEk3ghAr82H/Vd2E+jN2zp7StuWI6ozeRIRSB
 ZFc7m/nzgtTXWu3xP7ViZx4pHBi8ZjMuHlz7SP3/rIW7inJKqCBZSm2rB
 OUTtLbXPeweoQWJUaawEeX6W7BP6EicMra8hur8x1sXJPc6O65237N8bR
 aOH+t2tETlg5O1bg0m0oMKNEAgjKTmroQ52ongdKs5mmou9jnMhmD23OQ
 7zQIvf81JKeRPaFY2LG5sDfrUMhldg71Rovl7sKHrani/vVvZdPbGscpO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4199189"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4199189"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:19:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="32125289"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:19:34 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t 18/24] tests: Introduce Synchronization subcategory
Date: Mon,  4 Mar 2024 11:16:11 +0000
Message-Id: <20240304111617.849785-19-katarzyna.piecielska@intel.com>
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

DRM and i915 subcategories seems to be too wide and general. Let's use
Synchronization subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
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

