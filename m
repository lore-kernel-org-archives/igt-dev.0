Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BE9CD98F2
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 19:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4219A10E0FC;
	Fri, 19 Jun 2026 19:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlnYwl9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A3C10E0FC
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 19:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781896656; x=1813432656;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wv3GIkqcyZfY0bU6WFB9KB3Ml4egrXnNFmz/GWHtpZk=;
 b=RlnYwl9jpCgzCVYCdqjKIYKwRF396UziBTB2qVYjMqaUiQrhovdl1mMf
 Iy3olHK6l0eL+tvcbjBkhfPF6lNkw2nMx9gkwJXB3fxzNGypBcomZj04S
 9UObTt56aXUeEPUqOwiPWFlm9wwNa6wchQhW4LoVMJIo4xxvW4eMAveNL
 UgMngIJpc07Mx/gOIvQBIZS12AB6RpC1f1nemdj7NF/9HFXQerYdUOKmL
 ekuanyz532r0V1NQwVocAF5WsGA8yvDaB1n/uasZDwc98bw58DmUukXcB
 KzAkBYjd3eQww9PW2rLH1Ds7omEuGdnl8A6fM4TXZ+J1kjiDwjOeJyy6c Q==;
X-CSE-ConnectionGUID: taahdYL5SMes2OpLaRcr5g==
X-CSE-MsgGUID: 6O5aJtPrRvyHc8G5lYnacQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="81845558"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="81845558"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:17:36 -0700
X-CSE-ConnectionGUID: eD+0+41DShu7gMQ9aI1MKw==
X-CSE-MsgGUID: o/E2x7/fRJamLkgDRWPVAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="252593073"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:17:36 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v6] lib/intel_chipset: Extend intel_get_pci_device to
 PCI accelerator class
Date: Fri, 19 Jun 2026 12:17:31 -0700
Message-ID: <20260619191731.407668-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

In addition to PCI display class devices, Intel devices can also be PCI
accelerator class devices. Extend intel_get_pci_device() to also find these
devices.

v2: Introduce intel_get_pci_device_disp for those tools who specifically
    want only display class devices (Kamil)
v3: Same as v2
v4: s/intel_get_pci_device_disp/intel_get_pci_device_display/
v5: More code refactor (Kamil)
v6: s/uint8_t class/unsigned int class/ (Kamil)

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_chipset.c             | 56 +++++++++++++++++++++++++++------
 lib/intel_chipset.h             |  1 +
 tools/intel_audio_dump.c        |  2 +-
 tools/intel_backlight.c         |  2 +-
 tools/intel_display_bandwidth.c |  4 +--
 tools/intel_display_poller.c    |  4 +--
 tools/intel_panel_fitter.c      |  2 +-
 7 files changed, 55 insertions(+), 16 deletions(-)

diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
index 760faede24..8d7de087d1 100644
--- a/lib/intel_chipset.c
+++ b/lib/intel_chipset.c
@@ -64,15 +64,14 @@
 enum pch_type intel_pch;
 
 /**
- * intel_get_pci_device:
+ * intel_pci_device_by_class:
  *
  * Looks up the main graphics pci device using libpciaccess.
  *
  * Returns:
  * The pci_device, exits the program on any failures.
  */
-struct pci_device *
-intel_get_pci_device(void)
+static struct pci_device *intel_pci_device_by_class(unsigned int class)
 {
 	struct pci_device *pci_dev;
 	int error;
@@ -81,7 +80,7 @@ intel_get_pci_device(void)
 	igt_fail_on_f(error != 0,
 		      "Couldn't initialize PCI system\n");
 
-	/* Grab the graphics card. Try the canonical slot first, then
+	/* Grab the Intel device. Try the canonical slot first, then
 	 * walk the entire PCI bus for a matching device. */
 	pci_dev = pci_device_find_by_slot(0, 0, 2, 0);
 	if (pci_dev == NULL || pci_dev->vendor_id != 0x8086) {
@@ -93,7 +92,7 @@ intel_get_pci_device(void)
 		match.subvendor_id = PCI_MATCH_ANY;
 		match.subdevice_id = PCI_MATCH_ANY;
 
-		match.device_class = 0x3 << 16;
+		match.device_class = class << 16;
 		match.device_class_mask = 0xff << 16;
 
 		match.match_data = 0;
@@ -102,14 +101,53 @@ intel_get_pci_device(void)
 		pci_dev = pci_device_next(iter);
 		pci_iterator_destroy(iter);
 	}
-	igt_require_f(pci_dev, "Couldn't find Intel graphics card\n");
+	if (!pci_dev)
+		return NULL;
 
 	error = pci_device_probe(pci_dev);
-	igt_fail_on_f(error != 0,
-		      "Couldn't probe graphics card\n");
+	igt_fail_on_f(error != 0, "Couldn't probe the PCI device, class %#x\n", class);
 
 	if (pci_dev->vendor_id != 0x8086)
-		errx(1, "Graphics card is non-intel");
+		errx(1, "PCI device class %#x is non-intel", class);
+
+	return pci_dev;
+}
+
+/**
+ * intel_get_pci_device_display:
+ *
+ * Looks up display class pci device using libpciaccess
+ *
+ * Returns: The pci_device, exits the program on any failures
+ */
+struct pci_device *intel_get_pci_device_display(void)
+{
+	/* PCI display class (0x3) device */
+	struct pci_device *pci_dev = intel_pci_device_by_class(0x3);
+
+	igt_require_f(pci_dev, "Couldn't find Intel graphics device\n");
+
+	return pci_dev;
+}
+
+
+/**
+ * intel_get_pci_device:
+ *
+ * Looks up display and accelerator class pci devices using libpciaccess
+ *
+ * Returns: The pci_device, exits the program on any failures
+ */
+struct pci_device *intel_get_pci_device(void)
+{
+	/* PCI display class (0x3) device */
+	struct pci_device *pci_dev = intel_pci_device_by_class(0x3);
+
+	/* PCI accelerator class (0x12) device */
+	if (!pci_dev)
+		pci_dev = intel_pci_device_by_class(0x12);
+
+	igt_require_f(pci_dev, "Couldn't find Intel graphics or accelerator device\n");
 
 	return pci_dev;
 }
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 98a2a81fcf..1f02932e4a 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -36,6 +36,7 @@
 #define BIT(x) (1ul <<(x))
 
 struct pci_device *intel_get_pci_device(void);
