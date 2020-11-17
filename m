Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Tue, 17 Nov 2020 11:40:50 +0000
Message-Id: <20201117114050.302583-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] gem_wsim: Implement device selection
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

-L and -D <device> on the command line.

With no device specified tool tries to find i915 discrete or integrated in
that order.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 benchmarks/gem_wsim.c | 61 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 11 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index ecad4a8dcd22..f3567f7b9a0b 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -43,6 +43,7 @@
 #include <pthread.h>
 #include <math.h>
 
+#include "igt_device_scan.h"
 #include "intel_chipset.h"
 #include "intel_reg.h"
 #include "drm.h"
@@ -2520,7 +2521,9 @@ static void print_help(void)
 "                    clients.\n"
 "  -d                Sync between data dependencies in userspace.\n"
 "  -f <scale>        Scale factor for batch durations.\n"
-"  -F <scale>        Scale factor for delays."
+"  -F <scale>        Scale factor for delays.\n"
+"  -L                List GPUs.\n"
+"  -D <gpu>          One of the GPUs from -L.\n"
 	);
 }
 
@@ -2570,6 +2573,7 @@ add_workload_arg(struct w_arg *w_args, unsigned int nr_args, char *w_arg,
 
 int main(int argc, char **argv)
 {
+	bool list_devices_arg = false;
 	unsigned int repeat = 1;
 	unsigned int clients = 1;
 	unsigned int flags = 0;
@@ -2581,26 +2585,25 @@ int main(int argc, char **argv)
 	char *append_workload_arg = NULL;
 	struct w_arg *w_args = NULL;
 	int exitcode = EXIT_FAILURE;
+	struct igt_device_card card;
+	char *device_arg = NULL;
 	double scale_time = 1.0f;
 	double scale_dur = 1.0f;
 	int prio = 0;
 	double t;
 	int i, c, ret;
 
-	/*
-	 * Open the device via the low-level API so we can do the GPU quiesce
-	 * manually as close as possible in time to the start of the workload.
-	 * This minimizes the gap in engine utilization tracking when observed
-	 * via external tools like trace.pl.
-	 */
-	fd = __drm_open_driver_render(DRIVER_INTEL);
-	igt_require(fd);
-
 	master_prng = time(NULL);
 
 	while ((c = getopt(argc, argv,
-			   "hqvsSdc:r:w:W:a:p:I:f:F:")) != -1) {
+			   "LhqvsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
 		switch (c) {
+		case 'L':
+			list_devices_arg = true;
+			break;
+		case 'D':
+			device_arg = strdup(optarg);
+			break;
 		case 'W':
 			if (master_workload >= 0) {
 				wsim_err("Only one master workload can be given!\n");
@@ -2661,6 +2664,42 @@ int main(int argc, char **argv)
 		}
 	}
 
+	igt_devices_scan(false);
+
+	if (list_devices_arg) {
+		struct igt_devices_print_format fmt = {
+			.type = IGT_PRINT_USER,
+			.option = IGT_PRINT_DRM,
+		};
+
+		igt_devices_print(&fmt);
+
+		return EXIT_SUCCESS;
+	}
+
+	if (device_arg) {
+		ret = igt_device_card_match(device_arg, &card);
+		if (!ret) {
+			wsim_err("Requested device %s not found!\n",
+				 device_arg);
+			free(device_arg);
+
+			return EXIT_FAILURE;
+		}
+		free(device_arg);
+	} else {
+		ret = igt_device_find_first_i915_discrete_card(&card);
+		if (!ret)
+			ret = igt_device_find_integrated_card(&card);
+		if (!ret) {
+			wsim_err("No device filter specified and no discrete/integrated i915 devices found\n");
+			return EXIT_FAILURE;
+		}
+	}
+
+	fd = igt_open_card(&card);
+	igt_require(fd);
+
 	if (!nr_w_args) {
 		wsim_err("No workload descriptor(s)!\n");
 		goto err;
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
