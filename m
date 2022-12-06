Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B4810E304
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 08:56:01 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 00:58:48 -0800
Message-Id: <20221206085849.271505-11-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
References: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 10/11] tools/intel_guc_logger: On exit,
 save any leftover GuC log data
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

On exit, trigger the kernel, via debugfs, to flush any leftover GuC
log data so we can receive and save that into the end of the
output file using existing helper function.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tools/intel_guc_logger.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index 7243ad43..8bea2b4b 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -224,7 +224,7 @@ static void guc_log_control(struct thread_t *tdata, enum relay_cmd cmd)
 		igt_assert_f(tdata->guc->control_fd >= 0, "Can't open GuC log relay-ctl file\n");
 	}
 
-	if (tdata->guc->control_fd) {
+	if (tdata->guc->control_fd && cmd > RELAY_CMD_DISABLE) {
 		ret = asprintf(&str, "0x%" PRIx64, (unsigned long)cmd);
 		igt_assert_neq(ret, -1);
 		ret = write(tdata->guc->control_fd, str, ret);
@@ -254,7 +254,10 @@ static void int_sig_handler(int sig)
 		gbl_thread_handle[0].guc->stop_logging = true;
 }
 
-static void pull_leftover_data(struct thread_t *tdata)
+static bool write_extracted_data(struct global_t *gbl, struct guc_t *guc,
+				 char *inptr, int subbuf_size);
+
+static void pull_leftover_data(struct thread_t *tdata, bool save_it)
 {
 	struct guc_t *guc = tdata->guc;
 	unsigned int bytes_read = 0;
@@ -275,12 +278,8 @@ static void pull_leftover_data(struct thread_t *tdata)
 			igt_warn("invalid leftover-size from GuC GT-%d relay-channel\n",
 				 guc->gt_id);
 		bytes_read += ret;
-		if (guc->outfd >= 0) {
-			ret = write(guc->outfd, guc->readbuf, subbuf_size);
-			if (ret != subbuf_size)
-				igt_warn("Couldn't dump leftover logs to file\n");
-			guc->total_bytes_written += ret;
-		}
+		if (guc->outfd >= 0 && save_it)
+			write_extracted_data(tdata->global, guc, guc->readbuf, subbuf_size);
 	} while(1);
 
 	igt_debug("%u bytes flushed from GuC GT-%d\n", bytes_read, guc->gt_id);
@@ -629,7 +628,7 @@ static void open_relay_file(struct thread_t *tdata)
 	 * a different shell.
 	 */
 	if (tdata->global->discard_oldlogs)
-		pull_leftover_data(tdata);
+		pull_leftover_data(tdata, false);
 }
 
 static void open_output_file(struct thread_t *tdata)
@@ -914,7 +913,7 @@ int main(int argc, char **argv)
 	thread[0].guc->capturing_stopped = 1;
 	pthread_cond_signal(&thread[0].guc->underflow_cond);
 	pthread_join(thread[0].guc->flush_thread, NULL);
-	pull_leftover_data(&thread[0]);
+	pull_leftover_data(&thread[0], true);
 	update_outfile_header(&thread[0]);
 	igt_info("total bytes written %" PRIu64 "\n", thread[0].guc->total_bytes_written);
 
-- 
2.34.1
