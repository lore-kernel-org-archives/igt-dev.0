Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Feb 2022 12:41:05 +0100
Message-Id: <20220222114106.75641-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20220222114106.75641-1-janusz.krzysztofik@linux.intel.com>
References: <20220222114106.75641-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_device: Add support for
 accessing unbound VF PCI devices
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>
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

v2: refresh on top of IGT libpciaccess wrappers and drop previously added
    but no longer needed error unwind path and recommendations for users
    on calling pci_system_cleanup() after use (Chris),
  - fix incorrect validation of snprintf() result and misaligned
    formatting of igt_warn_on_f() arguments.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
---
 lib/igt_device.c | 34 ++++++++++++++++++++++++++++------
 lib/igt_device.h |  1 +
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/lib/igt_device.c b/lib/igt_device.c
index c50bf4a1f7..1603bf351c 100644
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
+	if (igt_warn_on_f(len >= sizeof(link),
+			  "IGT bug: insufficient buffer space for rendering PCI device link name\n"))
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
@@ -183,12 +193,24 @@ static int igt_device_get_pci_addr(int fd, struct igt_pci_addr *pci)
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
@@ -231,7 +253,7 @@ struct pci_device *igt_device_get_pci_device(int fd)
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
