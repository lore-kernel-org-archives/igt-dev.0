Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A4810E311
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 08:56:00 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 00:58:42 -0800
Message-Id: <20221206085849.271505-5-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
References: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 04/11] tools/intel_guc_logger: Add helper
 function for flusher code
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

Add an abstraction for the flusher-thread's code that writes
the log buffer data to file. This prepares us for future
patches that requires calling the same helper for different
types of data flushing.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tools/intel_guc_logger.c | 53 +++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index f694ff18..ce4d1bc5 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -317,6 +317,40 @@ static void pull_data(struct thread_t *tdata)
 	}
 }
 
+static bool file_reached_maxsize(struct global_t *gbl, struct guc_t *guc)
+{
+	if (gbl->max_filesize && MB(gbl->max_filesize) - guc->total_bytes_written <= 0)
+		return true;
+
+	return false;
+}
+
+static int _write(struct global_t *gbl, struct guc_t *guc,
+		  char *inptr, int copy_size)
+{
+	int ret = 0;
+
+	ret = write(guc->outfd, inptr, copy_size);
+	if (ret < 0) {
+		igt_warn("Copy to file failed with err %d, stopping!\n", ret);
+		guc->stop_logging = true;
+	} else if (!ret) {
+		igt_warn("Copy to file flushed zero bytes!\n");
+	} else {
+		if (ret != copy_size)
+			igt_warn("File write size err: ask = %d, copied = %d!\n",
+				 copy_size, ret);
+		guc->total_bytes_written += ret;
+		igt_info("wrote %d KB out to dat file\n", (ret / 1024));
+		if (file_reached_maxsize(gbl, guc)) {
+			igt_info("Reached target filesize of %" PRIu64 " bytes\n",
+				 MB(gbl->max_filesize));
+			guc->stop_logging = true;
+		}
+	}
+	return ret;
+}
+
 static void *flusher(void *arg)
 {
 	char *ptr;
@@ -351,23 +385,8 @@ static void *flusher(void *arg)
 
 		ptr = guc->readbuf + (guc->consumed % guc->subbuf_count) * subbuf_size;
 
-		ret = write(guc->outfd, ptr, subbuf_size);
-		if (ret < 0) {
-			igt_warn("Dump to file failed with err %d, stopping!\n", ret);
-			guc->stop_logging = true;
-		} else if (!ret) {
-			igt_warn("Dump to file flushed zero bytes!\n");
-		} else {
-			if (ret != subbuf_size)
-				igt_warn("Dump size mismatch = %d!\n", ret);
-			guc->total_bytes_written += ret;
-			igt_info("wrote %d KB out to dat file\n", (ret / 1024));
-			if (gbl->max_filesize && guc->total_bytes_written >
-			    MB(gbl->max_filesize)) {
-				igt_debug("reached the target of %" PRIu64 " bytes\n",
-					  MB(gbl->max_filesize));
-				guc->stop_logging = true;
-			}
+		ret = _write(gbl, guc, ptr, subbuf_size);
+		if (ret > 0) {
 			pthread_mutex_lock(&guc->mutex);
 			guc->consumed++;
 			pthread_cond_signal(&guc->overflow_cond);
-- 
2.34.1
