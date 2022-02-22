Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Feb 2022 12:41:04 +0100
Message-Id: <20220222114106.75641-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: Use safe wrappers around
 libpciaccess initialization functions
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

Multiple calls to igt functions using pci_system_init() provided by
libpciaccess result in memory leaking if not followed by its counterpart
pci_system_cleanup() before next use.  On the other hand, calling
pci_system_cleanup() can affect other users which still depend on global
data initialized by pci_system_init().

Introduce safe IGT wrappers around those libpciaccess functions and use
those wrappers in IGT library and tests.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
---
 lib/igt_core.c      | 20 ++++++++++++++++++++
 lib/igt_core.h      | 28 ++++++++++++++++++++++++++++
 lib/igt_device.c    |  2 +-
 lib/intel_chipset.c |  2 +-
 4 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index ab27a24d5a..88e2f7d01e 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3070,3 +3070,23 @@ err:
 
 	return -1;
 }
+
+/* IGT wrappers around libpciaccess init/cleanup functions */
+
+static void pci_system_exit_handler(int sig)
+{
+	pci_system_cleanup();
+}
+
+static void __pci_system_init(void)
+{
+	if (!igt_warn_on_f(pci_system_init(), "Could not initialize libpciaccess global data\n"))
+		igt_install_exit_handler(pci_system_exit_handler);
+}
+
+int igt_pci_system_init(void)
+{
+	static pthread_once_t pci_system_init_once_control = PTHREAD_ONCE_INIT;
+
+	return pthread_once(&pci_system_init_once_control, __pci_system_init);
+}
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 0aad161da5..78dc6202ce 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1452,4 +1452,32 @@ void igt_kmsg(const char *format, ...);
 
 #define for_if(expr__) if (!(expr__)) {} else
 
+/**
+ * igt_pci_system_init:
+ * IGT wrapper around pci_system_init()
+ *
+ * Runs pci_system_init() and installs pci_system_cleanup() as IGT exit handler when
+ * called first per thread, subsequent calls are noop.  Tests should use this wrapper
+ * instead of pci_system_init() to avoid memory leaking which happens each time a call
+ * to pci_system_init() is repeated not preceded by pci_system_cleanup() (may easily
+ * happen in consequence of long jumps performed by IGT flow control functions).
+ *
+ * Return value: equal return value of pthread_once() (return value of pci_system_init()
+ *		 can't be passed through pthread_once())
+ */
+int igt_pci_system_init(void);
+
+/**
+ * igt_pci_system_cleanup():
+ * IGT replacement for pci_system_cleanup()
+ *
+ * For use in IGT library and tests to avoid destroying libpciaccess global data.
+ * Direct calls to pci_system_cleanup() should be either dropped or replaced with this
+ * wrapper (for code clarity), otherwise subsequent access to libpciaccess global data
+ * may be lost unless preceded by direct call to pci_system_init() (not recommended).
+ */
+static inline void igt_pci_system_cleanup(void)
+{
+}
+
 #endif /* IGT_CORE_H */
diff --git a/lib/igt_device.c b/lib/igt_device.c
index 07bb0a0d41..c50bf4a1f7 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -193,7 +193,7 @@ static struct pci_device *__igt_device_get_pci_device(int fd)
 		return NULL;
 	}
 
-	if (pci_system_init()) {
+	if (igt_pci_system_init()) {
 		igt_warn("Couldn't initialize PCI system\n");
 		return NULL;
 	}
diff --git a/lib/intel_chipset.c b/lib/intel_chipset.c
index 4748a3fb85..efb6f17714 100644
--- a/lib/intel_chipset.c
+++ b/lib/intel_chipset.c
@@ -75,7 +75,7 @@ intel_get_pci_device(void)
 	struct pci_device *pci_dev;
 	int error;
 
-	error = pci_system_init();
+	error = igt_pci_system_init();
 	igt_fail_on_f(error != 0,
 		      "Couldn't initialize PCI system\n");
 
-- 
2.25.1
