Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC7CCF34A0
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 12:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E5610E824;
	Thu,  3 Oct 2024 12:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i1guGbWu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C58A10E827
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727956810; x=1759492810;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ae+Z4dIGQlEA7wHsVSqDpGykn+/0YIcJn1GseJpaz5o=;
 b=i1guGbWuPCP9g4LKxYfhivXz1FlY0YJUp+24GiRbpFs27pm0mW20OD9J
 YNH8FBZ56FSBUBjVYDyvw7BpqnPS12UfoMCg+u8WkOna/ij6zWzfUnMA1
 YFCaEuq1gE7fVkKhv+oOW0y3xUdeBz0A3N3Rw1KNZ62mQSYZc8eRx7qAa
 wDtQf4S1Exddu/liCCrs8cZWdrxWrjR3sDHOMMQIq2hFcPCa5pLYeSLmH
 SA7cJLrOgBXT6ZN9v86YwXHSDqiG9dG3M5hv/PxCwf+IAGvwvUAn5hv/R
 gty+ceF079a5FOOlybO9gwo76DQQ92/6cm18IRz70w2FsesozQKjzWFUY Q==;
X-CSE-ConnectionGUID: LVJBFqwuTCaCvOL5MlFw6g==
X-CSE-MsgGUID: lcu5b9IBRsWPtcMZBPeISw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37808774"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="37808774"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 05:00:10 -0700
X-CSE-ConnectionGUID: Uqcy+GFdRXOi9rPZKYP7BA==
X-CSE-MsgGUID: NTGVlp3eQ2Gb/2Ymn013Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="75123576"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.145.169.64])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 05:00:08 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v2] tests/intel/xe_oa: Check gtidle before rc6 disable
 test
Date: Thu,  3 Oct 2024 17:27:41 +0530
Message-Id: <20241003115741.119720-1-soham.purkait@intel.com>
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

Rc6 disable test has been modified in order to check the
presence of gtidle node in sysfs gt0 path through the following
code snippets :
igt_require(xe_sysfs_gt_has_node(drm_fd, 0, "gtidle")).

As of now only Render GT (gt0) is used for rc6 disable test through OA
activation. Standalone Media (gt1) is not supported yet for the same.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_oa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9be4fd633..6538d6323 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4644,8 +4644,10 @@ igt_main
 			test_oa_unit_concurrent_oa_buffer_read();
 	}
 
-	igt_subtest("rc6-disable")
+	igt_subtest("rc6-disable"){
+		igt_require(xe_sysfs_gt_has_node(drm_fd, 0, "gtidle"));
 		test_rc6_disable();
+	}
 
 	igt_subtest_with_dynamic("stress-open-close") {
 		__for_one_hwe_in_oag(hwe)
-- 
2.34.1

