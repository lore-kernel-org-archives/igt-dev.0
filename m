Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85598D2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 04:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348EE10E4B7;
	Tue, 20 Jan 2026 04:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XcfM+tq5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2FA10E4B7
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 04:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768884900; x=1800420900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AnbPmEHUKmQCnbiV7ODO4uVI/Z3HJzHdExqolXXR5fw=;
 b=XcfM+tq56rXErdmIs+7oWGpL1nTFR/5DS48rTbwjerFiXdOWu4WvzRsF
 LtOCbiJFwXEUJ4kRol9CjUigFbHg5RNw2ZqChuyVLEEIbkHYBliHL8Rcp
 /BbWrjqyu4JJuNmHUV1i9S3e4cI+SkD0LJoTtgbTLQKpcVWsmLtorSVLQ
 ms0prYs7Lw4KoIgVOzFFObqNMuzIhRRFs0xmA1A/7wtdk2b3vMOr44NmX
 2FouLSA7ZxlzE1Rp4S5rODj3w14LqtZpmfFTGLc5fjw46tTXjFFFRz5W2
 R4nzCQu3xiQ1ZRxuK7cujqaEy4gnux/JgCeqReKDxLId5S2Ai0HDAECHO Q==;
X-CSE-ConnectionGUID: Aah4OlbNQ6etSvPZcDusmQ==
X-CSE-MsgGUID: h4yehh2ASRqB/oVDEsvjaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70057631"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="70057631"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 20:55:00 -0800
X-CSE-ConnectionGUID: wAKxNWd+S5izYWIUr4o3nQ==
X-CSE-MsgGUID: oSJb4mn4TEabhN0izGyc9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="205817028"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 20:54:58 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, juha-pekka.heikkila@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/kms_plane: skip cursor clamping to avoid
 false positives
Date: Tue, 20 Jan 2026 10:25:45 +0530
Message-ID: <20260120045545.102676-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120045545.102676-1-ramanaidu.naladala@intel.com>
References: <20260120045545.102676-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Clamping subtest is not applicable to the cursor plane. Returning
early caused the subtest to be reported as passed, which can
mislead results when clamping is exercised elsewhere. Switch to
igt_skip() with a clear reason so the outcome is reported correctly
as “SKIP”.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index b71b3586f..396afce9a 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1094,7 +1094,7 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 	 * No clamping test for cursor plane
 	 */
 	if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
-		return;
+		igt_skip("Clamping is invalid for the cursor plane.\n");
 
 	for (int i = 0; i < plane->format_mod_count; i++) {
 		if (data->mod == plane->modifiers[i]) {
@@ -1116,10 +1116,9 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 		ref.format = DRM_FORMAT_XRGB8888;
 		ref.modifier = DRM_FORMAT_MOD_LINEAR;
 	} else {
-		if (!plane->drm_plane) {
-			igt_debug("Only legacy cursor ioctl supported, skipping cursor plane\n");
-			return;
-		}
+		if (!plane->drm_plane)
+			igt_skip("Only legacy cursor ioctl supported, skipping cursor plane\n");
+
 		do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
 		do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_HEIGHT, &height));
 		ref.format = DRM_FORMAT_ARGB8888;
-- 
2.43.0

