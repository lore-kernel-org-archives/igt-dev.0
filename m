Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DB210854B4
	for <igt-dev@archiver.kernel.org>; Sun, 15 Mar 2026 00:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A6E10E1FC;
	Sun, 15 Mar 2026 00:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQqvF0Kc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E9C10E1FC
 for <igt-dev@lists.freedesktop.org>; Sun, 15 Mar 2026 00:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773535112; x=1805071112;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GGtAM6YIgBorCONTcuSJzB66lYEjWC6cy3JNAn2FFls=;
 b=OQqvF0KcRXvcyIOc57FdD5dE00RbSvQkRs9zr4UwHXxeBXqMJlAo3WMB
 EAbYCw+0ApHEU4Nrz4P5bx05hxHSoLwP2Lpuch/cdxpot118bodlOQafa
 i4ZQf6qTSt1Xh86SIuRUSvW5ykzExfM6Ai7yLAWN2Xz8yswaP1OxHfJJ9
 EqKOLjNd1KYcA2QzD6dP7id8trU+DaVfeN6+L0uDxevXPgEsrzVggZkZn
 GmMIMel0cZ/KGIrMO5EcxGZFSDnh3nFedg+6pyxTD4kn1CH1sAyD+IZ7+
 DaCxOCLk2nnGHxia9bOMjxfPQU8ry96LOT5M1brHXoMnQ8lAnSPx4bViR A==;
X-CSE-ConnectionGUID: vuayHdRXTG6gfVlG0VYiwg==
X-CSE-MsgGUID: ojeIZn/oQDuUbgkK9n3LSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="74632784"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; d="scan'208";a="74632784"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2026 17:38:32 -0700
X-CSE-ConnectionGUID: 5HCdLGEvTwqib0d+B0PsaA==
X-CSE-MsgGUID: /ZlBO6p0Rem1Ey81qINOtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; d="scan'208";a="225648740"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa003.jf.intel.com with ESMTP; 14 Mar 2026 17:38:31 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t 1/2] tests/device_reset: unload audio before descriptor
 closure
Date: Sun, 15 Mar 2026 01:38:25 +0100
Message-ID: <20260315003826.3785048-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Currently check for audio unloading is done after driver's file
descriptor has been closed. This renders is_i915_device() useless since
check bases on the descriptor passed. Move the check before closing the
descriptor.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/device_reset.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 62b295a06e..b931dff7a0 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -345,9 +345,6 @@ static bool has_cold_reset(int slot_dir, const char **reason)
 /* Unbind the driver from the device */
 static void driver_unbind(struct device_fds *dev)
 {
-	if (is_i915_device(dev->fds.dev))
-		igt_audio_driver_unload(&dev->snd_driver);
-
 	igt_debug("unbind the driver from the device\n");
 	igt_assert(igt_sysfs_set(dev->fds.drv_dir, "unbind",
 		   dev->dev_bus_addr));
@@ -429,6 +426,10 @@ static void set_device_filter(const char* dev_path)
 
 static void unbind_reset_rebind(struct device_fds *dev, enum reset type)
 {
+	if (is_i915_device(dev->fds.dev)) {
+		igt_audio_driver_unload(&dev->snd_driver);
+	}
+
 	igt_debug("close the device\n");
 	close_if_opened(&dev->fds.dev);
 
-- 
2.45.2

