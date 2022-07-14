Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966FBA1854
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jul 2022 04:17:45 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 14 Jul 2022 06:17:29 +0200
Message-Id: <20220714041733.19044-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220714041733.19044-1-zbigniew.kempczynski@intel.com>
References: <20220714041733.19044-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/6] lib/igt_device_scan: Introduce
 codename for platform selection
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

Platform rare is defined by single pci device id. Adding platform group
selection will make device selection more convenient. Now instead using

pci:vendor=8086,device=0x1927
pci:vendor=intel,device=0x1927

we may pass:

pci:vendor=8086,device=skylake
pci:vendor=intel,device=skylake

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_device_scan.c | 91 ++++++++++++++++++++++++++++++++++++++-----
 lib/igt_device_scan.h |  1 +
 2 files changed, 82 insertions(+), 10 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 83a488aa7c..0ff49f96b7 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -85,13 +85,13 @@
  *
  * - pci: select device using PCI slot or vendor and device properties
  *   |[<!-- language="plain" -->
- *   pci:[vendor=%04x/name][,device=%04x][,card=%d] | [slot=%04x:%02x:%02x.%x]
+ *   pci:[vendor=%04x/name][,device=%04x/codename][,card=%d] | [slot=%04x:%02x:%02x.%x]
  *   ]|
  *
  *   Filter allows device selection using vendor (hex or name), device id
- *   (hex) and nth-card from all matches. For example if there are 4 PCI cards
- *   installed (let two cards have 1234 and other two 1235 device id, all of
- *   them of vendor Intel) you can select one using:
+ *   (hex or codename) and nth-card from all matches. For example if there
+ *   are 4 PCI cards installed (let two cards have 1234 and other two 1235
+ *   device id, all of them of vendor Intel) you can select one using:
  *
  *   |[<!-- language="plain" -->
  *   pci:vendor=Intel,device=1234,card=0
@@ -117,6 +117,12 @@
  *
  *   It selects the second one.
  *
+ *   We may use device codename instead of pci device id:
+ *
+ *   |[<!-- language="plain" -->
+ *   pci:vendor=8086,device=skylake
+ *   ]|
+ *
  *   Another possibility is to select device using a PCI slot:
  *
  *   |[<!-- language="plain" -->
@@ -131,7 +137,7 @@
  *
  * - sriov: select pf or vf
  *   |[<!-- language="plain" -->
- *   sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]
+ *   sriov:[vendor=%04x/name][,device=%04x/codename][,card=%d][,pf=%d][,vf=%d]
  *   ]|
  *
  *   Filter extends pci selector to allow pf/vf selection:
@@ -205,6 +211,8 @@ struct igt_device {
 	char *pci_slot_name;
 	int gpu_index; /* For more than one GPU with same vendor and device. */
 
+	char *codename; /* For grouping by codename */
+
 	struct igt_list_head link;
 };
 
@@ -248,13 +256,30 @@ static char *devname_intel(uint16_t vendor, uint16_t device)
 	return s;
 }
 
+static char *codename_intel(uint16_t vendor, uint16_t device)
+{
+	const struct intel_device_info *info = intel_get_device_info(device);
+	char *codename = NULL;
+
+	if (info->codename) {
+		codename = strdup(info->codename);
+		igt_assert(codename);
+	}
+
+	if (!codename)
+		codename = devname_hex(vendor, device);
+
+	return codename;
+}
+
 static struct {
 	const char *name;
 	const char *vendor_id;
 	devname_fn devname;
+	devname_fn codename;
 } pci_vendor_mapping[] = {
-	{ "intel", "8086", devname_intel },
-	{ "amd", "1002", devname_hex },
+	{ "intel", "8086", devname_intel, codename_intel },
+	{ "amd", "1002", devname_hex, devname_hex },
 	{ NULL, },
 };
 
@@ -283,6 +308,20 @@ static devname_fn get_pci_vendor_device_fn(uint16_t vendor)
 	return devname_hex;
 }
 
+static devname_fn get_pci_vendor_device_codename_fn(uint16_t vendor)
+{
+	char vendorstr[5];
+
+	snprintf(vendorstr, sizeof(vendorstr), "%04x", vendor);
+
+	for (typeof(*pci_vendor_mapping) *vm = pci_vendor_mapping; vm->name; vm++) {
+		if (!strcasecmp(vendorstr, vm->vendor_id))
+			return vm->codename;
+	}
+
+	return devname_hex;
+}
+
 static void get_pci_vendor_device(const struct igt_device *dev,
 				  uint16_t *vendorp, uint16_t *devicep)
 {
@@ -305,6 +344,15 @@ static char *__pci_pretty_name(uint16_t vendor, uint16_t device, bool numeric)
 	return fn(vendor, device);
 }
 
