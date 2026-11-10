Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ABB606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 16:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ix4l4czj
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E99210E03B;
	Tue, 10 Nov 2026 16:18:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169C110E21C
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794326900; x=1825862900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QBOhwPS98MP9daRHCqFn+ssnvfDUidQKzVJvLyEgkdo=;
 b=ix4l4czjQ2Aqc86pwjSEqXK+h6klGKDW/MLKSoVYiKo9TCHkGKoGgDjw
 w/nYHAwhXNjFy0pasbL1KwulJjZUYPajAzhyXxl7S8D4S8mSsdRtb5Ga1
 3/d35JAQfIW9CdtH+M+4Xnh4qq1cN70bakpqXebsUi3iSOPvwYbTEuHAT
 M5uY5Rjn1uPM6bxUlFkFl1bwhANqENZAD8p8HhBhgjIBnaqRolFcRiU7B
 AMngxrBbpXvu2J7N9p3VlHLtxuonxo1dkqM5wmNflEAb/ylNQp8zrCN2P
 D5lXlefAeX6TYS2luJjwWt5R8XORiIJ88sHLPWnxV67dvYwlc6nQrwr2c Q==;
X-CSE-ConnectionGUID: hooVPMEHQIqjEjlu1SVKig==
X-CSE-MsgGUID: OvMOHPF0QGW42+Ts+l1/Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3079367"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3079367"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:05:54 -0800
X-CSE-ConnectionGUID: a/g35RVDQ6yBLvDV6KtTTA==
X-CSE-MsgGUID: oVWkRtOGSGabTuFks6OFwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8781850"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:05:52 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v7 10/10] tests/intel/xe_err_injection: add CRI GPU
 requirement check
Date: Tue, 10 Nov 2026 21:35:04 +0530
Message-Id: <20261110160504.1315160-11-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
References: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
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

Add support to verify the CRI GPU and skips test gracefully
on non-cri platforms

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Reviewed-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_err_injection.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index af41c8ff2..07a290ce6 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -21,6 +21,7 @@
 
 #include "igt.h"
 #include "lib/igt_drm_ras_nl.h"
+#include "lib/intel_chipset.h"
 #include "lib/intel_reg.h"
 #include "lib/intel_compute.h"
 
@@ -508,6 +509,14 @@ static void test_inject_core_compute_corr_error(struct xe_mmio *mmio, int fd,
 	cleanup_on_error(&ctx, fw_handle);
 }
 
+static void require_cri_gpu(int fd)
+{
+	uint16_t dev_id = xe_dev_id(fd);
+
+	igt_require_f(IS_CRESCENTISLAND(dev_id),
+		      "This test requires CRI GPU, but found device ID 0x%04x\n", dev_id);
+}
+
 enum xe_err_injection_type {
 	XE_CORE_COMPUTE_UNCORR_ERR_INJ,
 	XE_CORE_COMPUTE_UNCORR_ERR_INJ_POST_RECOVERY_WL,
@@ -548,6 +557,11 @@ int igt_main()
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require_f(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY),
 			      "forcewake_all is not available in debugfs\n");
+		require_cri_gpu(fd);
+		/*
+		 * TODO: Add firmware query for error injection support.
+		 * Should check: EOM (End of Manufacturing) status and error injection jumper state.
+		 */
 		xe_mmio_access_init(fd, &mmio);
 		igt_require_f(xe_mmio_is_initialized(&mmio),
 			      "Failed to initialize Xe MMIO access\n");
-- 
2.34.1

