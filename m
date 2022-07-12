Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2129993F9B
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jul 2022 09:57:35 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Jul 2022 11:57:06 +0200
Message-Id: <20220712095707.22168-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220712095707.22168-1-zbigniew.kempczynski@intel.com>
References: <20220712095707.22168-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 5/6] lib/igt_device_scan: Add
 discrete/integrated pseudo-codenames
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

For simply selection where test should just run on dedicated card type
pci + sriov selectors can now use:

pci:vendor=8086,device=integrated
pci:vendor=intel,device=integrated

or

pci:vendor=8086,device=discrete
pci:vendor=intel,device=discrete

or (when there're more discrete cards)

pci:vendor=8086,device=discrete,card=n
pci:vendor=intel,device=discrete,card=n

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_device_scan.c | 75 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 3 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 044bb75c6a..5566e028d1 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -118,12 +118,19 @@
  *
  *   It selects the second one.
  *
- *   We may use device codename instead pci device id:
+ *   We may use device codename or pseudo-codename (integrated/discrete)
+ *   instead pci device id:
  *
  *   |[<!-- language="plain" -->
  *   pci:vendor=8086,device=skylake
  *   ]|
  *
+ *   or
+ *
+ *   |[<!-- language="plain" -->
+ *   pci:vendor=8086,device=integrated
+ *   ]|
+ *
  *   Another possibility is to select device using a PCI slot:
  *
  *   |[<!-- language="plain" -->
@@ -179,6 +186,15 @@
 #define DBG(...) {}
 #endif
 
+enum dev_type {
+	DEVTYPE_ALL,
+	DEVTYPE_INTEGRATED,
+	DEVTYPE_DISCRETE,
+};
+
+#define STR_INTEGRATED "integrated"
+#define STR_DISCRETE "discrete"
+
 static inline bool strequal(const char *a, const char *b)
 {
 	if (a == NULL || b == NULL)
@@ -213,6 +229,7 @@ struct igt_device {
 	int gpu_index; /* For more than one GPU with same vendor and device. */
 
 	char *codename; /* For grouping by codename */
+	enum dev_type dev_type; /* For grouping by integrated/discrete */
 
 	struct igt_list_head link;
 };
@@ -225,6 +242,7 @@ static struct {
 } igt_devs;
 
 typedef char *(*devname_fn)(uint16_t, uint16_t);
+typedef enum dev_type (*devtype_fn)(uint16_t, uint16_t, const char *);
 
 static char *devname_hex(uint16_t vendor, uint16_t device)
 {
@@ -273,14 +291,35 @@ static char *codename_intel(uint16_t vendor, uint16_t device)
 	return codename;
 }
 
+static enum dev_type devtype_intel(uint16_t vendor, uint16_t device, const char *pci_slot)
+{
+	(void) vendor;
+	(void) device;
+
+	if (!strncmp(pci_slot, INTEGRATED_I915_GPU_PCI_ID, PCI_SLOT_NAME_SIZE))
+		return DEVTYPE_INTEGRATED;
+
+	return DEVTYPE_DISCRETE;
+}
+
+static enum dev_type devtype_all(uint16_t vendor, uint16_t device, const char *pci_slot)
+{
+	(void) vendor;
+	(void) device;
+	(void) pci_slot;
+
+	return DEVTYPE_ALL;
+}
+
 static struct {
 	const char *name;
 	const char *vendor_id;
 	devname_fn devname;
 	devname_fn codename;
+	devtype_fn devtype;
 } pci_vendor_mapping[] = {
-	{ "intel", "8086", devname_intel, codename_intel },
-	{ "amd", "1002", devname_hex, devname_hex },
+	{ "intel", "8086", devname_intel, codename_intel, devtype_intel },
+	{ "amd", "1002", devname_hex, devname_hex, devtype_all },
 	{ NULL, },
 };
 
@@ -323,6 +362,20 @@ static devname_fn get_pci_vendor_device_codename_fn(uint16_t vendor)
 	return devname_hex;
 }
 
+static devtype_fn get_pci_vendor_device_devtype_fn(uint16_t vendor)
+{
+	char vendorstr[5];
+
+	snprintf(vendorstr, sizeof(vendorstr), "%04x", vendor);
+
+	for (typeof(*pci_vendor_mapping) *vm = pci_vendor_mapping; vm->name; vm++) {
+		if (!strcasecmp(vendorstr, vm->vendor_id))
+			return vm->devtype;
+	}
+
+	return devtype_all;
+}
+
 static void get_pci_vendor_device(const struct igt_device *dev,
 				  uint16_t *vendorp, uint16_t *devicep)
 {
@@ -354,6 +407,15 @@ static char *__pci_codename(uint16_t vendor, uint16_t device)
 	return fn(vendor, device);
 }
 
+static enum dev_type __pci_devtype(uint16_t vendor, uint16_t device, const char *pci_slot)
+{
+	devtype_fn fn;
+
+	fn = get_pci_vendor_device_devtype_fn(vendor);
+
+	return fn(vendor, device, pci_slot);
+}
+
 /* Reading sysattr values can take time (even seconds),
  * we want to avoid reading such keys.
  */
@@ -569,6 +631,7 @@ static struct igt_device *igt_device_new_from_udev(struct udev_device *dev)
 		set_pci_slot_name(idev);
 		get_pci_vendor_device(idev, &vendor, &device);
 		idev->codename = __pci_codename(vendor, device);
+		idev->dev_type = __pci_devtype(vendor, device, idev->pci_slot_name);
 	}
 
 	return idev;
@@ -620,6 +683,12 @@ static bool is_device_matched(struct igt_device *dev, const char *device)
 	if (!strcasecmp(dev->device, device))
 		return true;
 
+	/* Try "integrated" and "discrete" */
+	if (dev->dev_type == DEVTYPE_INTEGRATED && !strcasecmp(device, STR_INTEGRATED))
+		return true;
+	else if (dev->dev_type == DEVTYPE_DISCRETE && !strcasecmp(device, STR_DISCRETE))
+		return true;
+
 	/* Try codename */
 	return !strcasecmp(dev->codename, device);
 }
-- 
2.34.1
