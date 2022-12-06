Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D714410E312
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 08:56:00 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 00:58:44 -0800
Message-Id: <20221206085849.271505-7-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
References: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 06/11] tools/intel_guc_logger:
 Concatenate log samples into a contiguous file.
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

On the first log sample flushed from kernel, copy the GuC Log-events
header structure once at start of file.

With every new subbuffer flush, use the latest header's head and
tail pointers to extract only new valid data. Concatenate this
new set of debug logs into the output file.

Ensure the logger reorders content when dealing with wraparound of
the read and write pointers received log samples.

When ending, before closing the output file handle, go back to the
single header struct at start of file and update the read, write and
size offsets to make the valid buffer range take up the entire
output file contents.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tools/intel_guc_logger.c | 179 +++++++++++++++++++++++++++++++++++----
 1 file changed, 164 insertions(+), 15 deletions(-)

diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index fdef4622..57657e66 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -92,6 +92,7 @@ struct guc_t {
 	pthread_cond_t overflow_cond;
 	int64_t produced;
 	int64_t consumed;
+	bool header_stored;
 	bool stop_logging;
 	bool capturing_stopped;
 };
@@ -357,36 +358,145 @@ static bool file_reached_maxsize(struct global_t *gbl, struct guc_t *guc)
 	return false;
 }
 
+static void _write_header(struct global_t *gbl, struct guc_t *guc,
+			  struct guc_log_buffer_state_2_0 *header)
+{
+	int ret;
+	struct guc_log_buffer_state_2_0 fakecrashdump = {0};
+
+	ret = write(guc->outfd, header, sizeof(struct guc_log_buffer_state_2_0));
+	if (ret < 0) {
+		igt_warn("Header to file failed err %d, stopping!\n", -errno);
+		guc->stop_logging = true;
+	} else if (!ret) {
+		igt_debug("Header to file flushed zero bytes!\n");
+	} else {
+		/*
+		 * Offline decoding tools expect to find another header structure
+		 * describing the guc-crash-dump region before the debug-logs
+		 * lets add that here. Make sure it looks valid but empty.
+		 */
+#define GUCCRASHDUMP_2_0_HEADER_MAGIC_DW0 0XCABBA9E6
+#define GUCCRASHDUMP_2_0_HEADER_MAGIC_DW1 0x8086DEAD
+		fakecrashdump.marker[0] = GUCCRASHDUMP_2_0_HEADER_MAGIC_DW0;
+		fakecrashdump.marker[1] = GUCCRASHDUMP_2_0_HEADER_MAGIC_DW1;
+		fakecrashdump.size = KB(4);
+		fakecrashdump.wrap_offset = KB(4) - 4;
+		write(guc->outfd, &fakecrashdump, sizeof(fakecrashdump));
+
+		/*
+		 * Offline decoding tools expect to find the start of log-event
+		 * entries at GUCLOGEVT_2_0_START_OFFSET, so lets add zeros to fill
+		 * up to that point.
+		 */
+		lseek(guc->outfd, GUCLOGEVT_2_0_START_OFFSET - 1, SEEK_SET);
+		write(guc->outfd, "", 1);
+	}
+}
+
 static int _write(struct global_t *gbl, struct guc_t *guc,
-		  char *inptr, int copy_size)
+		  struct guc_log_buffer_state_2_0 *header, char *inptr, int bytes_to_copy)
 {
-	int ret = 0;
+	int ret = 0, max_copy_size = 0;
 
-	ret = write(guc->outfd, inptr, copy_size);
+	max_copy_size = header->size - header->read_offset;
+	if (bytes_to_copy > max_copy_size) {
+		igt_warn("Copy data size (%d) larger than max_copy_size (%d) so clip!\n",
+			 bytes_to_copy, max_copy_size);
+		bytes_to_copy = max_copy_size;
+	}
+	ret = write(guc->outfd, inptr + header->read_offset, bytes_to_copy);
 	if (ret < 0) {
-		igt_warn("Copy to file failed with err %d, stopping!\n", ret);
+		igt_warn("Copy to file failed with err %d, stopping!\n", -errno);
 		guc->stop_logging = true;
 	} else if (!ret) {
 		igt_warn("Copy to file flushed zero bytes!\n");
 	} else {
-		if (ret != copy_size)
-			igt_warn("File write size err: ask = %d, copied = %d!\n",
-				 copy_size, ret);
-		guc->total_bytes_written += ret;
-		igt_info("wrote %d KB out to dat file\n", (ret / 1024));
+		if (ret != bytes_to_copy)
+			igt_warn("File write size warn: ask = %d, copied = %d!\n",
+				 bytes_to_copy, ret);
+	}
+	return ret;
+}
+
+static bool write_extracted_data(struct global_t *gbl, struct guc_t *guc,
+				 char *inptr, int subbuf_size)
+{
+	struct guc_log_buffer_state_2_0 header = {0};
+	int bytes_to_copy = 0, copied = 0, ret = 0, tmp;
+	bool first_header = !guc->header_stored;
+
+	memcpy(&header, inptr, sizeof(header));
+
+	/* verify we have a valid header info */
+	if (header.marker[0] != GUCLOGEVT_2_0_HEADER_MAGIC_DW0 ||
+	    header.marker[1] != GUCLOGEVT_2_0_HEADER_MAGIC_DW1) {
+		igt_warn("Can't find GuC log buffer header magic, skip to next channel.\n");
+		return true;
+	} else if (header.version != GUCLOGEVT_2_0_VERSION) {
+		igt_warn("Mismatch on GuC log buffer header version 0x%08x, ignoring.\n",
+			 header.version);
+	}
+
+	inptr += GUCLOGEVT_2_0_START_OFFSET;
+
+	/*
+	 * If we just begun relay logging, copy the header just once, else
+	 * copy only the new data from relay subbuf but ensure the output
+	 * file contens is populated in a contiguous stream
+	 */
+	if (!guc->header_stored) {
+		_write_header(gbl, guc, &header);
+		if (guc->stop_logging) {
+			igt_warn("Bailing from failed header-write!\n");
+			return false;
+		}
+		guc->header_stored = true;
+	}
+
+	/* In case of wrap-around, copy data in chronological order, i.e. spatial end first*/
+	if (header.read_offset > header.sampled_write_offset) {
+		tmp = header.wrap_offset ? : header.size;
+		bytes_to_copy = tmp - header.read_offset;
+		ret = _write(gbl, guc, &header, inptr + header.read_offset, bytes_to_copy);
+		if (ret > 0)
+			copied = ret;
+		header.read_offset = 0;
+	}
+
+	/* Now copy the rest after wraparound or non-wraparound content from head */
+	if (ret >= 0) {
+		bytes_to_copy = header.sampled_write_offset - header.read_offset;
+		if (bytes_to_copy) {
+			ret = _write(gbl, guc, &header, inptr + header.read_offset, bytes_to_copy);
+			if (ret > 0)
+				copied += ret;
+		}
+	}
+
+	if (copied || first_header) {
+		guc->total_bytes_written += copied;
+		if (first_header)
+			igt_info("first parse found %d KB of data\n", (copied / 1024));
+		else
+			igt_info("wrote %d KB out to dat file\n", (copied / 1024));
 		if (file_reached_maxsize(gbl, guc)) {
 			igt_info("Reached target filesize of %" PRIu64 " bytes\n",
 				 MB(gbl->max_filesize));
 			guc->stop_logging = true;
 		}
+		return true;
 	}
-	return ret;
+	if (ret < 0)
+		guc->stop_logging = true;
+
+	return false;
 }
 
 static void *flusher(void *arg)
 {
 	char *ptr;
-	int ret, subbuf_size;
+	int subbuf_size;
 	struct thread_t *tdata = (struct thread_t *)arg;
 	struct global_t *gbl;
 	struct guc_t *guc;
@@ -416,9 +526,7 @@ static void *flusher(void *arg)
 		pthread_mutex_unlock(&guc->mutex);
 
 		ptr = guc->readbuf + (guc->consumed % guc->subbuf_count) * subbuf_size;
-
-		ret = _write(gbl, guc, ptr, subbuf_size);
-		if (ret > 0) {
+		if (write_extracted_data(gbl, guc, ptr, subbuf_size)) {
 			pthread_mutex_lock(&guc->mutex);
 			guc->consumed++;
 			pthread_cond_signal(&guc->overflow_cond);
@@ -503,13 +611,53 @@ static void open_output_file(struct thread_t *tdata)
 					tdata->guc->gt_id), -1);
 	}
 
