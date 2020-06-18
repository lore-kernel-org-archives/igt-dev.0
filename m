Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 18 Jun 2020 11:47:45 +0100
Message-Id: <20200618104747.24005-9-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
References: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 09/11] gem_wsim: Implement device selection
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

New command line options -L and -D <device> can respectively be used to
list and select a GPU when more than one is present.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 benchmarks/gem_wsim.c | 62 +++++++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 8788f752121b..59ddc798a3ea 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -43,6 +43,7 @@
 #include <pthread.h>
 #include <math.h>
 
+#include "igt_device_scan.h"
 #include "intel_chipset.h"
 #include "intel_reg.h"
 #include "drm.h"
@@ -2611,7 +2612,9 @@ static void print_help(void)
 "                    clients.\n"
 "  -d                Sync between data dependencies in userspace.\n"
 "  -f <scale>        Scale factor for batch durations.\n"
-"  -F <scale>        Scale factor for delays."
+"  -F <scale>        Scale factor for delays.\n"
+"  -L                List GPUs.\n"
+"  -D <gpu>          One of the GPUs from -L."
 	);
 }
 
@@ -2672,31 +2675,32 @@ int main(int argc, char **argv)
 	char *append_workload_arg = NULL;
 	struct w_arg *w_args = NULL;
 	unsigned int tolerance_pct = 1;
+	enum igt_devices_print_type printtype = IGT_PRINT_SIMPLE;
+	bool list_devices_arg = false;
 	int exitcode = EXIT_FAILURE;
+	struct igt_device_card card;
 	double scale_time = 1.0f;
 	double scale_dur = 1.0f;
+	char *device_arg = NULL;
 	int prio = 0;
 	double t;
-	int i, c;
+	int i, c, ret;
 	char *subopts, *value;
 	int raw_number = 0;
 	long calib_val;
 	int eng;
 
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
-			   "ThqvsSdc:n:r:w:W:a:t:p:I:f:F:")) != -1) {
+			   "LThqvsSdc:n:r:w:W:a:t:p:I:f:F:D:")) != -1) {
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
@@ -2820,6 +2824,33 @@ int main(int argc, char **argv)
 		}
 	}
 
+
+	igt_devices_scan(false);
+
+	if (list_devices_arg) {
+		igt_devices_print(printtype);
+		return EXIT_SUCCESS;
+	}
+
+	if (device_arg) {
+		ret = igt_device_card_match(device_arg, &card);
+		if (!ret) {
+			wsim_err("Requested device %s not found!\n", device_arg);
+			free(device_arg);
+
+			return EXIT_FAILURE;
+		}
+		free(device_arg);
+	} else {
+		igt_device_find_first_i915_discrete_card(&card);
+	}
+
+	if (card.render[0])
+		fd = igt_open_render(&card);
+	else
+		fd = __drm_open_driver_render(DRIVER_INTEL);
+	igt_require(fd);
+
 	if (!has_nop_calibration) {
 		if (verbose > 1) {
 			printf("Calibrating nop delays with %u%% tolerance...\n",
@@ -2932,15 +2963,12 @@ int main(int argc, char **argv)
 	clock_gettime(CLOCK_MONOTONIC, &t_start);
 
 	for (i = 0; i < clients; i++) {
-		int ret;
-
 		ret = pthread_create(&w[i]->thread, NULL, run_workload, w[i]);
 		igt_assert_eq(ret, 0);
 	}
 
 	if (master_workload >= 0) {
-		int ret = pthread_join(w[master_workload]->thread, NULL);
-
+		ret = pthread_join(w[master_workload]->thread, NULL);
 		igt_assert(ret == 0);
 
 		for (i = 0; i < clients; i++)
@@ -2949,7 +2977,7 @@ int main(int argc, char **argv)
 
 	for (i = 0; i < clients; i++) {
 		if (master_workload != i) {
-			int ret = pthread_join(w[i]->thread, NULL);
+			ret = pthread_join(w[i]->thread, NULL);
 			igt_assert(ret == 0);
 		}
 	}
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
