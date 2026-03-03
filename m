Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879BBEDEBF5
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 22:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BB710E08D;
	Tue,  3 Mar 2026 22:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMTjZZBK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B796010E08D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 22:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772578575; x=1804114575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6S5cFcwgbSerB7a0ZkM6jRg2fbrv1r/x7sHu/Gj/SoU=;
 b=bMTjZZBK0cdos33CYJC6wuIukRHaFyscmYgkmFuFjce5NUTK42/Tv0ir
 eBowfAEVsvjIPloFwuGWCA/rx00Z6WaLWvdzEOS06yxXcSQrWzLfTCY01
 mbWZkRszupiR409CdfeQHxjzSYFGVW/hi25TTs1t4GlSDbNN0KJORBq4D
 vMKAMkdcxaEnpXYUN8FmUe0hllBRpdG5ta4up8/waCoL4O5rYeJ3+C1Ng
 gmzEcgEEIa+9zOdxThufs7YamrLj8pJL+rWKWUWVyN3293g3nTtcY9GcM
 xQuTk3EJ/bv+WkXpR+6eVl0cTNUY6aSYUXJo5pe7zL9SK5Np02kPcaTZz g==;
X-CSE-ConnectionGUID: fS1FzeHwSlCY8BK3QmAkLg==
X-CSE-MsgGUID: 8MRaJX3fSyS5tjD0OAmL3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73680634"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73680634"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 14:56:14 -0800
X-CSE-ConnectionGUID: vx8ytHeJQBe6/+Ui5ph5Aw==
X-CSE-MsgGUID: CKVChoy6TUGxmdeMvbQPjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217306660"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 14:56:14 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, stuart.summers@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [i-g-t] tests/core_hotunplug: Open render capable DRM device
Date: Wed,  4 Mar 2026 06:53:32 +0800
Message-ID: <9e4d3126426686f9fde73011753ca1e85a32dd0d.1772578021.git.jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.53.0
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

The test may select simpledrm when opening DRIVER_ANY,
which does not expose a render node. This causes the
later render open to fail.

Open a render capable device initially using
__drm_open_driver_render(DRIVER_ANY) to avoid
selecting simpledrm.

Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/core_hotunplug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7c9dae1bf..3a612fce2 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -696,8 +696,8 @@ int igt_main()
 		int fd_drm;
 		char driver[32] = {};
 
-		fd_drm = __drm_open_driver(DRIVER_ANY);
-		igt_skip_on_f(fd_drm < 0, "No known DRM device found\n");
+		fd_drm = __drm_open_driver_render(DRIVER_ANY);
+		igt_skip_on_f(fd_drm < 0, "No known DRM render device found\n");
 
 		priv.chipset = drm_get_chipset(fd_drm);
 		/* Make sure it opens the same driver */
-- 
2.52.0

