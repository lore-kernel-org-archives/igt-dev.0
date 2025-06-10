Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089B0C5B552
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 14:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C1F10E571;
	Tue, 10 Jun 2025 14:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTsA2J7N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ACE10E571
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 14:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749565143; x=1781101143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RkOPWOlvHZM68kTVB46tJgI3Tc3IkaXcByBaMb2SR5A=;
 b=jTsA2J7NQjJuhZR8PIagcDFe1PifiAKEVAhUCWA4rrAF/AvYBy+sZx8J
 44cQ2lXsIbxHsUHUgSYypZv2w9Jm0/UV3sn0z1preC49DFLoMgjxtOzb8
 AmVaPSR6NiQthp7kZNjNWoKDRY/PCR05izMnEJdpGhMqezvtEhrmKEar9
 irocYGo07DqAEZvbDuJYX02P09+UQdKePIe0M5DWFVlOALWJfF8tUMdZl
 C73Yhx+3e68lLLtJacHLTHPZd6mGCSTNEg4esesOSZQ7NEA2He2lSfBMh
 FBq8o51vmWuNdiR0QVsISdNuNm3tCLfjegGV2Xv3476BxQkauWXWLE33/ Q==;
X-CSE-ConnectionGUID: Dye/A3fLSwqr74b8luCoVA==
X-CSE-MsgGUID: 8k6KSWOFRMO4LPe54gbIpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="61953698"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="61953698"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:18:59 -0700
X-CSE-ConnectionGUID: ZGWe1LKBQX6gY6umNLygTw==
X-CSE-MsgGUID: vVbvjVaqSdOaA2SV2sVsIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="151660825"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.19])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 07:18:57 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t] Revert "tests/intel/gem_exec_capture: Deal with DG1
 recoverable vs. capture uapi changes"
Date: Tue, 10 Jun 2025 16:18:52 +0200
Message-ID: <20250610141852.55249-1-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

This reverts commit be0b7853bb2ded0b183e87bdaeab4318a7e2cd52.

The corresponding change in the kernel [1] that made this test work on
DG1 was ultimately reverted [2], which broke the test again. Bring back
the code to the original state.

[1] https://lore.kernel.org/all/20250411144313.11660-2-ville.syrjala@linux.intel.com
[2] https://lore.kernel.org/all/20250522064127.24293-1-joonas.lahtinen@linux.intel.com/

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel/gem_exec_capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index c0549c0e3..37c1f7255 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -658,7 +658,7 @@ static bool needs_recoverable_ctx(int fd)
 		return false;
 
 	devid = intel_get_drm_devid(fd);
-	return intel_graphics_ver(devid) > IP_VER(12, 10);
+	return gem_has_lmem(fd) ||  intel_graphics_ver(devid) > IP_VER(12, 0);
 }
 
 #define find_first_available_engine(fd, ctx, e, saved) \
-- 
2.45.2

