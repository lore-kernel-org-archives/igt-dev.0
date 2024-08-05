Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD092C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 14:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A6010E217;
	Mon,  5 Aug 2024 14:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQOIAVq0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D3610E217
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722868674; x=1754404674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zfrnJI+Zbf6udJM+dNBpluoqfZALh3/xDGOagXomLvk=;
 b=fQOIAVq0/f8sisbnqHEDluP+vhN5rHipw+EKp9L609IqZf7PBb06wVps
 4sX41RpGz9icSn7qUWEVMliUnPT+bSLjTDc5hJwAnLxqeMC6MzzdGe+rw
 EYRL1z1S+XAxx8TM947xivL2vFBRiGliPkOh04iApmZlalAFjzQxxFORA
 rRbNBD7FQkxCYIL6DeyYlnA2fTh4kruqHVYJ8xI5R8Uc9yetYtyawxP9Y
 1ebdWpObRU37K3lvVZbGvrEL1ubkC6C6uBtj60j4svGJqSQ80JkZCJdtV
 XoZaShX4DD7Co6L3BjukuiajlTEapwxVLNEP/TxUVIHolZOfVaCzTCj3T A==;
X-CSE-ConnectionGUID: JLuksbLMR8emyOIXJMyrIQ==
X-CSE-MsgGUID: 5LNG58LPSP2W4Qr5zrcD1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21012818"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="21012818"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:53 -0700
X-CSE-ConnectionGUID: KvK3rWfDRzaiDR2YPnezmg==
X-CSE-MsgGUID: lWIY8IjIRaKFoyJtuvdQEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="55862791"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.245.246])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:54 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 8/8] tests/core_hotunplug: Print info between steps
Date: Mon,  5 Aug 2024 16:37:11 +0200
Message-ID: <20240805143713.76034-9-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
References: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
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

There are some info printed directly into kernel dmesg before
subtest steps. Turn comment before steps into direct prints
to stdout to help differentiate which steps where a success
and where it starts failing.

Fixed also one misspelling s/realoading/reloading/

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_hotunplug.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 51edee985..415c74381 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -184,12 +184,13 @@ static void prepare(struct hotunplug *priv)
 	igt_assert_fd(priv->fd.sysfs_bus);
 
 	priv->fd.sysfs_dev = close_sysfs(priv->fd.sysfs_dev);
+	igt_info("Preparations done\n");
 }
 
-/* Unbind the driver from the device */
 static void driver_unbind(struct hotunplug *priv, const char *prefix,
 			  int timeout)
 {
+	igt_info("Unbind the driver from the device (bus: %s)\n", priv->dev_bus_addr);
 	/*
 	 * FIXME: on some devices, the audio driver (snd_hda_intel)
 	 * binds into the i915 driver. On such hardware, kernel warnings
@@ -216,11 +217,13 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix,
 
 	igt_assert_f(faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr, F_OK, 0),
 		     "Unbound device still present (%s)\n", priv->dev_bus_addr);
+
+	igt_info("Unbind done\n");
 }
 
-/* Re-bind the driver to the device */
 static void driver_bind(struct hotunplug *priv, int timeout)
 {
+	igt_info("Re-bind the driver to the device (bus: %s)\n", priv->dev_bus_addr);
 	local_debug("%s\n", "rebinding the driver to the device");
 	priv->failure = "Driver re-bind failure!";
 
@@ -235,17 +238,19 @@ static void driver_bind(struct hotunplug *priv, int timeout)
 		      "Rebound device not present (%s)!\n", priv->dev_bus_addr);
 
 	if (priv->snd_driver) {
-		igt_info("Realoading %s\n", priv->snd_driver);
+		igt_info("Reloading %s\n", priv->snd_driver);
 		igt_kmod_load(priv->snd_driver, NULL);
 		free(priv->snd_driver);
 		priv->snd_driver = NULL;
 	}
+
+	igt_info("Re-bind done\n");
 }
 
-/* Remove (virtually unplug) the device from its bus */
 static void device_unplug(struct hotunplug *priv, const char *prefix,
 			  int timeout)
 {
+	igt_info("Remove (virtually unplug) the device from its bus (%s)\n", priv->dev_bus_addr);
 	igt_require(priv->fd.sysfs_dev == -1);
 
 	/*
@@ -267,7 +272,8 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
 				    O_DIRECTORY);
 	igt_assert_fd(priv->fd.sysfs_dev);
 
-	local_debug("%sunplugging the device\n", prefix);
+	igt_info("%sunplugging the device %s\n", prefix, priv->dev_bus_addr);
+	local_debug("%sunplugging the device %s\n", prefix, priv->dev_bus_addr);
 	priv->failure = "Device unplug failure!";
 
 	igt_set_timeout(timeout, "Device unplug timeout!");
@@ -280,11 +286,13 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
 
 	igt_assert_f(faccessat(priv->fd.sysfs_bus, priv->dev_bus_addr, F_OK, 0),
 		     "Unplugged device still present (%s)\n", priv->dev_bus_addr);
+
+	igt_info("Unplug done\n");
 }
 
-/* Re-discover the device by rescanning its bus */
 static void bus_rescan(struct hotunplug *priv, int timeout)
 {
+	igt_info("Re-discover the device by rescanning its bus (%s)\n", priv->dev_bus_addr);
 	local_debug("%s\n", "rediscovering the device");
 	priv->failure = "Bus rescan failure!";
 
@@ -303,6 +311,8 @@ static void bus_rescan(struct hotunplug *priv, int timeout)
 		free(priv->snd_driver);
 		priv->snd_driver = NULL;
 	}
+
+	igt_info("Bus rescan done\n");
 }
 
 static void cleanup(struct hotunplug *priv)
@@ -317,6 +327,7 @@ static void cleanup(struct hotunplug *priv)
 	}
 
 	priv->fd.sysfs_dev = close_sysfs(priv->fd.sysfs_dev);
+	igt_info("Cleanup done\n");
 }
 
 static bool local_i915_is_wedged(int i915)
@@ -498,6 +509,8 @@ static bool healthcheck(struct hotunplug *priv, bool recover)
 		node_healthcheck(priv,
 				 FLAG_RENDER | (recover ? FLAG_RECOVER : 0));
 
+	igt_info("Healthcheck: %s\n", priv->failure ? "failed" : "ok");
+
 	return !priv->failure;
 }
 
@@ -532,6 +545,7 @@ static void recover(struct hotunplug *priv)
 	else if (faccessat(priv->fd.sysfs_drv, priv->dev_bus_addr, F_OK, 0))
 		driver_bind(priv, 60);
 
+	igt_info("Recovery: %s\n", priv->failure ? "failed" : "ok");
 	if (priv->failure)
 		igt_assert_f(healthcheck(priv, true), "%s\n", priv->failure);
 }
-- 
2.43.0

