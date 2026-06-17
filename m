Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69167CD98F0
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 20:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1316710F10B;
	Wed, 17 Jun 2026 20:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WyXxiN2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE0B10F10B
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 20:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781727973; x=1813263973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Aeu/APXGCckGRdpBuEOpDoX0Mr69SIaR/SpXnuOHjs=;
 b=WyXxiN2A5PISbjaKufz2sR0qao/gjzG2+xTv5wnlavxCVcDkRlxm1tGg
 9fz+yTjfU8V2e195xZUc500mrj46QZQk6LcFakvEAlJqBpDSjHJe738Nz
 FYn8strE+xnHpU9c4Qi9FZqGjz44sVbJUJN3EaFQKFTyCP8WXMjxsytlj
 8SonVqSWZr/aTWErgBc8OVENUDJnnUT1TX6oXl5Sf8veV2Ut/L6uxbVGj
 9BuedvosumUkVAU5JObX09ZyAWj8xax6uj+fFp5FGrb4UVTUJXFQAu6OA
 KQ4nbMukGxlJZMUXiWsd1bOgVbn3+u5hD/l0uhNxNpNd5aLcNSDHbXYqL w==;
X-CSE-ConnectionGUID: svoc8sb2SyKfbuTBE3UeTQ==
X-CSE-MsgGUID: UQ6CKV8TRfib8BFLBWQRaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86387975"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="86387975"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 13:26:12 -0700
X-CSE-ConnectionGUID: dyFGDfypS3u5hVenwPAOqg==
X-CSE-MsgGUID: qzjcFtRzQOSBXBdH+SNj2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; d="scan'208";a="272241140"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.127])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 13:26:11 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v1 1/2] lib/intel_chipset: Create
 intel_get_pci_accelerator_device() function
Date: Wed, 17 Jun 2026 22:25:57 +0200
Message-ID: <20260617202600.251889-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617202600.251889-1-kamil.konieczny@linux.intel.com>
References: <20260617202600.251889-1-kamil.konieczny@linux.intel.com>
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

Among Intel DRM devices there are also accelerators, so create
a new function for searching for them.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_chipset.c | 47 ++++++++++++++++++++++++++++++++++++---------
 lib/intel_chipset.h |  1 +
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
index 760faede2..9f9643414 100644
--- a/lib/intel_chipset.c
+++ b/lib/intel_chipset.c
@@ -64,15 +64,14 @@
 enum pch_type intel_pch;
 
 /**
- * intel_get_pci_device:
+ * intel_get_pci_device_by_class:
  *
  * Looks up the main graphics pci device using libpciaccess.
  *
  * Returns:
- * The pci_device, exits the program on any failures.
+ * The pci_device, exits the program on probe failure.
  */
-struct pci_device *
-intel_get_pci_device(void)
+static struct pci_device *intel_get_pci_device_by_class(unsigned int class)
 {
 	struct pci_device *pci_dev;
 	int error;
@@ -81,7 +80,7 @@ intel_get_pci_device(void)
 	igt_fail_on_f(error != 0,
 		      "Couldn't initialize PCI system\n");
 
-	/* Grab the graphics card. Try the canonical slot first, then
+	/* Grab Intel device by class. Try the canonical slot first, then
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
@@ -102,18 +101,48 @@ intel_get_pci_device(void)
 		pci_dev = pci_device_next(iter);
 		pci_iterator_destroy(iter);
 	}
-	igt_require_f(pci_dev, "Couldn't find Intel graphics card\n");
+
+	if (!pci_dev)
+		return NULL;
 
 	error = pci_device_probe(pci_dev);
 	igt_fail_on_f(error != 0,
 		      "Couldn't probe graphics card\n");
 
-	if (pci_dev->vendor_id != 0x8086)
-		errx(1, "Graphics card is non-intel");
+	if (pci_dev->vendor_id != 0x8086) /* should not happen */
+		errx(1, "PCI device 0x%02x card is non-intel", class);
 
 	return pci_dev;
 }
 
+/**
+ * intel_get_pci_device:
+ *
+ * Looks up the main graphics pci device using libpciaccess.
+ *
+ * Returns:
+ * The pci_device or NULL if no Intel GPU card found.
+ */
+struct pci_device *intel_get_pci_device(void)
+{
+	/* PCI display (0x03) class devices */
+	return intel_get_pci_device_by_class(0x03);
+}
+
+/**
+ * intel_get_pci_accelerator_device:
+ *
+ * Looks up the main accelerator pci device using libpciaccess.
+ *
+ * Returns:
+ * The pci_device or NULL if no Intel accelerator card found.
+ */
+struct pci_device *intel_get_pci_accelerator_device(void)
+{
+	/* PCI accelerator (0x12) class devices */
+	return intel_get_pci_device_by_class(0x12);
+}
+
 static uint32_t __i915_get_drm_devid(int fd)
 {
 	struct drm_i915_getparam gp;
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 98a2a81fc..82c7883ea 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -36,6 +36,7 @@
 #define BIT(x) (1ul <<(x))
 
 struct pci_device *intel_get_pci_device(void);
+struct pci_device *intel_get_pci_accelerator_device(void);
 uint32_t intel_get_drm_devid(int fd);
 
 struct intel_device_info {
-- 
2.54.0

