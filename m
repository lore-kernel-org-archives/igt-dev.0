Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5F510E304
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 08:56:00 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 00:58:41 -0800
Message-Id: <20221206085849.271505-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
References: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 03/11] tools/intel_guc_logger: Add GT-ID
 selection for intel_guc_logger
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

With the introduction of MTL and multi-tile products, add a new
cmd line param for users to select which GT to collect GuC relay
logs from.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tools/intel_guc_logger.c | 58 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index 356cde59..f694ff18 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -48,9 +48,12 @@
   #define PAGE_SIZE 4096
 #endif
 
-#define GLR_LOGLEVEL_NAME         "guc_log_level"
-#define GLR_CTL_NAME              "guc_log_relay_ctl"
-#define GLR_CHANNEL_NAME          "guc_log_relay_chan0"
+#define MAX_GTS                      4
+#define DEFAULT_GT_ID                0 /* default logging from GuC GT-0 */
+
+#define GLR_LOGLEVEL_NAME            "guc_log_level"
+#define GLR_CTL_NAME                 "guc_log_relay_ctl"
+#define GLR_CHANNEL_NAME             "guc_log_relay_chan0"
 
 #define DEFAULT_OUTPUT_FILE_NAME     "guc_log_dump" /*.dat suffic added later*/
 #define DEFAULT_GUCLOG_VERBOSITY     3 /* by default capture logs at max verbosity */
@@ -96,6 +99,8 @@ struct guc_t {
 struct global_t {
 	int drmfd;
 	int verbosity;
+	uint32_t usr_gt_id;
+	uint32_t avail_guc_mask;
 	char *out_filename;
 	uint64_t max_filesize;
 	uint32_t test_duration;
@@ -111,6 +116,23 @@ struct thread_t {
 /* only global instance needed for killing threads from main's signal handler */
 struct thread_t *gbl_thread_handle;
 
+static void get_avail_guc_mask(struct global_t *gbl)
+{
+	int i, fd;
+	char path[20];
+
+	/* Query the number of GTs with GuC based on debugfs paths */
+	for (i = 0; i < MAX_GTS; i++) {
+		sprintf(path, "gt%d/uc/guc_info", i);
+		fd = igt_debugfs_open(gbl->drmfd, path, O_RDONLY);
+		if (fd > 0) {
+			igt_debug("Found GUC at GT-ID-%d\n", i);
+			gbl->avail_guc_mask |= (1 << i);
+			close(fd);
+		}
+	}
+}
+
 static void get_guc_subbuf_info(struct thread_t *tdata)
 {
 	int fd, ret, j;
@@ -492,7 +514,7 @@ static int parse_options(int opt, int opt_index, void *ptr)
 	case 'o':
 		data->out_filename = strdup(optarg);
 		igt_assert_f(data->out_filename, "Couldn't allocate the o/p filename\n");
-		igt_debug("logs to be stored in file %s_G[GuC-ID]\n", data->out_filename);
+		igt_debug("logs to be stored in file %s_G[GT-ID]\n", data->out_filename);
 		break;
 	case 't':
 		data->test_duration = atoi(optarg);
@@ -515,6 +537,14 @@ static int parse_options(int opt, int opt_index, void *ptr)
 		data->discard_oldlogs = true;
 		igt_debug("old/boot-time logs will be discarded\n");
 		break;
+	case 'i':
+		data->usr_gt_id = atoi(optarg);
+		igt_assert_f((data->usr_gt_id >= 0) && (data->usr_gt_id < MAX_GTS),
+			     "invalid input for -i (GT-ID) option\n");
+		igt_assert_f((data->avail_guc_mask & BIT(data->usr_gt_id)),
+			     "Requested GT-ID-%d unavailable, avail-mask = 0x%08x\n",
+			     data->usr_gt_id, data->avail_guc_mask);
+		break;
 	}
 
 	return 0;
@@ -529,6 +559,7 @@ static void process_command_line(int argc, char **argv, struct global_t *data)
 		{"polltimeout", required_argument, 0, 'p'},
 		{"size", required_argument, 0, 's'},
 		{"discard", no_argument, 0, 'd'},
+		{"gt_id", required_argument, 0, 'i'},
 		{ 0, 0, 0, 0 }
 	};
 
@@ -538,9 +569,10 @@ static void process_command_line(int argc, char **argv, struct global_t *data)
 		"  -t --testduration=sec  max duration in seconds for which the logger should run\n"
 		"  -p --polltimeout=ms    polling timeout in ms, -1 == indefinite wait for the new data\n"
 		"  -s --size=MB           max size of output file in MBs after which logging will be stopped\n"
-		"  -d --discard           discard the old/boot-time logs before entering into the capture loop\n";
+		"  -d --discard           discard the old/boot-time logs before entering into the capture loop\n"
+		"  -i --gt_id             GT-ID of GuC to capture from, defaults to capture from gt0\n";
 
-	igt_simple_init_parse_opts(&argc, argv, "v:o:b:t:p:s:d", long_options,
+	igt_simple_init_parse_opts(&argc, argv, "v:o:b:t:p:s:d:i", long_options,
 				   help, parse_options, data);
 }
 
@@ -556,6 +588,7 @@ int main(int argc, char **argv)
 	/* setup global context */
 	memset(&gbldata, 0, sizeof(gbldata));
 	gbldata.verbosity    = DEFAULT_GUCLOG_VERBOSITY;
+	gbldata.usr_gt_id    = DEFAULT_GT_ID;
 	gbldata.poll_timeout = DEFAULT_POLL_TIMEOUT;
 	gbldata.drmfd        = drm_open_driver_render(DRIVER_INTEL);
 	igt_assert(gbldata.drmfd != -1);
@@ -567,10 +600,21 @@ int main(int argc, char **argv)
 
 	thread[0].global = &gbldata;
 	thread[0].guc = &gucdata[0];
-	get_guc_subbuf_info(&thread[0]);
 
+	get_avail_guc_mask(&gbldata);
+	igt_assert_f(gbldata.avail_guc_mask, "Can't detect any available GuC's");
+
+	get_guc_subbuf_info(&thread[0]);
 	process_command_line(argc, argv, &gbldata);
 
+	igt_assert_f((gbldata.avail_guc_mask & BIT(gbldata.usr_gt_id)),
+		     "GuC of GT-ID-%d not avail. Avail-Mask = 0x%08x. Use '-i' option!\n",
+		     gbldata.usr_gt_id, gbldata.avail_guc_mask);
+
+	gucdata[0].gt_id = gbldata.usr_gt_id;
+	sprintf(gucdata[0].fspath, "gt%d/uc", gbldata.usr_gt_id);
+	igt_info("Logging on GuC of GT_ID-%d\n", gbldata.usr_gt_id);
+
 	gbl_thread_handle = thread;
 
 	init_main_thread(&thread[0]);
-- 
2.34.1
