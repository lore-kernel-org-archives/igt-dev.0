Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C7FC53209
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jul 2026 18:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAF610E6D5;
	Mon, 27 Jul 2026 18:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8AL2kHC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF0D10E6CA
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jul 2026 18:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785177992; x=1816713992;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U34OixJSSmDZtrcXu7QTCsj4g20EGdwrIzp2P8lZSHE=;
 b=g8AL2kHCEiLDDMZxRUx8hMwgexJIHldMvblKFzkydkzmDsaVURos5L2g
 Tp16HqEPc/zu/gBEIWUYTc+BbAMhhJRqLPBoTPyLjjFyQfOViVIB4eqlM
 ncJbBhJcgsiwF2H0kM0z5SQlMwKdB7gp8nAyPCHUvALFiXFAHWlrndvDo
 VtcQ5BJL7S+xo+S7BLzBTVXuRqaMR988ZkpqzFAPBgODCheUhcZ9kSrfV
 GoJF0B2CgsSOxOA0ux4iUTWv9ogcA4v+LRxtY6obsjhaOH+5+AIxIi8YQ
 Ho2Z7rOzLNdNaL8Hv2MfFSyXZ1qhLVNi6ITmuwpbNVhGC+muJBt8i4M8x A==;
X-CSE-ConnectionGUID: Ewmh+KZVQEeT4F9sbA7k2w==
X-CSE-MsgGUID: kTX1/SJ2TPedUcvZhZm51A==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103296098"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="103296098"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 11:46:31 -0700
X-CSE-ConnectionGUID: abtnLwIrQEuItG+V+9xEzA==
X-CSE-MsgGUID: mh/lCU/HS5KTGlqoOaFO0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="259545252"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:46:30 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/6] Add FIXED_MATRIX colorop tests
Date: Tue, 28 Jul 2026 00:25:25 +0530
Message-Id: <20260727185531.4046807-1-swati2.sharma@intel.com>
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

Supported FIXED_MATRIX modes:
  - YCbCr 601 Full NC to RGB
  - YCbCr 709 Full NC to RGB
  - YCbCr 2020 Full NC to RGB
  - YCbCr limited to full
  - RGB709 to RGB2020

The tests validate standalone FIXED_MATRIX, FIXED_MATRIX + 1D LUT,
1D LUT + FIXED_MATRIX + 1D LUT, and YCbCr range correction pipelines
matching the SDR plane hardware pipeline structure.

Swati Sharma (6):
  include/drm-uapi: Add DRM_COLOROP_FIXED_MATRIX definition
  lib/igt_kms: Add FIXED_MATRIX_TYPE colorop property
  tests/kms_colorop_helper: Add FIXED_MATRIX colorop support
  tests/kms_color_pipeline: Add FIXED_MATRIX colorop tests
  tests/kms_color_pipeline: Remove unused color_depth and drm_format
  tests/kms_chamelium_color_pipeline: Add FIXED_MATRIX colorop tests

 include/drm-uapi/drm_mode.h                   |  11 +
 lib/igt_kms.c                                 |   1 +
 lib/igt_kms.h                                 |   1 +
 .../chamelium/kms_chamelium_color_pipeline.c  | 339 +++++++++++++++
 tests/kms_color_pipeline.c                    | 391 +++++++++++++++++-
 tests/kms_colorop_helper.c                    |  20 +
 tests/kms_colorop_helper.h                    |  20 +-
 7 files changed, 776 insertions(+), 7 deletions(-)

-- 
2.25.1

