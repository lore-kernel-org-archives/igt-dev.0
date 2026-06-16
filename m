Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C73CD98E1
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 14:55:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8752210EC4F;
	Tue, 16 Jun 2026 14:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMc9jwle";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D0D10E1E6
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 14:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781621703; x=1813157703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DXoe4Wy2HFtUqg4JtZ1ory6sZCGmDXNaWiJOP5Yl+tM=;
 b=nMc9jwle1gg+++eKWYIYoyliwCBzRedHz/lhqAqNLQrSGrzwutPCYhO8
 cdm2KWU7Us+bZ0l3lByCF/UUP9Wjd8dJVb3wfmaTbmtZqjhR48VfoiMPm
 EPV3tCja5Zse3JP1wUENYjIvxznZimvaw1s8NE7sWD6RjGPQHjv57ngAn
 GrLbdeoBTzBiLoZytat5oJZp1tNgOG7A5vGXvTfs0Y7kf/wIP7lwSvTcq
 6Fo+nebqY6thrj2vXfjr9Qc0dgIzI3Zf4BFaEUrg5L0zcTae5CsqLDDtU
 NI5o6pQ+adNA6vZ1SZoX8V8I5R6ZG2L/IhHkO8hZQ3rdYU270W7GAvrTE Q==;
X-CSE-ConnectionGUID: wIxq90djQsq6aniWh8i6tw==
X-CSE-MsgGUID: sCqsTDB3Qd+kx+IzDCKyAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="99961687"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="99961687"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 07:55:03 -0700
X-CSE-ConnectionGUID: qm+bXm4lTHi9GQeL/E4TuA==
X-CSE-MsgGUID: 1N/iEZjsQLWXX1V3m01MeA==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 07:55:02 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 janusz.krzysztofik@linux.intel.com, lukasz.laguna@intel.com,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH i-g-t v3] lib/intel_chipset: Extend intel_get_pci_device to
 PCI accelerator class
Date: Tue, 16 Jun 2026 07:54:58 -0700
Message-ID: <20260616145458.181427-1-ashutosh.dixit@intel.com>
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
    want only display class devices (Kamiil)
v3: s/intel_get_pci_device_disp/intel_get_pci_device_display/

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_chipset.c             | 82 +++++++++++++++++++++++----------
 lib/intel_chipset.h             |  1 +
 tools/intel_audio_dump.c        |  2 +-
 tools/intel_backlight.c         |  2 +-
 tools/intel_display_bandwidth.c |  4 +-
 tools/intel_display_poller.c    |  4 +-
 tools/intel_panel_fitter.c      |  2 +-
 7 files changed, 65 insertions(+), 32 deletions(-)

diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
index 760faede24..8bf3d52b77 100644
--- a/lib/intel_chipset.c
+++ b/lib/intel_chipset.c
@@ -63,16 +63,34 @@
  */
 enum pch_type intel_pch;
 
-/**
- * intel_get_pci_device:
- *
- * Looks up the main graphics pci device using libpciaccess.
- *
- * Returns:
- * The pci_device, exits the program on any failures.
- */
-struct pci_device *
-intel_get_pci_device(void)
+static struct pci_device *intel_pci_device_by_class(uint8_t class)
+{
+	struct pci_device *pci_dev;
+	struct pci_device_iterator *iter;
+	struct pci_id_match match;
+	int error;
+
+	error = igt_pci_system_init();
+	igt_fail_on_f(error != 0, "Couldn't initialize PCI system\n");
+
+	match.vendor_id = 0x8086; /* Intel */
+	match.device_id = PCI_MATCH_ANY;
+	match.subvendor_id = PCI_MATCH_ANY;
+	match.subdevice_id = PCI_MATCH_ANY;
+
+	match.device_class = class << 16;
+	match.device_class_mask = 0xff << 16;
+
+	match.match_data = 0;
+
+	iter = pci_id_match_iterator_create(&match);
+	pci_dev = pci_device_next(iter);
+	pci_iterator_destroy(iter);
+
+	return pci_dev;
+}
+
+static struct pci_device *__intel_get_pci_device(bool accel)
 {
 	struct pci_device *pci_dev;
 	int error;
@@ -85,22 +103,12 @@ intel_get_pci_device(void)
 	 * walk the entire PCI bus for a matching device. */
 	pci_dev = pci_device_find_by_slot(0, 0, 2, 0);
 	if (pci_dev == NULL || pci_dev->vendor_id != 0x8086) {
-		struct pci_device_iterator *iter;
-		struct pci_id_match match;
+		/* PCI display class (0x3) devices */
+		pci_dev = intel_pci_device_by_class(0x3);
 
-		match.vendor_id = 0x8086; /* Intel */
-		match.device_id = PCI_MATCH_ANY;
-		match.subvendor_id = PCI_MATCH_ANY;
-		match.subdevice_id = PCI_MATCH_ANY;
-
-		match.device_class = 0x3 << 16;
-		match.device_class_mask = 0xff << 16;
-
-		match.match_data = 0;
-
-		iter = pci_id_match_iterator_create(&match);
-		pci_dev = pci_device_next(iter);
-		pci_iterator_destroy(iter);
+		if (!pci_dev && accel)
+			/* PCI accelerator class (0x12) devices */
+			pci_dev = intel_pci_device_by_class(0x12);
 	}
 	igt_require_f(pci_dev, "Couldn't find Intel graphics card\n");
 
@@ -114,6 +122,30 @@ intel_get_pci_device(void)
 	return pci_dev;
 }
 
+/**
+ * intel_get_pci_device:
+ *
+ * Looks up display and accelerator class pci devices using libpciaccess
+ *
+ * Returns: The pci_device, exits the program on any failures
+ */
+struct pci_device *intel_get_pci_device(void)
+{
+	return __intel_get_pci_device(true);
+}
+
+/**
+ * intel_get_pci_device_disp:
+ *
+ * Looks up display class pci device using libpciaccess
+ *
+ * Returns: The pci_device, exits the program on any failures
+ */
+struct pci_device *intel_get_pci_device_display(void)
+{
+	return __intel_get_pci_device(false);
+}
+
 static uint32_t __i915_get_drm_devid(int fd)
 {
 	struct drm_i915_getparam gp;
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 3fcc5b18d6..018cfaba5e 100644
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

