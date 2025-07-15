Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61584C83F22
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 19:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A42010E057;
	Tue, 15 Jul 2025 19:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GaoimVA8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCF410E057
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 19:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752606499; x=1784142499;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IMnVgxhb7fXN9weHWlfKBsQwk25s6TXJMPwAf4F+UZM=;
 b=GaoimVA8aQT24MNE1x2qou2U0Rx32Qgj6Mzm3CiS4rbKN++OsffAPWqL
 okzKjMKCmEd1phYNHmGEyXwlB7k6ZKrGtnLl309z3ym1qxakf6ZWJGTwR
 Aok6TYkYL1KDp4uu7+eqBPuQOiqXOUPQcCmA//4TWRWQMVQzU653Ys5Xy
 EHOy7lnC1mxImb6P2MSD5+cDTp3ITrhGGfiqzP+0B4PEB+148MlKj6Hq2
 L9YQ2pylRWl8G9djWawpQWE7VKkD4OUoIHr3XgJCvmtZmcHPg7mGKNi/t
 TIoEdVJJ+bZBUpe+uR0ixvmSI52TagJgxZP8uLk5i8cJ5NcaIybRC4lC/ Q==;
X-CSE-ConnectionGUID: lPjWMoJPT4a70zIJgx8rfA==
X-CSE-MsgGUID: LEuHvF2/Ri6LpYYB5QQP9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54055468"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54055468"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 12:08:19 -0700
X-CSE-ConnectionGUID: HBLkZXNHS4u81e3HuNIWpQ==
X-CSE-MsgGUID: TwU5qqCWReq1zlnFplWlRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="162853772"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 12:08:17 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2] tests/intel/kms_pipe_stress: Add support for additional tiling
 formats
Date: Wed, 16 Jul 2025 00:44:57 +0530
Message-Id: <20250715191457.58097-1-swati2.sharma@intel.com>
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

v2: -remove .c from subject (Kamil)

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

