Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E798D591C4
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049DE10E5B9;
	Tue, 19 Nov 2024 05:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZeYKf5bI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D8F10E143
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994825; x=1763530825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ff1gaRPNwcH2X4/CaeNM1B7uuIO3FLetJrED35pvTD8=;
 b=ZeYKf5bIkjh008TTiFFjPm6MS5xCscX5dMUj6BSOvvyx/gm/O5QoWrrP
 enxdqz8M1Y88YvDuLyL56bU018Z3wluIJnZojawdYBLrNOO+X99YL+fCl
 RC8uxkJ5oxJsmImwCf3GN58wXs3JC4VKlTqjaRQjDiY9wYjd2qYMLGETz
 7tfT3yyBBRVsxWo6hCS95j85W8uIS0ZxW3/+ArNxg9TfBgtQOE+ExcL2g
 xAsd9yXBVSpoFWflfdYrcmCjuj3pmlSIRtWqbyzRoaldsoHc9A7DFFawn
 whdGCkdCmjFKo4vOZAT1FzxjNCi/ZugqovGT7lmXze2f7aOtsDU3MuSVP Q==;
X-CSE-ConnectionGUID: vIOFqFaXRVCui1rTIyckaQ==
X-CSE-MsgGUID: 5oD/zSagRpuoAkT79oBsMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19588156"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="19588156"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
X-CSE-ConnectionGUID: ihKqiSU2Sr++sm5DncmMig==
X-CSE-MsgGUID: u42f7gX4RGeq/ddyNG60Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89222420"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [CI 6/9] tests/device_reset: Stop unloading audio
Date: Mon, 18 Nov 2024 21:40:05 -0800
Message-ID: <20241119054008.2001984-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119054008.2001984-1-lucas.demarchi@intel.com>
References: <20241119054008.2001984-1-lucas.demarchi@intel.com>
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

Not needed anymore and test should succeed when unbinding the device
from the driver.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/device_reset.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 40681931c..668ba8526 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -64,7 +64,6 @@ struct device_fds {
 		int slot_dir; /* pci hotplug slots fd */
 	} fds;
 	char dev_bus_addr[DEV_BUS_ADDR_LEN];
-	char *snd_driver;
 };
 
 static int __open_sysfs_dir(int fd, const char* path)
@@ -345,9 +344,6 @@ static bool has_cold_reset(int slot_dir, const char **reason)
 /* Unbind the driver from the device */
 static void driver_unbind(struct device_fds *dev)
 {
-	if (is_i915_device(dev->fds.dev))
-		igt_audio_driver_unload(&dev->snd_driver);
-
 	igt_debug("unbind the driver from the device\n");
 	igt_assert(igt_sysfs_set(dev->fds.drv_dir, "unbind",
 		   dev->dev_bus_addr));
@@ -359,9 +355,6 @@ static void driver_bind(struct device_fds *dev)
 	igt_debug("rebind the driver to the device\n");
 	igt_abort_on_f(!igt_sysfs_set(dev->fds.drv_dir, "bind",
 		       dev->dev_bus_addr), "driver rebind failed");
-
-	if (dev->snd_driver)
-		igt_kmod_load(dev->snd_driver, NULL);
 }
 
 /* Initiate device reset */
-- 
2.47.0

