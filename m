Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB69E94116
	for <igt-dev@archiver.kernel.org>; Tue, 30 Dec 2025 06:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8332310E12A;
	Tue, 30 Dec 2025 06:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLswlr5q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3090D10E12A
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Dec 2025 06:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767076655; x=1798612655;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AYAkDFiWrdnCaejxRqOkdqPuBXtP61YQW9y4xOhy09w=;
 b=bLswlr5qYc4mfDzsB+C2yCVrGjf+/lNe573QmK27VAzRb5TUiaCHYr2S
 ioiw/fabjdndsMSdTwtNkVqVqAD5Wrl4v0xzfeZuvFQSDPnLJfX9OcVVd
 rQZn7OHct/g7cSiHpFy+1PdLE8kgGtYsfgFcHllRqoDsfc0pbSi1697AA
 Z+8gN2UM5/nFIa9KSB3/ehvoxqbHpPmBewximvFidmGzt0OVESERrwkyy
 I/sF5SBmnzPNf8jOWV4DpD7oBHRD4g4CGdWzuv+SpMrUjFYPYx/pqSa8m
 Gi8Ks2Cs9ond+Gh7dDLCxjsNmI0xikj++xHItOai94Dp0c1hXnZDMPBsf A==;
X-CSE-ConnectionGUID: S2IDTuJiTA+N8cDqXWmHNQ==
X-CSE-MsgGUID: UL61N9pBTYW613t03lC+Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="67672889"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="67672889"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 22:37:35 -0800
X-CSE-ConnectionGUID: n2B7iYUcQYKTcWCyt0raCA==
X-CSE-MsgGUID: sPpSZgqzTsKCfJThDYA/qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="224644592"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 22:37:33 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v8 0/5] Add plane color pipeline tests for Intel hardware
Date: Tue, 30 Dec 2025 12:15:47 +0530
Message-Id: <20251230064552.22909-1-swati2.sharma@intel.com>
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
 tests/kms_color_helper.h   |    1 +
 tests/kms_color_pipeline.c |  336 ++
 tests/kms_colorop.c        |  206 +-
 tests/kms_colorop.h        |  266 -
 tests/kms_colorop_helper.c |  430 ++
 tests/kms_colorop_helper.h |  108 +
 tests/meson.build          |    3 +
 12 files changed, 10795 insertions(+), 5425 deletions(-)
 create mode 100644 lib/igt_color_lut.c
 create mode 100644 tests/kms_color_pipeline.c
 delete mode 100644 tests/kms_colorop.h
 create mode 100644 tests/kms_colorop_helper.c
 create mode 100644 tests/kms_colorop_helper.h

-- 
2.25.1

