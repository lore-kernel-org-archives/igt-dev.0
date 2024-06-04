Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83782C25B78
	for <igt-dev@archiver.kernel.org>; Tue,  4 Jun 2024 12:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5E310E46B;
	Tue,  4 Jun 2024 12:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmtmtfIo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A2110E46B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2024 12:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717503205; x=1749039205;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B2QhzOVw7rLRnF4ZU0oDvXECF2E/CGadXA6MDRNjcag=;
 b=dmtmtfIo2VczKWLBGyZeLg0l99TFJGT4IE3DbQnaNnllYK2QtYcIFIN4
 TYLEHUais6JTnIwTf7e5+4VMl8s4JWPOLLkXf5LvoGoe86wdwICrOz3vT
 ctDf9SD11u4xd8hvV3QFztW9kE5vRyRGpHPYdHLBNxw0ieojj/2+/HqjI
 yzxYgMBMJsZ/dx4OfRPelmFcSWGz3qKaXuQhL51kyQAagDru4MgbqH/eG
 pGcmwOLElFV/Y4Dp8I7WhixwD1JbOXLyIblDoO71zm8T5z11NidmMkhAL
 N0UfGpbkV0lRte4hRQ3vZH19ZKyKeXE3ZqcUbIiRSnxlmiTp9p91chlPP g==;
X-CSE-ConnectionGUID: 8vGcerXESvyZQRv8tXaqeg==
X-CSE-MsgGUID: xBKdMMrcRc21aOtWtLyGng==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="36564144"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="36564144"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 05:13:24 -0700
X-CSE-ConnectionGUID: X0I3VVkYRBWbO0ZEXt6gpw==
X-CSE-MsgGUID: g1HM/wzkQC67IBrk3Z0wEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="74714699"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 05:13:22 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t] tools/lsgpu: Add switch to display gpu pci devices
Date: Tue,  4 Jun 2024 14:13:15 +0200
Message-Id: <20240604121315.87957-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Device scanning in IGT is based on iterating over udev drm devices. This
limits to display only to devices which have driver loaded.

To remove this limitation add dedicated udev pci scanning in lsgpu which
displays all gpu devices (pci class 0x30000).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 tools/lsgpu.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 2 deletions(-)

diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index da84e20505..846da99196 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -30,6 +30,7 @@
 #include <string.h>
 #include <signal.h>
 #include <glib.h>
+#include <libudev.h>
 
 /**
  * SECTION:lsgpu
@@ -77,12 +78,14 @@ enum {
 	OPT_LIST_VENDORS   = 'v',
 	OPT_LIST_FILTERS   = 'l',
 	OPT_DEVICE         = 'd',
-	OPT_HELP           = 'h'
+	OPT_HELP           = 'h',
+	OPT_PCISCAN        = 'P',
 };
 
 static bool g_show_vendors;
 static bool g_list_filters;
 static bool g_help;
+static bool g_pciscan;
 static char *igt_device;
 
 static const char *usage_str =
@@ -158,6 +161,77 @@ static char *get_device_from_rc(void)
 	return rc_device;
 }
 
+static int pciscan(void)
+{
+	struct udev *udev;
+	struct udev_enumerate *enumerate;
+	struct udev_list_entry *devices, *dev_list_entry;
+	struct igt_device_card card;
+	int ret, n = 0;
+
+	udev = udev_new();
+	igt_assert(udev);
+
+	enumerate = udev_enumerate_new(udev);
+	igt_assert(enumerate);
+
+	printf("Scanning pci subsystem\n");
+	printf("----------------------\n");
+	ret = udev_enumerate_add_match_subsystem(enumerate, "pci");
+	igt_assert(!ret);
+
+	ret = udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "30000");
+	igt_assert(!ret);
+
+	ret = udev_enumerate_scan_devices(enumerate);
+	igt_assert(!ret);
+
+	devices = udev_enumerate_get_list_entry(enumerate);
+	if (!devices) {
+		printf("No pci devices with class 0x30000 found\n");
+		return 0;
+	}
+
+	udev_list_entry_foreach(dev_list_entry, devices) {
+		const char *path;
+		struct udev_device *udev_dev;
+		struct udev_list_entry *entry;
+		char *codename;
+
+		path = udev_list_entry_get_name(dev_list_entry);
+		udev_dev = udev_device_new_from_syspath(udev, path);
+		printf("[%s]\n", path);
+
+		strcpy(card.pci_slot_name, "-");
+		entry = udev_device_get_properties_list_entry(udev_dev);
+		while (entry) {
+			const char *name = udev_list_entry_get_name(entry);
+			const char *value = udev_list_entry_get_value(entry);
+
+			entry = udev_list_entry_get_next(entry);
+			if (!strcmp(name, "ID_VENDOR_FROM_DATABASE"))
+				printf("  vendor [db]: %s\n", value);
+			else if (!strcmp(name, "ID_MODEL_FROM_DATABASE"))
+				printf("  model  [db]: %s\n", value);
+			else if (!strcmp(name, "DRIVER"))
+				printf("  driver     : %s\n", value);
+			else if (!strcmp(name, "PCI_ID"))
+				igt_assert_eq(sscanf(value, "%hx:%hx",
+						     &card.pci_vendor, &card.pci_device), 2);
+		}
+		codename = igt_device_get_pretty_name(&card, false);
+		printf("  codename   : %s\n", codename);
+
+		udev_device_unref(udev_dev);
+		n++;
+	}
+
+	udev_enumerate_unref(enumerate);
+	udev_unref(udev);
+
+	return 0;
+}
+
 int main(int argc, char *argv[])
 {
 	static struct option long_options[] = {
@@ -180,7 +254,7 @@ int main(int argc, char *argv[])
 			.type = IGT_PRINT_USER,
 	};
 
-	while ((c = getopt_long(argc, argv, "ncspvld:h",
+	while ((c = getopt_long(argc, argv, "ncspvld:hP",
 				long_options, &index)) != -1) {
 		switch(c) {
 
@@ -208,6 +282,9 @@ int main(int argc, char *argv[])
 		case OPT_HELP:
 			g_help = true;
 			break;
+		case OPT_PCISCAN:
+			g_pciscan = true;
+			break;
 		case 0:
 			fmt.option = IGT_PRINT_DRM;
 			break;
@@ -220,6 +297,9 @@ int main(int argc, char *argv[])
 		}
 	}
 
+	if (g_pciscan)
+		return pciscan();
+
 	if (g_help) {
 		printf("%s\n", usage_str);
 		exit(0);
-- 
2.34.1

