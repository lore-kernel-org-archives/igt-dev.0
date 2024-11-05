Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840E9D1CA3B
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 06:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E638B10E51C;
	Tue,  5 Nov 2024 06:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LS5X328Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B81910E520
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730787557; x=1762323557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/4ECHlrfPl3MWOVBALplkLHUUtzXAiuDlmeX1Eyp0AA=;
 b=LS5X328Qi7+HxtvLIdwW6Q7P6rBFpm7z9qPal3rgJ6/jkAknuEs6c5ZG
 rn87kF8VSMS6nbvVwzDJJc/9LGno08xtzA8juZEMQVlUWzxLunaqmlcNg
 h5IylZIoGCass+F7UNTTmmAYsMsaVlUQpVjcrXKTwaBN04EkAQ+MrGR6G
 dgam+0iZyf6w5xEkXTctj20AOXgRCopqjNx3EM6Od5tcy0btVUferWaO5
 WajFotZYdie80JwvCnsHbyCsJ0ui0aTTy5Ehi0O3aiEWqHpswKpTxVM0a
 XujXs1AR/x+rNorThrMCBw/HYAgZcLdb2TnT0qOXQdLK8I6RO6GKha1gj Q==;
X-CSE-ConnectionGUID: suP8izdwR2OmoASsCChwXg==
X-CSE-MsgGUID: KWvdFTYGSsygQso9O5jOOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18133569"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="18133569"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
X-CSE-ConnectionGUID: 8UzEEpgrTdWSmMQsVgJbLQ==
X-CSE-MsgGUID: FtyyiaeOSZW1s38gWW1dVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83781737"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 6/9] tests/device_reset: Stop unloading audio
Date: Mon,  4 Nov 2024 22:18:42 -0800
Message-ID: <20241105061845.2486557-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105061845.2486557-1-lucas.demarchi@intel.com>
References: <20241105061845.2486557-1-lucas.demarchi@intel.com>
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

