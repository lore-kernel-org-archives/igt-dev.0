Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEA2C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B6889496;
	Tue, 12 Mar 2024 14:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKGBm6hd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095CF10E71C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710253045; x=1741789045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6lovIj6sqsJHTjzKAvy/q0z1PvOwd/ZgliirpwvsY7k=;
 b=oKGBm6hd3NYKoIZMs1alr1Mw1I0DRvsyAIEjRxf16YjKw+jv/bjSz5iP
 0sQVFgHxBbWpirT5TDiKqvel/rcR3r68BXjI/jutIesSSyib+kw2U4MK8
 FMhgoaTGHUmU/lr4CBKP47kYDawkmHA5tPUYKyUQQMdi0XfwyC2YGW44t
 W3wQWXkMsS0niwlHZ9NXJBGsDGoFkqrT7PtbRO5q7tL8tncMdpNb9Up4y
 yaFHsbIiC0+shbJ3Gys9aVuNh+F8PNNhM433Fy05QgnsflBUsFyt2atpO
 +H41PwlWcu0CYa3f0KVnNtMPwlTb/fXZKN8lV2p//3WoEZEMPaIN09saM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5568874"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5568874"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16158681"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:17:22 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 19/25] tests: Introduce intel-nouveau subcategory
Date: Tue, 12 Mar 2024 14:14:13 +0000
Message-Id: <20240312141419.1277931-20-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
References: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
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

There are some intel-nouveau tests that deserve its own subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/prime_nv_api.c   | 22 ++++++++++++++++++++++
 tests/prime_nv_pcopy.c | 18 ++++++++++++++++++
 tests/prime_nv_test.c  | 17 +++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/tests/prime_nv_api.c b/tests/prime_nv_api.c
index cb3d52e8d..a33e2202b 100644
--- a/tests/prime_nv_api.c
+++ b/tests/prime_nv_api.c
@@ -8,6 +8,28 @@
    test4 - export handle twice from intel, import into nouveau twice, check handle is the same
 */
 
+/**
+ * TEST: prime_nv_api
+ * Description: Basic api tests between intel and nouveau
+ * Sub-category: uapi
+ * Functionality: intel-nouveau
+ * Run type: FULL
+ *
+ * SUBTEST: i915_nv_import_twice
+ * SUBTEST: i915_nv_import_twice_check_flink_name
+ * SUBTEST: i915_nv_reimport_twice_check_flink_name
+ * SUBTEST: nv_i915_import_twice_check_flink_name
+ * SUBTEST: nv_i915_reimport_twice_check_flink_name
+ * SUBTEST: i915_nv_import_vs_close
+ * SUBTEST: i915_nv_double_import
+ * SUBTEST: i915_nv_double_export
+ * SUBTEST: i915_self_import
+ * SUBTEST: nv_self_import
+ * SUBTEST: i915_self_import_to_different_fd
+ * SUBTEST: nv_self_import_to_different_fd
+ *
+ */
+
 #include "igt.h"
 #include <stdio.h>
 #include <stdlib.h>
diff --git a/tests/prime_nv_pcopy.c b/tests/prime_nv_pcopy.c
index 5b2a89d80..ecaa9fb1b 100644
--- a/tests/prime_nv_pcopy.c
+++ b/tests/prime_nv_pcopy.c
@@ -13,6 +13,24 @@
    TODO add some nouveau rendering tests
 */
 
+/**
+ * TEST: prime_nv_pcopy
+ * Description: Basic set of prime tests between intel and nouveau
+ * Sub-category: intel-nouveau
+ * Functionality: buffer management
+ * Run type: FULL
+ *
+ * SUBTEST: test1_macro
+ * SUBTEST: test1_micro
+ * SUBTEST: test2
+ * SUBTEST: test3_1
+ * SUBTEST: test3_2
+ * SUBTEST: test3_3
+ * SUBTEST: test3_4
+ * SUBTEST: test3_5
+ * SUBTEST: test_semaphore
+ *
+ */
 
 #include "igt.h"
 #include <inttypes.h>
diff --git a/tests/prime_nv_test.c b/tests/prime_nv_test.c
index eb5e2d8ea..be9e56414 100644
--- a/tests/prime_nv_test.c
+++ b/tests/prime_nv_test.c
@@ -13,6 +13,23 @@
    TODO add some nouveau rendering tests
 */
 
+/**
+ * TEST: prime_nv_test
+ * Description: Basic set of prime tests between intel and nouveau
+ * Sub-category: intel-nouveau
+ * Functionality: buffer management
+ * Run type: FULL
+ *
+ * SUBTEST: i915_nv_sharing
+ * SUBTEST: nv_i915_sharing
+ * SUBTEST: nv_write_i915_cpu_mmap_read
+ * SUBTEST: nv_write_i915_gtt_mmap_read
+ * SUBTEST: i915_import_cpu_mmap
+ * SUBTEST: i915_import_gtt_mmap
+ * SUBTEST: i915_import_pread_pwrite
+ * SUBTEST: i915_blt_fill_nv_read
+ *
+ */
 
 #include "igt.h"
 #include <stdio.h>
-- 
2.34.1

