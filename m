Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99AAD1CA3C
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 06:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD9210E528;
	Tue,  5 Nov 2024 06:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPQXZFFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB0A10E523
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730787557; x=1762323557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+CrPpHaJ4N5Hwjz4GFhj7pHhYfIizcL0gkVEeTqyTz4=;
 b=mPQXZFFxogsdtDFtpZRB8eY55JfJLOd1KdnPHc0X8AKGEcYaZr1KnEDM
 UAfRyyWO3GCR/y91jQ6bezZFBmO8AdlO5i4sfYkVY33INnA2fZVsw8tOG
 qbo73wF4LQXC4Q4V5OUbB/YU6DT/c3G5QfX4p7B3BTBDGQaUb1imsz+Z1
 5NhGSoSrLTnE+P944DZGip2AXAmysjybRmoAkgoGDB4cMlQ5BrZN4HWaO
 tTLupmg3GUk/xjl5naeu1jMQZIIWG2tlgjrlNtYWj/58YpJ57C4DHCcwW
 F/JSSO6P/Dz1zaZVFD4ukZLDuFfAIUjsC1TQgVgbH9LHt/LddW1coDwzz w==;
X-CSE-ConnectionGUID: 6WPx763cRSSZq3qsc14KfQ==
X-CSE-MsgGUID: AGbsb2oiQQ2c0pyNKiZJug==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="18133568"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="18133568"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
X-CSE-ConnectionGUID: iAprCEHZTKu7Ip6sPk9aJQ==
X-CSE-MsgGUID: kPy0i/4sR8+Ors3ffV8sYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83781734"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:19:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 5/9] tests/core_hotunplug: Stop unloading audio
Date: Mon,  4 Nov 2024 22:18:41 -0800
Message-ID: <20241105061845.2486557-6-lucas.demarchi@intel.com>
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
from the driver. On a DG2 system which has pipewire running,
igt@core_hotunplug@unbind-rebind passes without this patch, but takes
~26sec and a dmesg full of warnings related to audio. After this patch
it took 4.7sec and apparently 1 unrelated warning about
"Unclaimed read from register 0xc4000" when rebinding.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/core_hotunplug.c | 46 ------------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7f17f4423..07a8dea37 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -96,7 +96,6 @@ struct hotunplug {
 	const char *failure;
 	bool need_healthcheck;
 	bool has_intel_perf;
- 	char *snd_driver;
 	int chipset;
 };
 
@@ -187,21 +186,6 @@ static void prepare(struct hotunplug *priv)
 static void driver_unbind(struct hotunplug *priv, const char *prefix,
 			  int timeout)
 {
-	/*
-	 * FIXME: on some devices, the audio driver (snd_hda_intel)
-	 * binds into the i915 driver. On such hardware, kernel warnings
-	 * and errors may happen if i915 is unbind/removed before removing
-	 * first the audio driver.
-	 * So, add a logic that unloads the audio driver before trying to
-	 * unbind i915 driver, reloading it when binding again.
-	 */
-	if (igt_audio_driver_unload(&priv->snd_driver)) {
-		igt_skip("Audio driver %s in use, skipping test\n",
-			 priv->snd_driver);
-	} else if (priv->snd_driver) {
-		igt_info("Unloaded audio driver %s\n", priv->snd_driver);
-	}
-
 	local_debug("%sunbinding the driver from the device\n", prefix);
 	priv->failure = "Driver unbind failure!";
 
@@ -230,13 +214,6 @@ static void driver_bind(struct hotunplug *priv, int timeout)
 	igt_fail_on_f(faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr,
 				F_OK, 0),
 		      "Rebound device not present (%s)!\n", priv->dev_bus_addr);
-
-	if (priv->snd_driver) {
-		igt_info("Realoading %s\n", priv->snd_driver);
-		igt_kmod_load(priv->snd_driver, NULL);
-		free(priv->snd_driver);
-		priv->snd_driver = NULL;
-	}
 }
 
 /* Remove (virtually unplug) the device from its bus */
@@ -245,21 +222,6 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
 {
 	igt_require(priv->fd.sysfs_dev == -1);
 
-	/*
-	 * FIXME: on some devices, the audio driver (snd_hda_intel)
-	 * binds into the i915 driver. On such hardware, kernel warnings
-	 * and errors may happen if i915 is unbind/removed before removing
-	 * first the audio driver.
-	 * So, add a logic that unloads the audio driver before trying to
-	 * unbind i915 driver, reloading it when binding again.
-	 */
-	if (igt_audio_driver_unload(&priv->snd_driver)) {
-		igt_skip("Audio driver %s in use, skipping test\n",
-			 priv->snd_driver);
-	} else if (priv->snd_driver) {
-		igt_info("Unloaded audio driver %s\n", priv->snd_driver);
-	}
-
 	priv->fd.sysfs_dev = openat(priv->fd.sysfs_bus, priv->dev_bus_addr,
 				    O_DIRECTORY);
 	igt_assert_fd(priv->fd.sysfs_dev);
@@ -293,13 +255,6 @@ static void bus_rescan(struct hotunplug *priv, int timeout)
 	igt_fail_on_f(faccessat(priv->fd.sysfs_bus, priv->dev_bus_addr,
 				F_OK, 0),
 		      "Fakely unplugged device not rediscovered (%s)!\n", priv->dev_bus_addr);
-
-	if (priv->snd_driver) {
-		igt_info("Realoading %s\n", priv->snd_driver);
-		igt_kmod_load(priv->snd_driver, NULL);
-		free(priv->snd_driver);
-		priv->snd_driver = NULL;
-	}
 }
 
 static void cleanup(struct hotunplug *priv)
@@ -679,7 +634,6 @@ igt_main
 		.failure	= NULL,
 		.need_healthcheck = true,
 		.has_intel_perf = false,
-		.snd_driver	= NULL,
 		.chipset	= DRIVER_ANY,
 	};
 
-- 
2.47.0

