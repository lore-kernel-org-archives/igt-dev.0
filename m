Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A065F606A321
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h2ParM+8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4084F10E73D;
	Thu, 26 Nov 2026 07:53:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9A610E73D
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 07:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795679225; x=1827215225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mqJm4aDOQcKOkRpamf/R5rd2ki8jBaF8N0mUY0pngyQ=;
 b=h2ParM+8/lxE22Rbboqpa1UIgxDxNBPkcE34H8Q8zwVM9RTUGtwjKhkT
 kLi6c8fbUzyIcz1xPeuRz2DmXDZVxT66nS2dEBmi9SCfm6f2UbD4VF6Ao
 CbZtdybqvuV3Rs//BT7f67t7EAKz2b91Z74MOlRSQZ7u0dem6RurcbxNW
 nY3kHazxCTwmwFDp0YiaOom4fbO7qsehH0yOJj5BSbQUUOYyzdK6XFutD
 hibAldyT8UHf+aRbKyr+y73Bwzw3nRs4/hCULYfX0oRQ8AqBPxv4L6PeV
 5uO/rVvNMggicF7FrQFxqN4Ii2T4gzp8cYPjeeJPDLbZZ4NxmxJELxglO Q==;
X-CSE-ConnectionGUID: TyF2ANZ+RimJ2w3auhUJiw==
X-CSE-MsgGUID: 9t29UYIoQRGgUY/kexMSIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4566205"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4566205"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 23:46:55 -0800
X-CSE-ConnectionGUID: MBzPA5mzRXG9QUaBgwUhow==
X-CSE-MsgGUID: 2KykxOPQSRm4grBvX4vKOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="11991852"
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
Subject: [PATCH i-g-t 5/6] tests/intel/xe_err_injection: Add PUnit error
 injection test
Date: Wed, 25 Nov 2026 23:46:45 -0800
Message-ID: <0f32e600b4666c834995d4e28d0352dd91dbd75d.1795677252.git.harish.chegondi@intel.com>
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

Inject PUnit errors through debugfs interface sc/ras_error_inject
This requires DG Diag FW application be loaded. PUnit errors will be
counted as SOC errors. Count SOC errors before and after Punit error
injection.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 tests/intel/xe_err_injection.c | 55 ++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index efdd8664b..b90091f20 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -36,6 +36,7 @@
 
 /* Error injection IP block IDs */
 #define	RAS_MEM_BLOCK	2
+#define	RAS_PUNIT_BLOCK	4
 
 /* Memory error injection sub-block IDs */
 #define MEM_AXI_WRITE_SUB_BLOCK		2
@@ -48,6 +49,12 @@
 #define MEM_MB0_AXI_WRITE_PARITY_ERR_INJ 5
 #define MEM_MB1_AXI_WRITE_PARITY_ERR_INJ 6
 
+/* PUnit error injection sub-block ID */
+#define PUNIT_SUB_BLOCK			1
+
+/* PUnit error injection type */
+#define PUNIT_DOUBLE_BIT_ERR_INJ	1
+
 /* Memory error injection mask */
 #define MEM_MSU_MASK			1
 
@@ -456,6 +463,46 @@ static void test_inject_memory_uncorr_errors(int fd,
 		     error_count_before_inj, error_count_after_inj);
 }
 
+/**
+ * SUBTEST: punit-double-bit-err-injection
+ * Description: Inject a PUnit double bit uncorrectable error and verify
+ * Functionality: error injection
+ */
+static void test_inject_soc_uncorr_error(int fd,
+					 uint8_t block_id,
+					 uint8_t sub_block_id,
+					 uint8_t err_type)
+{
+	int fw_handle;
+	uint32_t params = 0;
+	uint32_t error_id = ERROR_ID_SOC_INTERNAL;
+	uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
+	uint32_t error_count_before_inj, error_count_after_inj;
+
+	fw_handle = acquire_forcewake(fd);
+
+	error_count_before_inj = get_counter(node_id, error_id);
+
+	inject_ras_error(fd, block_id, sub_block_id, err_type, params);
+
+	sleep(3);
+	error_count_after_inj = get_counter(node_id, error_id);
+
+	release_forcewake(fw_handle);
+
+	igt_assert_f(error_count_before_inj != UINT32_MAX &&
+		     error_count_after_inj != UINT32_MAX,
+		     "Failed to fetch valid error counters: before=%u after=%u\n",
+		     error_count_before_inj, error_count_after_inj);
+
+	igt_info("SOC error counter: before injection=%u after injection=%u\n",
+		 error_count_before_inj, error_count_after_inj);
+	igt_assert_f(error_count_after_inj > error_count_before_inj,
+		     "Uncorrectable SOC error injection test failed: "
+		     "error count before injection=%u after injection=%u\n",
+		     error_count_before_inj, error_count_after_inj);
+}
+
 /**
  * SUBTEST: inject_core_compute_uncorr_error
  * Description: Inject a Core Compute Uncorrectable error and verify
@@ -849,6 +896,14 @@ int igt_main_args("f:", long_options, help_str, opt_handler, NULL)
 						 MEM_WR_2BIT_ECC_ERR_INJ,
 						 MEM_MSU_MASK);
 	}
+	igt_describe("Verify punit double bit error injection");
+	igt_subtest("punit-double-bit-err-injection") {
+		igt_require(dgdiag_fw_present);
+		test_inject_soc_uncorr_error(fd,
+					     RAS_PUNIT_BLOCK,
+					     PUNIT_SUB_BLOCK,
+					     PUNIT_DOUBLE_BIT_ERR_INJ);
+	}
 
 	igt_fixture() {
 		xe_mmio_access_fini(&mmio);
-- 
2.43.0

