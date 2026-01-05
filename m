Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FFECD0405
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 20:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0B310E013;
	Mon,  5 Jan 2026 20:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B06N0TUI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32F010E013
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 20:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767646661; x=1799182661;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RHvN7jEYYEGOoE6cJTqPdtE4m/pAGscGU4FzaWlllrU=;
 b=B06N0TUIkxV6pdevN4Y69xiZ4vLev1ofTw4OmuIFoTiuCmG7qakNfLwd
 uEYnLH1uyH5EVxROE9FmCQzNzjtQuhdfpgpHvlyxcQ+mI4FCU2aYUr/DI
 AFGFRraunAhvaVl0Mtq/k2B2ywMWs23GsyKnXYbKNUm6vrOkizR/BE+b/
 +fO/ceGuAZvB25KOWX3QrGVoqvulyH+DBj2qEBg1pSevRrXDdvdkLMTb9
 Lnwc3btPMlG6nu7tcZ7JZPXx0KH4vUba4m5vJcQzEMJwMRgGU2Kgw3zjK
 6Ma77tdjiU63+34RQwDFdBUJsPVoUVN4ZA6hDWBDYfU/LWnTLuxJ1+606 A==;
X-CSE-ConnectionGUID: 7DwOuXw8S7y6O+ZgyBOOHg==
X-CSE-MsgGUID: iOON2aKHS/+nR+ll19yqSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68029709"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="68029709"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 12:57:41 -0800
X-CSE-ConnectionGUID: PYAmQhb0RRmHabHEMfMlAw==
X-CSE-MsgGUID: fHy6lNFhQ3+43cVxAKZVrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202381562"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 12:57:39 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v9 0/5] Add plane color pipeline tests for Intel hardware
Date: Tue,  6 Jan 2026 02:35:58 +0530
Message-Id: <20260105210603.62170-1-swati2.sharma@intel.com>
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

This series add plane color pipeline tests for Intel hardware.

v2: -dropped CTM 3x3 colorop and used CTM 3x4 colorop instead
    -added new plane test with 1D LUT and CTM 3x4 colorops
v3: -rebase on v10
v4: -splits the series into smaller, modular patches for
     easier review
    -introduces safe skips on platforms lacking KMD support
    -add 3D-LUT subtest
v5: -rebase on top on AMD's colorop changes
    -refactor color pipeline helpers
v6: -reused frame work by defining igt_color_tf for
     linear and max
    -improved commit messages
v7: -rebase
v8: -add plane colorop tests to new igt kms_color_pipeline
v9: -fix headers and add comment

Swati Sharma (5):
  lib: Refactor color pipeline helpers
  tests/kms_colorop_helper: Add helpers to clear colorops data
  tests/kms_colorop_helper: Cast pixel values to double
  tests/kms_color_pipeline: Add Intel plane pipeline tests with LUT1D
    and CTM
  tests/kms_color_pipeline: Add 3D LUT subtest for green-only output
    with RGB traversal

 lib/igt_color.c            |   59 +
 lib/igt_color.h            |   54 +-
 lib/igt_color_lut.c        | 9839 ++++++++++++++++++++++++++++++++++++
 lib/igt_color_lut.h        | 4917 +-----------------
 lib/meson.build            |    1 +
 tests/kms_color_helper.h   |    1 -
 tests/kms_color_pipeline.c |  343 ++
 tests/kms_colorop.c        |  206 +-
 tests/kms_colorop.h        |  266 -
 tests/kms_colorop_helper.c |  430 ++
 tests/kms_colorop_helper.h |  108 +
 tests/meson.build          |    3 +
 12 files changed, 10801 insertions(+), 5426 deletions(-)
 create mode 100644 lib/igt_color_lut.c
 create mode 100644 tests/kms_color_pipeline.c
 delete mode 100644 tests/kms_colorop.h
 create mode 100644 tests/kms_colorop_helper.c
 create mode 100644 tests/kms_colorop_helper.h

-- 
2.25.1