-	tdata->guc->outfd = open(path, O_CREAT | O_WRONLY | O_TRUNC | O_DIRECT, 0440);
+	tdata->guc->outfd = open(path, O_CREAT | O_RDWR | O_TRUNC, 0440);
 	igt_assert_f(tdata->guc->outfd >= 0, "couldn't open the output file\n");
 
 	igt_info("Creating output GuC-log-file: %s\n", path);
 	free(path);
 }
 
+static void update_outfile_header(struct thread_t *tdata)
+{
+	struct guc_t *guc = tdata->guc;
+	struct guc_log_buffer_state_2_0 tmphdr = {0};
+
+	if (guc->outfd > 0 && guc->consumed && guc->total_bytes_written) {
+		/*
+		 * Offline decoder tool expects the 4KB crash dump buffer after
+		 * the debug-log-events we've been writing. Create an empty one.
+		 */
+		lseek(guc->outfd, KB(4) - 1, SEEK_CUR);
+		write(guc->outfd, "", 1);
+
+		/*
+		 * Go back to top of the file and update the debug-log-events
+		 * header structure with new head + tail ptrs and size so the
+		 * file appears as a gigantic log buffer as it were in mem.
+		 */
+		if (lseek(guc->outfd, 0, SEEK_SET) == 0) {
+			read(guc->outfd, &tmphdr, sizeof(tmphdr));
+
+			tmphdr.size = guc->total_bytes_written;
+			tmphdr.read_offset = 0;
+			tmphdr.sampled_write_offset = guc->total_bytes_written;
+			tmphdr.write_offset = guc->total_bytes_written;
+			tmphdr.wrap_offset = guc->total_bytes_written;
+
+			if (lseek(guc->outfd, 0, SEEK_SET) == 0)
+				write(guc->outfd, &tmphdr, sizeof(tmphdr));
+		} else {
+			igt_warn("Failed seek for header (errno=%d) on GT-%d after %ldKB\n",
+				 guc->gt_id, errno, (guc->total_bytes_written / 1024));
+		}
+
+	} else {
+		igt_debug("Skip final header: GT-%d, consume-subbufs-%ld, wrote-bytes-%ld\n",
+			  guc->gt_id, guc->consumed, guc->total_bytes_written);
+	}
+}
+
 static void init_main_thread(struct thread_t *tdata)
 {
 	struct sched_param thread_sched;
@@ -723,6 +871,7 @@ int main(int argc, char **argv)
 	pthread_cond_signal(&thread[0].guc->underflow_cond);
 	pthread_join(thread[0].guc->flush_thread, NULL);
 	pull_leftover_data(&thread[0]);
+	update_outfile_header(&thread[0]);
 	igt_info("total bytes written %" PRIu64 "\n", thread[0].guc->total_bytes_written);
 
 	if (gucdata[0].outfd)
-- 
2.34.1
