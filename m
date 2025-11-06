Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04C7CCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 04:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FE310E0C4;
	Thu,  6 Nov 2025 04:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIVZcjsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D9910E0C4
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 04:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762404084; x=1793940084;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pUXYu82oUNcRpCKyZw+2Kwzs6VbkFmMnlt3H1Ys9S5E=;
 b=iIVZcjsLRb5oBMCg+eFwdSKQIt5rWQK0LkPun/ryVC5gl7oAsZ9tznON
 61mzDrlxjtN4XFp90E4egd470mTO4Yoj59c5oJE0sZQ/bT6ojhOBiur4F
 twnN6bDIJzNZdZnrNKLOLi075vKosUIOKmK1Kc6I1YFnPmJ7fnUmoUQ3Y
 2Urf4Y06MdXwM4GRjkAofGYrdjBa3xDdwkdxuUGK3OzvINbzEEIN7wxUj
 mQesn5bncUnfsaVMKEOct7Vzw7EFVHYrLWS/bpVUNH0kENuESUzo47XCi
 NuYcdRehIAx2CTVzSaKC/ayNLN7I8FxCXXoGXXowFEdUlySs5JXiLj5HT w==;
X-CSE-ConnectionGUID: f+txxZ2jRD2T0rrEVYHjaw==
X-CSE-MsgGUID: ysbcY3DvSDS7Q/Lc0X/m+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="87161583"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="87161583"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 20:41:23 -0800
X-CSE-ConnectionGUID: idD+psJURiOHxENIp/QCSg==
X-CSE-MsgGUID: 9tHMzD4lRzqiq/hC23S/cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="191750373"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 20:41:23 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_vrr: Fix potential NULL dereference in
 test_cleanup
Date: Thu,  6 Nov 2025 10:11:00 +0530
Message-ID: <20251106044103.1502264-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a safeguard to prevent a possible crash during the cleanup
phase of the VRR test.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index bcb756202..a403de473 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -961,7 +961,9 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, false);
 
-	igt_plane_set_fb(data->primary, NULL);
+	if (data->primary)
+		igt_plane_set_fb(data->primary, NULL);
+
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_output_override_mode(output, NULL);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
-- 
2.43.0

