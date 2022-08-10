Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5F1F0556
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Aug 2022 08:20:06 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 10 Aug 2022 10:19:49 +0200
Message-Id: <20220810081949.17706-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_device_scan: Rescan pci properties
 if PCI_SLOT_NAME wasn't found
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

References: https://gitlab.freedesktop.org/drm/intel/-/issues/6543

Due to lack of reproduction path of the above issue more data about
missing PCI_SLOT_NAME property is required.

What is extremely weird when PCI_SLOT_NAME is missing udev returns some
properties, like:

[properties]
DEVPATH                         : /devices/pci0000:00/0000:00:02.0
DRIVER                          : i915
PCI_CLASS                       : 30000
PCI_ID                          : 8086:191E
SUBSYSTEM                       : pci

To narrow the problematic code when PCI_SLOT_NAME is missing lets dump
kernel uevent file and retry scanning properties from udev. Retry path
allows to detect if udev returns same list of properties.

Above doesn't fix the issue. It is providing additional information about
devices and their properties provided from udev, especially when missing
PCI_SLOT_NAME will strike again. It also contains warning which might
detect situation where two scanning of properties will provide different
results.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/igt_device_scan.c | 48 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index d6fae0650c..c2ecfcd3d4 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -568,28 +568,54 @@ static void dump_props_and_attrs(const struct igt_device *dev)
 	printf("\n");
 }
 
+static void dump_uevent_file(struct igt_device *dev)
+{
+	char filename[FILENAME_MAX];
+	const char *devpath = get_prop(dev, "DEVPATH");
+	char *line = NULL;
+	FILE *in;
+	size_t n;
+
+	igt_assert_f(devpath, "DEVPATH property doesn't exist\n");
+	snprintf(filename, FILENAME_MAX, "/sys%s/uevent", devpath);
+
+	in = fopen(filename, "r");
+	igt_assert(in);
+
+	printf("[uevent: %s]\n", filename);
+	while (getline(&line, &n, in) >= 0)
+		printf("%s", line);
+
+	free(line);
+	fclose(in);
+}
+
 /*
  * Get PCI_SLOT_NAME property, it should be in format of
  * xxxx:yy:zz.z
  */
-static void set_pci_slot_name(struct igt_device *dev)
+static bool set_pci_slot_name(struct igt_device *dev)
 {
 	const char *pci_slot_name = get_prop(dev, "PCI_SLOT_NAME");
 	int len;
 
 	if (!pci_slot_name) {
 		dump_props_and_attrs(dev);
-		igt_assert_f(pci_slot_name, "PCI_SLOT_NAME property == NULL\n");
+		igt_warn("PCI_SLOT_NAME property == NULL\n");
+		dump_uevent_file(dev);
+		return false;
 	}
 
 	len = strlen(pci_slot_name);
 	if (len != PCI_SLOT_NAME_SIZE) {
 		dump_props_and_attrs(dev);
-		igt_assert_f(len != PCI_SLOT_NAME_SIZE,
-			     "PCI_SLOT_NAME length != %d [%s]\n", len, pci_slot_name);
+		igt_warn("PCI_SLOT_NAME length != %d [%s]\n", len, pci_slot_name);
+		dump_uevent_file(dev);
+		return false;
 	}
 
 	dev->pci_slot_name = strdup(pci_slot_name);
+	return true;
 }
 
 /*
@@ -649,7 +675,16 @@ static struct igt_device *igt_device_new_from_udev(struct udev_device *dev)
 		uint16_t vendor, device;
 
 		set_vendor_device(idev);
-		set_pci_slot_name(idev);
+
+		/*
+		 * Very rare we observe there's no PCI_SLOT_NAME property.
+		 * We depend on it so retry acquiring properties from udev.
+		 */
+		if (!set_pci_slot_name(idev)) {
+			g_hash_table_remove_all(idev->props_ht);
+			get_props(dev, idev);
+			igt_assert(set_pci_slot_name(idev));
+		}
 		get_pci_vendor_device(idev, &vendor, &device);
 		idev->codename = __pci_codename(vendor, device);
 		idev->dev_type = __pci_devtype(vendor, device, idev->pci_slot_name);
@@ -1270,7 +1305,8 @@ igt_devs_print_detail(struct igt_list_head *view,
 			_print_key_value("codename", dev->codename);
 		}
 
-		dump_props_and_attrs(dev);
+		if (is_pci_subsystem(dev))
+			dump_props_and_attrs(dev);
 	}
 }
 
-- 
2.34.1