+static char *__pci_codename(uint16_t vendor, uint16_t device)
+{
+	devname_fn fn;
+
+	fn = get_pci_vendor_device_codename_fn(vendor);
+
+	return fn(vendor, device);
+}
+
 /* Reading sysattr values can take time (even seconds),
  * we want to avoid reading such keys.
  */
@@ -514,8 +562,12 @@ static struct igt_device *igt_device_new_from_udev(struct udev_device *dev)
 	get_attrs(dev, idev);
 
 	if (is_pci_subsystem(idev)) {
+		uint16_t vendor, device;
+
 		set_vendor_device(idev);
 		set_pci_slot_name(idev);
+		get_pci_vendor_device(idev, &vendor, &device);
+		idev->codename = __pci_codename(vendor, device);
 	}
 
 	return idev;
@@ -558,6 +610,19 @@ static bool is_vendor_matched(struct igt_device *dev, const char *vendor)
 	return !strcasecmp(dev->vendor, vendor_id);
 }
 
+static bool is_device_matched(struct igt_device *dev, const char *device)
+{
+	if (!dev->device || !device)
+		return false;
+
+	/* First we compare device id, like 1926 */
+	if (!strcasecmp(dev->device, device))
+		return true;
+
+	/* Try codename */
+	return !strcasecmp(dev->codename, device);
+}
+
 static char *safe_strncpy(char *dst, const char *src, int n)
 {
 	char *s;
@@ -824,6 +889,7 @@ static void scan_drm_devices(void)
 
 static void igt_device_free(struct igt_device *dev)
 {
+	free(dev->codename);
 	free(dev->devnode);
 	free(dev->subsystem);
 	free(dev->syspath);
@@ -935,6 +1001,7 @@ igt_devs_print_simple(struct igt_list_head *view,
 			if (is_pci_subsystem(dev)) {
 				_pr_simple("vendor", dev->vendor);
 				_pr_simple("device", dev->device);
+				_pr_simple("codename", dev->codename);
 			}
 		}
 		printf("\n");
@@ -1022,7 +1089,10 @@ igt_devs_print_user(struct igt_list_head *view,
 			char *devname;
 
 			get_pci_vendor_device(pci_dev, &vendor, &device);
-			devname = __pci_pretty_name(vendor, device, fmt->numeric);
+			if (fmt->codename)
+				devname = __pci_codename(vendor, device);
+			else
+				devname = __pci_pretty_name(vendor, device, fmt->numeric);
 
 			__print_filter(filter, sizeof(filter), fmt, pci_dev,
 				       false);
@@ -1106,6 +1176,7 @@ igt_devs_print_detail(struct igt_list_head *view,
 		if (!is_drm_subsystem(dev)) {
 			_print_key_value("card device", dev->drm_card);
 			_print_key_value("render device", dev->drm_render);
+			_print_key_value("codename", dev->codename);
 		}
 
 		printf("\n[properties]\n");
@@ -1332,7 +1403,7 @@ static struct igt_list_head *filter_pci(const struct filter_class *fcls,
 			continue;
 
 		/* Skip if 'device' doesn't match */
-		if (filter->data.device && strcasecmp(filter->data.device, dev->device))
+		if (filter->data.device && !is_device_matched(dev, filter->data.device))
 			continue;
 
 		/* We get n-th card */
@@ -1412,7 +1483,7 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
 			continue;
 
 		/* Skip if 'device' doesn't match */
-		if (filter->data.device && strcasecmp(filter->data.device, dev->device))
+		if (filter->data.device && !is_device_matched(dev, filter->data.device))
 			continue;
 
 		/* We get n-th card */
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index 5f583a0666..e6b0f1b90a 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -50,6 +50,7 @@ struct igt_devices_print_format {
 	enum igt_devices_print_type   type;
 	enum igt_devices_print_option option;
 	bool numeric;
+	bool codename;
 };
 
 #define INTEGRATED_I915_GPU_PCI_ID "0000:00:02.0"
-- 
2.34.1
