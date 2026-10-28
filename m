Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F367606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 06:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cRrxKiJ0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0532810E556;
	Wed, 28 Oct 2026 06:27:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845B710F9DB
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 06:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793168719; x=1824704719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KVXUXjiDcA9o4lnPDQy2QL3X2lCTb3HdOsw2J1AHhf8=;
 b=cRrxKiJ0FCMYnr3Ww4vmB/S4POOLyra39Gn6UNixq6oYDkkleUj5M76m
 sQiawVmY6XK50w/I4A/1Tu4nrlGEeUeGjN4XzgO7t880ZwrbVBchWxlP5
 /eSWftGKpDeL5jJzyMOrLPT59H6jCRErcR7VaUWj80tJVGqB5E5AXEsvz
 GReIsZ1cDA63TjhdGq4bKV3ZfkGW7l9Xv+v+Pxg1OIq15r+5zAhnb21qw
 Waqtp3qARZzyb3ivBcAyMMcqZeEjYjgow1tz53Q2fpc3qP2lkPohpb99N
 T3oZihE0MNHKD/QnU69RxRKIIYZEg7edI2YhnphT/4UzUGuXcMeDKRYe/ Q==;
X-CSE-ConnectionGUID: tONAIKz9Q625eG1/Hhj9+Q==
X-CSE-MsgGUID: mbC67dmrRFeS/PeRUn/Nqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1911632"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1911632"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 23:25:19 -0700
X-CSE-ConnectionGUID: TIsSe8b+TD+uPS2FNs0QrQ==
X-CSE-MsgGUID: zcdTEkp8QriqOvLRnuClRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5270341"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 27 Oct 2026 23:25:17 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Sk Anirban <sk.anirban@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/intel/xe_survivability: Reload audio
 driver on exit
Date: Wed, 28 Oct 2026 11:32:02 +0530
Message-ID: <20261028060202.2968778-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261028060202.2968778-1-chaitanya.kumar.borah@intel.com>
References: <20261028060202.2968778-1-chaitanya.kumar.borah@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

v2:
- Add Fixes tag (Pranay)
- Use the new igt_audio_driver_load() helper (Dnyaneshwar)

Cc: Sk Anirban <sk.anirban@intel.com>
Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Fixes: 117e9ecbdd1d ("xe/igt_kmod_unbind: release audio before unbinding xe")

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/intel/xe_survivability.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index bae9eca27..41d85bcea 100644
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
@@ -167,11 +168,13 @@ static void restore(int sig)
 	close(configfs_fd);
 
 	igt_kmod_bind("xe", bus_addr);
+
+	igt_audio_driver_load(&snd_driver);
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

