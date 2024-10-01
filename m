Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578DCCE7CE0
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 07:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A9710E5F2;
	Tue,  1 Oct 2024 07:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfK5AU4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5774C10E5F2
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 07:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727768148; x=1759304148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j/4zqbLgl3DRVik4dILIfiglZIv09qhnQEMJuBy+IKM=;
 b=nfK5AU4TqvNBEklzGkdT+MLuUfasqtlohNKFRHbeBE9qWe1T6zXdVwev
 jdE2b59+Dn4+9v9b2zATJlLRc2KN0nF5kuTVqJ6fre4lC7pKtEWSghs1m
 /RFXr7BPXNG/7yOcJ0NPnzyvaPwCwKI7Z1sStQhL0V/QkSTV/mxMUjGuD
 Ci+xGoWkeGXGbPZkoXdfzHf9Hr/biyeBnEsfz49R6I4AkFNFqGbALBbAE
 Gb1LTmI42J52oE1fpA7CqLAYhmFYD8HKQNo8/6EHxI6HfrsAtb9EfNTzQ
 8Na/PNt2yQQvgUBn87+M1JgK7fpopYM9TnWEQKcI3IOROPzNv6kHayOEk A==;
X-CSE-ConnectionGUID: LfF7H5iHRM+C7+UB41v1ig==
X-CSE-MsgGUID: ObjhP7ouSPeeFNtEGflSxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26839803"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="26839803"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 00:35:48 -0700
X-CSE-ConnectionGUID: tUfCRp4xQluFAGqp5pqtZg==
X-CSE-MsgGUID: +J6su7WzS1e0r1aPhmLCGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="96924455"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:35:47 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 1/1] tests/intel/kms_joiner: switch modeset from uj
 to bj and vice-versa
Date: Tue,  1 Oct 2024 13:04:48 +0530
Message-Id: <20241001073448.2252300-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001073448.2252300-1-santhosh.reddy.guddati@intel.com>
References: <20241001073448.2252300-1-santhosh.reddy.guddati@intel.com>
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

Add a subtest to validate switching from ultra joiner to big joiner
and vice-versa.

v2: Add new subtests for switching without force joiner (Karthik)
v3: start with uj to bj switch, if not available switch to force mode

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 53 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 508e82ce3..7c7436b9a 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -71,6 +71,9 @@
  * SUBTEST: invalid-modeset-force-ultra-joiner
  * Description: Verify if the modeset on the other pipes are rejected when
  *              the pipe A is active with force ultra joiner modeset.
+ *
+ * SUBTEST: switch-modeset-big-joiner-ultra-joiner
+ * Description: Verify modeset switch between ultra joiner and big joiner.
  */
 IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
@@ -507,6 +510,56 @@ igt_main
 				test_ultra_joiner(&data, false, false, false);
 	}
 
+	igt_describe("Verify modeset switch between joiner and ultra joiner");
+	igt_subtest_with_dynamic("switch-modeset-big-joiner-ultra-joiner") {
+		igt_require_f(data.n_pipes > 1,
+			      "Minimum 2 pipes required\n");
+
+		igt_dynamic_f("ultra_joiner_to_big_joiner") {
+			if (data.ultra_joiner_output_count > 0) {
+				test_ultra_joiner(&data, false, false, false);
+			} else {
+				igt_require_f(force_joiner_supported &&
+						  data.non_ultra_joiner_output_count > 0,
+					      "Force joiner not supported on this platform or none of the connected output supports it\n");
+				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+				test_ultra_joiner(&data, false, false, true);
+			}
+			if (data.big_joiner_output_count > 0) {
+				test_single_joiner(&data, data.big_joiner_output_count, false);
+			} else {
+				igt_require_f(force_joiner_supported &&
+							  data.non_big_joiner_output_count > 0,
+							  "Force joiner not supported on this platform or none of the connected outputs support it\n");
+					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+					test_single_joiner(&data, data.non_big_joiner_output_count, true);
+			}
+			igt_reset_connectors();
+		}
+
+		igt_dynamic_f("big_joiner_to_ultra_joiner") {
+			if (data.big_joiner_output_count > 0) {
+				test_single_joiner(&data, data.big_joiner_output_count, false);
+			} else {
+				igt_require_f(force_joiner_supported &&
+						  data.non_big_joiner_output_count > 0,
+					      "Force joiner not supported on this platform or none of the connected output supports it\n");
+					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+					test_single_joiner(&data, data.non_big_joiner_output_count, true);
+			}
+			if (data.ultra_joiner_output_count > 0) {
+				test_ultra_joiner(&data, false, false, false);
+			} else {
+				igt_require_f(force_joiner_supported &&
+						  data.non_ultra_joiner_output_count > 0,
+					      "Force joiner not supported on this platform or none of the connected output supports it\n");
+					enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+					test_ultra_joiner(&data, false, false, true);
+			}
+			igt_reset_connectors();
+		}
+	}
+
 	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
 		     "when the pipe is active with a big joiner modeset");
 	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
-- 
2.34.1

