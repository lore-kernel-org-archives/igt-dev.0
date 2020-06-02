Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B476E145
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2020 11:14:31 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 2 Jun 2020 14:13:30 +0300
Message-ID: <20200602111330.910039-4-arkadiusz.hiler@intel.com>
In-Reply-To: <20200602111330.910039-1-arkadiusz.hiler@intel.com>
References: <20200602111330.910039-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] tools/intel_gpu_top: Add support of
 discrete GPU and card selection
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
Cc: Petri Latvala <petri.latvala@intel.com>, Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>

In intel_gpu_top device path was hard coded for integrated GPU.

With this patch we:
 * use igt_device_scan library for device scanning,
 * make discrete GPU the default one,
 * provided options for card selection.

v2:
 * explicitly set ret to EXIT_SUCCESS after all the other uses
 * fix use after free of opt_device (Tvrtko)
 * use EXIT_FAILURE instead of "1" (Tvrtko)

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 man/intel_gpu_top.rst |  29 +++++++++-
 tools/Makefile.am     |   2 +-
 tools/intel_gpu_top.c | 130 ++++++++++++++++++++++++++++++++++++------
 tools/meson.build     |   2 +-
 4 files changed, 143 insertions(+), 20 deletions(-)

diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
index d487baca..5552e969 100644
--- a/man/intel_gpu_top.rst
+++ b/man/intel_gpu_top.rst
@@ -7,9 +7,9 @@ Display a top-like summary of Intel GPU usage
 ---------------------------------------------
 .. include:: defs.rst
 :Author: IGT Developers <igt-dev@lists.freedesktop.org>
-:Date: 2019-02-08
+:Date: 2020-03-18
 :Version: |PACKAGE_STRING|
-:Copyright: 2009,2011,2012,2016,2018,2019 Intel Corporation
+:Copyright: 2009,2011,2012,2016,2018,2019,2020 Intel Corporation
 :Manual section: |MANUAL_SECTION|
 :Manual group: |MANUAL_GROUP|
 
@@ -43,6 +43,31 @@ OPTIONS
 
 -s <ms>
     Refresh period in milliseconds.
+-L
+    List available GPUs on the platform.
+-d
+    Select a specific GPU using supported filter.
+
+
+DEVICE SELECTION
+================
+
+User can select specific GPU for performance monitoring on platform where multiple GPUs are available.
+A GPU can be selected by sysfs path, drm node or using various PCI sub filters.
+
+Filter types: ::
+
+    ---
+    filter   syntax
+    ---
+    sys      sys:/sys/devices/pci0000:00/0000:00:02.0
+             find device by its sysfs path
+
+    drm      drm:/dev/dri/* path
+             find drm device by /dev/dri/* node
+
+    pci      pci:[vendor=%04x/name][,device=%04x][,card=%d]
+             vendor is hex number or vendor name
 
 LIMITATIONS
 ===========
diff --git a/tools/Makefile.am b/tools/Makefile.am
index 9352b41c..f97f9e08 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -24,4 +24,4 @@ AM_CFLAGS = $(DEBUG_CFLAGS) $(DRM_CFLAGS) $(PCIACCESS_CFLAGS) $(CWARNFLAGS) \
 LDADD = $(top_builddir)/lib/libintel_tools.la
 AM_LDFLAGS = -Wl,--as-needed
 
-intel_gpu_top_LDADD = $(top_builddir)/lib/libigt_perf.la
+intel_gpu_top_LDADD = $(top_builddir)/lib/libigt_perf.la $(top_builddir)/lib/libigt_device_scan.la $(LIBUDEV_LIBS) $(GLIB_LIBS)
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 8197482d..2072a3a2 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -21,6 +21,8 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include "igt_device_scan.h"
+
 #include <stdio.h>
 #include <sys/types.h>
 #include <dirent.h>
@@ -94,7 +96,16 @@ struct engines {
 	struct pmu_counter imc_reads;
 	struct pmu_counter imc_writes;
 
+	bool discrete;
+	char *device;
+
+	/* Do not edit below this line.
+	 * This structure is reallocated every time a new engine is
+	 * found and size is increased by sizeof (engine).
+	 */
+
 	struct engine engine;
