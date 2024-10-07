Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BAACFB455
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 19:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63C610E409;
	Mon,  7 Oct 2024 19:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mz4SLRXW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE6A10E409
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728328098; x=1759864098;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qVXiczmIz0frDDEXPTZnRYysK007lOnZcHnn4kYj0ns=;
 b=Mz4SLRXWztGuRyvRkxXoxOAs021uv0SMnFO49vF0PnQsL7lXlDz72qvA
 +O662Wc8u87i4UAg78ln0fqhq7ncpd7QDgooc+Pl9H4UJpFTMhcWk6sor
 G9vc+K9rBh2C/mdNzs7GSlEypjrc6cMIfNPP4MPQAkTvqf0vhy8RzBYJ9
 b2RpoyBA9fZBekhKl4sr2I7juzL6rVe291I0y1rEBF6/vWvU5Q1Nkl54E
 i26DDPnoPJnrmPspMiOyLqRMD7f3oUMgJcFW00HOmNgPmN4dXUxDH0Gxs
 v0YJj3N6AK23RoXfNMYWX6zv5lbaJmwQLEccGpnanzrt/5tHulEN0OQhV Q==;
X-CSE-ConnectionGUID: WF6pMUW/Se+v9R6HutKznQ==
X-CSE-MsgGUID: 5VFiv2rITmiweTLrbQsKZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27583729"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="27583729"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 12:08:17 -0700
X-CSE-ConnectionGUID: OkfoCk+3QpCrCnWd9eVxfg==
X-CSE-MsgGUID: iW3en7W1RY6maYOZXinP5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="76007395"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.145.169.64])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 12:08:15 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com
Subject: [PATCH i-g-t v3] tests/intel/xe_oa: Preventing test failures by
 omitting rc6 disable test if 'gtidle' node is missing
Date: Tue,  8 Oct 2024 00:35:41 +0530
Message-Id: <20241007190541.141470-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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

Rc6 disable test has been modified in order to check for 'gtidle'
node to skip residency tests on VF devices where this node is not
present, preventing test failure.

v3: Commit message fixed (Ashutosh)
    Space added before curly braces (Riana)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_oa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index b4dfcced7..92f5828c7 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4649,8 +4649,10 @@ igt_main
 			test_oa_unit_concurrent_oa_buffer_read();
 	}
 
-	igt_subtest("rc6-disable")
+	igt_subtest("rc6-disable") {
+		igt_require(xe_sysfs_gt_has_node(drm_fd, 0, "gtidle"));
 		test_rc6_disable();
+	}
 
 	igt_subtest_with_dynamic("stress-open-close") {
 		__for_one_hwe_in_oag(hwe)
-- 
2.34.1

