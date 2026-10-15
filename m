Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DBDCC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 14:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE49112373;
	Thu, 15 Oct 2026 14:26:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7449C10E5D7
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 14:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792074234; x=1823610234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zd3qjCMrzJwGFPc4rlWnRNCmpWSKnbsbBAa6IpGoFxQ=;
 b=fPzubdkPf71icTbJMoFH+NeWUt4TjEYLQdoZhDdmo0qP98LdCjYtRA1+
 0r/K9PiO+HOroBE+FNGOXmF5UhRmpoWCA8+6xaG95yl3q9k0cDJllk7C/
 mc04VHeEeCbxLa7pfbykCUAOYnxSMyfZGIFVLKOHn+2cPVFwlrZ5awv7T
 dvAYU5/AzKghaPaQRG0qlVE4bRMUHTkOVoadGMw3wGO5V6wV/hCG08LB+
 Fsq+uXp9N1V5SnornShWQbXXQdijI9BLas10OfDeBKh9VFxhvdPQuW5PI
 JX8P6jCel+7YtcaQgbT3nBzsyjj985nCNWzlj8j++KqD8hDpCF3zxQZAj Q==;
X-CSE-ConnectionGUID: KfXzHLu0T4imKfB/id0IWg==
X-CSE-MsgGUID: ug8bBvq5Q5WyVI41wVP1Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="831670"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="831670"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 07:23:54 -0700
X-CSE-ConnectionGUID: 1SIdW6YxQVe4m4na3yjtJQ==
X-CSE-MsgGUID: IsCYvmFjRiGbQUGn8BWlNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1618018"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa008.jf.intel.com with ESMTP; 15 Oct 2026 07:23:53 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/xe_configfs: Reload audio driver on exit
Date: Thu, 15 Oct 2026 19:30:34 +0530
Message-ID: <20261015140035.2686997-2-chaitanya.kumar.borah@intel.com>
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
happen if xe is unbound while snd_hda_intel is still attached. All
call sites in this file passed NULL for the unloaded driver name, so
it was never tracked, and nothing ever reloaded it afterwards.

As a result snd_hda_intel/snd_hdmi_lpe_audio is left unloaded for the
rest of the boot even when every subtest passes, since xe always ends
up rebound by restore() but audio never does.

Capture the unloaded driver name and reload it wherever xe gets bound
again in restore().

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/intel/xe_configfs.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 450c0a119..576a741b2 100644
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
@@ -66,11 +67,17 @@ static void restore(int sig)
 
 	/* Bind again a clean driver with no custom settings */
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
@@ -115,7 +122,7 @@ static void test_engines_allowed_invalid(int configfs_device_fd)
 	 * These only test if engine parsing is correct, so just make sure
 	 * there's no device bound
 	 */
-	igt_audio_driver_unload(NULL);
+	igt_audio_driver_unload(&snd_driver);
 	igt_kmod_unbind("xe", bus_addr);
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
@@ -142,7 +149,7 @@ static void test_engines_allowed(int configfs_device_fd)
 	 * These only test if engine parsing is correct, so just make sure
 	 * there's no device bound
 	 */
-	igt_audio_driver_unload(NULL);
+	igt_audio_driver_unload(&snd_driver);
 	igt_kmod_unbind("xe", bus_addr);
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
@@ -173,7 +180,7 @@ static void test_gt_types_allowed(int configfs_device_fd)
 	 * These only test if gt type parsing is correct, so just make sure
 	 * there's no device bound
 	 */
-	igt_audio_driver_unload(NULL);
+	igt_audio_driver_unload(&snd_driver);
 	igt_kmod_unbind("xe", bus_addr);
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
@@ -240,7 +247,7 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 	 * These only test if command parsing is correct,
 	 * so just make sure there's no device bound
 	 */
-	igt_audio_driver_unload(NULL);
+	igt_audio_driver_unload(&snd_driver);
 	igt_kmod_unbind("xe", bus_addr);
 
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
@@ -325,7 +332,7 @@ static void test_ctx_restore(int configfs_device_fd, const char *type,
 	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
 		const struct value *v = &values[i];
 
-		igt_audio_driver_unload(NULL);
+		igt_audio_driver_unload(&snd_driver);
 		igt_kmod_unbind("xe", bus_addr);
 
 		for (int j = 0, off = 0; v->in[j]; j++)
-- 
2.50.1

