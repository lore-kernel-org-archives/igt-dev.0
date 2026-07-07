Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22E7C43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 04:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF7810EB4B;
	Tue,  7 Jul 2026 04:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AzzuXCQB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E7910EB3D
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 04:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783397482; x=1814933482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dqi2EX5oiAjxIjOmwmKBLH0YEm1GgYw0tw27wXCLx00=;
 b=AzzuXCQB51BsV5P4XjKQF2guvIF/Yr4Caz7YHWgKUGBNT0d38s2tM9Ao
 tFKnFa58qdJ4Z43i5ImpStwh/OKiwF3Ya3ZXXQv0I8d+fwj1bu69BRpa6
 /maCSq5+BxQXhg1HS0fG960HUOQ8Nfsx0ou56BBbJtoSmfBKv2Zgl4dA/
 Xloohfs5lB+PewhsXNp6aN7uzxB7Irf8GP3LD68LWG+rlx490YtnoaFLL
 8u3mxqV0psUjV/7ReBloZt0XYtBvYZUT/6OMR+glNYlh/IOQNLQ23J1Wp
 hvxYjV3MgHe1ZkJd1hyeE7sYmvY/tUQ2PnBpF8JhVixps2cmqEo6fTzGA g==;
X-CSE-ConnectionGUID: jdhS+F0USyGVkHqNM5cfCQ==
X-CSE-MsgGUID: lczV2NX7Sbu93xcvT7ohOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84128512"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="84128512"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 21:11:22 -0700
X-CSE-ConnectionGUID: 4jC4xl5hRNm7WASc0yUMeg==
X-CSE-MsgGUID: g4A22Ww/So2CT8xxhlI6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="258207800"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 21:11:20 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: Skip mirrored pipe combinations
Date: Tue,  7 Jul 2026 09:41:13 +0530
Message-ID: <20260707041113.3997991-1-jeevan.b@intel.com>
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

Use a canonical pipe ordering in extended-mode-basic so each pipe pair
is tested only once. This removes mirrored combinations (A-B and B-A)
that provide duplicate coverage.

Reducing these redundant combinations lowers the total number of dynamic
subtests, helping prevent incomplete test execution in CI while
preserving coverage of all pipe and output pairings.

v2: Skip mirrored pipe pairs, but keep both directions for SST<->MST
    combos.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index d8aae4256..c1876aa05 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -193,6 +193,11 @@ static void run_extendedmode_test(data_t *data) {
 			if (output1 == output2)
 				continue;
 
+			if (crtc1->pipe > crtc2->pipe &&
+			    igt_check_output_is_dp_mst(output1) ==
+			    igt_check_output_is_dp_mst(output2))
+				continue;
+
 			igt_display_reset(display);
 
 			igt_output_set_crtc(output1, crtc1);
-- 
2.43.0

