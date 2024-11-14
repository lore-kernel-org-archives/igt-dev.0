Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D43D6A221
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 19:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F3C10E2C5;
	Thu, 14 Nov 2024 19:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rf4NqDcA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B8D10E093
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 19:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731611024; x=1763147024;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qPO3pqagj3tPQdpSh82GvkSawnxaEH79FMMs3/j70PY=;
 b=Rf4NqDcArfGtOkqKE/Ae4KFq4hN9t3mrQTuU+7s2VfzoHP6d4VJ3PHIO
 KQHpFRn3mEt6KzKPCEjEsH2i/Trm/u2+FfOtx/ktkgOrOYvutw7y6tg9X
 gRrrpbLpJpNFSiJDPVjjJbkdcPt2MmtVw6Kmm/vJzHztZpnuzRsJQJVwn
 E0IFSmr+sJyqb49iVkZBAfoYDh2oNaWlKcLoZHC3xIqFeMxwFoEDfKZNP
 YOZmWPSCsc39Mo4vgeSLrECoRD2H62FT7eOks5atxqbMeDLVibzWN2u9J
 4vONqylY95zhhOPHhsv7yZV/EaLk2VNAZYZg33nzcsdNog8YsgSWsQQXX A==;
X-CSE-ConnectionGUID: p8k3Xj5GSrevHfWr1es8Mg==
X-CSE-MsgGUID: gPkiwo++SiiCUpFZdeAUlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="34442551"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="34442551"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:43 -0800
X-CSE-ConnectionGUID: YfKQXCQ4Rbuq1g4hZJRLEQ==
X-CSE-MsgGUID: b1+XZ5TOQoaawcjieq410w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93242103"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 11:03:43 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 0/9] Initial PTL support 
Date: Thu, 14 Nov 2024 11:03:30 -0800
Message-Id: <20241114190339.3885752-1-clinton.a.taylor@intel.com>
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

Initial set of patches to enable testing Pantherlake.

Akshata Jahagirdar (1):
  PTL: lib/intel_device_info: Enable flatccs for PTL

Heikkila, Juha-pekka (4):
  XE3: tests/kms_addfb_basic: fix x-tiled tests for case when there is
    no x-tile
  XE3: tests/intel/kms_draw_crc: fix x-tiled tests for case when there
    is no x-tile
  XE3: tests/kms_cursor_legacy: flip_vs_cursor_busy_crc was requiring
    any driver but used intel x-tile
  XE3: tests/intel/kms_frontbuffer_tracking: fix x-tiled tests for case
    when there is no x-tile

Matt Atwood (1):
  PTL: lib/intel_chipset: add pantherlake definition and support

Matthew Auld (2):
  XE3: lib/intel_pat: extend for xe3
  XE3: tests/intel/xe_pat: extend for xe3

Vinod Govindapillai (1):
  XE3: tests/intel/kms_frontbuffer_tracking: platform based handling of
    x-tile cases

 lib/intel_chipset.h                    |  2 ++
 lib/intel_device_info.c                | 13 +++++++++++++
 lib/intel_pat.c                        |  3 ++-
 tests/intel/kms_draw_crc.c             |  6 ++++--
 tests/intel/kms_frontbuffer_tracking.c | 18 ++++++++++++++----
 tests/intel/xe_pat.c                   |  4 ++--
 tests/kms_addfb_basic.c                | 22 ++++++++++++----------
 tests/kms_cursor_legacy.c              |  2 +-
 8 files changed, 50 insertions(+), 20 deletions(-)

-- 
2.25.1

