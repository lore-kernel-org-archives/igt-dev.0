Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8FEC61DFD
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 19:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4EB10E33F;
	Mon, 31 Aug 2026 19:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfWCLh4A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADFB10E33F
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 19:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788204033; x=1819740033;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5G5OD2FDJsPVi5TOp0t1ud/8wSKmam2GaKvLwiyES8Y=;
 b=DfWCLh4AqU+JmIxLpaxkVY6XheoS+Lvq/e2zo4L1Y6/WBKlYRLC6oD/s
 M5YC+tzHbOud+jwjnH+rJjz3u1Ylcvstsa4mohcxD4CzlwbZZwuJdCYpx
 iZPzmiwOPNyLHw5KRTeEzMB4JEy8o0GkRkuGINBXxpZssj6yXwgY9a7PA
 hk3cCGlQMs6aA1ukD8kFy7ay+VfbdzJQAoeMAuSIIX0QxrV9P2Df/dgfw
 NCH/O/6IQR0dRLKJZ/r9reqgdqtCIbWnNzsVu08m7XhXjzfmygTeCxtnB
 QG+kH4WqQ/wprxHDa57eTj1cgeIJhFduC1X5Z+EdyhQTKMGYlRQJXY+3h g==;
X-CSE-ConnectionGUID: SxKS5/rRTYSeb1nRC7Dd2A==
X-CSE-MsgGUID: /qG96AHRTGaou86x/op8xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88549098"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="88549098"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 12:20:33 -0700
X-CSE-ConnectionGUID: kVZDVNbxR2WB6MHl8VcjGA==
X-CSE-MsgGUID: uPlzrqJdRnG/Cr/lWYo5sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="272392292"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 12:20:31 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v5 0/7] Add FIXED_MATRIX colorop tests
Date: Tue,  1 Sep 2026 00:59:28 +0530
Message-Id: <20260831192935.463134-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add support for testing the DRM FIXED_MATRIX colorop type, which
selects from predefined hardware color space conversion matrices
rather than programmable coefficients.

The series adds:
- Pipe-CRC based tests in kms_color_pipeline
- Chamelium frame-capture based tests in kms_chamelium_color_pipeline

With this, the SDR plane color pipeline looks like:

[YUV Full/Limited -> RGB] -> [1D LUT]

A single FIXED_MATRIX colorop handles both full and limited range
YCbCr to RGB conversion.

Supported FIXED_MATRIX modes:
  - YCbCr 601 Full to RGB
  - YCbCr 601 Limited to RGB
  - YCbCr 709 Full to RGB
  - YCbCr 709 Limited to RGB
  - YCbCr 2020 NC Full to RGB
  - YCbCr 2020 NC Limited to RGB

v2: -Naming changes (CSC_FF -> FIXED_MATRIX)
v3: -Drop YCbCr limited to full and RGB709 to RGB2020 matrices
     until we have non-IGT userspace that shows their use
    -Rename subtests to yuv-rgb-btXXX with limited range variants
    -Add limited range test coverage
v4: -Reuse _test_plane_colorops() for FIXED_MATRIX instead of
     separate _test_plane_fixed_matrix_colorops()
    -Store encoding/range in colorop fixed_matrix_info
v5: -Rebase

Swati Sharma (7):
  lib/igt_kms: Rename IGT_COLOROP_FIXED_MATRIX to
    IGT_COLOROP_FIXED_MATRIX_TYPE
  lib/igt_kms: Order IGT_COLOROP_FIXED_MATRIX_TYPE before
    IGT_COLOROP_NEXT
  tests/kms_colorop_helper: Add Fixed Matrix enum names table
  tests/kms_color_pipeline: Add FIXED_MATRIX colorop tests
  tests/kms_color_pipeline: Remove unused color_depth and drm_format
  tests/kms_chamelium_color_pipeline: Add FIXED_MATRIX colorop tests
  tests/chamelium/kms_chamelium_color_pipeline: Fix CRTC naming

 lib/igt_kms.c                                 |   2 +-
 lib/igt_kms.h                                 |   2 +-
 .../chamelium/kms_chamelium_color_pipeline.c  | 281 ++++++++++++++--
 tests/kms_color_pipeline.c                    | 305 ++++++++++++++++--
 tests/kms_colorop_helper.c                    |  26 +-
 tests/kms_colorop_helper.h                    |  14 +-
 6 files changed, 570 insertions(+), 60 deletions(-)

-- 
2.25.1

