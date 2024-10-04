Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83870CFA751
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 07:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BFC10E8F0;
	Fri,  4 Oct 2024 07:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEMbzNo2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D6510E8F0
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 07:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728028206; x=1759564206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dtnG5NxJAYD3eTVLwUGh07QMqfsD5L20k7HZ7hAkHMo=;
 b=aEMbzNo2OB/VMVAG860QLZGD0oDmBERNnsF2vJR9eUGuBe2mY0qBMXLf
 zBq8V8JVhv6cfXPPglH/MBiJPYA3iCQQYptinrvpRhi8O6Yw2rmmnbG39
 fj6ZWGwnhbUFcjX4FinHvzdLGWbe/0/8qnQ5GHrbqg9NW8cqelccQCMpg
 JTBIXsII00uBj0Zhtc5Z6fxurEL24gdIwWm6tPO4fi74fEW1MW73afc6B
 +FfnvPk8y4XI4eoay9l3jm3ORJH8XkJ7JJJs/yNTzpz38JDyDwh6/R/PW
 Sn1xYk7QVQeeM8E4ZheGPi7PXROBbwLPwJ2RsiHWLk+tyzZ89z2qHFLIj A==;
X-CSE-ConnectionGUID: vaukmZcuTgOZ+HAo6G1kKA==
X-CSE-MsgGUID: n2+aKsdBQuaICIqAB8CdHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38631359"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="38631359"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 00:50:06 -0700
X-CSE-ConnectionGUID: bqJCoNv4SSe5yVvUvo+YlQ==
X-CSE-MsgGUID: UoXk9MK8QxKkHdajOTu2Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="112085056"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 00:50:05 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 1/1] tests/intel/kms_joiner: switch modeset from uj
 to bj and vice-versa
Date: Fri,  4 Oct 2024 13:18:54 +0530
Message-Id: <20241004074854.470546-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004074854.470546-1-santhosh.reddy.guddati@intel.com>
References: <20241004074854.470546-1-santhosh.reddy.guddati@intel.com>
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
v4: check for uj, bj support before starting dynamic tests (karthik)
    call reset_connectors after forcing to uj

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_joiner.c | 45 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 508e82ce3..1f66c4d8b 100644
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
 
@@ -507,6 +510,48 @@ igt_main
 				test_ultra_joiner(&data, false, false, false);
 	}
 
+	igt_describe("Verify modeset switch between joiner and ultra joiner");
+	igt_subtest_with_dynamic("switch-modeset-big-joiner-ultra-joiner") {
+		igt_require_f(data.big_joiner_output_count > 0 || data.non_big_joiner_output_count > 0,
+			      "No big joiner or force joiner output found\n");
+		igt_require_f(data.ultra_joiner_output_count > 0 || data.non_ultra_joiner_output_count > 0,
+			      "No ultra joiner or force joiner output found\n");
+		igt_require_f(data.n_pipes > 3,"Minimum 4 pipes required\n");
+
+		igt_dynamic_f("ultra_joiner_to_big_joiner") {
+			if (data.ultra_joiner_output_count > 0) {
+				test_ultra_joiner(&data, false, false, false);
+			} else {
+				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+				test_ultra_joiner(&data, false, false, true);
+				igt_reset_connectors();
+			}
+			if (data.big_joiner_output_count > 0) {
+				test_single_joiner(&data, data.big_joiner_output_count, false);
+			} else {
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+				test_single_joiner(&data, data.non_big_joiner_output_count, true);
+			}
+			igt_reset_connectors();
+		}
+
+		igt_dynamic_f("big_joiner_to_ultra_joiner") {
+			if (data.big_joiner_output_count > 0) {
+				test_single_joiner(&data, data.big_joiner_output_count, false);
+			} else {
+				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
+				test_single_joiner(&data, data.non_big_joiner_output_count, true);
+			}
+			if (data.ultra_joiner_output_count > 0) {
+				test_ultra_joiner(&data, false, false, false);
+			} else {
+				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
+				test_ultra_joiner(&data, false, false, true);
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

