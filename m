Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A89CC88E4D
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 21:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A9210E40C;
	Fri, 11 Sep 2026 21:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqrjTjEh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F22F10E1F5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 20:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789160296; x=1820696296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GPgjBrtyXQ/0fPYAUM7GbxZvax+6mFifcL/dGlAU5CI=;
 b=OqrjTjEhyyIbcxmBpRwA/bb3r0tioQHED9UbMPiqfQmi8mtutgDCpkoC
 WHD0UcwLEoBJwnX0APUCVJvTUkECwMP3bizwotR5YEreSERPqI/INHME+
 aeEQaEp1i1VUtPdehL2iMEozEG7WwEKyYOjwq8caun9lO1Df+4u51Cyy8
 JKky/MSOYsiiw2zYIaxJoM4KkQyDAUfVJ5SEv/WngZ8UHUx0HSl7neENU
 ZJ3XQq1NygZyBvYbIMjFFtFKfT5U0/kWvDnZwwCJ1bdlzqmwiZIzkgVBl
 o/6tIMKxwafzaxHXNk1YTHlhSZuZTtS+UoAcVrQEnuFOO8GkunsgHVr/d w==;
X-CSE-ConnectionGUID: ih3AE834SjuLZDCZ6ZxxVg==
X-CSE-MsgGUID: 2/cxl9v8QeiBKYE384kX+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="138968"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="138968"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:16 -0700
X-CSE-ConnectionGUID: eOjkbI6ZRVSg6FL1cKbK6Q==
X-CSE-MsgGUID: RgS8VU7YRuq2CV2ObcIJyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="310293717"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:15 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v3 6/9] tests/intel/kms_dsc: Add compressed BPP combinations
Date: Sat, 12 Sep 2026 02:37:06 +0530
Message-Id: <20260911210709.943683-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260911210709.943683-1-swati2.sharma@intel.com>
References: <20260911210709.943683-1-swati2.sharma@intel.com>
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

Add a subtest that combines compressed BPP testing with all
supported DSC output formats and input BPC values.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_dsc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 90dbcb444..8fd383c1f 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -62,8 +62,11 @@
  * @fractional-bpp:               DSC with fractional bpp with default parameters
  * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
  * @compressed-bpp:               DSC with compressed bpp
+ * @compressed-bpp-with-output-formats-with-bpc: DSC with compressed bpp, output formats, and input BPC
  * @compressed-bpp-bigjoiner:               DSC with big joiner and compressed bpp
+ * @compressed-bpp-with-output-formats-with-bpc-bigjoiner: DSC with big joiner, compressed bpp, output formats, and input BPC
  * @compressed-bpp-ultrajoiner:             DSC with ultra joiner and compressed bpp
+ * @compressed-bpp-with-output-formats-with-bpc-ultrajoiner: DSC with ultra joiner, compressed bpp, output formats, and input BPC
  * @basic-bigjoiner:                        DSC with big joiner and default parameters
  * @with-formats-bigjoiner:                 DSC with big joiner and diff formats
  * @with-bpc-bigjoiner:                     DSC with big joiner and certain input BPC
@@ -622,6 +625,24 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 			test_dsc(&data, TEST_DSC_COMPRESSED_BPP,
 				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
 				 DSC_FORMAT_RGB, joiner_tests[i]);
+
+		igt_describe_f("Tests compressed BPP with output formats and input BPC "
+			       "on all connectors that support it%s",
+			       joiner_tests[i] ? " and joiner" : "");
+		igt_subtest_with_dynamic_f("dsc-compressed-bpp-with-output-formats-with-bpc%s",
+					   joiner_subtest_suffix(joiner_tests[i])) {
+			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
+				for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
+					test_dsc(&data,
+						 TEST_DSC_COMPRESSED_BPP |
+						 TEST_DSC_OUTPUT_FORMAT |
+						 TEST_DSC_BPC,
+						 bpc_list[j], DRM_FORMAT_XRGB8888,
+						 output_format_list[k],
+						 joiner_tests[i]);
+				}
+			}
+		}
 	}
 
 	igt_fixture() {
-- 
2.25.1

