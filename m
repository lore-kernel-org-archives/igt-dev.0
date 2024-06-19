Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDB8C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 08:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2477D10E067;
	Wed, 19 Jun 2024 08:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iaYt3Agz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D98A10E067
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 08:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718786526; x=1750322526;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0beQ8AXEFgIeSg2BVNBKWy1op0WpYs/7f1MY5sBM0L8=;
 b=iaYt3Agzt9Hjlid3HhhwdBO71K0xKWNk7DseIl+wl5mD23iOJGCeXP3x
 ryF0EZowR9A23PwlfyK5D+XPhJMm8dUmhFMvgyL5f7wiunP5pvqGfYJNe
 x5wvutBtkHfO5MJlwvQTkFN00dwEkO/qo+0WIYMC9EQrYIIJELLYdbop1
 yI67rNCJCWKsx+11zOh+EOH2cTjzoKHCJWnlu9+erPO3vdgTMQlBDO74T
 OffSPDkgdRfL3KAX/5Xfi+uHdi1HEDAcKg9eZVQ33HEVRs421tvsCtQHU
 0MNjXVfvnBvuvrPue2hrWkrfI5DbqWJOYLXIAwy77c+RLTRGtkyEFSdUG A==;
X-CSE-ConnectionGUID: 1rWhCb7qSMmmWdN0k0nVgA==
X-CSE-MsgGUID: a+rfYSypQ2WB+H0uO56cmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="26834798"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="26834798"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 01:42:05 -0700
X-CSE-ConnectionGUID: CPAPXI09ShKl6RBiwNGbhA==
X-CSE-MsgGUID: 10I3YMhNRNmsxNogorpl5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; d="scan'208";a="46974702"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.231])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 01:42:03 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3] tools/lsgpu: Add switch to display gpu pci devices
Date: Wed, 19 Jun 2024 10:41:55 +0200
Message-Id: <20240619084155.266550-1-zbigniew.kempczynski@intel.com>
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
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
v2: Remove unnecessary variable
    Add pci-id and use codename only when is pretty
v3: Add class 0x38000 (Kamil)
    Add --pci-scan long opt
---
 tools/lsgpu.c | 93 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 91 insertions(+), 2 deletions(-)

diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index da84e20505..0d863c26ce 100644
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
@@ -92,6 +95,7 @@ static const char *usage_str =
 	"  -c, --codename              Print codename instead pretty device name\n"
 	"  -s, --print-simple          Print simple (legacy) device details\n"
 	"  -p, --print-details         Print devices with details\n"
+	"  -P, --pci-scan              Print pci display devices\n"
 	"  -v, --list-vendors          List recognized vendors\n"
 	"  -l, --list-filter-types     List registered device filters types\n"
 	"  -d, --device filter         Device filter, can be given multiple times\n"
@@ -158,6 +162,84 @@ static char *get_device_from_rc(void)
 	return rc_device;
 }
 
+static int pciscan(void)
+{
+	struct udev *udev;
+	struct udev_enumerate *enumerate;
+	struct udev_list_entry *devices, *dev_list_entry;
+	struct igt_device_card card;
+	char pcistr[10];
+	int ret;
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
+	ret = udev_enumerate_add_match_property(enumerate, "PCI_CLASS", "38000");
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
+		snprintf(pcistr, sizeof(pcistr), "%04x:%04x",
+			 card.pci_vendor, card.pci_device);
+		printf("  pci id     : %s\n", pcistr);
+		codename = igt_device_get_pretty_name(&card, false);
+		if (strcmp(pcistr, codename))
+			printf("  codename   : %s\n", codename);
+		free(codename);
+
+		udev_device_unref(udev_dev);
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
@@ -168,6 +250,7 @@ int main(int argc, char *argv[])
 		{"codename",          no_argument,       NULL, OPT_CODENAME},
 		{"print-simple",      no_argument,       NULL, OPT_PRINT_SIMPLE},
 		{"print-detail",      no_argument,       NULL, OPT_PRINT_DETAIL},
+		{"pci-scan",          no_argument,       NULL, OPT_PCISCAN},
 		{"list-vendors",      no_argument,       NULL, OPT_LIST_VENDORS},
 		{"list-filter-types", no_argument,       NULL, OPT_LIST_FILTERS},
 		{"device",            required_argument, NULL, OPT_DEVICE},
@@ -180,7 +263,7 @@ int main(int argc, char *argv[])
 			.type = IGT_PRINT_USER,
 	};
 
-	while ((c = getopt_long(argc, argv, "ncspvld:h",
+	while ((c = getopt_long(argc, argv, "ncspvld:hP",
 				long_options, &index)) != -1) {
 		switch(c) {
 
@@ -208,6 +291,9 @@ int main(int argc, char *argv[])
 		case OPT_HELP:
 			g_help = true;
 			break;
+		case OPT_PCISCAN:
+			g_pciscan = true;
+			break;
 		case 0:
 			fmt.option = IGT_PRINT_DRM;
 			break;
@@ -220,6 +306,9 @@ int main(int argc, char *argv[])
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

