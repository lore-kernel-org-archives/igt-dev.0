Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34231C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 09:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2FC10E7B5;
	Thu, 23 Jan 2025 09:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UMG86P+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A9310E7B5
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737625942; x=1769161942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gKD4ut9yoXUhqgJsZS7sAxjydNt1mirePCpDorQNE54=;
 b=UMG86P+A2Vj2XB+l26cbpPUuXW9fnw7rRqnTCw+zXi+bxh7Osjw61Dfl
 vKFvJcsUpEuLt1k53to/TwB6ndvNeTFu9gX2te0s+HjP64f66MM+o7V9q
 rXDdY4tmKcwJQzDgk+GBnjliwllr9HCMBGy1yH5UJg4fQDjCkVKiBnxqC
 AcV93uhYVI2OwmzCRUdo8Dk+5lFDKsDGeR0BCkLpoE8wkgkW1TStZNb1g
 6JcoOr0+YERfq/2lVVc3+ucVPoidJsMk0Lqo5Ga0U2KcMuBYHQJwGHma5
 pgtmrhn9sotJrAY7HaZZXO6sqylJtmpMSKxhwQ0TjDBELVKXrwSFcHx7I g==;
X-CSE-ConnectionGUID: oK/ASEEHQEej5wV/1gggHg==
X-CSE-MsgGUID: EuORl0G/Tx2slJ/BT/RL4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37814767"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="37814767"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:52:20 -0800
X-CSE-ConnectionGUID: tGNvvRo+S9+bbqLhiu7GNw==
X-CSE-MsgGUID: E6SVETawSNqcnv8fBsCz2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="107407503"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.85])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:52:18 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 1/3] lib/igt_device_scan: drop device scan cache logic
Date: Thu, 23 Jan 2025 10:52:06 +0100
Message-Id: <20250123095208.72984-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
References: <20250123095208.72984-1-zbigniew.kempczynski@intel.com>
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

Tests which plays with module unload/load/reload must ensure scanned
device list cache is up-to-date. Missing direct calling of device scan
after module operations may lead to use stale data and use invalid
device name if it was changed in the meantime.

Lucas noticed device scanning overhead is minimal and we may drop
caching logic and scan (get drm data from udev) unconditionally.
From igt_runner perspective where single subtest is a separate process
device scan cost might likely be ignored.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
v2: Retrieve back current scanning state to prevent unnecessary freeing.
---
 benchmarks/gem_wsim.c      |  2 +-
 lib/drmtest.c              |  2 +-
 lib/igt_device_scan.c      | 14 ++++----------
 lib/igt_device_scan.h      |  2 +-
 lib/igt_multigpu.c         |  2 +-
 tests/core_hotunplug.c     |  2 +-
 tests/device_reset.c       |  2 +-
 tests/intel/i915_suspend.c |  4 ++--
 tools/intel_gpu_top.c      |  2 +-
 tools/intel_pm_rpm.c       |  2 +-
 tools/lsgpu.c              |  2 +-
 11 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 454b6f017b..7a6b100288 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -3178,7 +3178,7 @@ int main(int argc, char **argv)
 		}
 	}
 
-	igt_devices_scan(false);
+	igt_devices_scan();
 
 	if (list_devices_arg) {
 		struct igt_devices_print_format fmt = {
diff --git a/lib/drmtest.c b/lib/drmtest.c
index 2dd4540b85..436b6de780 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -475,7 +475,7 @@ void drm_load_module(unsigned int chipset)
 	}
 
 	pthread_mutex_unlock(&mutex);
-	igt_devices_scan(true);
+	igt_devices_scan();
 }
 
 static int __open_driver(const char *base, int offset, unsigned int chipset, int as_idx)
diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 8e2297087e..44b632008b 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1090,18 +1090,12 @@ void igt_devices_free(void)
  * igt_devices_scan
  * @force: enforce scanning devices
  *
- * Function scans udev in search of gpu devices. For first run it can be
- * called with @force = false. If something changes during the the test
- * or test does some module loading (new drm devices occurs during execution)
- * function must be called again with @force = true to refresh device array.
+ * Function scans udev in search of gpu devices.
  */
