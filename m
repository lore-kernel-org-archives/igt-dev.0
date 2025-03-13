Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C662C282EC
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 06:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C695710E7F8;
	Thu, 13 Mar 2025 06:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnScZmW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C723410E7F8
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 06:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741847119; x=1773383119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7d9b3VYkJXmpha4llaqfyCWJDgDaPjOAAgiOloT8BvA=;
 b=AnScZmW5wMGIl0HYyhS+y396Ntxoue2+7s45/HPqZerVDvtsdljj6vWw
 kLYtN7ncFFC/JTrXK4LIUgSKM5AdAIBdvbEMyZeiwCm5WlA+Hl0Towlra
 nxUirhpvGZnplfySGzKcdxvdTlIv4oSaQjtzA4Y5F9Kn/mQFJ80JC7C6F
 Lh+J1DBU7bZo+vqTUZFYE93bHKpjKy5S3AfoPOoDv0PUjNjpZ0n+Y1TVS
 hAMp3KkbZq3sODpXIYKlCb75xEYKTycnGpJzc+R6kDNt8m2ioBQyTDFAP
 xIkFKn3NXTSpO7KtGTRhOie64tSo3V8aB3Vnuran9QuromHvPmf1NOm9R Q==;
X-CSE-ConnectionGUID: A1wV1sPHQ9WeSsBNPNe9cQ==
X-CSE-MsgGUID: y3SksRW0SvaAt/qdpXebqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42829723"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="42829723"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:25:18 -0700
X-CSE-ConnectionGUID: YtPonTEBQoe7jamXuTgj1A==
X-CSE-MsgGUID: Gc34vYRzSlKV/beYoTFkLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="158022884"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:25:06 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, jonathan.ming.jun.lui@intel.com
Subject: [PATCH <i-g-t> v4 1/4] lib/igt_device_scan: Enable finding all IGT
 devices for a specific driver
Date: Thu, 13 Mar 2025 11:51:51 +0530
Message-Id: <20250313062154.1601701-2-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313062154.1601701-1-soham.purkait@intel.com>
References: <20250313062154.1601701-1-soham.purkait@intel.com>
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

    Add function to find all the available GPU
cards by driver name and card type.
Add driver field to igt_device_card structure 
for storing driver names.

v2 : fix for refactoring GPUTOP into a
     vendor-agnostic tool (Lucas)

v3 : Separate commit for lib (Kamil)

v4 : Refactor to use composition strategy
     for driver and device type filtering
     Refactor code to improve memory
     allocation and error handling (Lucas)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 lib/igt_device_scan.c | 58 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_device_scan.h |  3 +++
 2 files changed, 61 insertions(+)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 711bedc5c..4d243126e 100644
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
@@ -820,6 +824,60 @@ static bool __find_first_intel_card_by_driver_name(struct igt_device_card *card,
 	return false;
 }
 
+/**
+ * Iterate over all igt_devices array and find all discrete/integrated cards.
+ * @card: double pointer to igt_device_card structure, containing
+ * an array of igt_device_card structures upon successful return.
+ * @card_type: flag to indicate whether to find discrete, integrated, or
+ * both types of cards. Use 0 for integrated, 1 for discrete, and 2 for both.
+ * @drv_name: name of the driver to match.
+ *
+ * Returns the number of cards found, or -1 on error.
+ */
+int find_all_intel_card_by_driver_name(struct igt_device_card **card,
+				       uint8_t card_type, const char *drv_name)
+{
+	int count = 0;
+	struct igt_device *dev;
+	int is_integrated;
+	struct igt_device_card *tmp;
+	struct igt_device_card *crd = NULL;
+
+	igt_assert(drv_name);
+	*card = NULL;
+
+	igt_list_for_each_entry(dev, &igt_devs.all, link) {
+		if (!is_pci_subsystem(dev) || strcmp(dev->driver, drv_name))
+			continue;
+
+		is_integrated = !strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
+						PCI_SLOT_NAME_SIZE);
+
+		if ((card_type == 1 && !is_integrated) ||
+		    (card_type == 0 && is_integrated) ||
+		    card_type == 2) {
+			tmp = realloc(crd, sizeof(struct igt_device_card) * (count + 1));
+			if (!tmp) {
+				free(crd);
+				return -1;
+			}
+
+			crd = tmp;
+			__copy_dev_to_card(dev, &crd[count]);
+			count++;
+		}
+	}
+
+	if (!count) {
+		if (!crd)
+			free(crd);
+		return 0;
+	}
+
+	*card = crd;
+	return count;
+}
+
 bool igt_device_find_first_i915_discrete_card(struct igt_device_card *card)
 {
 	igt_assert(card);
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index 92741fe3c..4fbb11193 100644
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
+int find_all_intel_card_by_driver_name(struct igt_device_card **card,
+				       uint8_t want_discrete, const char *drv_name);
 char *igt_device_get_pretty_name(struct igt_device_card *card, bool numeric);
 int igt_open_card(struct igt_device_card *card);
 int igt_open_render(struct igt_device_card *card);
-- 
2.34.1

