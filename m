Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FFEE7719C
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 19:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E72310E51F;
	Fri, 10 Jan 2025 19:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5VROwVV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CBE10E51D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 19:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736538352; x=1768074352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wHwcRDZrgAOac0+Y6eDoS6H1376WFPhldt8Rn3ScsbM=;
 b=c5VROwVVLbxC8WF/qwLOr1N+fr0nBXqu3ArYdrmOLHShyU1jShWxLuQl
 zNACZBHVDG7FLcxhuzpnM4TJLIeKxsmJcvyChH/exW5mOLKpuZ4aoSl/V
 WbRvrDpwcTw3lKpjZFI1yx6VaOow6iTiuHUJtnmjbyBsTWm2sUoWTZiae
 PfkPomoenY/2uusxte8jqjFc09lWVtHWtPfHHNChk8wKR0yDbNWV9HL7H
 wQbBVOoBM+cdR4mbCR4+t3Mrn/FbujpyQ3e+rDlOHztjAyDuOodKpU05e
 gmwRvzFgL5K/mNFPqFyOsM779h8vF3fcg6VjO4+M71flbFSCSOYD7SOF5 A==;
X-CSE-ConnectionGUID: M9pFHn8dQ/mp+CTHq7YZQA==
X-CSE-MsgGUID: 6Emsy95ZSomIZE47KbnVyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47419794"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="47419794"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:45:52 -0800
X-CSE-ConnectionGUID: MIGEh2zAT5umdrhm7v2dMg==
X-CSE-MsgGUID: D5L4iFH/SDm2VC3a1tAIkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; d="scan'208";a="104334404"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 11:45:51 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/8] New sharpness tool
Date: Sat, 11 Jan 2025 01:20:52 +0530
Message-Id: <20250110195100.150301-1-swati2.sharma@intel.com>
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

New sharpness tool is introduced to validate basic functionality
of content adaptive sharpness filter supported with intel LNL platform.

Tool has following 2 main functions:
1. input user defined strength value (1-255)
2. input incr/decr factor for setting strength and use up/down
   arrow keys to increase/decrease strength during run time

Naladala Ramanaidu (5):
  data: Move PNG images to new data directory
  runner/settings: Constify absolute_path parameter
  runner/settings: Add function to set IGT_RUNNER_DATA environment
    variable
  lib/igt_core: Enhance __igt_fopen_data to support additional
    directories
  meson: Add sharpness tool

Swati Sharma (3):
  lib/igt_kms: Add "sharpness strength" as crtc property
  tools: Add new sharpness tool
  data: Add image

 {tests => data}/1080p-left.png  | Bin
 {tests => data}/1080p-right.png | Bin
 data/default_hd_image.png       | Bin 0 -> 657520 bytes
 data/meson.build                |  12 ++
 {tests => data}/pass.png        | Bin
 lib/igt_core.c                  |  31 ++-
 lib/igt_core.h                  |   6 +-
 lib/igt_kms.c                   |   4 +
 lib/igt_kms.h                   |   1 +
 lib/meson.build                 |   1 +
 meson.build                     |   2 +
 runner/runner.c                 |   8 +
 runner/settings.c               |  11 +-
 runner/settings.h               |   3 +-
 tests/meson.build               |   6 -
 tools/intel_sharpness_tool.c    | 370 ++++++++++++++++++++++++++++++++
 tools/meson.build               |  11 +
 17 files changed, 439 insertions(+), 27 deletions(-)
 rename {tests => data}/1080p-left.png (100%)
 rename {tests => data}/1080p-right.png (100%)
 create mode 100644 data/default_hd_image.png
 create mode 100644 data/meson.build
 rename {tests => data}/pass.png (100%)
 create mode 100644 tools/intel_sharpness_tool.c

-- 
2.25.1

