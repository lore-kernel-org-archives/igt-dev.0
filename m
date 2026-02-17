Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B596E83856
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 06:08:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B7E10E441;
	Tue, 17 Feb 2026 06:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtLpE8fF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD7010E441
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 06:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771308495; x=1802844495;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6ecWORMtTf98hIhKEBtlCvdte3I0MrcfIcTqwy/IFVQ=;
 b=JtLpE8fFCHlaA3K/TEHJWHiIKi02rAudnJr/gh9p8X69tRTQF54lAlGN
 lbMFyyj5kCM7XiFpk0Ee0+6ot5t3V4vdlz4gTpPiLtRT45ZrGjMZsx49Z
 5NhRB63LFHzasU8XOFNXM0hDRWcCqujV4xoUr/eBT+9nceX8pQgOARJlZ
 kMue2ZVXFmSJjCmKGNhrRVPIumednWNPuYIqegKOUkQWRSvVkWUxj+b6E
 E0XmLYEOWqKA3eLj87xks0whx4tSo9VRYx7Hfvf3jFIY3e3SNg49CLwZV
 CkpFvAdq2fmrSG4LchqqgfKMQElIYUu32lNfOBvW+aBXlMkUxIh4dD+6f Q==;
X-CSE-ConnectionGUID: RkYvyCjTS4+xctl6fpWntg==
X-CSE-MsgGUID: Ep9UYlWtRvSfYLCgN7fr3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="76226888"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="76226888"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 22:08:15 -0800
X-CSE-ConnectionGUID: 81dx7nEsSQ+HnR1KoaZyLg==
X-CSE-MsgGUID: U8U8D1CqRoGBSlSustxXzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="213890195"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 22:08:14 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_rotation_crc: Add vblank wait for multiplane
 rotation synchronization
Date: Tue, 17 Feb 2026 11:38:25 +0530
Message-ID: <20260217060825.517098-1-jeevan.b@intel.com>
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

Add explicit vblank wait after atomic commit in test_multi_plane_rotation()
to ensure both planes are fully synchronized before CRC capture. This fixes
sporadic CRC mismatches observed on CI.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6946
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_rotation_crc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 8721a8311..93e5c3e91 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1032,6 +1032,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 							continue;
 
 						igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+						igt_wait_for_vblank(crtc);
 						fliphw = kmstest_get_vblank(data->gfx_fd,
 									    crtc->pipe,
 									    0) + 1;
-- 
2.43.0

