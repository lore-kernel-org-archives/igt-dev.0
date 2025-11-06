Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF13CCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 05:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397CF10E807;
	Thu,  6 Nov 2025 05:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N4+qgAxQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1C810E807
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 05:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762405752; x=1793941752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pUXYu82oUNcRpCKyZw+2Kwzs6VbkFmMnlt3H1Ys9S5E=;
 b=N4+qgAxQnKhb4GBJzYb2DOq6Qi3ncoFY55iL6a0dTFLpjsrKMHel1qq4
 iUpMVPyH0III28SQg29vJZBUpYhoZxs75zwcpPkUUT4/1Q6nmmrNkk1Fb
 nZLvlTGi+5TryUcNLEsSdjnyUeHZQsjvsR23T0R7XSUhhKZRqXy0KnOTu
 NHn3klKWpA/d9QsV89WOucHo/BN1yUR2lfdjSkTUxOBPQw7PGYlDdZhLl
 RM++d7CZw4LYVcwbJzrbKp6baART9URdhMGZwYs6mZ+wHvQlWFA8SB7bY
 ODaUSAzf9vx6r0jwbBeg2L52m/Z+QArvwgZa9fte8jWqmyMyuAM68+C8T w==;
X-CSE-ConnectionGUID: jmdZGpImQpaMiuMZ9D7Ucw==
X-CSE-MsgGUID: cAP/5FHBRRyn4YTuBllWHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="52102338"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="52102338"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 21:09:12 -0800
X-CSE-ConnectionGUID: nlH5wMYySYm3jm+m+DuKHg==
X-CSE-MsgGUID: B27wyQPwTkaRVu8pJGKxqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="218317792"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 21:09:10 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_vrr: Avoid NULL dereference on cleanup
Date: Thu,  6 Nov 2025 10:38:51 +0530
Message-ID: <20251106050851.1502869-1-ramanaidu.naladala@intel.com>
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

