Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16340E6E7FC
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 10:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CD710E603;
	Tue,  3 Feb 2026 10:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Saj9Mksg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BDB10E603
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 10:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770115598; x=1801651598;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d2ilyRq+C4zp3Vvv7xUc01W9tE4P02hb2OgR6U4aDx0=;
 b=Saj9MksgSx9XpnjVPaD0AFdQfsGHjmD29QObl2l8eI9qspteLDJgyUym
 AHPK+wI4G3ZdgJ+tyYbECVq+UCigv/Y5a5gxQtQNbFu5FM0Pzh8KQ+IQS
 VnK4gOV8pKekC5gksBbSrNWFdepIez0F/yd+Dc0rQD8Wd6skYgW/WY/IU
 lDxipUBNUZYy3DmYYb2KlQCNE3voVZhV+u3SgtgFQ9UKQGhsmAeGtcJIP
 98J8tSWzNWgzvQUQGSEfbQuYa+XoDJvGTsZlXPDcyvUMVvXr7vKf7/Xiz
 utM7YkfQ+inI3Xd/NpD+7He9/+8gsqCrj2QtNbZifLUAfes3jRSfuMrDn g==;
X-CSE-ConnectionGUID: +tSzKktPSGuhRKUhxXl1mg==
X-CSE-MsgGUID: u26yyYNnTjeb/68u78H73A==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71182060"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="71182060"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 02:46:37 -0800
X-CSE-ConnectionGUID: pRO88+u+S8KxfyenBr6baQ==
X-CSE-MsgGUID: /3NKvS3LSniJjz1j96X6FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="232731003"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.93])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 02:46:35 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t] tests/core_hotunplug: Skip unplug when sysfs 'remove'
 is missing
Date: Tue,  3 Feb 2026 11:46:29 +0100
Message-ID: <20260203104629.56005-1-marcin.bernatowicz@linux.intel.com>
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

Some PCI devices don't expose the sysfs remove attribute. The unplug/rescan
paths in core_hotunplug rely on writing 1 to remove, so attempting those
subtests would fail, skip the test early when remove is not present.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/core_hotunplug.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index e23b5b89f..7c9dae1bf 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -245,6 +245,17 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
 {
 	igt_require(priv->fd.sysfs_dev == -1);
 
+	priv->fd.sysfs_dev = openat(priv->fd.sysfs_bus, priv->dev_bus_addr,
+				    O_DIRECTORY);
+	igt_assert_fd(priv->fd.sysfs_dev);
+
+	if (!igt_sysfs_has_attr(priv->fd.sysfs_dev, "remove")) {
+		priv->fd.sysfs_dev = close_sysfs(priv->fd.sysfs_dev);
+		igt_assert_eq(priv->fd.sysfs_dev, -1);
+		igt_skip("PCI %s has no sysfs 'remove' attribute, skipping test\n",
+			 priv->dev_bus_addr);
+	}
+
 	/*
 	 * FIXME: on some devices, the audio driver (snd_hda_intel)
 	 * binds into the i915 driver. On such hardware, kernel warnings
@@ -254,16 +265,14 @@ static void device_unplug(struct hotunplug *priv, const char *prefix,
 	 * unbind i915 driver, reloading it when binding again.
 	 */
 	if (igt_audio_driver_unload(&priv->snd_driver)) {
+		priv->fd.sysfs_dev = close_sysfs(priv->fd.sysfs_dev);
+		igt_assert_eq(priv->fd.sysfs_dev, -1);
 		igt_skip("Audio driver %s in use, skipping test\n",
 			 priv->snd_driver);
 	} else if (priv->snd_driver) {
 		igt_info("Unloaded audio driver %s\n", priv->snd_driver);
 	}
 
-	priv->fd.sysfs_dev = openat(priv->fd.sysfs_bus, priv->dev_bus_addr,
-				    O_DIRECTORY);
-	igt_assert_fd(priv->fd.sysfs_dev);
-
 	local_debug("%sunplugging the device\n", prefix);
 	priv->failure = "Device unplug failure!";
 
-- 
2.43.0

