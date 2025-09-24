Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF81CAC5B3
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 09:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38A910E6D1;
	Wed, 24 Sep 2025 09:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N62PSqe4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8AB10E6D1
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 09:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758706356; x=1790242356;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y8bfvUrTBDykg6RGlKSfEDcpXv2pT65K4I2YEa4rd5M=;
 b=N62PSqe44bcOIo90U1gZZ1YAO7CLxWp7eQnRYxNrpXl6tm3qFSEU5Kwk
 AIQ/wV6f8tN8QJuj108zhha25fZ6aAdZLVidhyI9X7VbD6YaYfzZH8zBB
 PYx7FiLnX7HjpLcG4nwEpwR9u4a2/JpS9Z3mk9L/qopRQ3da0RQPxBIcU
 dC2sUeKeTtiM5ueTTqjMKFipu2rTzpf4WyAK5sLdf7mux6jRyeL7H+oIX
 tUAOYOUVu1iOE0hs/5MK4/f4q54IJU40qIsvWTwQ5YkPMaoQkcMvqzgyC
 FXXlQEqVoN7Lyrxe7if2pj/rwUBXHe4rFxxw0gpaJoZ8HwcovVDZllAnX g==;
X-CSE-ConnectionGUID: zlws2gXkT2y7GUw228VTJQ==
X-CSE-MsgGUID: KZjuAil1SueRjk+3J9n01w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60913236"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60913236"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 02:32:36 -0700
X-CSE-ConnectionGUID: zb1fFriZS0WG2edu+81vaw==
X-CSE-MsgGUID: W3JsKVo7Q9KjNJ2Ho9C0Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181286025"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 02:32:34 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, ankit.k.nautiyal@intel.com,
 mitulkumar.ajitkumar.golani@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_vrr: Skip DRRS-related tests on LNL+
Date: Wed, 24 Sep 2025 15:02:26 +0530
Message-ID: <20250924093226.3899875-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

To prevent false failures and maintain test relevance, seamless VRR
and DRRS test cases are skipped. This ensures the test suite aligns
with current hardware capabilities and avoids unnecessary execution
on platforms where DRRS is no longer supported.

Bspec: 68917
HSD: 14016007525
Link: https://lore.kernel.org/intel-gfx/20250912135926.18910-1-ville.syrjala@linux.intel.com/

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 233143770..94ff029b7 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1016,7 +1016,7 @@ static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags
 		return false;
 	}
 
-	if (flags & TEST_SEAMLESS_DRRS)
+	if (flags & TEST_LINK_OFF)
 		goto out;
 
 	/* For Negative tests, panel should be non-vrr. */
@@ -1030,6 +1030,12 @@ static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags
 		return false;
 	}
 
+	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
+	    (intel_display_ver(data->drm_fd) >= 14)) {
+		igt_info("Can't run DRRS has been defeatured on LNL+\n");
+		return false;
+	}
+
 out:
 	if (!output_constraint(data, output, flags))
 		return false;
-- 
2.43.0

