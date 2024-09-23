Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8AFCF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 07:07:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD8210E38D;
	Mon, 23 Sep 2024 07:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PuvxrDVZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C833E10E38D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 07:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727075267; x=1758611267;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZKm9MsCvnD4qfJB/ZSnS21R9w94qF1mz2YZMELCVYrE=;
 b=PuvxrDVZ6mrV9vYt7xalUWs1p01mdkQIR2y34T9StWtSzS9vv6g/+MeG
 hwzL4szGKMDPe5N582cjgWv4JyaiQ3Qk5MBzx/alovSkKj9UWLljv1q0Y
 /AWB3Z7Xgx7qe7UdotwbuJGIMuHxWNbeUIcEfeXsB8VZovT8P1Wye9+XT
 jmUSGULj0eTANPKcOgJE80qXnzua6yblZFvsEHEn/a0omRaMguIYJLGeH
 5q3N3hDqRGglHFrZInBQBsbX65Fh3qJksyoy89e45nrVewpgEfJYrERWt
 Yqq33YbvPPXFgrTLfQ/RX0Cs+nvONEBpvm8DCyB+ugMjo4Lzfnq41NsG+ w==;
X-CSE-ConnectionGUID: ORvaLVzxQxW139AmyVvlew==
X-CSE-MsgGUID: o9uTWANQSqayMFr/ah6o9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25956121"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="25956121"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:07:47 -0700
X-CSE-ConnectionGUID: Doj/sdlxSoafadv2MpKYsQ==
X-CSE-MsgGUID: nBAA6VN+Q8mAyK2jATGWdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="71799108"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 00:07:46 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/6] New sharpness tool
Date: Mon, 23 Sep 2024 12:40:17 +0530
Message-Id: <20240923071023.1170127-1-swati2.sharma@intel.com>
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

To experiment with sharpness, 3 images are used (HD, FHD, 4K).
All the images are stocked images.

Tool has following options:
-h value:   incr/decr factor for setting strength for hd res
-f value:   incr/decr factor for setting strength for fhd res
-k value:   incr/decr factor for setting strength for 4k res
-H value:   user defined strength (1-255) for hd res
-F value:   user defined strength (1-255) for fhd res
-K value:   user defined strength (1-255) for 4k res
-p:         prints this message

Naladala Ramanaidu (1):
  meson: Add sharpness tool

Naladala, Ramanaidu (2):
  data: create new data directory
  lib: update fopen() to accomodate imgdir

Swati Sharma (3):
  [HAX] lib/igt_kms: Added "sharpness strength" as crtc property
  tools: Add new sharpness tool
  data: Add hd, fhd and 4k images

 {tests => data}/1080p-left.png  | Bin
 {tests => data}/1080p-right.png | Bin
 data/1920x1080.png              | Bin 0 -> 3347107 bytes
 data/3840x2160.png              | Bin 0 -> 13426944 bytes
 data/640x480.png                | Bin 0 -> 657520 bytes
 data/meson.build                |  12 ++
 {tests => data}/pass.png        | Bin
 lib/igt_core.c                  |  10 +-
 lib/igt_core.h                  |   4 +-
 lib/igt_kms.c                   |   4 +
 lib/igt_kms.h                   |   1 +
 lib/meson.build                 |   1 +
 meson.build                     |   2 +
 tests/meson.build               |   6 -
 tools/intel_sharpness_tool.c    | 342 ++++++++++++++++++++++++++++++++
 tools/meson.build               |  11 +
 16 files changed, 383 insertions(+), 10 deletions(-)
 rename {tests => data}/1080p-left.png (100%)
 rename {tests => data}/1080p-right.png (100%)
 create mode 100644 data/1920x1080.png
 create mode 100644 data/3840x2160.png
 create mode 100644 data/640x480.png
 create mode 100644 data/meson.build
 rename {tests => data}/pass.png (100%)
 create mode 100644 tools/intel_sharpness_tool.c

-- 
2.25.1

