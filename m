Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90099C5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 18:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3BB10EB88;
	Wed, 26 Aug 2026 18:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDCHx4LJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F6E10EB88
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 18:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787769032; x=1819305032;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NReICZqK+Xhvm8VtjNNfTkujUayjp7OCGQWkLrjBUJ4=;
 b=fDCHx4LJdcUbzRO9m1VVM530d98fMIBVCd+deZpufNIKeD3lsKoo3wPe
 YVm2guM9w5AhZTWsG8V2Zw4IhZUke1E+4Ztr/1ZSvluuPP7brwWoKbNjK
 qjQ9uH9uk6eziBVIf+45vr+novHFk1sJ4JHg0Mlljvm36uM/PrcIKpWKu
 m91r5hFbTGE/wZkshcumezgYO9jB6LSUn2WaGfc0V+wgvsLzmatVNko7z
 7rQZ5VNPzsIAyAcsJBfVYZQ/2nMSPFeIxcq6UkvZc97TPD+4Qp/z5pqdi
 KXf2Je0OYWo/HgmKetMswAvAAiR3Jcmq3G+K5GIezjWjg0o2aPWK3FZ6i Q==;
X-CSE-ConnectionGUID: IYTe+d2KQ/KA3lfC+3WfSg==
X-CSE-MsgGUID: HXPs+rbPQdKoKYF3vztDpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88314761"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88314761"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 11:30:31 -0700
X-CSE-ConnectionGUID: +k4OIS5GSv24LsvdEv9Cow==
X-CSE-MsgGUID: 2suAjzUtRVa84ShzJPtWIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="271159646"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:30:30 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v4 0/7] Add FIXED_MATRIX colorop tests
Date: Thu, 27 Aug 2026 00:09:25 +0530
Message-Id: <20260826183932.351933-1-swati2.sharma@intel.com>
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
- UAPI definition for DRM_COLOROP_FIXED_MATRIX
- FIXED_MATRIX_TYPE property support in igt_kms
- Colorop helper support for configuring FIXED_MATRIX blocks
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

Harry Wentland (1):
  tests/kms_colorop_helper: Add Fixed Matrix colorop infrastructure

Swati Sharma (6):
  include/drm-uapi: Add DRM_COLOROP_FIXED_MATRIX definition
  lib/igt_kms: Add FIXED_MATRIX_TYPE colorop property
  tests/kms_colorop_helper: Add Fixed Matrix enum names table
  tests/kms_color_pipeline: Add FIXED_MATRIX colorop tests
  tests/kms_color_pipeline: Remove unused color_depth and drm_format
  tests/kms_chamelium_color_pipeline: Add FIXED_MATRIX colorop tests

 include/drm-uapi/drm_mode.h                   |  11 +
 lib/igt_kms.c                                 |   1 +
 lib/igt_kms.h                                 |   1 +
 .../chamelium/kms_chamelium_color_pipeline.c  | 279 ++++++++++++++--
 tests/kms_color_pipeline.c                    | 305 ++++++++++++++++--
 tests/kms_colorop_helper.c                    |  64 ++++
 tests/kms_colorop_helper.h                    |  26 +-
 7 files changed, 637 insertions(+), 50 deletions(-)

-- 
2.25.1

