Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85032C43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 12:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2820B10EC7C;
	Tue,  7 Jul 2026 12:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbQ7CZff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63E610EC7C
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 12:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783425989; x=1814961989;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sndomZuSnMa/1kolCKBlKtNSXkBRHnvGz/g1A3pt/No=;
 b=HbQ7CZff4f1ZTN52UtW+DCdnxXEKT8NjGJqEs+SzwPFYxLGSVK1IWT4r
 sacW1uns2xXtjOD7saZr3z+VRi6/pusGpKRbONFRePMZ+YdVUKjJhg7qA
 eY0f3FqaNzefl0SJFcoxRyZM6ByHGDrYn92paxZ3BIPd8Ibgs63SUvzhc
 EgDTHZ78CCXKq3345DMyhcwhmRI4ex9FwcRKfSZehhbn1I76aVmTFn9II
 0zRcwddmPl16x4XqW7hku239Fcz5hiwDPktM4O4CPRIyAN5X7uQNBqIac
 reJeJF8C5+n7fVBjt5HnPsK7L6DSvdVxqYHwevnMqc0mrOJz3JlOjLkSQ Q==;
X-CSE-ConnectionGUID: Gp5W77yWSISWz9ebdghbGQ==
X-CSE-MsgGUID: qtKIVqLPTT2RvBGh8sGfkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="87888862"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="87888862"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 05:06:29 -0700
X-CSE-ConnectionGUID: hAYKIMuvTqKsDo1hmRYXjg==
X-CSE-MsgGUID: IhaMRyKFQw2jyUEpWcCiGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="257556776"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 05:06:28 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_hdr: Enable DRM KMS debug mask for
 invalid-hdr subtest
Date: Tue,  7 Jul 2026 17:45:28 +0530
Message-Id: <20260707121528.2984729-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

The invalid-hdr subtest validates that HDR is not enabled on
non-HDR panels by checking for "Unknown EOTF" messages in dmesg.
These messages are emitted via drm_dbg_kms() which requires
DRM_UT_KMS to be set in the debug mask.

v2:
- Scope DRM_UT_KMS enablement to invalid-hdr subtest only (Pranay)

v3:
- Explicitly reset debug mask after invalid-hdr subtest (Pranay)

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_hdr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 2079bc154..5d6337c1b 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -34,6 +34,7 @@
 #include <unistd.h>
 #include "igt_edid.h"
 #include "igt_hdr.h"
+#include "igt_sysfs.h"
 
 /**
  * SUBTEST: bpc-switch
@@ -713,8 +714,12 @@ int igt_main()
 		test_hdr(&data, TEST_INVALID_METADATA_SIZES);
 
 	igt_describe("Test to ensure HDR is not enabled on non-HDR panel");
-	igt_subtest_with_dynamic("invalid-hdr")
+	igt_subtest_with_dynamic("invalid-hdr") {
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+		igt_drm_debug_mask_update(DRM_UT_KMS);
 		test_hdr(&data, TEST_INVALID_HDR);
+		igt_drm_debug_mask_reset();
+	}
 
 	igt_fixture() {
 		igt_display_fini(&data.display);
-- 
2.25.1

