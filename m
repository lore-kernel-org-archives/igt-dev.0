Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58B9C3ABB2
	for <igt-dev@archiver.kernel.org>; Mon, 16 Sep 2024 20:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956ED10E3E0;
	Mon, 16 Sep 2024 20:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmQ2GNAT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEFF10E3E0
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Sep 2024 20:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726517930; x=1758053930;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cEr1Pzf5SB05GHo1FVDF5cSseh2iHDqGoeGNktDFmFk=;
 b=gmQ2GNATe6CBMoevyz/C4OEK4lycKfVlAWfizXxTLVbx9f5wf3SRZfVg
 EiGGTayRTKhblrXyTaLNIhaNvcMfid9jl71l2ENoIHiBVGl+x0rpc0vQR
 50Z4SC5vKJ2C3R7ti2mPqr/2yyY/5nDggLrvZkcvYxK9RSiHnhUObkGZH
 Y3H7qRy3ZRH96HqCfOOWrey5i6gY1QoqpuEcE4dB2NVmbcayccupAl069
 KC6xGdEnqIvZ4qdt84WmjxBX5uIrVIhcgtp7Hjrnm2Ewq9ZBn3189tKMP
 ah/VGI+QjjCt+xr5Vuoic7ID9WFK9SDcwmTpqHF98W1RibO9kclo3ByPz A==;
X-CSE-ConnectionGUID: z3myBRVjTBqoEfIcCIFMjQ==
X-CSE-MsgGUID: F7CkfF63RD2moboMronpBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36499484"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="36499484"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 13:18:49 -0700
X-CSE-ConnectionGUID: JZgalmq7Sqadx6w23qPakw==
X-CSE-MsgGUID: RnzkxYcqTwGlx2PICIT6EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="69070732"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 16 Sep 2024 13:18:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 23:18:46 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/5] igt: Use is_intel_dgfx()
Date: Mon, 16 Sep 2024 23:18:38 +0300
Message-ID: <20240916201841.29592-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240916201841.29592-1-ville.syrjala@linux.intel.com>
References: <20240916201841.29592-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace the hand rolled copies of is_intel_dgfx() with
the real thing.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_power.c          | 6 ++----
 tests/intel/kms_pm_dc.c  | 6 ++----
 tests/intel/kms_pm_rpm.c | 6 ++----
 tests/kms_addfb_basic.c  | 9 ++++-----
 4 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/lib/igt_power.c b/lib/igt_power.c
index f4d3efcf0cec..e891da87acf3 100644
--- a/lib/igt_power.c
+++ b/lib/igt_power.c
@@ -12,7 +12,7 @@
 #include "igt_power.h"
 #include "igt_sysfs.h"
 
-#include "xe/xe_query.h"
+#include "intel_common.h"
 
 static const char *rapl_domains[] = { "cpu", "gpu", "pkg", "ram" };
 
@@ -101,13 +101,11 @@ static inline void rapl_close(struct rapl *r)
 int igt_power_open(int fd, struct igt_power *p, const char *domain)
 {
 	int i;
-	bool is_dgfx;
 
 	p->hwmon_fd = -1;
 	p->rapl.fd = -1;
 
-	is_dgfx = fd >= 0 && (is_xe_device(fd) ? xe_has_vram(fd) : gem_has_lmem(fd));
-	if (is_dgfx) {
+	if (fd >= 0 && is_intel_dgfx(fd)) {
 		if (strncmp(domain, "gpu", strlen("gpu")) == 0) {
 			p->hwmon_fd = igt_hwmon_open(fd);
 			if (p->hwmon_fd >= 0)
diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 07b140ce5b16..362c9b6edb25 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -46,7 +46,7 @@
 #include "limits.h"
 #include "time.h"
 #include "igt_pm.h"
-#include "xe/xe_query.h"
+#include "intel_common.h"
 
 /**
  * SUBTEST: dc3co-vpb-simulation
@@ -711,7 +711,6 @@ static void kms_poll_state_restore(int sig)
 igt_main
 {
 	data_t data = {};
-	bool is_dgfx;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
@@ -805,8 +804,7 @@ igt_main
 
 	igt_describe("This test validates display engine entry to DC9 state");
 	igt_subtest("dc9-dpms") {
-		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
-		if (!is_dgfx)
+		if (!is_intel_dgfx(data.drm_fd))
 			igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 				      "PC8+ residencies not supported\n");
 		test_dc9_dpms(&data);
diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 852e9cb5f84d..990c509156f3 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -39,8 +39,8 @@
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
 #include "intel_blt.h"
+#include "intel_common.h"
 #include "xe/xe_ioctl.h"
-#include "xe/xe_query.h"
 
 /**
  * SUBTEST: basic-pci-d3-state
@@ -1116,7 +1116,6 @@ static bool device_in_pci_d3(struct pci_device *pci_dev)
 static void pci_d3_state_subtest(void)
 {
 	struct pci_device *pci_dev, *bridge_pci_dev;
-	bool is_dgfx;
 
 	igt_require(has_runtime_pm);
 
@@ -1126,8 +1125,7 @@ static void pci_d3_state_subtest(void)
 	disable_all_screens_and_wait(&ms_data);
 	igt_assert(igt_wait(device_in_pci_d3(pci_dev), 2000, 100));
 
-	is_dgfx = is_xe_device(drm_fd) ? xe_has_vram(drm_fd) : gem_has_lmem(drm_fd);
-	if (is_dgfx)
+	if (is_intel_dgfx(drm_fd))
 		igt_require_f(pci_device_has_kernel_driver(bridge_pci_dev),
 			      "pci bridge device does not bind with pcieport driver\n");
 
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 8fe22ec05166..b22818592e57 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -51,6 +51,7 @@
 #include "igt_rand.h"
 #include "igt_device.h"
 #include "i915/intel_memory_region.h"
+#include "intel_common.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
@@ -303,13 +304,11 @@ static void invalid_tests(int fd)
 			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
 		igt_calc_fb_size(&fb);
 
-		if (is_i915_device(fd)) {
-			igt_require(gem_has_lmem(fd));
+		igt_require(is_intel_dgfx(fd));
+		if (is_i915_device(fd))
 			handle = gem_create_in_memory_regions(fd, fb.size, REGION_SMEM);
-		} else {
-			igt_require(xe_has_vram(fd));
+		else
 			handle = xe_bo_create(fd, 0, fb.size, system_memory(fd), 0);
-		}
 
 		f.handles[0] = handle;
 		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EREMOTE);
-- 
2.44.2

