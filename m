Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2FE10E311
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 08:56:01 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 00:58:49 -0800
Message-Id: <20221206085849.271505-12-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
References: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 11/11] tools/intel_guc_logger: Add useful
 debug messages
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

Add useful debug messages for verbose logging progress so that
errors or warnings are not lost while capturing data.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tools/intel_guc_logger.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index 8bea2b4b..008bee50 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -450,6 +450,16 @@ static bool write_extracted_data(struct global_t *gbl, struct guc_t *guc,
 
 	memcpy(&header, inptr, sizeof(header));
 
+	igt_debug("header->marker[0] = 0x%08x\n", header.marker[0]);
+	igt_debug("header->marker[1] = 0x%08x\n", header.marker[1]);
+	igt_debug("header->read_offset = 0x%08x\n", header.read_offset);
+	igt_debug("header->write_offset = 0x%08x\n", header.write_offset);
+	igt_debug("header->size = 0x%08x\n", header.size);
+	igt_debug("header->sampled_write_offset = 0x%08x\n", header.sampled_write_offset);
+	igt_debug("header->wrap_offset = 0x%08x\n", header.wrap_offset);
+	igt_debug("header->flags = 0x%08x\n", header.flags);
+	igt_debug("header->counts = 0x%08x\n", header.version);
+
 	/* verify we have a valid header info */
 	if (header.marker[0] != GUCLOGEVT_2_0_HEADER_MAGIC_DW0 ||
 	    header.marker[1] != GUCLOGEVT_2_0_HEADER_MAGIC_DW1) {
@@ -555,14 +565,16 @@ static void *flusher(void *arg)
 			 * the disk file.
 			 */
 			if (guc->capturing_stopped) {
-				igt_debug("flusher to exit now\n");
+				igt_debug("Write-flush exiting\n");
 				pthread_mutex_unlock(&guc->mutex);
 				return NULL;
 			}
+			igt_debug("Write-flush waiting\n");
 			pthread_cond_wait(&guc->underflow_cond, &guc->mutex);
 		};
 		pthread_mutex_unlock(&guc->mutex);
 
+		igt_debug("Write-flush extracting\n");
 		ptr = guc->readbuf + (guc->consumed % guc->subbuf_count) * subbuf_size;
 		if (write_extracted_data(gbl, guc, ptr, subbuf_size)) {
 			pthread_mutex_lock(&guc->mutex);
@@ -669,6 +681,8 @@ static void update_outfile_header(struct thread_t *tdata)
 		lseek(guc->outfd, KB(4) - 1, SEEK_CUR);
 		write(guc->outfd, "", 1);
 
+		igt_debug("Finalizing header data of GT-%d to buffer-size = %ld\n",
+			  guc->gt_id, guc->total_bytes_written);
 		/*
 		 * Go back to top of the file and update the debug-log-events
 		 * header structure with new head + tail ptrs and size so the
@@ -683,6 +697,17 @@ static void update_outfile_header(struct thread_t *tdata)
 			tmphdr.write_offset = guc->total_bytes_written;
 			tmphdr.wrap_offset = guc->total_bytes_written;
 
+			igt_debug("Final header->marker[0] = 0x%08x\n", tmphdr.marker[0]);
+			igt_debug("Final header->marker[1] = 0x%08x\n", tmphdr.marker[1]);
+			igt_debug("Final header->read_offset = 0x%08x\n", tmphdr.read_offset);
+			igt_debug("Final header->write_offset = 0x%08x\n", tmphdr.write_offset);
+			igt_debug("Final header->size = 0x%08x\n", tmphdr.size);
+			igt_debug("Final header->sampled_write_offset = 0x%08x\n",
+				  tmphdr.sampled_write_offset);
+			igt_debug("Final header->wrap_offset = 0x%08x\n", tmphdr.wrap_offset);
+			igt_debug("Final header->flags = 0x%08x\n", tmphdr.flags);
+			igt_debug("Final header->counts = 0x%08x\n", tmphdr.version);
+
 			if (lseek(guc->outfd, 0, SEEK_SET) == 0)
 				write(guc->outfd, &tmphdr, sizeof(tmphdr));
 		} else {
@@ -824,6 +849,7 @@ int main(int argc, char **argv)
 	struct thread_t thread[1];
 	struct pollfd relay_poll_fd;
 	int nfds, ret;
+	int poll_msg_count = 0;
 
 	/* setup global context */
 	memset(&gbldata, 0, sizeof(gbldata));
@@ -891,6 +917,8 @@ int main(int argc, char **argv)
 		 * succession (less than a jiffy gap between 2 flush interrupts)
 		 * causing relay to run out of sub buffers to store new logs.
 		 */
+		if (++poll_msg_count % 200 == 0)
+			igt_debug("Read-pull waited %d\n", poll_msg_count);
 		ret = poll(&relay_poll_fd, nfds, gbldata.poll_timeout);
 		if (ret < 0) {
 			if (errno == EINTR)
@@ -902,8 +930,11 @@ int main(int argc, char **argv)
 		if (!relay_poll_fd.revents)
 			continue;
 
+		igt_debug("Read-pull copying data after %d polls\n", poll_msg_count);
+		poll_msg_count = 0;
 		pull_data(&thread[0]);
 	} while (!thread[0].guc->stop_logging);
+	igt_debug("Read-pull exiting\n");
 
 	/* Pause logging on the GuC side */
 	guc_log_control(&thread[0], RELAY_CMD_FLUSH);
-- 
2.34.1
