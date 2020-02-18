Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D626E9F6
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2020 12:53:37 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Tue, 18 Feb 2020 13:53:33 +0100
Message-Id: <20200218125333.29250-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Check if device is not wedged while
 opening fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

In rare cases it is possible to use wedged device in testing,
what is causing to have false results. Let's abort any fd usage when
GPU is wedged. Use sysfs to check status to make any environment happy.

Signed-off-by: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/drmtest.c    |  1 +
 lib/igt_device.c | 20 ++++++++++++++++++++
 lib/igt_device.h |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 1fc39925..e770462e 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -476,6 +476,7 @@ int drm_open_driver(int chipset)
 		}
 	}
 
+	igt_fail_on_f(igt_device_is_wedged(fd), "Device is wedged.\n");
 	return fd;
 }
 
diff --git a/lib/igt_device.c b/lib/igt_device.c
index 07bb0a0d..e9d2d01e 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -236,3 +236,23 @@ struct pci_device *igt_device_get_pci_device(int fd)
 
 	return pci_dev;
 }
+
+/**
+ * igt_device_is_wedged:
+ * @fd: device fd
+ *
+ * Return true is device is wedged.
+ */
+bool igt_device_is_wedged(int fd)
+{
+	char file_name[20] = {0};
+	char buf[2];
+
+	strcat(file_name, "i915_wedged");
+	igt_debugfs_read(fd, "i915_wedged", buf);
+
+	if (!strstr(buf, "0"))
+		return true;
+
+	return false;
+}
diff --git a/lib/igt_device.h b/lib/igt_device.h
index 278ba7a9..cb3f9b94 100644
--- a/lib/igt_device.h
+++ b/lib/igt_device.h
@@ -34,4 +34,6 @@ void igt_device_drop_master(int fd);
 int igt_device_get_card_index(int fd);
 struct pci_device *igt_device_get_pci_device(int fd);
 
+bool igt_device_is_wedged(int fd);
+
 #endif /* __IGT_DEVICE_H__ */
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
