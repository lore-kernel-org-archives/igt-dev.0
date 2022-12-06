Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC8A10E313
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 08:56:01 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 00:58:46 -0800
Message-Id: <20221206085849.271505-9-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
References: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 08/11] tools/intel_guc_logger: Limit
 relay logging output file to 4GB.
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

Because the GuC Log buffer header structure has a buffer-size
data type of 32 bits, let's make the output file size limit
a total of 4GB.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tools/intel_guc_logger.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index 38c50598..be09190c 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -68,7 +68,7 @@
 					 *  64K -> log events buffer     *
 					 */
 #define DEFAULT_POLL_TIMEOUT         2 /* default timeout of 2ms */
-#define DEFAULT_MAX_OUTPUT_SIZE      MB(4 * 1024) /* default to 4 GB max file size */
+#define DEFAULT_MAX_OUTPUT_SIZE_MB   (4 * 1024) /* default to 4 GB max file size */
 
 enum relay_cmd {
 	RELAY_CMD_DISABLE = 0,
@@ -104,7 +104,7 @@ struct global_t {
 	uint32_t usr_gt_id;
 	uint32_t avail_guc_mask;
 	char *out_filename;
-	uint64_t max_filesize;
+	long long max_filesize;
 	uint32_t test_duration;
 	int poll_timeout;
 	bool discard_oldlogs;
@@ -361,7 +361,7 @@ struct guc_log_buffer_state_2_0 {
 
 static bool file_reached_maxsize(struct global_t *gbl, struct guc_t *guc)
 {
-	if (gbl->max_filesize && MB(gbl->max_filesize) - guc->total_bytes_written <= 0)
+	if (gbl->max_filesize && (gbl->max_filesize - guc->total_bytes_written <= 0))
 		return true;
 
 	return false;
@@ -508,8 +508,7 @@ static bool write_extracted_data(struct global_t *gbl, struct guc_t *guc,
 		else
 			igt_info("wrote %d KB out to dat file\n", (copied / 1024));
 		if (file_reached_maxsize(gbl, guc)) {
-			igt_info("Reached target filesize of %" PRIu64 " bytes\n",
-				 MB(gbl->max_filesize));
+			igt_info("Reached target filesize of %lld bytes\n", gbl->max_filesize);
 			guc->stop_logging = true;
 		}
 		return true;
@@ -757,7 +756,10 @@ static int parse_options(int opt, int opt_index, void *ptr)
 	case 's':
 		data->max_filesize = atoll(optarg);
 		igt_assert_f(data->max_filesize > 0, "invalid input for -s option\n");
-		igt_debug("max allowed size of the output file is %lu MB\n", data->max_filesize);
+		if (data->max_filesize >= DEFAULT_MAX_OUTPUT_SIZE_MB)
+			data->max_filesize = DEFAULT_MAX_OUTPUT_SIZE_MB;
+		igt_debug("max allowed size of the output file is %lld MB\n", data->max_filesize);
+		data->max_filesize *= MB(1);
 		break;
 	case 'd':
 		data->discard_oldlogs = true;
@@ -794,7 +796,7 @@ static void process_command_line(int argc, char **argv, struct global_t *data)
 		"  -o --outputfile=name   name of the output file, including the location, where logs will be stored\n"
 		"  -t --testduration=sec  max duration in seconds for which the logger should run\n"
 		"  -p --polltimeout=ms    polling timeout in ms, -1 == indefinite wait for the new data\n"
-		"  -s --size=MB           max size of output file in MBs after which logging will be stopped\n"
+		"  -s --size=MB           max size of output file in MBs after which logging stops, default is 4GB\n"
 		"  -d --discard           discard the old/boot-time logs before entering into the capture loop\n"
 		"  -i --gt_id             GT-ID of GuC to capture from, defaults to capture from gt0\n";
 
@@ -816,6 +818,7 @@ int main(int argc, char **argv)
 	gbldata.verbosity    = DEFAULT_GUCLOG_VERBOSITY;
 	gbldata.usr_gt_id    = DEFAULT_GT_ID;
 	gbldata.poll_timeout = DEFAULT_POLL_TIMEOUT;
+	gbldata.max_filesize = DEFAULT_MAX_OUTPUT_SIZE_MB * MB(1);
 	gbldata.drmfd        = drm_open_driver_render(DRIVER_INTEL);
 	igt_assert(gbldata.drmfd != -1);
 
-- 
2.34.1
