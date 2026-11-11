Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A74C606A321
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 12:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iutKLY0R
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73D010FB45;
	Wed, 11 Nov 2026 12:12:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F408C10FA44
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 12:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794398951; x=1825934951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SD5RV6r0Sk8Fgg5gVsjcRIvVnDqCD1VbJV60sM/uY/8=;
 b=iutKLY0RtaJDfMv2Rw5EDLF157TNTFPinkqFjrg89OhdIM3+5fQMKxv+
 XqbQrHE0+Au8ZMwLvBiRQuQfw75i5LpV/JFu3cAGaKAEWZ5f5Y89tQ4Th
 KJn1eLrxWd56z6IP8awfWsMkO7yQPiu79elLPvNIa/T+H9ygq3ycFv3D4
 kwuivuwO0cw0kG8MEx0Go3HOpp4bbt4qBb1kAG37PrGsZrfq9P6OuDc7P
 NKkZJp8DUPQzVeVwki1eHrsMWxDKj1Vlmo4cbfuTRuMhD1f/vZN2MUwR2
 nJSaXbVJThb90oDfTnGIcPFscm3kNHYJBBxodmChhexrQMIzbYvsVzy4G g==;
X-CSE-ConnectionGUID: HcN3LoG3T8qHHVqYwjHJjg==
X-CSE-MsgGUID: p1Ua6StbRbCMr+w9pOOitw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3212759"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3212759"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 04:09:11 -0800
X-CSE-ConnectionGUID: 84OYOfkJSyyru/3/3x+FNQ==
X-CSE-MsgGUID: L8a9V9MsROut5XovFNjxig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8323977"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa007.jf.intel.com with ESMTP; 11 Nov 2026 04:09:09 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Sk Anirban <sk.anirban@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 Pranay Samala <pranay.samala@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH i-g-t v3 3/3] tests/intel/xe_survivability: Reload audio
 driver on exit
Date: Wed, 11 Nov 2026 17:16:00 +0530
Message-ID: <20261111114600.4104768-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261111114600.4104768-1-chaitanya.kumar.borah@intel.com>
References: <20261111114600.4104768-1-chaitanya.kumar.borah@intel.com>
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

v3:
- Free snd_driver explicitly after igt_audio_driver_load(), which
  no longer frees it itself (Dnyaneshwar)

Cc: Sk Anirban <sk.anirban@intel.com>
Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Pranay Samala <pranay.samala@intel.com>
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Fixes: 117e9ecbdd1d ("xe/igt_kmod_unbind: release audio before unbinding xe")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/intel/xe_survivability.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 015b22051..6d5423be7 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -39,6 +39,7 @@
  */
 
 static char bus_addr[NAME_MAX];
+static char *snd_driver;
 
 static bool configfs_group_preexisting;
 
@@ -160,7 +161,7 @@ static void restore(int sig)
 {
 	int configfs_fd;
 
-	igt_audio_driver_unload(NULL);
+	igt_audio_driver_unload(&snd_driver);
 	igt_kmod_unbind("xe", bus_addr);
 
 	configfs_fd = igt_configfs_open("xe");
@@ -169,11 +170,15 @@ static void restore(int sig)
 	close(configfs_fd);
 
 	igt_kmod_bind("xe", bus_addr);
+
+	igt_audio_driver_load(&snd_driver);
+	free(snd_driver);
+	snd_driver = NULL;
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

