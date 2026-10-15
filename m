Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C76BCC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 14:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EC310E5D7;
	Thu, 15 Oct 2026 14:25:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D9910EA14
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 14:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792074236; x=1823610236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yEZcXSP4ll6FLazmgxTHmPfOeA1ypcTbbP9h6ae9IVY=;
 b=iPei7EsrNEaNB4sOnxrXxZJZpEqVM+4wO0Pz2PS+tvPkCjVVFuu/HsrI
 ZjBWWZcAdVpHRh/y+LFYnXV6MVOK2AdZh8DJxSWa/zayUBM4+ELwPvdgm
 WgDlZ+4PRdqCCXxzK7Z0Kv5npe7R0bnaofMrBvVPOshie4YqdwTUap0o6
 /Yn75fwSoBcJIdgY9StbId24L3ceRj0IbDV6apu+otpaTh3PoYkaFqpo+
 H6MxwcEzYUP3DVY5B/ppgYhQDcgrEHb+GKMJDPNFYNK13FaloLFwn9O1Q
 5qDLk75vzG9BvkaNuMh+C9eEpIr/bAYL+/62RiNPZ+8kKGeKhlUMeade7 Q==;
X-CSE-ConnectionGUID: ozLE6E1TQvi097fjYrd+Cw==
X-CSE-MsgGUID: PIwTC1ZTSq2UcsQyWnHt4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="831679"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="831679"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 07:23:56 -0700
X-CSE-ConnectionGUID: v3rUU4EKSBSyXY5yZlcszA==
X-CSE-MsgGUID: RaK3yatRRDyJNTGfUBseWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1618034"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa008.jf.intel.com with ESMTP; 15 Oct 2026 07:23:55 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Sk Anirban <sk.anirban@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_survivability: Reload audio driver
 on exit
Date: Thu, 15 Oct 2026 19:30:35 +0530
Message-ID: <20261015140035.2686997-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261015140035.2686997-1-chaitanya.kumar.borah@intel.com>
References: <20261015140035.2686997-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Commit 117e9ecbdd1d ("xe/igt_kmod_unbind: release audio before
unbinding xe") made igt_audio_driver_unload() be called before
unbinding xe to avoid the audio-component bind warnings/errors that
happen if xe is unbound while snd_hda_intel is still attached. Both
call sites in this file passed NULL for the unloaded driver name, so
it was never tracked, and nothing ever reloaded it afterwards.

As a result snd_hda_intel/snd_hdmi_lpe_audio is left unloaded for the
rest of the boot even when every subtest passes, since xe always ends
up rebound by restore() but audio never does.

Capture the unloaded driver name and reload it wherever xe gets bound
again in restore().

Cc: Sk Anirban <sk.anirban@intel.com>
Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/intel/xe_survivability.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index bae9eca27..2be8e9ec0 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -39,6 +39,7 @@
  */
 
 static char bus_addr[NAME_MAX];
+static char *snd_driver;
 
 static void ignore_wedged_in_dmesg(void)
 {
@@ -158,7 +159,7 @@ static void restore(int sig)
 {
 	int configfs_fd;
 
-	igt_audio_driver_unload(NULL);
+	igt_audio_driver_unload(&snd_driver);
 	igt_kmod_unbind("xe", bus_addr);
 
 	configfs_fd = igt_configfs_open("xe");
@@ -167,11 +168,17 @@ static void restore(int sig)
 	close(configfs_fd);
 
 	igt_kmod_bind("xe", bus_addr);
+
+	if (snd_driver) {
+		igt_kmod_load(snd_driver, NULL);
+		free(snd_driver);
+		snd_driver = NULL;
+	}
 }
 
 static void set_survivability_mode(int configfs_device_fd, bool value)
 {
-	igt_audio_driver_unload(NULL);
+	igt_audio_driver_unload(&snd_driver);
 	igt_kmod_unbind("xe", bus_addr);
 	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
 	igt_kmod_bind("xe", bus_addr);
-- 
2.50.1

