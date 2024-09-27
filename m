Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82017CCFA16
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 12:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA7110E339;
	Fri, 27 Sep 2024 12:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQsX3wYk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1800A10E339
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727439606; x=1758975606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pzZEeUtwC9FY7GX2IMNIr1C1LUS173hddtMVwA8tXjk=;
 b=HQsX3wYkXnqM1oO8QFvC+nZvw+M6AnHSYGCKCn/aMTtRgsFYkNYsa/7l
 mb53MYbrIMgyvYZY+OrbCTQO59BH0tnnpfKJO5RLZ+iDOQCV/m+JBbva1
 bsEUix0X0WpZ/eKOWqCy2d2ItgeP3bPKDVks871oG4lFxCzMoovmVuGbW
 MPEy6M3Dw66PObpEmtaU3Ph7/XG8982PYoPU2YcjkpDcwqdSPzWjsW7xg
 0nGaaqCRNDTRdy2I8CJ8RhqPzo32Rzp9x9kaV3HGEgAMSg2KTL84nn5ye
 WS00jJra+8AYQo8h7qjR6tHVkI3SgJwNju0gopR7Ix2e2VX13J92O/C67 w==;
X-CSE-ConnectionGUID: OID2peGeR/OPdU8WY5CkVA==
X-CSE-MsgGUID: ooH+LmE9SAqg/mXNaERL+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37162097"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="37162097"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 05:20:05 -0700
X-CSE-ConnectionGUID: SgCCDFlxQRqqjsM1JsZIMQ==
X-CSE-MsgGUID: FhGGBqF9SjKnW8XIRLDYmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72826787"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 05:20:04 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_joiner: switch modeset from uj to bj
 and vice-versa
Date: Fri, 27 Sep 2024 17:49:23 +0530
Message-Id: <20240927121923.1003676-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911133311.569568-1-santhosh.reddy.guddati@intel.com>
References: <20240911133311.569568-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 53 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 508e82ce3..aefa3b44d 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -71,6 +71,12 @@
  * SUBTEST: invalid-modeset-force-ultra-joiner
  * Description: Verify if the modeset on the other pipes are rejected when
  *              the pipe A is active with force ultra joiner modeset.
+ *
+ * SUBTEST: switch-modeset-force-ultra-joiner
+ * Description: Verify modeset switch between force joiner and force ultra joiner.
+ *
+ * SUBTEST: switch-modeset-ultra-joiner
+ * Description: Verify modeset switch between ultra joiner and big joiner.
  */
 IGT_TEST_DESCRIPTION("Test joiner / force joiner");
 
@@ -507,6 +513,53 @@ igt_main
 				test_ultra_joiner(&data, false, false, false);
 	}
 
+	igt_describe("Verify modeset switch between force joiner and force ultra joiner");
+	igt_subtest_with_dynamic("switch-modeset-force-ultra-joiner") {
+		igt_require_f(force_joiner_supported,
+			     "force joiner not supported on this platform or none of the connected output supports it\n");
+		igt_require_f(data.ultra_joiner_output_count > 0 &&
+				data.big_joiner_output_count > 0,
+				"No ultra joiner or big joiner output found\n");
+		igt_require_f(data.n_pipes > 1,
+					  "Minimum 2 pipes required\n");
+
+		igt_dynamic_f("force_ultra_joiner_to_big_joiner") {
+			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+			test_ultra_joiner(&data, false, false, true);
+			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+			test_single_joiner(&data, data.big_joiner_output_count, true);
+			igt_reset_connectors();
+		}
+
+		igt_dynamic_f("force_big_joiner_to_ultra_joiner") {
+			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+			test_single_joiner(&data, data.big_joiner_output_count, true);
+			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+			test_ultra_joiner(&data, false, false, true);
+			igt_reset_connectors();
+		}
+	}
+
+	igt_describe("Verify modeset switch between ultra joiner and big joiner");
+	igt_subtest_with_dynamic("switch-modeset-ultra-joiner")
+	{
+		igt_require_f(data.ultra_joiner_output_count > 0 &&
+					data.big_joiner_output_count > 0,
+					"No ultra joiner or big joiner output found\n");
+		igt_require_f(data.n_pipes > 1,
+					  "Minimum 2 pipes required\n");
+
+		igt_dynamic_f("ultra_joiner_to_big_joiner") {
+			test_ultra_joiner(&data, false, false, false);
+			test_single_joiner(&data, data.big_joiner_output_count, false);
+		}
+
+		igt_dynamic_f("big_joiner_to_ultra_joiner") {
+			test_single_joiner(&data, data.big_joiner_output_count, false);
+			test_ultra_joiner(&data, false, false, false);
+		}
+	}
+
 	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
 		     "when the pipe is active with a big joiner modeset");
 	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
-- 
2.34.1

