Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3BEC61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 20:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D8810E191;
	Thu, 12 Jun 2025 20:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LX7vzQ3P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952B410E191
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 20:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749759489; x=1781295489;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1CrihwpulAG+CiR67024zWTD1LnlRwYz4UV87ARyF08=;
 b=LX7vzQ3PQrMmS5veXH1REhNnMlXgB4hs8JReAag5A4Eaa4gKuuD35jD2
 12BkhBPldQyo4iOeXTtr3cCy4AoUFPpQa4kFyTG8j7KHrE2WHwkplgKC0
 shOOf0vbT7p1pVhFW2EaLFCAIWarG+FVS2P1gb8zod3pdcxaFTmkNGfRs
 +JmST37cYzriqfj//qBpn5/oDyGGIcFa3UBoaS6hsypqo377KdM1Fu2BP
 fqygYEzvBMlOCkIuMupFfG7zerCkk0JpD/lwDc4oGupgX9WxpQ/DBj8k8
 H0Fq8SUGLSJAFmbvSkSEjY5yNGfmtqPOfENegpV8EPc/j4hd3G+1qO1Ey g==;
X-CSE-ConnectionGUID: GmM2bJzxRCGVh5bzMg9a9w==
X-CSE-MsgGUID: dEyzHXWLQxmpxCZB0JbGzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62613884"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="62613884"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 13:18:09 -0700
X-CSE-ConnectionGUID: TJFfzBnAR8GU2LfrvvwXAw==
X-CSE-MsgGUID: 9C252E08Tt2I88qvOj78OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147608885"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 13:18:07 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/intel-ci: Blocklist unsupported Xe scaling
 tests
Date: Fri, 13 Jun 2025 01:47:34 +0530
Message-ID: <20250612201734.3280725-1-ramanaidu.naladala@intel.com>
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

The second scaler does not support downscaling in either
vertical or horizontal dimensions. Blocklist the affected IGT
kms_plane_scaling tests that involve downscaling scenarios
unsupported by the second scaler.

Bspec: 69901

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index ebe1ff006..8e43c217d 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -82,6 +82,10 @@ igt@kms_pm_rpm@cursor.*
 ##################################################################
 igt@kms_atomic@plane-primary-overlay-mutable-zpos
 igt@kms_plane_scaling@.*downscale-factor-0-25.*
+igt@kms_plane_scaling@planes-downscale-factor-.*5
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-.*
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-.*
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-.*
 igt@kms_prime@.*
 igt@kms_scaling_modes@scaling-mode-none
 igt@kms_writeback@writeback.*
-- 
2.43.0

