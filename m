Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB83C021B3
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 16:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED4510EB02;
	Fri, 21 Feb 2025 16:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNGSN15j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E68410EAFF
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740156758; x=1771692758;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oP46TuBm4v7aUZaFlnsNkkM0RNorV0km8wPt05QTFmM=;
 b=HNGSN15jfUHCWrsbtdxLH6dA5EXC/jo9n+nzNRqGuU+Eb4byFztFXiSl
 lvLOVPfG3jwSIxYCEgzGi4Ml3VTnshYXm3MzcTnJLHSVOXvraeZ7VHJjo
 sOZQ7KKdJFCMXys8wY9WNvcR5hHIQ+LWvmQTCERme5XHQgSXDGm55HbQU
 bCl6qs+TXfPQeJtB/pAab/+bD9MOajwDzijrMi47GSetBRdLolFLeq070
 wgFsqM/bNRwGjARhxToLn2bAegQmmoZTSPPzxCFX3yey/rv5OBacXTfDb
 fXQsNFZmChvJMH5OTLxdgn/UbgnMoaFC5JRgDu7EMbQtocfQIyO2eeQqu A==;
X-CSE-ConnectionGUID: 2hXWaGOATL60wpU1luyW+A==
X-CSE-MsgGUID: cKThfF5qRqS4p6IyR4o33g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41186728"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41186728"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:52:37 -0800
X-CSE-ConnectionGUID: GO9LB7CpR8upty3lnPzMXg==
X-CSE-MsgGUID: HIlGJIaDRJut9zCkzI1XPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120517557"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:52:36 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 00/11] Add new test to validate adaptive sharpness filter
Date: Fri, 21 Feb 2025 22:27:38 +0530
Message-Id: <20250221165749.460347-1-swati2.sharma@intel.com>
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

New test is added to validate adaptive sharpness filter on
LNL platform. Pipe scaler is repurposed to perform a portion
of this work. This means pipe scaling will be unavailable while
the sharpening function is being used. The other scaler can be
used for plane scaler.

In this series, attempt is made to validate adaptive sharpness
solution which helps in improving the image quality. For this new
CRTC property is added. The user can set this property with desired
sharpness strength value with 0-255. A value of 1 representing
minimum sharpening strength and 255 representing maximum
sharpness strength. A strength value of 0 means no sharpening or
sharpening feature disabled.

KMD: https://patchwork.freedesktop.org/series/138754/

Swati Sharma (11):
  lib/igt_kms: Add "sharpness strength" as crtc property
  lib/igt_kms: Add func() to return scaling mode name string
  tests/kms_sharpness_filter: Add adaptive sharpness basic filter tests
  tests/kms_sharpness_filter: Add toggle subtest
  tests/kms_sharpness_filter: Add filter-tap subtest
  tests/kms_sharpness_filter: Add dpms/suspend subtests
  tests/kms_sharpness_filter: Add scaler subtests
  tests/kms_sharpness_filter: Add invalid subtests
  tests/chamelium/kms_chamelium_sharpness_filter: Add basic test
  lib/igt_core: Add igt_dynamic_subtest_name()
  lib/igt_frame: Use igt_dynamic_subtest_name()

 lib/igt_core.c                                |  11 +
 lib/igt_core.h                                |   1 +
 lib/igt_frame.c                               |  25 +-
 lib/igt_kms.c                                 |  23 +
 lib/igt_kms.h                                 |   2 +
 .../kms_chamelium_sharpness_filter.c          | 236 ++++++
 tests/kms_sharpness_filter.c                  | 773 ++++++++++++++++++
 tests/meson.build                             |   3 +
 8 files changed, 1065 insertions(+), 9 deletions(-)
 create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
 create mode 100644 tests/kms_sharpness_filter.c

-- 
2.25.1

