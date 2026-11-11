Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C3A606A321
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S/I/t9J1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A6110E9FC;
	Wed, 11 Nov 2026 13:10:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584D710E9A1
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794402421; x=1825938421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QBOhwPS98MP9daRHCqFn+ssnvfDUidQKzVJvLyEgkdo=;
 b=S/I/t9J1XKjNFJDu/d+X4DkLn+0ALw1+Zsp5WpNNAt5pEHNNNhDIaFnT
 zjGgXYMEa6tz25NQfNCbs+1CsBC5fvZmTWMmWSA93I+NeOSFvSci0hWtf
 Ys8NpqLnpMkJac16fnWSCkbF7cVFra04097ZLXqcZMPQhON0fqOZe+Xo4
 xgobqBGDTPuo/6lNTtl+zFf7sUMEATE0L69qwCVkCfBoZABEi/nRHQfyy
 O6BXqd5TxfcO4mUgaYY3ysz4+WzRlV21vjiuBDnl76dpQcxrf6S0xMWnQ
 HSkLX5gHDdfOn9EgsTqv6xYHSwFW1JpsGM8kBoL5/GcOtAy+DSpsqtQ+a g==;
X-CSE-ConnectionGUID: daBGxJ7dRk+R1Ah/z2xekA==
X-CSE-MsgGUID: /9sdiKWEQ/i16/sHWck7YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3054420"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3054420"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 05:07:01 -0800
X-CSE-ConnectionGUID: heZW6eFKQH6i6Oktde2myQ==
X-CSE-MsgGUID: sutECug0TH2giTSbe13BtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8413460"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 05:06:59 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v8 10/10] tests/intel/xe_err_injection: add CRI GPU
 requirement check
Date: Wed, 11 Nov 2026 18:36:24 +0530
Message-Id: <20261111130624.1446908-11-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111130624.1446908-1-ravi.kishore.koppuravuri@intel.com>
References: <20261111130624.1446908-1-ravi.kishore.koppuravuri@intel.com>
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

