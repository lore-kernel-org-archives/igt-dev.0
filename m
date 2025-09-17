Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060ECCAC598
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 01:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D50C10E3F9;
	Wed, 17 Sep 2025 01:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4LWcyEv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD6410E3F9
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 01:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758074308; x=1789610308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z96E6Q2Pc+KR9rcDFIvJHtAoq88Dhyv3HKkHjIca6XQ=;
 b=i4LWcyEv1RK5jKDjMBl7GK6XtYiSFehjBX5vQ9u54/z0cciNFursR40Z
 GbVoFc07aCg9JCguXIme7cIvpYYwH3laRw1E/BfCLwquZ5kCqk32tqJHQ
 F648ZPIlrZ1ok7kHF8Rk3J+sDH3v+5LB+MTlNbk6r5B3/qWAGMLdARujj
 d/HFbiOEPFOvxCYQ0n0L1RcqdVkQ2nUoBPNil+oAjTKiyV+c/0iSwKu3Z
 LJsXHW2iBQ9ytfn9kcqw6ftfMGqSDPIq7bW6aZWYkWCbC7g9pPgY7Hzol
 6fudaEuv0K49He2ubCwNk5Y7Ywgv7/X6h/FPCHIMd4TEYSC/DP0NmR91j g==;
X-CSE-ConnectionGUID: a/HLhudoTg6DJ6SyKLezmw==
X-CSE-MsgGUID: soKBXOzKTzyshPtVgOKBNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60436101"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="60436101"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 18:58:28 -0700
X-CSE-ConnectionGUID: Z0joYLdQRFuiP1rGPwdwzg==
X-CSE-MsgGUID: 1h6XoJtMSlGPtwksIEDR1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="174668633"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:58:26 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, vinod.govindapillai@intel.com, jeevan.b@intel.com,
 swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/kms_fbc_dirty_rect: Limit to one format on
 simulation
Date: Wed, 17 Sep 2025 07:26:11 +0530
Message-Id: <20250917015611.283588-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917015611.283588-1-santhosh.reddy.guddati@intel.com>
References: <20250917015611.283588-1-santhosh.reddy.guddati@intel.com>
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
Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index d2330bd4a..eda3fd91a 100644
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

