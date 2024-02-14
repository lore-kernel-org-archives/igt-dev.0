Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15CCC48BC4
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C631310E12C;
	Wed, 14 Feb 2024 06:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UuCmE1mm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBAF910E085
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893142; x=1739429142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o1f7YEdRKqKYCN1tPi0Q8wcMyXjwYgc1oqFTGRAvEjc=;
 b=UuCmE1mmoSAb1ybN6prsRzp5JMbV+AHBxy4UiLPsfWWJpRqZ04DKo/Gk
 MBtuU444oTA4jxR+XehHp5mElJuP95Y3l1aubqLK/koPQoNlvSBt5Rm7G
 mvRnhMXpbgPSVoHDjw1F76JPUQuzJU5vbOmUMtM7xGzvWvVbeuoNgapE/
 kJaMGsanKkFFV1t9dZZf9z2nPag0/0zRGhcVlxe8MG0/5ZIz4ZophhTHg
 28QkLLiIv5Qmxnw8f57bPPHL4WGmTrRJIPDgEenmETb5EOSa06aNNwlFz
 tVvanFyWxFl0NmJP9qpedeL4UZtVL9VJf4KtayeMQQKe/LcNKwq5Xoh/X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645405"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645405"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:45:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427543"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:45:32 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Alexander Goins <agoins@nvidia.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>, Sima <daniel@ffwll.ch>,
 Uma Shankar <uma.shankar@intel.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Hector Martin <marcan@marcan.st>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Sasha McIntosh <sashamcintosh@google.com>
Subject: [RFC v4 00/22] IGT tests for the KMS Color Pipeline API
Date: Wed, 14 Feb 2024 12:09:31 +0530
Message-ID: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

This series introduces support for
* drm_colorop DRM objects
* COLOR_PIPELINE plane property

Kernel changes:
https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5

It also adds a new kms_colorop test case that tests the color pipeline
API. The tests are designed to be easily extensible with a "transform"
and "compare" function pointer for each test. The "transform" function
performs the transformations under test via SW routines. The "compare"
function compares the DRM/KMS result (via a writeback connector) with
the result derived via the SW "transform".

There are three tests for LUTs:
 - plane-srgb_eotf: pre-blending sRGB EOTF
 - plane-srgb_inv_eotf: pre-blending sRGB Inverse EOTF
 - plane-srgb_eotf-srgb_inv_eotf: pre-blending sRGB EOTF,
   followed by its inverse

And a number of tests for matrices.

v3:
 - Remove need for IOCTLs and libdrm changes
 - Test colorop properties with both atomic and legacy code paths
 - move enum drm_colorop_type to drm_mode.h
 - Add descriptions for public functions in lib (Kamil)
 - Use SPDX style license identifier (Kamil)
 - Replace Skia license comment with copyright note in file header
 - Fix kms_colorop subtests if applicable color pipeline not found

v4: (Bhanu)
 - Though v3 required some cleanup, I am not touching it, instead fix any issue
   as new patch (we may need to squash those patches)
 - Rebase v3
 - Move few helpers to common place (kms_color_helper) to reuse by multiple tests
 - New helpers to cleanup the colorop props.
 - Helpers to support custom 1D LUT & CTM 3x3
 - New subtests to validate Intel plane color pipeline, please find the
   KMD changes: https://patchwork.freedesktop.org/series/129812/

Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Sima <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Hector Martin <marcan@marcan.st>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Sasha McIntosh <sashamcintosh@google.com>

Bhanuprakash Modem (10):
  tests/kms_properties: Fix compilation errors
  lib/igt_kms: Destroy colorops on exit
  lib/colorops: Move few helpers to common place to reuse
  drm-uapi: Add 3x3 CTM
  drm-uapi: Add custom 1D LUT
  lib/igt_color: Add support for 3x3 matrices
  lib/colorops: Add support for Custom 1D LUT
  lib/igt_kms: Increase the colorops count
  tests/kms_color_helper: Add helpers to clear colorops data
  tests/kms_color: Add plane color pipeline tests for Intel hardware

Harry Wentland (12):
  lib/drmtest: Add is_vkms_device()
  lib/igt_kms: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
  include/drm-uapi: Add COLOROP object
  lib/igt_kms: Introduce drm_colorop and COLOR_PIPELINE
  tests/kms_properties: Add colorop properties test
  igt/color: Add SW color transform functionality
  lib/igt_fb: Add copy_fb function
  tests/kms_colorop: Add kms_colorop tests
  drm-uapi: Add 3x4 CTM
  lib/igt_kms: Add support for DATA colorop property
  lib/igt_color: Add support for 3x4 matrices
  tests/kms_colorop: Add 3x4 CTM tests

 include/drm-uapi/drm.h      |  15 ++
 include/drm-uapi/drm_mode.h |  52 +++++
 lib/drmtest.c               |   5 +
 lib/drmtest.h               |   1 +
 lib/igt_color.c             | 361 +++++++++++++++++++++++++++++
 lib/igt_color.h             |  81 +++++++
 lib/igt_fb.c                |  40 +++-
 lib/igt_fb.h                |   3 +
 lib/igt_kms.c               | 312 ++++++++++++++++++++++++-
 lib/igt_kms.h               |  97 +++++++-
 lib/meson.build             |   1 +
 tests/kms_color.c           | 273 +++++++++++++++++++++-
 tests/kms_color_helper.c    | 313 ++++++++++++++++++++++++++
 tests/kms_color_helper.h    |  91 ++++++++
 tests/kms_colorop.c         | 438 ++++++++++++++++++++++++++++++++++++
 tests/kms_properties.c      |  72 ++++++
 tests/meson.build           |   2 +
 17 files changed, 2140 insertions(+), 17 deletions(-)
 create mode 100644 lib/igt_color.c
 create mode 100644 lib/igt_color.h
 create mode 100644 tests/kms_colorop.c

--
2.43.0

