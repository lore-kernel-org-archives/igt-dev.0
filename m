Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE8EC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 11:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90C7112009;
	Mon,  4 Mar 2024 11:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7N07VlZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F332112009
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 11:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551078; x=1741087078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5UDpwfaLzpVYEF3ZQ6lmIW+1ZSlmpMRpw9WFoijZPD0=;
 b=a7N07VlZ3cr7vklldo3h9l6KBMhfVf31S3/3sjYcnUJKn2/WIEeYxbRh
 pbmAHkbDZw3oUVxomm1yODXjpNv/Uycx43NIqcH2OZrHwcj9HviWvJCav
 UxFII6UaPqWZGd76NpRcnx5KHXoZVzx0o7g6sh7GFvjHpS+cKtutWtqkR
 W+h2MGosiCPzV8P5jZZxEglkUJuBRzcZ/P6Qs2tSo4IZuEAIvHEB8R4kK
 kr8+Fyhy1++CUjwVA1odDwd7mgGOQiGhU9vWgSh1ugIDgewhqAFGbX888
 pWRNsbz8LqLRvKAbapFZwP0dw/GtJ/CEPICQAPUV7s6jY0mZp9lJetUdR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14745762"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="14745762"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:17:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="46480015"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:17:56 -0800
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t 08/24] tests/intel: Introduce Blitter subcategory
Date: Mon,  4 Mar 2024 11:16:01 +0000
Message-Id: <20240304111617.849785-9-katarzyna.piecielska@intel.com>
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

Let's introduce Blitter subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_exercise_blt.c      | 14 +++++++-------
 tests/intel/gem_set_tiling_vs_blt.c |  3 +++
 tests/intel/gen9_exec_parse.c       |  3 +++
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
index 4a9bc3729..f8fc689ff 100644
--- a/tests/intel/gem_exercise_blt.c
+++ b/tests/intel/gem_exercise_blt.c
@@ -14,18 +14,18 @@
  * TEST: gem exercise blt
  * Description: Exercise blitter commands
  * Feature: blitter
- * Run type: FULL
+ * Sub-category: Blitter
+ * Category: Desktop client
+ * Functionality: blitter
  * Test category: GEM_Legacy
+ * Run type: FULL
  *
  * SUBTEST: fast-copy
- * Description:
- *   Check fast-copy blit
- *   blitter
+ * Description: Check fast-copy blit blitter
  *
  * SUBTEST: fast-copy-emit
- * Description:
- *   Check multiple fast-copy in one batch
- *   blitter
+ * Description: Check multiple fast-copy in one batch blitter
+ *
  */
 
 IGT_TEST_DESCRIPTION("Exercise blitter commands");
diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
index 9077e0f3f..28469f5f3 100644
--- a/tests/intel/gem_set_tiling_vs_blt.c
+++ b/tests/intel/gem_set_tiling_vs_blt.c
@@ -61,6 +61,9 @@
  * TEST: gem set tiling vs blt
  * Description: Check for proper synchronization of tiling changes vs. tiled gpu access.
  * Feature: blitter, gtt
+ * Functionality: tiling
+ * Sub-category: Blitter
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: tiled-to-tiled
diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
index 33ff6bcb5..509a2e80f 100644
--- a/tests/intel/gen9_exec_parse.c
+++ b/tests/intel/gen9_exec_parse.c
@@ -36,6 +36,9 @@
 /**
  * TEST: gen9 exec parse
  * Feature: blitter, command_parser
+ * Sub-category: Blitter
+ * Functionality: command_parser
+ * Category: Desktop client
  * Run type: FULL
  *
  * SUBTEST: allowed-all
-- 
2.34.1