-void igt_devices_scan(bool force)
+void igt_devices_scan(void)
 {
-	if (force && igt_devs.devs_scanned)
-		igt_devices_free();
-
 	if (igt_devs.devs_scanned)
-		return;
+		igt_devices_free();
 
 	prepare_scan();
 	scan_drm_devices();
@@ -1983,7 +1977,7 @@ static bool __igt_device_card_match(const char *filter,
 	 * Scan devices in case the user hasn't yet,
 	 * but leave a decision on forced rescan on the user side.
 	 */
-	igt_devices_scan(false);
+	igt_devices_scan();
 
 	if (igt_device_filter_apply(filter) == false)
 		return false;
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index 9087337458..fa90134aa3 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -63,7 +63,7 @@ struct igt_device_card {
 	uint16_t pci_vendor, pci_device;
 };
 
-void igt_devices_scan(bool force);
+void igt_devices_scan(void);
 
 void igt_devices_print(const struct igt_devices_print_format *fmt);
 void igt_devices_print_vendors(void);
diff --git a/lib/igt_multigpu.c b/lib/igt_multigpu.c
index be0c113322..d4b89d706a 100644
--- a/lib/igt_multigpu.c
+++ b/lib/igt_multigpu.c
@@ -37,7 +37,7 @@ static int print_gpus(int count, int gpu_num)
 
 	igt_info("PCI devices available in the system:\n");
 
-	igt_devices_scan(true);
+	igt_devices_scan();
 	devices = igt_device_filter_pci();
 	igt_devices_print(&fmt);
 
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7f17f4423d..18e9dfc346 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -488,7 +488,7 @@ static bool healthcheck(struct hotunplug *priv, bool recover)
 	sleep(1);
 
 	/* device name may have changed, rebuild IGT device list */
-	igt_devices_scan(true);
+	igt_devices_scan();
 
 	node_healthcheck(priv, recover ? FLAG_RECOVER : 0);
 	if (!priv->failure)
diff --git a/tests/device_reset.c b/tests/device_reset.c
index 40681931c2..6c93a96c21 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -399,7 +399,7 @@ static void healthcheck(struct device_fds *dev)
 		/* give the kernel a breath for re-creating device nodes in devtmpfs */
 		sleep(1);
 		/* refresh device list */
-		igt_devices_scan(true);
+		igt_devices_scan();
 		igt_debug("reopen the device\n");
 		dev->fds.dev = __drm_open_driver(DRIVER_ANY);
 	}
diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
index 3398b372b5..fae1031a23 100644
--- a/tests/intel/i915_suspend.c
+++ b/tests/intel/i915_suspend.c
@@ -265,7 +265,7 @@ test_suspend_without_i915(int state)
 	int fd;
 
 	fd = __drm_open_driver(DRIVER_INTEL);
-	igt_devices_scan(false);
+	igt_devices_scan();
 
 	/*
 	 * When module is unloaded and s2idle is triggered, PCI core leaves the endpoint
@@ -317,7 +317,7 @@ igt_main
 		 * instead of reloading the i915 module.
 		 */
 		if (igt_device_filter_count())
-			igt_devices_scan(true);
+			igt_devices_scan();
 		fd = drm_open_driver(DRIVER_INTEL);
 	}
 
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index a608b894d3..68d27089b9 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -2701,7 +2701,7 @@ int main(int argc, char **argv)
 		break;
 	};
 
-	igt_devices_scan(false);
+	igt_devices_scan();
 
 	if (list_device) {
 		struct igt_devices_print_format fmt = {
diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
index 17cd2bc1d6..08c25ca8a6 100644
--- a/tools/intel_pm_rpm.c
+++ b/tools/intel_pm_rpm.c
@@ -142,7 +142,7 @@ int main(int argc, char *argv[])
 	}
 
 	env_device = getenv("IGT_DEVICE");
-	igt_devices_scan(false);
+	igt_devices_scan();
 
 	if (env_device) {
 		if (!igt_device_card_match(env_device, &card)) {
diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index 2bf2cf5f05..e482ca6b75 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -362,7 +362,7 @@ int main(int argc, char *argv[])
 		printf("Notice: Using filter from .igtrc\n");
 	}
 
-	igt_devices_scan(false);
+	igt_devices_scan();
 
 	if (igt_device != NULL) {
 		struct igt_device_card card;
-- 
2.34.1

