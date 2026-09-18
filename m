Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA38C982D2
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 08:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D11310E95F;
	Fri, 18 Sep 2026 08:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfTAtgWM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585D810E95F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 08:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789719885; x=1821255885;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3smh0DW5iEnArTVZwpElplOiOLUPr+19rBUnWUNu6C8=;
 b=dfTAtgWM01qXYJtWSKZ52zpHyEqr5EWX/f8syFzUKv0ij/FPftTRZjfW
 Yz9h19xHpHJQWADicW1/cGRJ6y1HQXrf7vQfARRqesxRJq7E5fdMqKVjV
 4nCUEHp4fAVG8rS3vILdlW79EaV1+3hryL9Gb0W7uSQrtkgl9gww2Pf2k
 yUwWRfdJm7sZtlk+Gs5ioPu+aOuADB/ZnI4twGChvqSaDZ6YcMWkfV9lu
 wAQaXEtDG4tWM6TdmJYsDoXjxFCx6jgYeorEYBEJuKMbuBKSCng0iI1Fs
 ILCapC/6QJi2aXGufKWZ643XcxxB68M+vv21MGqGmUp0uPI+XuZe5zDWp Q==;
X-CSE-ConnectionGUID: j8jPHtzYQl2WjTiGZ1OVXg==
X-CSE-MsgGUID: gi6k6D7CSoyzsnY5BWYhtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100870696"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100870696"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 01:24:45 -0700
X-CSE-ConnectionGUID: cBjYgsw3Rry48Rlvyo76Ow==
X-CSE-MsgGUID: nB9T1zULQAmgLTPaTEZDPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270965394"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 01:24:43 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v6 0/6] Add FIXED_MATRIX colorop tests
Date: Fri, 18 Sep 2026 14:03:44 +0530
Message-Id: <20260918083350.1021184-1-swati2.sharma@intel.com>
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
v6: -s/fixed_matrix/fixed_matrix_type/
    -Derive encoding and range from colorop[0]

Swati Sharma (6):
  lib/igt_kms: Rename IGT_COLOROP_FIXED_MATRIX to
    IGT_COLOROP_FIXED_MATRIX_TYPE
  lib/igt_kms: Order IGT_COLOROP_FIXED_MATRIX_TYPE before
    IGT_COLOROP_NEXT
  tests/kms_colorop_helper: Add Fixed Matrix enum names table
  tests/kms_color_pipeline: Add FIXED_MATRIX colorop tests
  tests/kms_color_pipeline: Remove unused color_depth and drm_format
  tests/kms_chamelium_color_pipeline: Add FIXED_MATRIX colorop tests

 lib/igt_kms.c                                 |   2 +-
 lib/igt_kms.h                                 |   2 +-
 .../chamelium/kms_chamelium_color_pipeline.c  | 280 ++++++++++++++--
 tests/kms_color_pipeline.c                    | 311 ++++++++++++++++--
 tests/kms_colorop_helper.c                    |  26 +-
 tests/kms_colorop_helper.h                    |  14 +-
 6 files changed, 576 insertions(+), 59 deletions(-)

-- 
2.25.1

