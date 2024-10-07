Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC78CFB440
	for <igt-dev@archiver.kernel.org>; Mon,  7 Oct 2024 04:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E578C10E0E5;
	Mon,  7 Oct 2024 04:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTNqj3gg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B02810E0E5
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Oct 2024 04:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728275078; x=1759811078;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4ldeDB0sQP166CV1faQTEAschz+QBY89x7EODKRgs/4=;
 b=lTNqj3ggOqCR8c1ywmI2fm16MLJcbtHgI6Wi6lX0k0gBEfuISPUU+Hem
 ZzLMINe5TUISkeQYZ/fg51lESk/CSZTevIcShX//5Mbj78zzVhj4AG423
 0+fJoeOKvK5bUCBihiaBNMqw3vcrOX7yzPW9yUV/zKdpBXcDY0im1or5c
 CfkaC15AAC6n7qrhDAgoROVaskpUlMTtqgS1g4BcQ2KmjekuAG46E6HNF
 8jAwKPKB23aR+a8+eenTTJgsTaUE5gGL0YPV/GoZRNHfBPQzVXVmU5U5N
 LyVYwrwnmb1qPMxt3qwO6JpcQgcYnNbVpVHB45yXJr9mwTMTizi49GxhZ g==;
X-CSE-ConnectionGUID: uluByPcJRx6DCP0dFNryTw==
X-CSE-MsgGUID: S8kMWofNQ/+3MOV1U8IIEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38800498"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38800498"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 21:24:37 -0700
X-CSE-ConnectionGUID: 4/oA9uSAQ3mw7SGisqAKdw==
X-CSE-MsgGUID: 2lSbw97tQ961zN6DeAPo5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="75477195"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.145.169.64])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 21:24:35 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v3] tests/intel/xe_oa: Preventing test failures by
 omitting rc6 disable test if 'gtidle' node is missing
Date: Mon,  7 Oct 2024 09:52:02 +0530
Message-Id: <20241007042202.138153-1-soham.purkait@intel.com>
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

v3: Commit message rephrasing

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_oa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index b4dfcced7..6a3d36559 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4649,8 +4649,10 @@ igt_main
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