+
 };
 
 static uint64_t
@@ -168,14 +179,20 @@ static int engine_cmp(const void *__a, const void *__b)
 		return a->instance - b->instance;
 }
 
-static struct engines *discover_engines(void)
+#define is_igpu_pci(x) (strcmp(x, "0000:00:02.0") == 0)
+#define is_igpu(x) (strcmp(x, "i915") == 0)
+
+static struct engines *discover_engines(char *device)
 {
-	const char *sysfs_root = "/sys/devices/i915/events";
+	char sysfs_root[PATH_MAX];
 	struct engines *engines;
 	struct dirent *dent;
 	int ret = 0;
 	DIR *d;
 
+	snprintf(sysfs_root, sizeof(sysfs_root),
+		 "/sys/devices/%s/events", device);
+
 	engines = malloc(sizeof(struct engines));
 	if (!engines)
 		return NULL;
@@ -183,6 +200,8 @@ static struct engines *discover_engines(void)
 	memset(engines, 0, sizeof(*engines));
 
 	engines->num_engines = 0;
+	engines->device = device;
+	engines->discrete = !is_igpu(device);
 
 	d = opendir(sysfs_root);
 	if (!d)
@@ -497,7 +516,7 @@ static int pmu_init(struct engines *engines)
 	}
 
 	engines->rapl_fd = -1;
