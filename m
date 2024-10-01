Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C35FCEACFA
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 19:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C974E10E65D;
	Tue,  1 Oct 2024 19:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABevB1OS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2A110E65D
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 19:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727810100; x=1759346100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IHen8jiTiAXOFXhh9Cx7n0cWPNP1+79LCUA49MRSCmI=;
 b=ABevB1OSwVYv1EbGTjReTZYFICZPWNoOLB6bkSemtNw0+qbrFEy3sCq0
 0o2uSkWB0pJjgcRhTDo2x+TluXc8TVupetG/4UXZG3TFS5BMP/Soq5jac
 EG/CIkODqN+g47EgzJOw/6tDMsVfWbdhzAce9KTpW3/jnR/oGD9HXKyGd
 VknMizwQG3xVLrS5IyCMCr6CUqoYJIMYlRtWrGhsnJPDOBYuiCItR7fmF
 x/Tej4qCGxPYgUoL6wtrnjAWlU5DkMi5SSkkkIARd6nK6GEqqZN46Jb5D
 USNQsyeN57yCxS1H2sm49NqC+GW+TldGz/tJFxO9C6exeLdmCkd6xOI7G g==;
X-CSE-ConnectionGUID: cinPdveDREyGuhofKmcdIA==
X-CSE-MsgGUID: M/xjr9mORXyHYJYLX/XmaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27099348"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="27099348"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 12:14:59 -0700
X-CSE-ConnectionGUID: uiMaSxTpQNK4tjVYpfefAg==
X-CSE-MsgGUID: FKRz3zslSGmIOuVsu2AZFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="73802494"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.145.169.64])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 12:14:58 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, soham.purkait@intel.com
Subject: [PATCH 1/1] Check gtidle before rc6 disable test
Date: Wed,  2 Oct 2024 00:42:30 +0530
Message-Id: <20241001191230.113540-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001191230.113540-1-soham.purkait@intel.com>
References: <20241001191230.113540-1-soham.purkait@intel.com>
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

From: "Purkait, Soham" <soham.purkait@intel.com>

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

