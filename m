Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47457CCD194
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 11:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70D310E9C6;
	Thu, 16 Oct 2025 11:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAwB3PmD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506F310E9C4
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760615451; x=1792151451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F7ka6z38e8GT7OP8ssq5pP1d6BjRC4onpTDM8nzdlko=;
 b=dAwB3PmD34qWk8fKfIkNnE74BdKHi2ISmk5wEilLZd4v5IpDzWuoSO3B
 CTpyPjiL7jMc8Bk0ybLtqfEpGsKIo0F/XVbPmyjVmCerUCNjPzw4Kg46f
 KloVwMCQvi/7H2osYnsS4LcAoQA+ioVetSgd+LNs/4/psRITipzcTWWDH
 ax+EYvsF6En1JuXKoEEm66dGU/DvTUvFY7OEvoXtKs8jnAjfTkyRdPQ+V
 xH69Mf3DbK83qQpbw8A0iyFVncJ2OQpFPci1mc8/tpedGSND25Mp5FAIs
 m165SCw3S7bWTt45+U7GKpuCS6we4nH7lcpHU+lC+sKmPyrhMvCQt+CA3 Q==;
X-CSE-ConnectionGUID: bZVXs1ofRiCBh1DKLWrQQg==
X-CSE-MsgGUID: r0UhMZuvR3+oxTTlWje6iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66635793"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66635793"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 04:50:51 -0700
X-CSE-ConnectionGUID: EYnSFIiETjybgcPMWEwLIA==
X-CSE-MsgGUID: BRgV2WqSRpivCyhrL29K8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="181565986"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa006.jf.intel.com with ESMTP; 16 Oct 2025 04:50:49 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v6 2/2] tests/kms_concurrent: Fix for msg_queue failure
Date: Thu, 16 Oct 2025 17:08:16 +0530
Message-Id: <20251016113816.3343875-3-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016113816.3343875-1-s.sebinraj@intel.com>
References: <20251016113816.3343875-1-s.sebinraj@intel.com>
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

Adds supports to check if the system supports SYSVIPC
and if not found it skips the test. This removes test
failures with msg_queue creation for systems that
don't support SYSVIPC.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 tests/kms_concurrent.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 4f16f8b89..1f2da3001 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -396,7 +396,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_require(data.display.is_atomic);
 		igt_display_require_output(&data.display);
 		if (is_intel_device(data.drm_fd))
-			intel_allocator_multiprocess_start();
+			igt_require_f(intel_allocator_multiprocess_start(),
+				   "Allocator failure, no SYSV IPC\n");
 	}
 
 	run_tests_for_pipe(&data);
-- 
2.43.0

