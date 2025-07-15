Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0B4C83F22
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 12:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327BC10E5A9;
	Tue, 15 Jul 2025 12:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ddord4M1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C7110E5A9
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 12:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752582913; x=1784118913;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GpDr2Bv2rOQVegDq5DvaV0OcrOedZs4PKYHouPHrQOU=;
 b=ddord4M1aoKt0cSlRxUahkNSVEjvK4s/yl9eVwLofFaUr3L/C2pqe9PE
 p9bz12G3LbrbVv83gIPKaC0H7ndQ0Xa51MugFbIyo6W1bKuiRTFpaU52m
 sjD3eghBODTJUVAHF/MjzH1ZkeNXcq5MCYLM6z3v9Unyu/RAoRjccZF1L
 OA4BeAGBvd3wBSATcCUlac3F0b17Jur3dV7Ejz7bQZUCEt2Yb7JtPR5o6
 WSklZZf9642tKasXqa1X3CfAomcguNs5k64p66XR5dorLDDXKRRgR81k0
 ap7+/JcaBrwitYVBsFWgNKLTZz5ixooIqAw4hTrAOPVNu2Hi7iU7839Qj w==;
X-CSE-ConnectionGUID: BI1tKIfERCO6GCi7y5QL2w==
X-CSE-MsgGUID: yog8imteSlqqRQoJxlk4xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54774045"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54774045"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 05:35:12 -0700
X-CSE-ConnectionGUID: T3aUBaLbTaaD6Zn8sEX8qg==
X-CSE-MsgGUID: uMHDNX30Qduqkr2UmU4hdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="194360453"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP; 15 Jul 2025 05:35:10 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 1/1] tests/kms_cursor_legacy: don't inhibit pipe CRC
 calculation
Date: Tue, 15 Jul 2025 14:36:23 +0200
Message-ID: <20250715123623.832027-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Running either flip-vs-cursor-busy-crc-(legacy|atomic) subtest from
kms_cursor_legacy results in entering PSR1 after the test. Even with
PSR2 enabled panel, it is impossible to switch to PSR2 via
i915_edp_psr_debug. Kernel does so because it prevents inhibiting pipe
CRC calculation which is allowed in PSR1 but prohibited in PSR2.
Therefore subtests from kms_psr testing PSR2 feature (e.g. psr2-no-drrs,
psr2-primary-blt etc.) are failing after running any of those
kms_cursor_legacy subtests.

Restore enabling Panel Replay Selective Update by cleaning pipe CRC
calculation after running the subtest.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_cursor_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 9f6e644e1..2ef9690ea 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1751,7 +1751,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	/* Clean-up */
 	igt_plane_set_fb(plane_primary, NULL);
 	igt_plane_set_fb(cursor, NULL);
-	igt_output_set_pipe(output, PIPE_NONE);
+	igt_output_set_pipe(output, pipe);
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	igt_pipe_crc_stop(pipe_crc);
-- 
2.45.2

