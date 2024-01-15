Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6412E10E31C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jan 2024 15:45:10 +0000 (UTC)
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] benchmarks/gem_wsim: Option to list physical engines
Date: Mon, 15 Jan 2024 16:44:48 +0100
Message-Id: <20240115154448.29263-3-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240115154448.29263-1-marcin.bernatowicz@linux.intel.com>
References: <20240115154448.29263-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Added command line option (-l) to list physical engines.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 benchmarks/gem_wsim.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index e79d26513..aa70b1770 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -2924,6 +2924,7 @@ static void print_help(void)
 "  -f <scale>        Scale factor for batch durations.\n"
 "  -F <scale>        Scale factor for delays.\n"
 "  -L                List GPUs.\n"
+"  -l                List physical engines.\n"
 "  -D <gpu>          One of the GPUs from -L.\n"
 	);
 }
@@ -2983,10 +2984,42 @@ add_workload_arg(struct w_arg *w_args, unsigned int nr_args, char *w_arg,
 	return w_args;
 }
 
+static void list_engines(void)
+{
+	struct intel_engines *engines = query_engines();
+	int engine_class_count[NUM_ENGINE_CLASSES] = {};
+	unsigned int i;
+
+	for (i = 0; i < engines->nr_engines; ++i) {
+		igt_assert_lt(engines->engines[i].engine_class, NUM_ENGINE_CLASSES);
+		engine_class_count[engines->engines[i].engine_class]++;
+	}
+
+	for (i = 0; i < engines->nr_engines; ++i) {
+		if (engine_class_count[engines->engines[i].engine_class] > 1)
+			printf("%s%u",
+			       intel_engine_class_string(engines->engines[i].engine_class),
+			       engines->engines[i].engine_instance + 1);
+		else
+			printf("%s",
+			       intel_engine_class_string(engines->engines[i].engine_class));
+
+		if (is_xe && engines->engines[i].gt_id)
+			printf("-%u", engines->engines[i].gt_id);
+
+		if (verbose > 3)
+			printf(" [%d:%d:%d]", engines->engines[i].engine_class,
+			       engines->engines[i].engine_instance,
+			       engines->engines[i].gt_id);
+		printf("\n");
+	}
+}
+
 int main(int argc, char **argv)
 {
 	struct igt_device_card card = { };
 	bool list_devices_arg = false;
+	bool list_engines_arg = false;
 	unsigned int repeat = 1;
 	unsigned int clients = 1;
 	unsigned int flags = 0;
@@ -3009,11 +3042,14 @@ int main(int argc, char **argv)
 	master_prng = time(NULL);
 
 	while ((c = getopt(argc, argv,
-			   "LhqvsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
+			   "LlhqvsSdc:r:w:W:a:p:I:f:F:D:")) != -1) {
 		switch (c) {
 		case 'L':
 			list_devices_arg = true;
 			break;
+		case 'l':
+			list_engines_arg = true;
+			break;
 		case 'D':
 			device_arg = strdup(optarg);
 			break;
@@ -3134,6 +3170,11 @@ int main(int argc, char **argv)
 	if (is_xe)
 		xe_device_get(fd);
 
+	if (list_engines_arg) {
+		list_engines();
+		goto out;
+	}
+
 	if (!nr_w_args) {
 		wsim_err("No workload descriptor(s)!\n");
 		goto err;
-- 
2.31.1
