Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1289FC5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:17:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63C110FFFE;
	Mon,  4 Mar 2024 11:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BayUybdt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0999010FFFE
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551027; x=1741087027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bRSaLfbgtxw+Cz8JmzzM5zmzHF7BO8j/6khxCzMgZuM=;
 b=BayUybdts12DpU1bw9p8YH5kws4tMGt2Gx4DeVpjrqHYn/oM8TvzKxf+
 BLOJ8t0hPFzP2LkBof5OdExc/iypOcHuTRDKj3g8G+OE2/d2FxQvQjbbD
 EJ5t8trC0Ma1c+d0nWoWgfu3geau0OhgYuXjIoOV1CIwn549bUS3D8QFI
 64U5naFs4m8gj8c6q9SBROT35f5PMIHQUGlrFtQaVBN1gIahhz21FeOlo
 uK7B4ZG55wdC7K/B/KBFr4FjWMe782IWlMp5+DfkuFfDnKQToDiYwGfFH
 Qcj3xFJymN3iwDuMop4weG2waCmCuyaCt4Y+lcFp4fpclKC9uINT2frgy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15444877"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="15444877"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:17:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8840348"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:17:04 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 03/24] tests/intel: Introduce Fences subcategory
Date: Mon,  4 Mar 2024 11:15:56 +0000
Message-Id: <20240304111617.849785-4-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Let's introduce 'Fences' subcategory to allow better alignment between i915
and XE.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/gem_fence_thrash.c       |  3 +++
 tests/intel/gem_fence_upload.c       |  3 +++
 tests/intel/gem_fenced_exec_thrash.c |  3 +++
 tests/intel/gem_vm_create.c          | 10 ++++------
 tests/intel/prime_busy.c             |  2 +-
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thrash.c
index 4cb3d842b..0c9be92df 100644
--- a/tests/intel/gem_fence_thrash.c
+++ b/tests/intel/gem_fence_thrash.c
@@ -46,6 +46,9 @@
 /**
  * TEST: gem fence thrash
  * Feature: gtt, synchronization
+ * Sub-category: Fences
+ * Category: Desktop client
+ * Functionality: synchronization
  * Run type: FULL
  *
  * SUBTEST: bo-copy
diff --git a/tests/intel/gem_fence_upload.c b/tests/intel/gem_fence_upload.c
index b239c0e78..074908d81 100644
--- a/tests/intel/gem_fence_upload.c
+++ b/tests/intel/gem_fence_upload.c
@@ -43,6 +43,9 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem fence upload
+ * Sub-category: Fences
+ * Category: Desktop client
+ * Functionality: synchronization
  * Run type: FULL
  *
  * SUBTEST: performance
diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
index 098f22ef4..b26eb7780 100644
--- a/tests/intel/gem_fenced_exec_thrash.c
+++ b/tests/intel/gem_fenced_exec_thrash.c
@@ -37,6 +37,9 @@
  * TEST: gem fenced exec thrash
  * Description: Test execbuf fence accounting.
  * Feature: gtt, synchronization
+ * Sub-category: Fences
+ * Category: Desktop client
+ * Functionality: synchronization
  * Run type: FULL
  *
  * SUBTEST: 2-spare-fences
diff --git a/tests/intel/gem_vm_create.c b/tests/intel/gem_vm_create.c
index 8834c987f..d3d03eb73 100644
--- a/tests/intel/gem_vm_create.c
+++ b/tests/intel/gem_vm_create.c
@@ -30,22 +30,20 @@
 /**
  * TEST: gem vm create
  * Category: Server
- * Functionality: context management
- * Run type: FULL
- * Sub-category: Compute
+ * Functionality: compute
+ * Sub-category: Context
+ * Feature: mapping
  * Test category: GEM_Legacy
+ * Run type: FULL
  *
  * SUBTEST: create-ext
- * Feature: mapping
  *
  * SUBTEST: execbuf
  * Feature: cmd_submission, mapping
  *
  * SUBTEST: invalid-create
- * Feature: mapping
  *
  * SUBTEST: invalid-destroy
- * Feature: mapping
  *
  * SUBTEST: isolation
  * Feature: context, mapping
diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c
index 90d79864f..a4edb0e0a 100644
--- a/tests/intel/prime_busy.c
+++ b/tests/intel/prime_busy.c
@@ -33,7 +33,7 @@
  * Feature: prime
  * Functionality: buffer management
  * Run type: FULL
- * Sub-category: DRM
+ * Sub-category: Fences
  * Test category: GEM_Legacy
  *
  * SUBTEST: after
-- 
2.34.1

