Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388AF10D14A7
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 11:42:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C234A10E660;
	Mon, 30 Mar 2026 11:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1GMLLCd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9903E10E5FE
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 11:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774870946; x=1806406946;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XcOvmfg4GasGMcGadHuWon3D4Q+zTofpPooK25op4po=;
 b=H1GMLLCdA2Wn6qn6SKPeS+/CRpiq/KfCeUEKgketYhrreNfKmoAvtR1F
 M13ZQaDF+0pRNzVqLueBlZfPHm65xFiUE6/htTGSqzfl/ClzqIYyrbHCj
 M0xQfgDJXAhDAd5B0b/MqVxWguZX+DiXTvwSL6jRDL3XOJ6C7QEeMXXRR
 RMPhSrMe2m4w/6hKixGO8/6ypj7t8kni/u47pP+dmVw324iqp/a2EeidG
 uYqDE8/TFhnlVDnOAydWl1Q23OE1Ssq8yQkymAYH/lVEbkA0VMpbvZAZF
 W4+ZqTom/ovH9tB8nDtll1Qmd+lsoMqjQqi+91mdE7z3pRuxGaJ2PERJg A==;
X-CSE-ConnectionGUID: D7AJ0XsnQge1j0FjscW9yQ==
X-CSE-MsgGUID: 0s8Q2GoAQ7+L1fcaGq+Vlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75572000"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75572000"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 04:42:26 -0700
X-CSE-ConnectionGUID: WjcXuzpjSCq3WNlJUsJ7RA==
X-CSE-MsgGUID: Ck5kat9URL+GZbbNyh83Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="230080334"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:42:25 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC PATCH i-g-t 0/5] Add CSC Fixed-Function (CSC_FF) colorop tests
Date: Mon, 30 Mar 2026 17:20:52 +0530
Message-Id: <20260330115057.963395-1-swati2.sharma@intel.com>
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

This series adds IGT test support for the DRM_COLOROP_CSC_FF colorop
type, which represents a fixed-function Color Space Conversion block
in Intel display hardware. Unlike programmable CSC matrices, CSC_FF
selects from predefined hardware modes via the CSC_FF_TYPE enum
property.

The series is structured as follows:

Patch 1: Syncs the DRM UAPI header to add the DRM_COLOROP_CSC_FF
          enum definition.
Patch 2: Registers the CSC_FF_TYPE property in the IGT KMS library
          so IGT can discover and set the enum property on CSC_FF
          colorops.
Patch 3: Extends the kms_colorop_helper with CSC_FF type handling,
          including can_use_colorop(), set_colorop(), and
          reset_colorop() support, plus the enum name table for:
            - YUV601 to RGB601
            - YUV709 to RGB709
            - YUV2020 to RGB2020
            - RGB709 to RGB2020
Patch 4: Adds the actual plane color pipeline subtests for CSC_FF
          covering standalone CSC_FF, CSC_FF + 1D LUT, and
          1D LUT + CSC_FF + 1D LUT pipelines. For YUV input
          tests, a YUYV framebuffer is created with the appropriate
          color encoding and range. Also refactors ctm_colorop_only()
          into a generic colorop_type_only() helper.
Patch 5: Removes unused color_depth and drm_format assignments from
          run_tests_for_plane() that were left over from earlier
          refactoring.

This depends on the corresponding kernel series that introduces
CSC_FF colorop support for Intel display hardware:
https://patchwork.freedesktop.org/series/162786/

Note: During local validation, CRC mismatches were observed on a few
tests. This is still under investigation and is the reason for the
RFC tag.

Swati Sharma (5):
  include/drm-uapi: Add DRM_COLOROP_CSC_FF definition
  lib/igt_kms: Add CSC_FF_TYPE colorop property
  tests/kms_colorop_helper: Add CSC_FF colorop support
  tests/kms_color_pipeline: Add CSC_FF colorop tests
  tests/kms_color_pipeline: Remove unused color_depth and drm_format

 include/drm-uapi/drm_mode.h |  12 ++
 lib/igt_kms.c               |   1 +
 lib/igt_kms.h               |   1 +
 tests/kms_color_pipeline.c  | 292 +++++++++++++++++++++++++++++++++++-
 tests/kms_colorop_helper.c  |  19 +++
 tests/kms_colorop_helper.h  |  19 ++-
 6 files changed, 337 insertions(+), 7 deletions(-)

-- 
2.25.1

