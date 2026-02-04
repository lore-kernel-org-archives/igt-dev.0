Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB47DE9D419
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F0A10E6FA;
	Wed,  4 Feb 2026 16:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVceQyGS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296E210E6F5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770224296; x=1801760296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PEzSZULCxVOoLD0BJD4JqAihMNscw0z6PKNSAydlBAs=;
 b=eVceQyGSJYHyDMAD9lwVnw1zYlKmv+ufVmgpRPIi23l0N1hoqAW2kUcZ
 ibtftASDtmJl32oxuWU27VbX+k60S4FAXwnXK+dci3DQectbcX04kv0eO
 EIg9s2LJLzoQ8lTYcTWIhhtY6CKRp+78dbXFUM8UvKGeg86a7uVTCIyuA
 TsVBDrIpu7vjAbW2Q0TtEHTxktuNCPVmjmoD0+0d+Dxdpwj+G2P+Q46um
 /gw5bWZCGHt8hf7OM1O0QBFwJOQqv164EZew9aeTDkklkEBBYtSwHu9pk
 SVQ/hDTRambkGzI8J8PnYhvA0THOilnZQ5bxGqCbxT8brD3D5ZRwVjXJ1 A==;
X-CSE-ConnectionGUID: 3gSytrFyQg24oPIFOdPslQ==
X-CSE-MsgGUID: /Jz9qxoJShWrIkKDNcC3Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71580109"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71580109"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:58:00 -0800
X-CSE-ConnectionGUID: 1X6JsDaBRXa1PNxtszFmpA==
X-CSE-MsgGUID: jndbzZWoQ4KnOX5qR3eVpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210253059"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:57:59 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v8 9/9] tests/kms_writeback: Use helper to fetch default
 FB format
Date: Wed,  4 Feb 2026 22:48:18 +0530
Message-ID: <20260204171819.292327-10-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204171819.292327-1-sowmiya.s@intel.com>
References: <20260204171819.292327-1-sowmiya.s@intel.com>
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

Replace remaining hardcoded formats with the default
formatr selected by the helper based on requested BPC.

v7: Refactor the commit message (Suraj)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 1892ddc47..a0656fddb 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -685,7 +685,7 @@ int igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		igt_skip_on(data.dump_check || data.list_modes);
 		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay / 2,
 				      mode.vdisplay / 2,
-				      DRM_FORMAT_XRGB8888,
+				      get_default_fb_format(&display, BPC_8),
 				      DRM_FORMAT_MOD_LINEAR,
 				      &invalid_output_fb);
 		igt_require(fb_id > 0);
-- 
2.43.0

