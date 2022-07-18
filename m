Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD021AB45E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jul 2022 07:11:48 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Jul 2022 09:11:35 +0200
Message-Id: <20220718071140.20058-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220718071140.20058-1-zbigniew.kempczynski@intel.com>
References: <20220718071140.20058-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 1/6] lib/igt_device_scan: Migrate pci
 assignment
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

Core function of scanning drm devices is scan_drm_devices(). It goes
over all drm subsystem devices acquiring pci (parent) device from udev
during dedicated call for drm device.

Extending device selection to multi-gpu setup requires access to such
machine or simulate udev calls (really replace current udev calls to
say linker to use static versions of overridden udev functions).

Change migrates some core pci assignment to place where new igt_device is
registered. It doesn't change code logic, only place where initialization
is done making my simulation code happy.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_device_scan.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 5d98381f06..83a488aa7c 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -513,6 +513,11 @@ static struct igt_device *igt_device_new_from_udev(struct udev_device *dev)
 	get_props(dev, idev);
 	get_attrs(dev, idev);
 
+	if (is_pci_subsystem(idev)) {
+		set_vendor_device(idev);
+		set_pci_slot_name(idev);
+	}
+
 	return idev;
 }
 
@@ -671,10 +676,6 @@ static void update_or_add_parent(struct udev_device *dev,
 	parent_idev = igt_device_find(subsystem, syspath);
 	if (!parent_idev) {
 		parent_idev = igt_device_new_from_udev(parent_dev);
-		if (is_pci_subsystem(parent_idev)) {
-			set_vendor_device(parent_idev);
-			set_pci_slot_name(parent_idev);
-		}
 		igt_list_add_tail(&parent_idev->link, &igt_devs.all);
 	}
 	devname = udev_device_get_devnode(dev);
@@ -804,8 +805,8 @@ static void scan_drm_devices(void)
 		path = udev_list_entry_get_name(dev_list_entry);
 		udev_dev = udev_device_new_from_syspath(udev, path);
 		idev = igt_device_new_from_udev(udev_dev);
-		update_or_add_parent(udev_dev, idev);
 		igt_list_add_tail(&idev->link, &igt_devs.all);
+		update_or_add_parent(udev_dev, idev);
 
 		udev_device_unref(udev_dev);
 	}
-- 
2.34.1
