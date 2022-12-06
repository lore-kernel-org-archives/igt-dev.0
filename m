Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF3C10E302
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 08:56:00 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 00:58:45 -0800
Message-Id: <20221206085849.271505-8-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
References: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 07/11] tools/intel_guc_logger: Add
 overflow awareness.
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

Update header structure definition and make logger
aware of the fw overflow flag so that it can warn the
end user of possible decode issue at that point in the
file. Also, copy the entire buffer irrespective of the
head and tail ptrs when overflow occurs.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tools/intel_guc_logger.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index 57657e66..38c50598 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -95,6 +95,7 @@ struct guc_t {
 	bool header_stored;
 	bool stop_logging;
 	bool capturing_stopped;
+	uint32_t fw_overflows;
 };
 
 struct global_t {
@@ -345,7 +346,15 @@ struct guc_log_buffer_state_2_0 {
 	uint32_t size; /* the buffer size that driver and GuC shares */
 	uint32_t sampled_write_offset; /* end-offset exclusive of new data */
 	uint32_t wrap_offset; /* end-offset exclusive when data wraps */
-	uint32_t flags; /* GuC uses to update driver of events like overflows */
+	union {
+		/* GuC uses to update driver of events like overflows */
+		struct {
+			uint32_t midflushing:1;
+			uint32_t overflow_count:4;
+			uint32_t reserved:27;
+		};
+		uint32_t flags;
+	};
 	uint32_t version; /* we currently recognize version 2 */
 #define GUCLOGEVT_2_0_VERSION          0x0002
 };
@@ -425,6 +434,7 @@ static bool write_extracted_data(struct global_t *gbl, struct guc_t *guc,
 	struct guc_log_buffer_state_2_0 header = {0};
 	int bytes_to_copy = 0, copied = 0, ret = 0, tmp;
 	bool first_header = !guc->header_stored;
+	bool is_overflowing = false;
 
 	memcpy(&header, inptr, sizeof(header));
 
@@ -440,6 +450,17 @@ static bool write_extracted_data(struct global_t *gbl, struct guc_t *guc,
 
 	inptr += GUCLOGEVT_2_0_START_OFFSET;
 
+	if (guc->fw_overflows == 0xFFFFFFFF) {
+		guc->fw_overflows = header.overflow_count;
+	} else if (header.overflow_count != (guc->fw_overflows & 0x000F)) {
+		if (header.overflow_count < (guc->fw_overflows & 0x000F))
+			guc->fw_overflows += 16;
+		guc->fw_overflows = (guc->fw_overflows & ~0x000F) + header.overflow_count;
+		is_overflowing = true;
+		igt_info("GuC FW Log Overflow #%d - possible decode kaput after offset %ld\n",
+			 guc->fw_overflows, guc->consumed);
+	}
+
 	/*
 	 * If we just begun relay logging, copy the header just once, else
 	 * copy only the new data from relay subbuf but ensure the output
@@ -454,6 +475,12 @@ static bool write_extracted_data(struct global_t *gbl, struct guc_t *guc,
 		guc->header_stored = true;
 	}
 
+	/* head == tail means we are empty unless overflowing, else augment ptrs for full copy*/
+	if (is_overflowing) {
+		header.read_offset = 0;
+		header.sampled_write_offset = header.wrap_offset ? : header.size;
+	}
+
 	/* In case of wrap-around, copy data in chronological order, i.e. spatial end first*/
 	if (header.read_offset > header.sampled_write_offset) {
 		tmp = header.wrap_offset ? : header.size;
@@ -794,6 +821,7 @@ int main(int argc, char **argv)
 
 	memset(&gucdata[0], 0, sizeof(struct guc_t));
 	gucdata[0].gt_id = 0;
+	gucdata[0].fw_overflows = 0xFFFFFFFF;
 	igt_assert_neq(asprintf(&gucdata[0].fspath, "gt/uc"), -1);
 	gucdata[0].outfd = -1;
 
-- 
2.34.1