+struct pci_device *intel_get_pci_device_display(void);
 uint32_t intel_get_drm_devid(int fd);
 
 struct intel_device_info {
diff --git a/tools/intel_audio_dump.c b/tools/intel_audio_dump.c
index 287dbd4759..5761fc1bbc 100644
--- a/tools/intel_audio_dump.c
+++ b/tools/intel_audio_dump.c
@@ -2468,7 +2468,7 @@ int main(int argc, char **argv)
 	struct pci_device *pci_dev;
 	struct intel_mmio_data mmio_data;
 
-	pci_dev = intel_get_pci_device();
+	pci_dev = intel_get_pci_device_display();
 	devid = pci_dev->device_id; /* XXX not true when mapping! */
 
 	do_self_tests();
diff --git a/tools/intel_backlight.c b/tools/intel_backlight.c
index edf060224f..1478583e97 100644
--- a/tools/intel_backlight.c
+++ b/tools/intel_backlight.c
@@ -41,7 +41,7 @@ int main(int argc, char** argv)
 	struct intel_mmio_data mmio_data;
 	uint32_t current, max;
 
-	intel_mmio_use_pci_bar(&mmio_data, intel_get_pci_device());
+	intel_mmio_use_pci_bar(&mmio_data, intel_get_pci_device_display());
 
 	current = INREG(BLC_PWM_CPU_CTL) & BACKLIGHT_DUTY_CYCLE_MASK;
 	max = INREG(BLC_PWM_PCH_CTL2) >> 16;
diff --git a/tools/intel_display_bandwidth.c b/tools/intel_display_bandwidth.c
index b798f8b652..193f309d39 100644
--- a/tools/intel_display_bandwidth.c
+++ b/tools/intel_display_bandwidth.c
@@ -152,14 +152,14 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	devid = intel_get_pci_device()->device_id;
+	devid = intel_get_pci_device_display()->device_id;
 
 	if (!has_de_power2(devid)) {
 		fprintf(stderr, "Display bandwidth counter not available\n");
 		return 2;
 	}
 
-	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
+	intel_register_access_init(&mmio_data, intel_get_pci_device_display(), 0);
 
 	if (has_de_power2_abox0_abox1(devid))
 		measure_de_power2_abox0_abox1(devid, sleep_duration);
diff --git a/tools/intel_display_poller.c b/tools/intel_display_poller.c
index 6338f22223..df333597e7 100644
--- a/tools/intel_display_poller.c
+++ b/tools/intel_display_poller.c
@@ -1508,7 +1508,7 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	devid = intel_get_pci_device()->device_id;
+	devid = intel_get_pci_device_display()->device_id;
 
 	/*
 	 * check if the requires registers are
@@ -1677,7 +1677,7 @@ int main(int argc, char *argv[])
 		break;
 	}
 
-	intel_register_access_init(&mmio_data, intel_get_pci_device(), 0);
+	intel_register_access_init(&mmio_data, intel_get_pci_device_display(), 0);
 
 	if (auto_scanline_offset)
 		scanline_offset = default_scanline_offset(devid, pipe);
diff --git a/tools/intel_panel_fitter.c b/tools/intel_panel_fitter.c
index d9555d5c67..2234eac6c4 100644
--- a/tools/intel_panel_fitter.c
+++ b/tools/intel_panel_fitter.c
@@ -280,7 +280,7 @@ int main (int argc, char *argv[])
 	       "with overscan compensation properties: it is just a temporary "
 	       "solution that may or may not work. Use it at your own risk.\n");
 
-	pci_dev = intel_get_pci_device();
+	pci_dev = intel_get_pci_device_display();
 	intel_register_access_init(&mmio_data, pci_dev, 0);
 	devid = pci_dev->device_id;
 
-- 
2.54.0

