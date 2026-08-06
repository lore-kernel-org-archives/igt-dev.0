Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E66C56208
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 11:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560A510EA23;
	Thu,  6 Aug 2026 11:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C7gbGpzh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB1210EA23
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 11:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786017295; x=1817553295;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mOD1WU7SISYeztN2Q+glSEMXnO0LD+r2+RuCnx2fK0w=;
 b=C7gbGpzh4F6AbLOR9ctdE3fXBteU61dNmVQ6sPFD4srfmWnayx1PKP/M
 HBf24UWbCH/ggWBVflal8kh6X8yvDXdS0DMrkrUAVcgM4SmChQWlphp3s
 s0l0+inKKeP4A7tNEvSTAdKc/1PoPgpmQCgEkY4gptNvFiSsFTMR/0sop
 aSPgXcrmiP5ryB6CXNiWHlTgit7xxEo/iZwmFoOqs2GNZ+rJD0i7vbpOT
 FOW2KelYSBIuIpSPZdQEhCPNO3HyIgDC0hJ5ICh2Ow1BmgT+wWlZy1030
 KGbt6zdXkY0+Ejz9yMYHf55uS7+EjTbsJvsocQxhk1ICvJPMe6iV+l3WO g==;
X-CSE-ConnectionGUID: apex0IwzSSuqz8JlGaouww==
X-CSE-MsgGUID: KC583AuJQfqJzff09SG9DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97204764"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="97204764"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:54:55 -0700
X-CSE-ConnectionGUID: DAOljfraQOCEro7bsAQPeA==
X-CSE-MsgGUID: KyK8kajySpeQXR3ksQU2Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="261552826"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 04:54:53 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v3 0/6] Add FIXED_MATRIX colorop tests
Date: Thu,  6 Aug 2026 17:33:39 +0530
Message-Id: <20260806120345.19406-1-swati2.sharma@intel.com>
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
 .../chamelium/kms_chamelium_color_pipeline.c  | 307 ++++++++++++++++
 tests/kms_color_pipeline.c                    | 345 +++++++++++++++++-
 tests/kms_colorop_helper.c                    |  21 ++
 tests/kms_colorop_helper.h                    |  21 +-
 7 files changed, 700 insertions(+), 7 deletions(-)

-- 
2.25.1
