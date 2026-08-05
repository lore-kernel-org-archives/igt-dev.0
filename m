Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584B5C2A09B
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 02:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C744E10EC80;
	Wed,  5 Aug 2026 02:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnOUkn84";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C52510EC80
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Aug 2026 02:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785898643; x=1817434643;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BnfiMxa4qVvh8AB2E6VcQJt7axfVTJi84paCocpGkMM=;
 b=hnOUkn84Hmh6yzrO42RripWn34oPNhWMjxDLGsNI6GTiF7ognGUk4RjB
 yabfXSwwe1zTfJJv2Cexk1QdTgSdqM65bYewsnGYOuyo0PCgNxDqZVchH
 f1m/p9+TJ1HzIfj0R6ceJvagzIVA/brvmc02+40lqnO1e/xzTWCHbEmQV
 5dIX4aM7xbGp0Pkru41sKUeZFPxUxyC6kx6IvrHkgBDKqsyrr5tptHjaX
 EDFFeQCQVakkL8exx9utD/oo5HVPxR4WclaQ4c1elNOEH6/p1sdVXVHLw
 qa9e+u3ufaEKvei7lTvqKbJkvVfWcYF8dEF26e5udtg8x11LC9ZjrKisx g==;
X-CSE-ConnectionGUID: k6Vvel11SQ2csoR7PlZ7Lw==
X-CSE-MsgGUID: uqVfK5QrRVeitScyMP9WRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86492636"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="86492636"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 19:57:20 -0700
X-CSE-ConnectionGUID: edjvg4V6T6OpXYUYQRHq4w==
X-CSE-MsgGUID: L4hvlvG4Qx6ijrzOrplhOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="261114603"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 19:57:18 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] lib/intel_fbc: Use display version for FBC max plane
 size
Date: Wed,  5 Aug 2026 08:24:53 +0530
Message-Id: <20260805025453.212016-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

FBC plane size restrictions are a display feature, so use
intel_display_ver() instead of graphics_ver. This fixes incorrect
size limits on platforms where display and graphics versions differ.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/i915/intel_fbc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index ad78ee2a31..1052dfcae5 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -201,8 +201,7 @@ static void intel_fbc_max_plane_size(igt_display_t *display, uint32_t *width, ui
 {
 	int fd = display->drm_fd;
 	const uint32_t dev_id = intel_get_drm_devid(fd);
-	const struct intel_device_info *info = intel_get_device_info(dev_id);
-	int ver = info->graphics_ver;
+	int ver = intel_display_ver(dev_id);
 
 	if (ver >= 30) {
 		*width = 6144;
-- 
2.34.1

