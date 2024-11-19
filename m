Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F1CD6004C
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 07:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B3710E0CF;
	Tue, 19 Nov 2024 07:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEummIwo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C519110E0CF
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 07:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732002854; x=1763538854;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4ysQyn3kjGYfLjFGmtL2qfDGIMPhIatzMGmRo0McJpo=;
 b=FEummIwoql8kVe+fnVJ5JgannXVCuq4j/LHp5PTemClhXbgalRvmnjkM
 7BbAYJT+065m5Mb1suWSKX+BEfpEgsKx+90pNhqCLGfPhvb1DGBzh0Nc5
 uL5SfaewP3kvGxBTzAlliaV1YQ5JS4DZP80LPy8F2FN42QgvdbF3fex9Z
 +5lhLBFGakHgRi7C0SGCKozoyt8N9BNrBfWhuRUIbFGoSODcIbu6rt4O9
 LIFA6D2o54WXqOdFmK1/0WQ4iQ9tuATFjQYli4iu8wG1JOPHM9OH2or2g
 NuxQ2iJEPeMPmqRcnFmhYu/7qAJrTKcMf0DNadv3/FdW8AH2h9rUSwh2k A==;
X-CSE-ConnectionGUID: JR48rUUrReuC2qSmsfrZ0Q==
X-CSE-MsgGUID: sgs7hXsIQLa8IZh7+lz5cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32136131"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32136131"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 23:54:14 -0800
X-CSE-ConnectionGUID: Fu/SRXnfRGGHlWjq57tHtQ==
X-CSE-MsgGUID: mpqwgIoJQe+Br4s1NJ5Ulg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="90278693"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 23:54:12 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH 0/5] Update image assets
Date: Tue, 19 Nov 2024 13:22:54 +0530
Message-ID: <20241119075259.3048734-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Update image assets and improve file handling.

Naladala Ramanaidu (3):
  runner/settings: Update absolute_path function to accept const char*
    parameter
  runner/settings: Add function to set IMGDIR environment variable
  HAX patch do not merge

Naladala, Ramanaidu (2):
  data: create new data directory
  lib: update fopen() to accomodate imgdir

 {tests => data}/1080p-left.png           | Bin
 {tests => data}/1080p-right.png          | Bin
 data/meson.build                         |   9 +
 {tests => data}/pass.png                 | Bin
 lib/igt_core.c                           |  17 +-
 lib/igt_core.h                           |   4 +-
 lib/meson.build                          |   1 +
 meson.build                              |   2 +
 runner/runner.c                          |   2 +
 runner/settings.c                        |  15 +-
 runner/settings.h                        |  10 +-
 tests/intel-ci/fast-feedback.testlist    | 168 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 279 +----------------------
 tests/meson.build                        |   6 -
 14 files changed, 56 insertions(+), 457 deletions(-)
 rename {tests => data}/1080p-left.png (100%)
 rename {tests => data}/1080p-right.png (100%)
 create mode 100644 data/meson.build
 rename {tests => data}/pass.png (100%)

-- 
2.43.0

