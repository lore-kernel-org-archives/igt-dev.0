Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6865BC83F17
	for <igt-dev@archiver.kernel.org>; Fri, 18 Jul 2025 05:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B6110E00C;
	Fri, 18 Jul 2025 05:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JZQsSCla";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DCD10E00C
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jul 2025 05:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752817752; x=1784353752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1yTpt7IQmqR/3O9znszjiK0fI2XJ2+QgwRBnPuQV2KI=;
 b=JZQsSCla/0DR7oOn1+Ylqsl70g+NpkxjFiK41++6jeBo5vZ07tH3NdCO
 FzLhHiyKg51eLOGIuECt7OH7NoJ0vZUUNsZqojky+1pqCAzwzEbFTSoZ+
 zeiNFssBoFOWYj4xBqX1Q6fRdqBgSI2sdXb6OD84TBOuz/vAeHElnbRXg
 qiEO9NLyBqRBr9LCyoTUvTSup5q9BulSlG7Z2r91aKCeqjtW45/BuKPbj
 HHrHTPZzIE5aJMeHq8nzltDr6uPEOI06I97C5+w+2hTSYVuAYw8ptlOkN
 D3wsND6dKdAHFAud40q0H7j4PEnXWdQ7XwKNGm41f8HM/TjXrRoAU5fTk A==;
X-CSE-ConnectionGUID: gOQhcgbxTWu2YJgSYw+liA==
X-CSE-MsgGUID: tuvAvp8qSN2+8QWj4ttfdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55230248"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="55230248"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 22:49:11 -0700
X-CSE-ConnectionGUID: OEXA9ny8T3yeXTp+KSHteg==
X-CSE-MsgGUID: Nlds4Vg8Q1qHL32ylBNwlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="158058873"
Received: from dut2943pvc.iind.intel.com ([10.190.215.47])
 by orviesa007.jf.intel.com with ESMTP; 17 Jul 2025 22:49:09 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, matthew.brost@intel.com,
 nishit.sharma@intel.com
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 0/2] Multi-Tile Handling in IGT
Date: Fri, 18 Jul 2025 05:49:06 +0000
Message-ID: <20250718054908.1502234-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

In multi-tile scenario it was assumed tile_id == gt_id which is
not always the case. The patch version 1 tracks the valid tile_id
and patch version 2 queries valid tile_id in order to check tile_ID
returned from UAPI is in order or out of order.

Nishit Sharma (2):
  lib/xe: Track valid Tile IDs
  tests/intel/xe_multi_tile: Multi-tile support in IGT

 lib/igt_sysfs.c             |  11 ++-
 lib/xe/xe_query.c           |  12 +++
 lib/xe/xe_query.h           |   8 ++
 tests/intel/xe_multi_tile.c | 141 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 5 files changed, 171 insertions(+), 2 deletions(-)
 create mode 100644 tests/intel/xe_multi_tile.c

-- 
2.43.0

