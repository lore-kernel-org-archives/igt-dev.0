Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FD5C021B3
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 12:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A2910E4C4;
	Thu, 20 Feb 2025 12:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0CNOixg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FADB10E4C4
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740054113; x=1771590113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NTDeMYJJEcGXA+cLW9a8Hzu6p327AhjE1PYkyEYIwm0=;
 b=O0CNOixgwhIXFF7XGaR5JNA4lO7iRKm8rTEQRqIB1GiJZckssd8Gbkmt
 D4RmZBnWtjJ6F0YIZelVGRGPFftbH0g11TepCh4ey83MOmb6QnzfRUhA+
 bbzqy6Lk/fMR+G1kW8BfSY5FbwFKTDYI8vFLY2rare8Ogu3hDrI1dadBC
 i2NMDUWTypcF3lLcYDRUm3J6TD1QTiw7Bs9L6cPbrDUvjEHh2yokjMQe3
 zXCc+Q4I5Hw6o/Vmbmcq/bPakAgoiGI9JXwrpkIkKzvcif3TrrYIBjaWe
 yBZe8t/MB39k+aSD59tvIdVu+lIyDZ+5XbUQwRY56Vyai6VXrYTn8dYp1 w==;
X-CSE-ConnectionGUID: Cb33rceUTy64y1T5Vc18dQ==
X-CSE-MsgGUID: UNRU7MaFQ7KgkMaWXiFMOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40697038"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40697038"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 04:21:53 -0800
X-CSE-ConnectionGUID: dO59NGTzTe2UVNoNtDhvmQ==
X-CSE-MsgGUID: +kAgFtqgRZCinoJyMtLOdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120251377"
Received: from slindbla-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.224])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 04:21:51 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jeevan.b@intel.com, jani.saarinen@intel.com
Subject: [PATCH i-g-t v1 2/5] tests/intel/kms_psr: update to FBC support check
Date: Thu, 20 Feb 2025 14:21:28 +0200
Message-ID: <20250220122131.221907-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220122131.221907-1-vinod.govindapillai@intel.com>
References: <20250220122131.221907-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Utilize the library function to check if the FBC PSR combination
is supported in a platform and re-roder the condition check.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_psr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index ad49c18f0..124d7be18 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -823,10 +823,9 @@ igt_main
 		data.bops = buf_ops_create(data.drm_fd);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require_f(output_supports_psr(&data), "Sink does not support PSR/PSR2/PR\n");
-		if ((intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20) &&
-		    (intel_fbc_supported_on_chipset(data.drm_fd, pipe))) {
+		if (intel_fbc_supported_on_chipset(data.drm_fd, pipe) &&
+		    intel_fbc_psr_combo_supported(data.drm_fd))
 			data.fbc_flag = true;
-		}
 	}
 
 	for (y = 0; y < ARRAY_SIZE(fbc_status); y++) {
-- 
2.43.0

