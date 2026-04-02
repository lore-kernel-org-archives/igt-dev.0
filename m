Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4978ECC6B36
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 08:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE5E10EE84;
	Thu,  2 Apr 2026 08:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4hIjc2V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E92310EE84
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 08:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775120073; x=1806656073;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ha5msXaJI+muWnhKWQXRzKzlZW6xvNnU6Yh0Tqj8IrQ=;
 b=k4hIjc2VaV6kNHJp+rEjxkghxXx3kW8/1cEmkPLjLCj/UuRVBRdw21gR
 EGX/sU2rNbhPpd890oXkEG4JkmQJCpZl2q9FbN//sy8sYjXYEBHXxDQhb
 xPS17F4xa6i7VRbIONxMYRPKeofvz3klTKyThfiNCCkqqAFTdQg09Kdfn
 mCBGdU3TFHSSUaun0cbK9p9j4+ZTBYo0QvrxI6e/TeakysK1NxREoaQ0B
 LcQVt4KhP60ldE7pRmemm6vOjIGhsNIsNxy1ljxnyzqdsC269TxN6n3Jw
 5mB3nGktlGyULArrdJuDnBFtqQ/8wuloGubHKBT1cO6Tpdgx6+DcOYg4d Q==;
X-CSE-ConnectionGUID: 4ljOOvnjSb2pKkv4SIVvwA==
X-CSE-MsgGUID: nzRkUTM1RICPPIJtFnSniA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93566573"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="93566573"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:54:33 -0700
X-CSE-ConnectionGUID: uEPjEZTvTy+Q+qoeyGtVWw==
X-CSE-MsgGUID: DgSk1ftqSYWkrUGw8PEaSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="226893237"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 01:54:31 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 Karthik B S <karthik.b.s@intel.com>, Jesse Zhang <jesse.zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_fuzzing: Remove unused variable
Date: Thu,  2 Apr 2026 14:20:39 +0530
Message-ID: <20260402085039.1655070-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

Fix compilation warning:

[1694/2119] Compiling C object tests/amdgpu/amd_fuzzing.p/amd_fuzzing.c.o
../tests/amdgpu/amd_fuzzing.c: In function ‘amd_kgd_multi_ioctl_field_fuzzing’:
../tests/amdgpu/amd_fuzzing.c:298:14: warning: unused variable ‘have_amdgpu_dev’ [-Wunused-variable]
  298 |         bool have_amdgpu_dev = (amdgpu_dev != NULL);
      |              ^~~~~~~~~~~~~~~

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Fixes: 49cf0900dd23 ("tests/amdgpu: add field-level negative ioctl fuzzing tests")
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/amdgpu/amd_fuzzing.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index 21dab4afe..00717e593 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -295,7 +295,6 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 	uint32_t valid_bo_handle = 0;
 	bool have_valid_ctx = false;
 	bool have_valid_bo = false;
-	bool have_amdgpu_dev = (amdgpu_dev != NULL);
 
 	memset(&valid_ctx, 0, sizeof(valid_ctx));
 	valid_ctx.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
-- 
2.43.0

