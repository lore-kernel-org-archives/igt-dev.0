Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F29F8D770
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 19:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1FC10E16B;
	Thu, 16 Apr 2026 19:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X46/cfDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9681310E209
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 19:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776367126; x=1807903126;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hV9Rpba+4iYbEowRjM0DODi/nsHODkDrASRp/IiYmpU=;
 b=X46/cfDA6u8P8+8gXtZiRRKdOcJt2oWgfHNGLL4UU3Fc3Du+3GoyKv+C
 pc1+E4Dn/mMF4K7c+Wn9QPpCNclq4h/Yb0GgbduDOSc6r7OVtb5BHtDd6
 +kLXYs7CAETvvWDYbOASpq2BP0jOzZDkJRE2g9rFkvjY7dxRrXUuVKbMq
 yiBIhamjGmuWpg5CBLNYUug17tw+2TSL8njVx14rymoIx61EjPOL0t57T
 MKGVVocmvrDc4onzDR+qJGGNSLpJGhRaCpdHD7poDAbOjdZCUagXvWPlS
 hZrodpVfYZzGTAuRWV6ju1rHpJM/w0QG82Ef1Bz5aGzVnioWu6AYdOOHS Q==;
X-CSE-ConnectionGUID: JOkeVlUoTVOQkpqKbWWinw==
X-CSE-MsgGUID: pWRw2HJlRlOzWWNMDHEUeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81260621"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81260621"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:18:22 -0700
X-CSE-ConnectionGUID: 6/lnQQxoRpCfDEK3mzZQ2Q==
X-CSE-MsgGUID: pC5oG5anSxqvkpJSUAJbLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="229818004"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 12:18:20 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC PATCH i-g-t v3 0/5] Add FIXED_MATRIX colorop tests
Date: Fri, 17 Apr 2026 00:56:55 +0530
Message-Id: <20260416192700.1579042-1-swati2.sharma@intel.com>
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

This series adds IGT test support for the DRM_COLOROP_FIXED_MATRIX
colorop type, which represents a fixed-function matrix block in Intel
display hardware. Unlike programmable CSC matrices, FIXED_MATRIX
selects from predefined hardware modes via the FIXED_MATRIX_TYPE enum
property.

With this, the SDR plane color pipeline looks like:

[YUV Range Correct] -> [1D LUT] -> [CSC] -> [1D LUT]

The series is structured as follows:

Patch 1: Syncs the DRM UAPI header to add the DRM_COLOROP_FIXED_MATRIX
         enum definition.
Patch 2: Registers the FIXED_MATRIX_TYPE property in the IGT KMS
         library so IGT can discover and set the enum property on
         FIXED_MATRIX colorops.
Patch 3: Extends the kms_colorop_helper with FIXED_MATRIX type
         handling, including can_use_colorop(), set_colorop(), and
         reset_colorop() support, plus the enum name table for:
            - YCbCr 601 Full to RGB
            - YCbCr 709 Full to RGB
            - YCbCr 2020 Full to RGB NC
            - YCbCr limited to full
            - RGB709 to RGB2020
Patch 4: Adds the actual plane color pipeline subtests for
         FIXED_MATRIX covering standalone FIXED_MATRIX,
         FIXED_MATRIX + 1D LUT, 1D LUT + FIXED_MATRIX + 1D LUT,
         and YCbCr range correction (limited/full) pipelines.
         For YUV input tests, a YUYV framebuffer is created with
         the appropriate color encoding and range. Also refactors
         ctm_colorop_only() into a generic colorop_type_only()
         helper.
Patch 5: Removes unused color_depth and drm_format assignments from
         run_tests_for_plane() that were left over from earlier
         refactoring.

This depends on the corresponding kernel series that introduces
FIXED_MATRIX colorop support for Intel display hardware:
https://patchwork.freedesktop.org/series/162786/#rev2

v2: -Naming changes (CSC_FF -> FIXED_MATRIX) to align with KMD
    -Add YCbCr limited-to-full range correction tests (yuv-lim/yuv-full)
    -Add chained range-correct + FIXED_MATRIX tests for bt601/bt709/bt2020

Note: During local validation, CRC mismatches were observed on a few
tests. This is still under investigation and is the reason for the
RFC tag.

Swati Sharma (5):
  include/drm-uapi: Add DRM_COLOROP_FIXED_MATRIX definition
  lib/igt_kms: Add FIXED_MATRIX_TYPE colorop property
  tests/kms_colorop_helper: Add FIXED_MATRIX colorop support
  tests/kms_color_pipeline: Add FIXED_MATRIX colorop tests
  tests/kms_color_pipeline: Remove unused color_depth and drm_format

 include/drm-uapi/drm_mode.h |  11 +
 lib/igt_kms.c               |   1 +
 lib/igt_kms.h               |   1 +
 tests/kms_color_pipeline.c  | 395 +++++++++++++++++++++++++++++++++++-
 tests/kms_colorop_helper.c  |  20 ++
 tests/kms_colorop_helper.h  |  20 +-
 6 files changed, 441 insertions(+), 7 deletions(-)

-- 
2.25.1

