Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6550CCA0EE4
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 15:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E37D10E494;
	Mon, 18 Aug 2025 15:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZjQmlx4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AA310E494
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 15:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755532681; x=1787068681;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IfSx1cU+VOysXMKGKf6sk57a86ucUbQq42KHlHkCTgc=;
 b=UZjQmlx4rYpmS97SRcKrVueQYYi6o04Bzph5uIDk97rJ6+myxr4RdgtA
 OU1F7Cjd2OAV/5OBWu7eUDxx6+TAW/EGIyq2n4wfSIqWcOGVziu9kRv9z
 Hrsdzwup/gmVHXO2R5ZP5g6pMLwpWKskJl8X/gCqPDJ5oanzpAE7mChay
 dkwIcbQftHdqKMR4Cc1rVHFgvkZLBlLFXrtwMN0l+TKfV8NZ+QBa5NNI3
 7suxs22rZOr9+A4AAICpfZK8mEOJtarksDGLXV3q64DsuhyAOxDCswJWp
 a7wI21PX0Ng4j17KCAMB+L2eBD42kf1Vjmx2H7bwJHnXgvBuIF86FHZtV g==;
X-CSE-ConnectionGUID: kLjcOn1UTz+kt3Q7rk6EeA==
X-CSE-MsgGUID: D3zxbOskQJ2PZxLvd4r0Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69134611"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="69134611"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:58:00 -0700
X-CSE-ConnectionGUID: Bo8MhEXaS0unjz66KC965Q==
X-CSE-MsgGUID: WZBSA2VpSqaM6toBo+P9Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="166781665"
Received: from dut2943pvc.iind.intel.com ([10.190.215.44])
 by orviesa006.jf.intel.com with ESMTP; 18 Aug 2025 08:57:58 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com,
 matthew.brost@intel.com, nishit.sharma@intel.com
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 0/1] Multi-Tile tracking in IGT
Date: Mon, 18 Aug 2025 15:57:56 +0000
Message-ID: <20250818155757.92515-1-nishit.sharma@intel.com>
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

Revision 1:
 In multi-tile scenario it was assumed tile_id == gt_id which is
 not always the case. The patch version 1 tracks the valid tile_id
 and patch version 2 queries valid tile_id in order to check tile_ID
 returned from UAPI is in order or out of order.

v2:
- Incorporated review comments
- Moved common function calls to IGT lib

Nishit Sharma (1):
  lib/xe: Track valid Tile IDs

 lib/igt_sysfs.c   | 29 +++++++++++++++------
 lib/xe/xe_query.c | 66 +++++++++++++++++++++++++----------------------
 lib/xe/xe_query.h |  1 +
 3 files changed, 57 insertions(+), 39 deletions(-)

-- 
2.43.0

