Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2552606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 06:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nrwl1io5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FEB10E556;
	Wed, 28 Oct 2026 06:27:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A055810F9D6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 06:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793168717; x=1824704717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AKen6JMU5t+UWCcFPe4TQe5zNFa5dxRXITrsQeS7+Ws=;
 b=nrwl1io5BJ2DKQRV/wEV6w/5JJ2X1qDCPoKatQqUBXGE8/j+4tufdvJ6
 r+GkrbfKtTb5KYXNA/tuAtRxpf90PHz8pmO8pntCIUANE/cFkcyaOnw9x
 1e50JY3KyHV388pWhaK10dWgZ1hsKQXU2e0IDmTobJvf9qkCeBodrDVJF
 pOmSEjUcVN1JJznQ7VM0QZkNakcMYN2piFUru34hqMhRwzDpVEygmWJeW
 gWyvzBvAWUj1gWIECbDQQU0i5ktEjJMokuqq+cAXDCk7C1G0kuwYqNkv+
 NNEvgs3lbs6mO3a1o6PunvnOvM9RCCo3Xdxz+M7MzMyxmrrrw8koV5vus Q==;
X-CSE-ConnectionGUID: t1LXzE6wSYiF6l9KN/BTMA==
X-CSE-MsgGUID: 1NO9ltkfRm2eEkQbPwG1Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1911630"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1911630"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 23:25:17 -0700
X-CSE-ConnectionGUID: IvnqVb75Rs6flBTb4jLSPg==
X-CSE-MsgGUID: 1b/EqUDvSiSiQgV2fpTaIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5270336"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 27 Oct 2026 23:25:15 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 Pranay Samala <pranay.samala@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH i-g-t v2 2/3] tests/intel/xe_configfs: Reload audio driver on
 exit
Date: Wed, 28 Oct 2026 11:32:01 +0530
Message-ID: <20261028060202.2968778-2-chaitanya.kumar.borah@intel.com>
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
happen if xe is unbound while snd_hda_intel is still attached. All
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

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Pranay Samala <pranay.samala@intel.com>
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Fixes: 117e9ecbdd1d ("xe/igt_kmod_unbind: release audio before unbinding xe")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/intel/xe_configfs.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 450c0a119..1b881507c 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -25,6 +25,7 @@
 
 static char bus_addr[NAME_MAX];
 static struct pci_device *pci_dev;
+static char *snd_driver;
 
 static bool check_registers(const uint32_t reg[], const uint32_t val[],
 			    size_t max)
@@ -55,7 +56,7 @@ static void restore(int sig)
 {
 	int configfs_fd;
 
-	igt_audio_driver_unload(NULL);
+	igt_audio_driver_unload(&snd_driver);
 	igt_kmod_unbind("xe", bus_addr);
 
 	/* Drop all custom configfs settings from subtests */
@@ -66,11 +67,13 @@ static void restore(int sig)
 
 	/* Bind again a clean driver with no custom settings */
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
@@ -115,7 +118,7 @@ static void test_engines_allowed_invalid(int configfs_device_fd)
 	 * These only test if engine parsing is correct, so just make sure
 	 * there's no device bound
 	 */
-	igt_audio_driver_unload(NULL);
+	igt_audio_driver_unload(&snd_driver);
 	igt_kmod_unbind("xe", bus_addr);
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
@@ -142,7 +145,7 @@ static void test_engines_allowed(int configfs_device_fd)
 	 * These only test if engine parsing is correct, so just make sure
 	 * there's no device bound
 	 */
-	igt_audio_driver_unload(NULL);
+	igt_audio_driver_unload(&snd_driver);
 	igt_kmod_unbind("xe", bus_addr);
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
@@ -173,7 +176,7 @@ static void test_gt_types_allowed(int configfs_device_fd)
 	 * These only test if gt type parsing is correct, so just make sure
 	 * there's no device bound
 	 */
-	igt_audio_driver_unload(NULL);
+	igt_audio_driver_unload(&snd_driver);
 	igt_kmod_unbind("xe", bus_addr);
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
@@ -240,7 +243,7 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 	 * These only test if command parsing is correct,
 	 * so just make sure there's no device bound
 	 */
-	igt_audio_driver_unload(NULL);
+	igt_audio_driver_unload(&snd_driver);
 	igt_kmod_unbind("xe", bus_addr);
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
@@ -325,7 +328,7 @@ static void test_ctx_restore(int configfs_device_fd, const char *type,
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
 		const struct value *v = &values[i];
 
-		igt_audio_driver_unload(NULL);
+		igt_audio_driver_unload(&snd_driver);
 		igt_kmod_unbind("xe", bus_addr);
 
 		for (int j = 0, off = 0; v->in[j]; j++)
-- 
2.50.1

