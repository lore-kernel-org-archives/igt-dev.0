Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C50CED275
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 07:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E035610E482;
	Tue,  8 Oct 2024 07:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuSIJQ2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A774210E486
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728373013; x=1759909013;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nt3nuXGrO+kpuc+XHi/zqzd+ArJsTCLSBQjqwFNXnSc=;
 b=NuSIJQ2N4lsAst8oSuZIGv96CHz2ydtfHp+k/FEclna/xyu6bzT7p0Bk
 6VDRIhgDA9abtUFATP9RA+mS8UtK7l2lZXw3FoujLahZnxhwWQ8l+Fg0r
 YzvoEzTN76oXCfjIfPyVqtxFCiLSyTJSyaogcwVxu36Y9otlq4CDKp+VG
 vEXf/LsBGqrT2nD/zof/AiXWlB8zP1fnvFptz2I/zu9+lsmJaNmFJ2NWZ
 ySV1/2xfIldkcLrBxazdpYiLAlsjoUZ0uu4V0wCPDKw4lRAYU2U/vPVf/
 ux5SnNRS70Jk+elMkXDH0q+TkVpwAiZhdq9lNDfimEPcFmQnhR5a/+Ao2 A==;
X-CSE-ConnectionGUID: 0OpYMsVqQ3WKx1PP4U+6CA==
X-CSE-MsgGUID: KBk41GJBThWNQxkGnlMs7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38910956"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="38910956"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 00:36:52 -0700
X-CSE-ConnectionGUID: sXyFiTaITqWZsNahFRh2zA==
X-CSE-MsgGUID: Yu+Z3eSiRDq0BTvqxcKYHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="76171281"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.145.169.64])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 00:36:51 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, soham.purkait@intel.com,
 ashutosh.dixit@intel.com
Subject: [PATCH i-g-t v4] tests/intel/xe_oa: Skip rc6 disable test if gtidle
 node is missing
Date: Tue,  8 Oct 2024 13:04:15 +0530
Message-Id: <20241008073415.143698-1-soham.purkait@intel.com>
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
v4: Subject line fixed (Riana)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
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

