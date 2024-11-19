Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2457DD591A5
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 05:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E2610E5B1;
	Tue, 19 Nov 2024 05:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyEJT06Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2FC10E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 05:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731994825; x=1763530825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b8fV9jq9q3geHflXaL0P4tGzb8z4Qb8MEbiMwNb9evk=;
 b=YyEJT06Zvl0xzHKh0Z0YQKQXKUULBXY2C5ris3KUq+fMfzzfzD49v3KV
 Zg7VlI+9yEaWrGQqezOBnsmwELKCa1raQmkydh2WrC35uOUvNYrybuOgS
 3xpgAdjPqrUcj4qETO1LCp+bUN1pN0Ts9OUkof619f25oGJHtf2TR6Ub+
 5G7rdM/gUmOsuZpM/48UsKkqGq2oyyMANKJ6mW4WHOAbg0T0rpEL8o8bZ
 aouYo0nBhg9zlKyLXiOLsCEYnZk8++SiFEdwc7UCzM2OJe3hSQ4grWLcl
 X6+I3NwKeYRyZ8GvRgfod1n8TtwVdzEXX7PVVpkPoVEANVSV3Yj7iQ1Pm A==;
X-CSE-ConnectionGUID: fjiZBLnAQAWrxZLDMhFz+w==
X-CSE-MsgGUID: /6NF2Ll7Tea5EHfnBZDQJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19588155"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="19588155"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
X-CSE-ConnectionGUID: 1q/JUK+cQQ+Q7PsHG/JYXA==
X-CSE-MsgGUID: Up0794nwTYKLSOnMwb+l5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89222417"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 21:40:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [CI 5/9] tests/core_hotunplug: Stop unloading audio
Date: Mon, 18 Nov 2024 21:40:04 -0800
Message-ID: <20241119054008.2001984-5-lucas.demarchi@intel.com>
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
from the driver. On a DG2 system which has pipewire running,
igt@core_hotunplug@unbind-rebind passes without this patch, but takes
~26sec and a dmesg full of warnings related to audio. After this patch
it took 4.7sec and apparently 1 unrelated warning about
"Unclaimed read from register 0xc4000" when rebinding.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
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

