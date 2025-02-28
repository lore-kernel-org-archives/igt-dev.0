Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F001C19776
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 14:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C654810ECB9;
	Fri, 28 Feb 2025 14:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+WftMXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F04D10ECB9
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740752459; x=1772288459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wgmt/ncVFGZUuvo4tZjN5xJ9tZyQ6jGt9cUjFjfCTn0=;
 b=k+WftMXI68cQDGvVjb2WW2JmVSSbIXRTi2vsY2UrV8tnCR9d7Wh9LQ+M
 RGtC7N1OdvCGAspND+V/PWmFzHn75Dy8DzirM3ub6yni+B0ckBS33VvQ3
 Sr7DwMcpyhshpmLVfeVYE+bJlEjOlyTROHd7jlG6eQMnc11BoDUsDAnzp
 Cd0/H0eKK5L4ZPKpen1jNf6c+3eYTyy5UmiCZS7iljYUn9qhFCy4/w4pb
 ioh6uQlkPnXnFqjgwsaNMQaMKBTRpWD4tIo2lFt08Jp2ylNv0Y6aDFZY0
 w2MhX0d9qig5iRBOqkAFXnjkemIX0NiOwfNpVFdGtQVfSp0CC6RqLENO7 A==;
X-CSE-ConnectionGUID: Q9P35Vg2QiuXGp2COIpsNw==
X-CSE-MsgGUID: rypguW9URxSXAZhAlhYrPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="51885199"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="51885199"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 06:20:59 -0800
X-CSE-ConnectionGUID: ddEkK0bAQdq6zF5dDcS4ow==
X-CSE-MsgGUID: huhyhxaPQcS9Vt7COM3sKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="121955022"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 06:20:56 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, jonathan.ming.jun.lui@intel.com
Subject: [PATCH i-g-t v3 1/4] Enable finding all IGT devices for xe driver
Date: Fri, 28 Feb 2025 19:48:07 +0530
Message-Id: <20250228141810.1417657-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228141810.1417657-1-soham.purkait@intel.com>
References: <20250228141810.1417657-1-soham.purkait@intel.com>
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

v2 : fix for refactoring GPUTOP into a
     vendor-agnostic tool (Lucas)

v3 : Separate commit for lib (Kamil)

---
 lib/igt_device_scan.c | 97 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_device_scan.h |  3 ++
 2 files changed, 100 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 711bedc5c..bdbe09761 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -774,6 +774,10 @@ __copy_dev_to_card(struct igt_device *dev, struct igt_device_card *card)
 		safe_strncpy(card->render, dev->drm_render,
 			     sizeof(card->render));
 
+	if (dev->driver != NULL)
+		safe_strncpy(card->driver, dev->driver,
+			     sizeof(card->driver));
+
 	if (dev->pci_slot_name != NULL)
 		safe_strncpy(card->pci_slot_name, dev->pci_slot_name,
 			     sizeof(card->pci_slot_name));
@@ -820,6 +824,99 @@ static bool __find_first_intel_card_by_driver_name(struct igt_device_card *card,
 	return false;
 }
 
+/*
+ * Iterate over all igt_devices array and find all discrete/integrated card.
+ * @card: double pointer to igt_device_card structure, containing
+ * an array of igt_device_card structure upon successful return.
+ */
+static int __find_all_intel_card_by_driver_name(struct igt_device_card **card,
+						bool want_discrete, const char *drv_name)
+{
+	int count = 0;
+	struct igt_device *dev;
+	int is_integrated;
+	struct igt_device_card *tmp;
+	struct igt_device_card *crd =
+		(struct igt_device_card *)calloc(1, sizeof(struct igt_device_card));
+
+	igt_assert(drv_name);
+	memset(card, 0, sizeof(*card));
+
+	igt_list_for_each_entry(dev, &igt_devs.all, link) {
+		if (!is_pci_subsystem(dev) || strcmp(dev->driver, drv_name))
+			continue;
+
+		is_integrated = !strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
+				PCI_SLOT_NAME_SIZE);
+
+		if (want_discrete && !is_integrated) {
+			__copy_dev_to_card(dev, (crd + count));
+			count++;
+			tmp = realloc(crd, sizeof(struct igt_device_card) * (1 + count));
+			if (!tmp) {
+				free(crd);
+				return -1;
+			}
+			crd = tmp;
+
+		} else if (!want_discrete && is_integrated) {
+			__copy_dev_to_card(dev, (crd + count));
+			count++;
+			tmp = realloc(crd, sizeof(struct igt_device_card) * (1 + count));
+			if (!tmp) {
+				free(crd);
+				return -1;
+			}
+			crd = tmp;
+		}
+	}
+	if (count == 0) {
+		free(crd);
+		return 0;
+	}
+
+	*card = crd;
+	return count;
+}
+
+/**
+ * igt_device_find_all_xe_integrated_card
+ * @card: double pointer to igt_device_card structure
+ *
+ * Iterate over all igt_devices array and find only xe integrated
+ * cards and populate an array of igt_device_card structure upon
+ * successful return.
+ * card will be updated with the pointer to the array of
+ * igt_device_card structure only if at least a single such device
+ * is found.
+ *
+ * Returns: number of integrated xe device is found.
+ */
+int igt_device_find_all_xe_integrated_card(struct igt_device_card **card)
+{
+	igt_assert(card);
+	return __find_all_intel_card_by_driver_name(card, false, "xe");
+}
+
+/**
+ * igt_device_find_all_xe_discrete_card
+ * @card: double pointer to igt_device_card structure
+ *
+ * Iterate over all igt_devices array and find only xe discrete
+ * cards and populate an array of igt_device_card structure upon
+ * successful return.
+ * card will be updated with the pointer to the array of
+ * igt_device_card structure only if at least a single such device
+ * is found.
+ *
+ * Returns: number of discrete xe device is found.
+ */
+int igt_device_find_all_xe_discrete_card(struct igt_device_card **card)
+{
+	igt_assert(card);
+	return __find_all_intel_card_by_driver_name(card, true, "xe");
+}
+
 bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
 {
 	igt_assert(card);
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index 92741fe3c..25d3c462f 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -59,6 +59,7 @@ struct igt_device_card {
 	char subsystem[NAME_MAX];
 	char card[NAME_MAX];
 	char render[NAME_MAX];
+	char driver[NAME_MAX];
 	char pci_slot_name[PCI_SLOT_NAME_SIZE+1];
 	uint16_t pci_vendor, pci_device;
 };
@@ -92,6 +93,8 @@ bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card);
 bool igt_device_find_integrated_card(struct igt_device_card *card);
 bool igt_device_find_first_xe_discrete_card(struct igt_device_card *card);
 bool igt_device_find_xe_integrated_card(struct igt_device_card *card);
+int igt_device_find_all_xe_integrated_card(struct igt_device_card **card);
+int igt_device_find_all_xe_discrete_card(struct igt_device_card **card);
 char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
 int igt_open_card(struct igt_device_card *card);
 int igt_open_render(struct igt_device_card *card);
-- 
2.34.1

