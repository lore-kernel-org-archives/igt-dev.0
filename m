Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252CC606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gc4+BNYG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31DE10E17D;
	Thu, 26 Nov 2026 07:54:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A6210E234
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 07:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795679230; x=1827215230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+8ieUlvoz1Sv1KsDi2sHk6KEkN44ESuz+w0s0+6KOI0=;
 b=gc4+BNYGsXl9YeuLoCX/ig4TSvve49nJunjGQEekX07Cbji1Wr+eVw3k
 bjIJiPg7+gYj3S+bKwq6aDFmTKgQcxZgTa1k6YdXqMOslzESMEo8yIeyx
 57JqVqMwjU8WjOxO4qT3J9rtpy8d1juE7Gzb1++d87FNOAEgdbBrNzXXB
 yzljYwWA1i9mJASiobvA1dKLvR4wWf7DNBypTcMfa+LSwUNG9e5o/ZG+e
 frWaSbhNWK8EH4loePho0P/virgocfVxSPmRo8d9zwfUSYxK4bgnrkSHy
 ufBs8cRMEQ1RC9zdt+jvGB0rrHEDgUVcBV6dCYoKuCKWU8wGadbpZ82o+ w==;
X-CSE-ConnectionGUID: H0vOn8MITLq9efIACYLO5g==
X-CSE-MsgGUID: nrJWw5F7QjyjhsSljlZFPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4566206"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4566206"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:46:55 -0800
X-CSE-ConnectionGUID: ZWYGNj1nRgiCuk7LmwluyA==
X-CSE-MsgGUID: d/SEoPnET1qvopbZjDhNLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="11991856"
Received: from hchegond-desk.jf.intel.com ([10.24.80.219])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:46:55 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, ravi.kishore.koppuravuri@intel.com,
 zbigniew.kempczynski@intel.com, maarten.lankhorst@intel.com,
 alexander.usyskin@intel.com, anshuman.gupta@intel.com,
 soham.purkait@intel.com, riana.tauro@intel.com, nishit.sharma@intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t 6/6] tests/intel/xe_err_injection: Add CSC error
 injection tests
Date: Wed, 25 Nov 2026 23:46:46 -0800
Message-ID: <f363d814f1e3b711d141fb677fd25c5117a3d3f0.1795677252.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795677252.git.harish.chegondi@intel.com>
References: <cover.1795677252.git.harish.chegondi@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Inject CSC errors through debugfs interface sc/ras_error_inject
This requires DG Diag FW application be loaded. CSC errors will
be counted as SOC errors. Count SOC errors before and after CSC
error injection.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_err_injection.c | 46 ++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index b90091f20..e3eb1d09f 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -36,6 +36,7 @@
 
 /* Error injection IP block IDs */
 #define	RAS_MEM_BLOCK	2
+#define	RAS_CSC_BLOCK	3
 #define	RAS_PUNIT_BLOCK	4
 
 /* Memory error injection sub-block IDs */
@@ -55,6 +56,14 @@
 /* PUnit error injection type */
 #define PUNIT_DOUBLE_BIT_ERR_INJ	1
 
+/* CSC error injection sub-block ID */
+#define RAS_CSC_SUB_BLOCK		1
+
+/* CSC error injection type */
+#define RAS_CSC_FATAL_ERR_INJ		0
+#define RAS_CSC_DISABLED_ERR_INJ	1
+#define RAS_CSC_DATA_CORRUPTION		2
+
 /* Memory error injection mask */
 #define MEM_MSU_MASK			1
 
@@ -467,6 +476,19 @@ static void test_inject_memory_uncorr_errors(int fd,
  * SUBTEST: punit-double-bit-err-injection
  * Description: Inject a PUnit double bit uncorrectable error and verify
  * Functionality: error injection
+ *
+ * SUBTEST: csc-fatal-err-injection
+ * Description: Inject a CSC fatal error and verify
+ * Functionality: error injection
+ *
+ * SUBTEST: csc-disabled-err-injection
+ * Description: Inject a CSC disable error and verify
+ * Functionality: error injection
+ *
+ * SUBTEST: csc-data-corruption-err-injection
+ * Description: Inject a CSC data corruption error and verify
+ * Functionality: error injection
+ *
  */
 static void test_inject_soc_uncorr_error(int fd,
 					 uint8_t block_id,
@@ -904,6 +926,30 @@ int igt_main_args("f:", long_options, help_str, opt_handler, NULL)
 					     PUNIT_SUB_BLOCK,
 					     PUNIT_DOUBLE_BIT_ERR_INJ);
 	}
+	igt_describe("Verify CSC fatal error injection");
+	igt_subtest("csc-fatal-err-injection") {
+		igt_require(dgdiag_fw_present);
+		test_inject_soc_uncorr_error(fd,
+					     RAS_CSC_BLOCK,
+					     RAS_CSC_SUB_BLOCK,
+					     RAS_CSC_FATAL_ERR_INJ);
+	}
+	igt_describe("Verify CSC disabled error injection");
+	igt_subtest("csc-disabled-err-injection") {
+		igt_require(dgdiag_fw_present);
+		test_inject_soc_uncorr_error(fd,
+					     RAS_CSC_BLOCK,
+					     RAS_CSC_SUB_BLOCK,
+					     RAS_CSC_DISABLED_ERR_INJ);
+	}
+	igt_describe("Verify CSC data corruption error injection");
+	igt_subtest("csc-data-corruption-err-injection") {
+		igt_require(dgdiag_fw_present);
+		test_inject_soc_uncorr_error(fd,
+					     RAS_CSC_BLOCK,
+					     RAS_CSC_SUB_BLOCK,
+					     RAS_CSC_DATA_CORRUPTION);
+	}
 
 	igt_fixture() {
 		xe_mmio_access_fini(&mmio);
-- 
2.43.0

