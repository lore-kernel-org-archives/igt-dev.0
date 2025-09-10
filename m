Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCD6CA101F
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 13:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95B310E303;
	Wed, 10 Sep 2025 13:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PL7spCz0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034D710E303
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 13:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757512473; x=1789048473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yLjOQ2BWm5CodkLweoJ4mPe92XR+IVfiSkcC+XTcS3A=;
 b=PL7spCz07irtdPufFlw7HHyl567TXA5i/XK//32bnlY9NYphUyz3OP0g
 c/5JS+aZrmFnIvY+NII/Pjzxo5bysKZsrQUchKGR7JsPe03PJMGo2ElaJ
 7LFOxz8ZjooRUgk8epQvi7woMDJ78XaJ3gqhYQXmE17CI97haP903BR/T
 JabETuOkPmNtuOykEs2Mvl0iPKp3I6WyJ2gGizfn1iuo9ZX4vNx1lkGMu
 IKLp726o1NPzn5IrKL10YcyEHnnQmCVj1a7Y+zXtJzYP7uEN54dUNQax6
 CBAnlteTUNzcPrgwxyhFmQ0IgeTyVbsTuww/R9WQ3lwi9fDo3tTg4eecN A==;
X-CSE-ConnectionGUID: gYsWKO3vRWqcy/qMwqJWjQ==
X-CSE-MsgGUID: L+Lyl43mS9WGH2lT0Kw9tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="47393476"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="47393476"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 06:54:32 -0700
X-CSE-ConnectionGUID: I/EL8IbyQjCP6bbvzes3JA==
X-CSE-MsgGUID: +HEB7o0CSBOhiHKHkAb2yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="172962410"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 06:54:31 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, vinod.govindapillai@intel.com, jeevan.b@intel.com,
 swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_fbc_dirty_rect: Limit to one format on
 simulation
Date: Wed, 10 Sep 2025 19:22:43 +0530
Message-Id: <20250910135243.252684-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910135243.252684-1-santhosh.reddy.guddati@intel.com>
References: <20250826070734.1117429-1-santhosh.reddy.guddati@intel.com>
 <20250910135243.252684-1-santhosh.reddy.guddati@intel.com>
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

limit fbc-dirty-rectangle-different-formats subtest to execute on single
format on simulation platforms to avoid CI timeouts while still
validating functionality.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index b187a5942..c3a86aeda 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -510,6 +510,10 @@ igt_main
 				break;
 			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
 				for (int i = 0; i < num_formats; i++) {
+					/* on simulation platforms , limit to single format */
+					if (data.is_simulation && i > 0)
+						break;
+
 					igt_dynamic_f("pipe-%s-%s-format-%s",
 						       kmstest_pipe_name(data.pipe),
 						       igt_output_name(data.output),
-- 
2.34.1

