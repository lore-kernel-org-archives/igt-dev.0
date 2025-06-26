Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EBEC7EE32
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 12:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBA110E2BB;
	Thu, 26 Jun 2025 12:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ij5aoxDq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AAE10E2BB
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 12:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750941964; x=1782477964;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r5Okrnui5YcOe4VCgA/2hUt837pAk+/4Ic7CxOmgNSg=;
 b=ij5aoxDqUZD21Cy7cJaO4oFjaA5ut5uW6l0RRIBu9LH6UIVSKjIRxSAp
 73UTm+zZD3621pUHuU8a7hyg6/cHbLk51s6EwaeFiEmLp7lQ/Hev+frjF
 9mrN45ZKYleRuqEsktsnswt90Vqxz3TIjB4d9ABQw+eTQzVPot5M67a2m
 3j7k6NwkMoLmx3BLtzFRn08AVz2egc/p62crXtnnJ/6YiEWYdxNWxZyDJ
 lygEEDClP+z/wAWwjLoUOt5dbJE0QTX6byfqkPItXnvpRxeZrcsuwQZqY
 vuNmdLnGHa5jV+gz+LP+8YphNRJssMun3NtCTDfuYikm143QcmlsLmZNe w==;
X-CSE-ConnectionGUID: DokZWhLdSxm3IJYfu5VayA==
X-CSE-MsgGUID: XCO/1NYqS0eT8OTCtOedAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52463997"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="52463997"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 05:46:03 -0700
X-CSE-ConnectionGUID: nEoljQVdQmOEmqUGBlVi0w==
X-CSE-MsgGUID: JHqJNtzUSiewfZItyyRUVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="158010365"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 05:46:02 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pipe_stress.c: Add support for
 additional tiling formats
Date: Thu, 26 Jun 2025 18:21:38 +0530
Message-Id: <20250626125138.1693732-1-swati2.sharma@intel.com>
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

Added support for X, Yf, and 4 TILING modifiers to increase coverage
of buffer format combinations.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_pipe_stress.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 296c93b58..7551a5e9c 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -28,15 +28,18 @@
  * Driver requirement: i915, xe
  * Mega feature: General Display Features
  *
- * SUBTEST: stress-xrgb8888-untiled
+ * SUBTEST: stress-xrgb8888-%s
  * Description:
  *   Start pipe stress test, utilizing cpu and gpu simultaneously with maximum amount of planes
- *   and resolution.
+ *   and resolution and %arg[1] modifier.
  *
- * SUBTEST: stress-xrgb8888-ytiled
- * Description:
- *   Start pipe stress test, utilizing cpu and gpu simultaneously with maximum amount of planes
- *   and resolution.
+ * arg[1]:
+ *
+ * @4tiled:            TILE-4 modifier
+ * @xtiled:            TILE-X modifier
+ * @ytiled:            TILE-Y modifier
+ * @yftiled:           TILE-YF modifier
+ * @untiled:           LINEAR modifier
  */
 
 IGT_TEST_DESCRIPTION("Stress test how gpu and cpu behaves if maximum amount of planes, "
@@ -59,10 +62,13 @@ static const uint32_t formats[N_FORMATS] = {
 	DRM_FORMAT_XRGB8888,
 };
 
-#define N_TILING_METHODS 2
+#define N_TILING_METHODS 5
 static const uint64_t tilings[N_TILING_METHODS] = {
 	DRM_FORMAT_MOD_LINEAR,
+	I915_FORMAT_MOD_X_TILED,
 	I915_FORMAT_MOD_Y_TILED,
+	I915_FORMAT_MOD_Yf_TILED,
+	I915_FORMAT_MOD_4_TILED,
 };
 
 static const char *format_str(int format_index)
@@ -88,6 +94,10 @@ static const char *tiling_str(int tiling_index)
 		return "xtiled";
 	case I915_FORMAT_MOD_Y_TILED:
 		return "ytiled";
+	case I915_FORMAT_MOD_Yf_TILED:
+		return "yftiled";
+	case I915_FORMAT_MOD_4_TILED:
+		return "4tiled";
 	default:
 		igt_assert(false);
 	}
-- 
2.25.1

