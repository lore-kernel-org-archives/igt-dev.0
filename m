Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9664C5DF9C
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 16:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3988210E161;
	Mon, 24 Aug 2026 16:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ymu1o/YR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BFF10E15F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787589748; x=1819125748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y+oqdx2ZXMBbp1LhA9VlXYsyXQmYSwqbBPYFzES960A=;
 b=Ymu1o/YRBxXGxsU+QBKNYZ6Fp87O3K/0D92meGlIEjeIC/T7I4xvMFmm
 Ck5Pk/16c//cR20Ihl6l5OdKm6dFKKd+fnjt9tNcl3/3DR+R2YHhma/ro
 ObGiBtbmyQlmliWUMcE0AWOLKYBOtOa+JWFVhpHba44VX1Z196tpfWjtT
 FSISTfcnISQUq+JeSDtJRTydE1L/zY3hxlPzUjFVJvVM8qgSEGLMOTi/I
 2QFmGzZ2Bb9rh63unjDCKdB/+9gXUAo+StyH5YtuKqf5OfPhV+WUGDAES
 bCTBkHvRFvx/yBATXGsIZkO7R7qNS8hhYV7ua1txcmFS0Iaid5uqAnxLw A==;
X-CSE-ConnectionGUID: 03xKsfWiSKqieWgY7cVW/A==
X-CSE-MsgGUID: mEd9VnDQSymFjFEi9s8oqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88105701"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="88105701"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:42:28 -0700
X-CSE-ConnectionGUID: 1GAeKuM4RqKhVhfjrEyyKg==
X-CSE-MsgGUID: ferGvtLYQSyqtf3esiIVaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="268993426"
Received: from unknown (HELO rkoppura-Z790I-AORUS-ULTRA.iind.intel.com)
 ([10.190.239.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:42:26 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v3 10/10] tests/intel/xe_err_injection: add CRI GPU
 requirement check
Date: Mon, 24 Aug 2026 22:11:33 +0530
Message-Id: <20260824164133.129138-11-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
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

Add support to verify the CRI GPU and skips test gracefully
on non-cri platforms

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 tests/intel/xe_err_injection.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 05bef3e52..d17d049f4 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -20,6 +20,7 @@
 
 #include "igt.h"
 #include "lib/igt_drm_netlink.h"
+#include "lib/intel_chipset.h"
 #include "lib/intel_reg.h"
 #include "lib/intel_compute.h"
 
@@ -544,6 +545,14 @@ static void test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
 	CLEANUP_ON_ERROR(ctx, fw_handle);
 }
 
+static void igt_require_cri(int fd)
+{
+	uint16_t dev_id = xe_dev_id(fd);
+
+	igt_require_f(IS_CRESCENTISLAND(dev_id),
+		      "This test requires CRI GPU, but found device ID 0x%04x\n", dev_id);
+}
+
 static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
 {
 	igt_info("Starting Error Injection test: %s\n", injection);
@@ -575,6 +584,11 @@ int igt_main()
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
+		igt_require_cri(fd);
+		/*
+		 * TODO: Add firmware query for error injection support.
+		 * Should check: EOM (End of Manufacturing) status and error injection jumper state.
+		 */
 		xe_mmio_access_init(fd, &mmio);
 		igt_require(xe_mmio_is_initialized(&mmio));
 	}
-- 
2.34.1

