Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F775C282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 08:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B4710E3CD;
	Mon, 17 Mar 2025 08:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apRhUfw/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B6710E3CD
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 08:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742200301; x=1773736301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m3HlrJOPaqboF3k1mWfwu2knUwvewTWIr/vBUm4SOVo=;
 b=apRhUfw/0b9iI4yZ4/3Y/QLP1tP4lG4kR8aKeSqB4uwS2PH4UpszStNP
 /V/2kS++BZ/F3vjAFKHeyEtUGRi1TRKeAZrUVqdzUlMtNFZCi4fEZzKz1
 e5uWUDwdlPO5lQOem3sHODkqNL9eil5EfIvj/x3piiqL3guFfM+oIbf5r
 GuSj/c9m59So5077HvmRfGoOBBES01epA1KlwA2CWvnPv1kcStzIzOl0i
 aon+IBOOawnMyzzhJQ729m35m/5F8QTR2WssJ/9IUv5RzzMbaAUdz3cJE
 E8sKjfRBYIYbx7SpAJm0PvLVgSCIe87IfHPxHkLtUQytxQP6UnHZCAroE A==;
X-CSE-ConnectionGUID: TB4cM6lfSVmwn5B4LJCD6A==
X-CSE-MsgGUID: 7deunx3xTR6rS1dZOAzEDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43166096"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="43166096"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 01:31:41 -0700
X-CSE-ConnectionGUID: 2HpcotV7QnKQGDT+PazN6g==
X-CSE-MsgGUID: Blyf3HcGQnWEzAtAQpXYbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="127056570"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 01:31:39 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com
Subject: [PATCH <i-g-t> v1 1/2] Add support for xe in runtime pm
Date: Mon, 17 Mar 2025 13:58:22 +0530
Message-Id: <20250317082823.1631744-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317082823.1631744-1-soham.purkait@intel.com>
References: <20250317082823.1631744-1-soham.purkait@intel.com>
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

Add support for runtime power management
for Xe driver along with existing i915
support

v1 :  Updated references from "i915" to
      "generic GPU driver" to include support
      for the xe driver, ensuring clarity and
      consistency

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/intel_pm_rpm.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
index 08c25ca8a..8c4778e4f 100644
--- a/tools/intel_pm_rpm.c
+++ b/tools/intel_pm_rpm.c
@@ -35,7 +35,7 @@
 #include "igt_pm.h"
 
 #define DONT_SET_AUTOSUSPEND_DELAY (1 << 0)
-#define SET_I915_AUTOSUSPEND_DELAY (1 << 1)
+#define SET_AUTOSUSPEND_DELAY (1 << 1)
 
 typedef struct {
 	int drm_fd;
@@ -47,8 +47,8 @@ typedef struct {
 const char *help_str =
 	"  --disable-display-wait\t\tDisable all screens and try to go into runtime pm.\n"
 	"  --force-d3cold-wait\t\tForce dgfx gfx card to enter runtime D3Cold.\n"
-	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set autosupend delay to"
-	"  i915 autosuspend delay. Use --setup-d3cold=i915-auto-delay as optional argument.\n"
+	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set GPU driver's"
+	"  autosuspend delay. Use --setup-d3cold=auto-delay as optional argument.\n"
 	"  --help\t\tProvide help. Provide card name with IGT_DEVICE=drm:/dev/dri/card*.";
 static struct option long_options[] = {
 	{"disable-display-wait", 0, 0, 'd'},
@@ -80,14 +80,14 @@ static void disable_all_displays(data_t *data)
 static void
 setup_gfx_card_d3cold(data_t *data, unsigned char setup_d3cold)
 {
-	struct pci_device *root, *i915;
+	struct pci_device *root, *gpu_device;
 
 	root = igt_device_get_pci_root_port(data->drm_fd);
 	if (setup_d3cold == DONT_SET_AUTOSUSPEND_DELAY) {
 		igt_pm_enable_pci_card_runtime_pm(root, NULL);
-	} else if (setup_d3cold == SET_I915_AUTOSUSPEND_DELAY) {
-		i915 = igt_device_get_pci_device(data->drm_fd);
-		igt_pm_enable_pci_card_runtime_pm(root, i915);
+	} else if (setup_d3cold == SET_AUTOSUSPEND_DELAY) {
+		gpu_device = igt_device_get_pci_device(data->drm_fd);
+		igt_pm_enable_pci_card_runtime_pm(root, gpu_device);
 	}
 
 	igt_info("Enabled pci devs runtime pm under Root port %04x:%02x:%02x.%01x\n",
@@ -151,7 +151,8 @@ int main(int argc, char *argv[])
 			goto exit;
 		}
 	} else {
-		if (!igt_device_find_first_i915_discrete_card(&card)) {
+		if (!igt_device_find_first_i915_discrete_card(&card) &&
+		    !igt_device_find_first_xe_discrete_card(&card)) {
 			igt_warn("No discrete gpu found\n");
 			ret = EXIT_FAILURE;
 			goto exit;
@@ -169,8 +170,8 @@ int main(int argc, char *argv[])
 			break;
 		case 's':
 			if (optarg) {
-				if (!strcmp(optarg, "i915-auto-delay")) {
-					setup_d3cold = SET_I915_AUTOSUSPEND_DELAY;
+				if (!strcmp(optarg, "auto-delay")) {
+					setup_d3cold = SET_AUTOSUSPEND_DELAY;
 				} else	{
 					usage(argv[0]);
 					ret = EXIT_SUCCESS;
@@ -203,7 +204,7 @@ int main(int argc, char *argv[])
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 
-		/* i915 disables RPM in case DMC is not loaded on kms supported cards */
+		/* GPU driver disables RPM in case DMC is not loaded on kms supported cards */
 		if (!igt_pm_dmc_loaded(data.debugfs_fd)) {
 			igt_warn("dmc fw is not loaded, no runtime pm\n");
 			ret = EXIT_FAILURE;
@@ -215,7 +216,10 @@ int main(int argc, char *argv[])
 		igt_setup_runtime_pm(data.drm_fd);
 		disable_all_displays(&data);
 		if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)) {
-			__igt_debugfs_dump(data.drm_fd, "i915_runtime_pm_status", IGT_LOG_INFO);
+			if (!strcmp("i915", card.driver))
+				__igt_debugfs_dump(data.drm_fd,
+						   "i915_runtime_pm_status",
+						   IGT_LOG_INFO);
 			ret = EXIT_FAILURE;
 			goto exit;
 		}
-- 
2.34.1

