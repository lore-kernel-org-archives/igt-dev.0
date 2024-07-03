Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B5BC3271F
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 00:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D0210E70E;
	Wed,  3 Jul 2024 00:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoILWBuw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AF910E6F9
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 00:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719966338; x=1751502338;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=X3BKgRlLO92o4JUSBQAleF4Fe12zOtmHk9pavrKT5Y4=;
 b=XoILWBuwnZiiXHhCnUieyyT29phI3Tg7nxC30wRB7z3RaJSpnk1Wgr7W
 VicumdqReqQbh9Ge2aF9wGAdJwkyQAXapWDr89VRtpXsADX+RPOkTZ6Af
 INyfKxzK21FcW0nmlC4O2Uf3aYCxfxgsUjxtqq0W3rGIpi0G0k4Tp405N
 bfu2mHlgARPkQc2ZBJ2cc4oNAYpvC7UD3mjlPr4IbTxOxQI4YoTCFiALH
 j2sOgSRAe0HfEyXfC7WFfppXdAReCec/CK+Cm7q+y8183SlkN5Z+hbWM5
 Paitv+dlETMJ5ZyrCZArZUcLzd1EbE9OQUhhdnsueqlA7r3g0tTj2kZZF g==;
X-CSE-ConnectionGUID: rv98F6eGRqK8H+38KEHEJA==
X-CSE-MsgGUID: XX6zPLP6TlqOKF8diEBrkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20074280"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="20074280"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:37 -0700
X-CSE-ConnectionGUID: w9TcAuiORICTaPKuH8gq/w==
X-CSE-MsgGUID: AqR8kiizRGGZ3bMZk9qZOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46072861"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 17:25:37 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2 01/10] tests/intel/xe_drm_fdinfo: Rename basic to
 basic-memory test
Date: Tue,  2 Jul 2024 17:25:23 -0700
Message-Id: <20240703002532.3156277-2-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
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

Existing basic test is checking memory info in fdinfo. Rename
accordingly.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 2ceafba24..f0aa23e2f 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -22,8 +22,8 @@
  * Feature: SMI, core
  * Test category: SysMan
  *
- * SUBTEST: basic
- * Description: Check if basic fdinfo content is present
+ * SUBTEST: basic-memory
+ * Description: Check if basic fdinfo content is present for memory
  *
  * SUBTEST: drm-total-resident
  * Description: Create and compare total and resident memory consumption by client
@@ -259,7 +259,7 @@ static void test_total_resident(int xe)
 	xe_vm_destroy(xe, vm);
 }
 
-static void basic(int xe)
+static void basic_memory(int xe)
 {
 	struct drm_xe_mem_region *memregion;
 	uint64_t memreg = all_memory_regions(xe), region;
@@ -299,9 +299,9 @@ igt_main
 		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
 	}
 
-	igt_describe("Check if basic fdinfo content is present");
-	igt_subtest("basic")
-		basic(xe);
+	igt_describe("Check if basic fdinfo content is present for memory");
+	igt_subtest("basic-memory")
+		basic_memory(xe);
 
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("drm-total-resident")
-- 
2.38.1

