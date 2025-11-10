Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DC4CCFA1A
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 03:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9376910E16E;
	Mon, 10 Nov 2025 03:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iT+92Ym4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F00310E16E
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 03:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762746966; x=1794282966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=or+1oIhn6PwmU6lZLgfw8RFkd9yo0h77Q7GJEWhgYDw=;
 b=iT+92Ym4RBMhSkkRunnn9+srXvUk6QDcFrAB5ebPcO8eVtS0kNl6Z0N0
 9Kr8UF+m3VNycc9eSBbKhsHMPuJtJvrm5HKNYs3x1rWZR111KWK4/kzEd
 xWYZj96HbH5z+vCxqjyEkbWIxrcyJQiQcY/A8Dlp7f80tB04uIYeXcGEB
 7LuN7gQJrXVawoJj39I4lNBgqbjP5udnWA8IFf8dO8r+gOcC2tUGYUVBE
 cR4Sjn3EErf8wGhGdt3ApbIfu7efjnpGLxr1qlAUb1F53CAy+DS/wl345
 1L2nXaDedf8n2lR1DN6RqiHEUsapy9cOfYoEEPSqq5uzZm9TPopqhlxRv Q==;
X-CSE-ConnectionGUID: Ev1VUMAgQE2hTFT45k+W5A==
X-CSE-MsgGUID: ZPu1reB8RiGB91EYyq/hug==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64722883"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64722883"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 19:56:05 -0800
X-CSE-ConnectionGUID: 7NXx7Cv3SYmx8jaLrJemvA==
X-CSE-MsgGUID: h+elucIARfiru4VkMyFoLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; d="scan'208";a="188519027"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 19:56:03 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_vrr: Fix logical condition for DRRS support
Date: Mon, 10 Nov 2025 09:25:40 +0530
Message-ID: <20251110035540.1644079-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104081009.1474197-1-ramanaidu.naladala@intel.com>
References: <20251104081009.1474197-1-ramanaidu.naladala@intel.com>
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

Fix platform detection logic to correctly identify LNL and newer
platforms, and disable DRRS accordingly.

v2: Update platform logic and commit message. (Ankit)

Fixes: 734ee5297842 ("tests/kms_vrr: Skip DRRS-related tests on LNL and newer platforms")

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index d83aa2de1..05c8a581d 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1068,7 +1068,7 @@ static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	}
 
 	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
-	    (intel_display_ver(data->drm_fd) >= 14)) {
+	    (intel_display_ver(data->drm_fd) >= 20)) {
 		igt_info("DRRS is not supported on LNL and newer platforms\n");
 		return false;
 	}
-- 
2.43.0

