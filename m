Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Feb 2022 16:19:35 +0100
Message-Id: <20220218151935.31688-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_device: Add support for accessing
 unbound VF PCI devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The library provides igt_device_get_pci_device() function that allows to
get access to a PCI device from an open DRM device file descriptor.  It
can be used on VF devices as long as a DRM driver is bound to them.
However, SR-IOV tests may want to exercise VF PCI devices created by a PF
without binding any DRM driver to them.

While keeping the API of igt_device_get_pci_device() untouched, extend API
of its underlying helper __igt_device_get_pci_device() with an extra
argument for specifying VF ID of the requested PCI device and expose this
function as public.

While being at it, fix pci_system_cleanup() not called on errors and
instruct users to call it for symmetry when the obtained struct pci_device
is no longer needed.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_device.c | 44 ++++++++++++++++++++++++++++++++++++--------
 lib/igt_device.h |  1 +
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/lib/igt_device.c b/lib/igt_device.c
index 07bb0a0d41..56f66afc6f 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -149,9 +149,9 @@ struct igt_pci_addr {
 	unsigned int function;
 };
 
-static int igt_device_get_pci_addr(int fd, struct igt_pci_addr *pci)
+static int igt_device_get_pci_addr(int fd, unsigned int vf_id, struct igt_pci_addr *pci)
 {
-	char path[IGT_DEV_PATH_LEN];
+	char link[20], path[IGT_DEV_PATH_LEN];
 	char *buf;
 	int sysfs;
 	int len;
@@ -159,11 +159,21 @@ static int igt_device_get_pci_addr(int fd, struct igt_pci_addr *pci)
 	if (!igt_device_is_pci(fd))
 		return -ENODEV;
 
+	if (vf_id)
+		len = snprintf(link, sizeof(link), "device/virtfn%u", vf_id - 1);
+	else
+		len = snprintf(link, sizeof(link), "device");
+	if (igt_warn_on_f(len > sizeof(link) || link[len -1],
+	    "IGT bug: insufficient buffer space for rendering PCI device link name\n"))
+		return -ENOSPC;
+	else if (igt_debug_on_f(len < 0, "unexpected failure from snprintf()\n"))
+		return len;
+
 	sysfs = igt_sysfs_open(fd);
 	if (sysfs == -1)
 		return -ENOENT;
 
-	len = readlinkat(sysfs, "device", path, sizeof(path) - 1);
+	len = readlinkat(sysfs, link, path, sizeof(path) - 1);
 	close(sysfs);
 	if (len == -1)
 		return -ENOENT;
@@ -183,12 +193,25 @@ static int igt_device_get_pci_addr(int fd, struct igt_pci_addr *pci)
 	return 0;
 }
 
-static struct pci_device *__igt_device_get_pci_device(int fd)
+/**
+ * __igt_device_get_pci_device:
+ *
+ * @fd: DRM device file descriptor
+ * @vf_id: virtual function number (0 if native or PF)
+ *
+ * Looks up the graphics pci device using libpciaccess.
+ * Since pci_system_init() is called, users are expected to call pci_sytem_clenup() after use
+ * unless an error occurs and NULL is returned.
+ *
+ * Returns:
+ * The pci_device, NULL on any failures.
+ */
+struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id)
 {
 	struct igt_pci_addr pci_addr;
 	struct pci_device *pci_dev;
 
-	if (igt_device_get_pci_addr(fd, &pci_addr)) {
+	if (igt_device_get_pci_addr(fd, vf_id, &pci_addr)) {
 		igt_warn("Unable to find device PCI address\n");
 		return NULL;
 	}
@@ -206,15 +229,19 @@ static struct pci_device *__igt_device_get_pci_device(int fd)
 		igt_warn("Couldn't find PCI device %04x:%02x:%02x:%02x\n",
 			 pci_addr.domain, pci_addr.bus,
 			 pci_addr.device, pci_addr.function);
-		return NULL;
+		goto cleanup;
 	}
 
 	if (pci_device_probe(pci_dev)) {
 		igt_warn("Couldn't probe PCI device\n");
-		return NULL;
+		goto cleanup;
 	}
 
 	return pci_dev;
+
+cleanup:
+	pci_system_cleanup();
+	return NULL;
 }
 
 /**
@@ -223,6 +250,7 @@ static struct pci_device *__igt_device_get_pci_device(int fd)
  * @fd: the device
  *
  * Looks up the main graphics pci device using libpciaccess.
+ * Since pci_system_init() is called, users are expected to call pci_sytem_clenup() after use.
  *
  * Returns:
  * The pci_device, skips the test on any failures.
@@ -231,7 +259,7 @@ struct pci_device *igt_device_get_pci_device(int fd)
 {
 	struct pci_device *pci_dev;
 
-	pci_dev = __igt_device_get_pci_device(fd);
+	pci_dev = __igt_device_get_pci_device(fd, 0);
 	igt_require(pci_dev);
 
 	return pci_dev;
diff --git a/lib/igt_device.h b/lib/igt_device.h
index 278ba7a9b3..1aaa840e25 100644
--- a/lib/igt_device.h
+++ b/lib/igt_device.h
@@ -33,5 +33,6 @@ void igt_device_drop_master(int fd);
 
 int igt_device_get_card_index(int fd);
 struct pci_device *igt_device_get_pci_device(int fd);
+struct pci_device *__igt_device_get_pci_device(int fd, unsigned int vf_id);
 
 #endif /* __IGT_DEVICE_H__ */
-- 
2.25.1
