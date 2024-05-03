Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75ABC4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 11:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC0E10EA3C;
	Fri,  3 May 2024 11:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHcV2SZJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2063E10EA3C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714737413; x=1746273413;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kGB9TLwN0+/T0TE3nbwvnBIunaydp+trvnSCOIelEto=;
 b=XHcV2SZJk1e9b+Ba5EfnUJag6Jwx8r/E17lan20i9pk8xerbWbgEO2XK
 qNc0r82MQx4G0g+/Tec3lytEsfJQgJqPxQPsz8jZsreUJGbMtSCA2yURr
 Vwam82PNkpShb/oOqBXH4NWyPO3/XmbCVNnUDg8K7yVu0nc0ys1N2j60c
 nm8/DtwuyWiO9sJknKGGnASUBC1zn2yHLFWPmqoiTbY4PZk4tpLJIExgM
 u3FzNIut5TKX//YNNxXiYhnRcnbvB7ySmCiiekkKxnWbrNrRTiJ1pxHnV
 jey1dZrtZrIxYux1XCwJTmQrctD3l0sxHkI7lWE8eKTKSFfRm9tzQTWEY A==;
X-CSE-ConnectionGUID: yhO2Ci03SU+5v7qhePfyag==
X-CSE-MsgGUID: KX1sL+RyTaOzjRdQxK30tQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="13492746"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="13492746"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 04:56:52 -0700
X-CSE-ConnectionGUID: m8TVTsZwQXaL/pR2DO/mGQ==
X-CSE-MsgGUID: /JF2t/HtRzi9TWD/sOn7TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="32249029"
Received: from unknown (HELO gjsousa-mobl2.intel.com) ([10.124.222.44])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 04:56:51 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] igt_core: Update doc on generated test-list.txt
Date: Fri,  3 May 2024 08:55:46 -0300
Message-ID: <20240503115545.44784-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.44.0
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

Commit e72686b83b0b ("tests: create a single combined test list")
updated the build to generate a single test-list.txt instead of the two
single-tests.txt and multi-tests.txt files. Update the documentation in
igt_core.c to reflect that.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/igt_core.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 1abe3d3370d1..3ff3e0392316 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -217,11 +217,10 @@
  * On top of that tests may report unexpected results and minor issues to
  * stderr. If stderr is non-empty the test result should be treated as "warn".
  *
- * The test lists are generated at build time. Simple testcases are listed in
- * tests/single-tests.txt and tests with subtests are listed in
- * tests/multi-tests.txt. When running tests with subtest from a test runner it
- * is recommend to run each subtest individually, since otherwise the return
- * code will only reflect the overall result.
+ * The list of test executables is generated at build time and stored in
+ * tests/test-list.txt. When running tests with subtest from a test runner it is
+ * recommend to run each subtest individually, since otherwise the return code
+ * will only reflect the overall result.
  *
  * To do that obtain the lists of subtests with "--list-subtests", which can be
  * run as non-root and doesn't require a DRM driver to be loaded (or any GPU to
-- 
2.44.0

