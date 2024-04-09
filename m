Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0259BC67861
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 11:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDC8112CCF;
	Tue,  9 Apr 2024 11:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X51k9BvT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00E3112CCE
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 11:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712661589; x=1744197589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PQYmE0d0ylugm7BX2z8ATZME++8Zy5Hy7hMVZC7suJI=;
 b=X51k9BvTwp3dExORVF0bNb0GNU26RME0SFZ4eOsy8l/43XXAPTPAwfrU
 vap5keS05n153ll6gqtxdoqjmGTviXLUgZT6pIXj12Io11jStfEAVAuly
 noqDn57GMWZHiHP1/n3SQETiUTQu86jpRcCfczooMvX7toV3EK00Ld6n/
 /WXMrXJ6BJb+3oiRUNv4Cvs/PLP0fV6Mjrsj6KED+jlP7TrLivMdXEi9X
 +TFQMmJ3gN2bf7dkEdtZsdWdXssPky4HNEHUaMWLl/cno2jhgAbidXCta
 0X49NeY8hHmZqroSobIpPl7Ihfp+OSsFFUbuzXQLMUcfYJKeOB880tiqT A==;
X-CSE-ConnectionGUID: i8pmNJHsQx6CjEHkBV1BaQ==
X-CSE-MsgGUID: U6HmXRzUTDylyJruBmfsCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7839728"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7839728"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:19:49 -0700
X-CSE-ConnectionGUID: WlP1W/moSJ6BXbV2Fx8YPg==
X-CSE-MsgGUID: WOTT9IJiTLa/O/1Yubd01Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20640489"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:19:48 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/5] tests/intel: Remove name collision in Display tests
 visible in Core docs
Date: Tue,  9 Apr 2024 11:19:12 +0000
Message-Id: <20240409111915.2842477-3-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
References: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
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

Display team is not using Subcategory field, but this test is
visible in Core documentation. Let's remove name collision in
Category, Subcategory and Functionality.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/i915_pipe_stress.c | 2 +-
 tests/intel/prime_mmap_kms.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
index 6c5e951ab..de4df830f 100644
--- a/tests/intel/i915_pipe_stress.c
+++ b/tests/intel/i915_pipe_stress.c
@@ -26,7 +26,7 @@
  *              possible bandwidth/watermark and similar problems.
  * Functionality: kms_core
  * Mega feature: General Display Features
- * Sub-category: Display
+ * Sub-category: Display Tests
  * Test category: stress test
  *
  * SUBTEST: stress-xrgb8888-untiled
diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index 35d1eedde..7759b9469 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -41,7 +41,7 @@ IGT_TEST_DESCRIPTION(
  * TEST: prime mmap kms
  * Category: Infrastructure
  * Feature: prime
- * Functionality: memory management
+ * Functionality: prime
  * Sub-category: DRM
  * Test category: GEM_Legacy
  *
-- 
2.34.1