-	if (rapl_type_id()) {
+	if (!engines->discrete && rapl_type_id()) {
 		engines->rapl_scale = rapl_gpu_power_scale();
 		engines->rapl_unit = rapl_gpu_power_unit();
 		if (!engines->rapl_unit)
@@ -695,8 +714,11 @@ usage(const char *appname)
 		"\t[-l]            List plain text data.\n"
 		"\t[-o <file|->]   Output to specified file or '-' for standard out.\n"
 		"\t[-s <ms>]       Refresh period in milliseconds (default %ums).\n"
+		"\t[-L]            List all cards.\n"
+		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
 		"\n",
 		appname, DEFAULT_PERIOD_MS);
+	igt_device_print_filter_types();
 }
 
 static enum {
@@ -1082,13 +1104,18 @@ print_header(struct engines *engines, double t,
 	if (output_mode == INTERACTIVE) {
 		printf("\033[H\033[J");
 
-		if (lines++ < con_h)
-			printf("intel-gpu-top - %s/%s MHz;  %s%% RC6; %s %s; %s irqs/s\n",
-			       freq_items[1].buf, freq_items[0].buf,
-			       rc6_items[0].buf, power_items[0].buf,
-			       engines->rapl_unit,
-			       irq_items[0].buf);
-
+		if (lines++ < con_h) {
+			if (!engines->discrete)
+				printf("intel-gpu-top - %s/%s MHz;  %s%% RC6; %s %s; %s irqs/s\n",
+					freq_items[1].buf, freq_items[0].buf,
+					rc6_items[0].buf, power_items[0].buf,
+					engines->rapl_unit,
+					irq_items[0].buf);
+			else
+				printf("intel-gpu-top - %s/%s MHz;  %s%% RC6; %s irqs/s\n",
+					freq_items[1].buf, freq_items[0].buf,
+					rc6_items[0].buf, irq_items[0].buf);
+		}
 		if (lines++ < con_h)
 			printf("\n");
 	}
@@ -1249,6 +1276,33 @@ static void sigint_handler(int  sig)
 	stop_top = true;
 }
 
+/* tr_pmu_name()
+ *
+ * Transliterate pci_slot_id to sysfs device name entry for discrete GPU.
+ * Discrete GPU PCI ID   ("xxxx:yy:zz.z")       device = "i915_xxxx_yy_zz.z".
+ */
+static char *tr_pmu_name(struct igt_device_card *card)
+{
+	int ret;
+	const int bufsize = 18;
+	char *buf, *device = NULL;
+
+	assert(card->pci_slot_name[0]);
+
+	device = malloc(bufsize);
+	assert(device);
+
+	ret = snprintf(device, bufsize, "i915_%s", card->pci_slot_name);
+	assert(ret == (bufsize-1));
+
+	buf = device;
+	for (; *buf; buf++)
+		if (*buf == ':')
+			*buf = '_';
+
+	return device;
+}
+
 int main(int argc, char **argv)
 {
 	unsigned int period_us = DEFAULT_PERIOD_MS * 1000;
@@ -1256,10 +1310,14 @@ int main(int argc, char **argv)
 	char *output_path = NULL;
 	struct engines *engines;
 	unsigned int i;
-	int ret, ch;
+	int ret = 0, ch;
+	bool list_device = false;
+	enum igt_devices_print_type printtype = IGT_PRINT_SIMPLE;
+	char *pmu_device, *opt_device = NULL;
+	struct igt_device_card card;
 
 	/* Parse options */
-	while ((ch = getopt(argc, argv, "o:s:Jlh")) != -1) {
+	while ((ch = getopt(argc, argv, "o:s:d:JLlh")) != -1) {
 		switch (ch) {
 		case 'o':
 			output_path = optarg;
@@ -1267,9 +1325,15 @@ int main(int argc, char **argv)
 		case 's':
 			period_us = atoi(optarg) * 1000;
 			break;
+		case 'd':
+			opt_device = strdup(optarg);
+			break;
 		case 'J':
 			output_mode = JSON;
 			break;
+		case 'L':
+			list_device = true;
+			break;
 		case 'l':
 			output_mode = STDOUT;
 			break;
@@ -1320,21 +1384,50 @@ int main(int argc, char **argv)
 		break;
 	};
 
-	engines = discover_engines();
+	igt_devices_scan(false);
+
+	if (list_device) {
+		igt_devices_print(printtype);
+		goto exit;
+	}
+
+	if (opt_device != NULL) {
+		ret = igt_device_card_match(opt_device, &card);
+		if (!ret) {
+			fprintf(stderr, "Requested device %s not found!\n", opt_device);
+			free(opt_device);
+			ret = EXIT_FAILURE;
+			goto exit;
+		}
+		free(opt_device);
+	} else {
+		igt_device_find_first_discrete_card(&card);
+	}
+
+	if (card.pci_slot_name[0] && !is_igpu_pci(card.pci_slot_name))
+		pmu_device = tr_pmu_name(&card);
+	else
+		pmu_device = strdup("i915");
+
+	engines = discover_engines(pmu_device);
 	if (!engines) {
 		fprintf(stderr,
 			"Failed to detect engines! (%s)\n(Kernel 4.16 or newer is required for i915 PMU support.)\n",
 			strerror(errno));
-		return 1;
+		ret = EXIT_FAILURE;
+		goto err;
 	}
 
 	ret = pmu_init(engines);
 	if (ret) {
 		fprintf(stderr,
 			"Failed to initialize PMU! (%s)\n", strerror(errno));
-		return 1;
+		ret = EXIT_FAILURE;
+		goto err;
 	}
 
+	ret = EXIT_SUCCESS;
+
 	pmu_sample(engines);
 
 	while (!stop_top) {
@@ -1384,5 +1477,10 @@ int main(int argc, char **argv)
 		usleep(period_us);
 	}
 
-	return 0;
+err:
+	free(engines);
+	free(pmu_device);
+exit:
+	igt_devices_free();
+	return ret;
 }
diff --git a/tools/meson.build b/tools/meson.build
index 59b56d5d..34f95e79 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -93,7 +93,7 @@ install_subdir('registers', install_dir : datadir,
 executable('intel_gpu_top', 'intel_gpu_top.c',
 	   install : true,
 	   install_rpath : bindir_rpathdir,
-	   dependencies : lib_igt_perf)
+	   dependencies : [lib_igt_perf,lib_igt_device_scan])
 
 executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
 	   dependencies : [tool_deps],
-- 
2.25.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
