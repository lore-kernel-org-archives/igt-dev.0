Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56B110E02A
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 08:56:00 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 00:58:43 -0800
Message-Id: <20221206085849.271505-6-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
References: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 05/11] tools/intel_guc_logger: Add GuC
 Log header structure definition
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

We need to redesign the logger to generate an output file that's formatted
as a single log buffer. It needs to continuously concatenate new GuC Log
buffer samnples provided by the kernel. To do this, the logger needs the
header structure of GuC log buffers as per the definition of the GuC
firmware.

Add this header structure that will be used in upcoming patches to extract
GuC Log debug entries.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tools/intel_guc_logger.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index ce4d1bc5..fdef4622 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -317,6 +317,38 @@ static void pull_data(struct thread_t *tdata)
 	}
 }
 
+/**
+ * struct guc_log_buffer_state_format_2_0 - GuC log buffer state
+ * It includes snippet from i915 guc-log-relay code:
+ *
+ * Below state structure is used for describing the location of new GuC firmware
+ * log data. This includes the read_offset that points to the location where i915
+ * read last in log buffer (the last data we already wrote to file) as well as the
+ * write_offset which is incremented by GuC with the number new bytes of log data.
+ * When the log buffer becomes half full, GuC sends a flush interrupt to i915.
+ * GuC firmware expects that while it is writing to second half of the buffer,
+ * first half would get consumed by i915 and then get a flush completed
+ * acknowledgment from Host. Thus, we would expect to see the size of new incoming
+ * data being about half the size of the buffer state size member variable.
+ * If the read and write pointers are equal, it means that the buffer is full
+ */
+
+#define GUCLOGEVT_2_0_START_OFFSET      PAGE_SIZE
+
+struct guc_log_buffer_state_2_0 {
+	uint32_t marker[2]; /* we should find GUCLOG_LOGEVENTHEADER_MAGIC */
+#define GUCLOGEVT_2_0_HEADER_MAGIC_DW0 0XCABBA9E6
+#define GUCLOGEVT_2_0_HEADER_MAGIC_DW1 0XDEADFEED
+	uint32_t read_offset; /* start offset inclusive of new data */
+	uint32_t write_offset;  /* GuC in midst of writing new data, ignore this */
+	uint32_t size; /* the buffer size that driver and GuC shares */
+	uint32_t sampled_write_offset; /* end-offset exclusive of new data */
+	uint32_t wrap_offset; /* end-offset exclusive when data wraps */
+	uint32_t flags; /* GuC uses to update driver of events like overflows */
+	uint32_t version; /* we currently recognize version 2 */
+#define GUCLOGEVT_2_0_VERSION          0x0002
+};
+
 static bool file_reached_maxsize(struct global_t *gbl, struct guc_t *guc)
 {
 	if (gbl->max_filesize && MB(gbl->max_filesize) - guc->total_bytes_written <= 0)
-- 
2.34.1
