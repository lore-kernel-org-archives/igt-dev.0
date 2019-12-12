Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638216ECF1
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2019 09:48:59 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date: Thu, 12 Dec 2019 11:46:00 +0200
Message-Id: <20191212094601.21940-3-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191212094601.21940-1-stanislav.lisovskiy@intel.com>
References: <20191212094601.21940-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] [PATCH i-g-t v15 2/3] igt/lib: Use proper functions to
 gen11+ gpgpu_fill
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: martin.peres@intel.com, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>

gen11_fill_curbe_buffer_data and gen11_fill_interface_descriptor
are there but for some reason gen12_gpgpu_fill still uses
those from gen8, which seems to cause ocassional input/output error
in gen7_render_flush.

Change-Id: I99e6f65230d242235cf037a40e7def471eb097ac
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 lib/gpgpu_fill.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
index ec7204b8..15931782 100644
--- a/lib/gpgpu_fill.c
+++ b/lib/gpgpu_fill.c
@@ -276,6 +276,56 @@ __gen9_gpgpu_fillfunc(struct intel_batchbuffer *batch,
 	intel_batchbuffer_reset(batch);
 }
 
+static void
+__gen11_gpgpu_fillfunc(struct intel_batchbuffer *batch,
+		      const struct igt_buf *dst,
+		      unsigned int x, unsigned int y,
+		      unsigned int width, unsigned int height,
+		      uint8_t color, const uint32_t kernel[][4],
+		      size_t kernel_size)
+{
+	uint32_t curbe_buffer, interface_descriptor;
+	uint32_t batch_end;
+
+	intel_batchbuffer_flush(batch);
+
+	/* setup states */
+	batch->ptr = &batch->buffer[BATCH_STATE_SPLIT];
+
+	/*
+	 * const buffer needs to fill for every thread, but as we have just 1
+	 * thread per every group, so need only one curbe data.
+	 * For each thread, just use thread group ID for buffer offset.
+	 */
+	curbe_buffer = gen11_fill_curbe_buffer_data(batch);
+
+	interface_descriptor = gen11_fill_interface_descriptor(batch, dst, dst,
+				kernel, kernel_size);
+
+	igt_assert(batch->ptr < &batch->buffer[4095]);
+
+	batch->ptr = batch->buffer;
+
+	/* GPGPU pipeline */
+	OUT_BATCH(GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
+		  PIPELINE_SELECT_GPGPU);
+
+	gen9_emit_state_base_address(batch);
+	gen8_emit_vfe_state(batch, THREADS, GEN8_GPGPU_URB_ENTRIES,
+			    GPGPU_URB_SIZE, GPGPU_CURBE_SIZE);
+	gen7_emit_curbe_load(batch, curbe_buffer);
+	gen7_emit_interface_descriptor_load(batch, interface_descriptor);
+	gen8_emit_gpgpu_walk(batch, x, y, width, height);
+
+	OUT_BATCH(MI_BATCH_BUFFER_END);
+
+	batch_end = intel_batchbuffer_align(batch, 8);
+	igt_assert(batch_end < BATCH_STATE_SPLIT);
+
+	gen7_render_flush(batch, batch_end);
+	intel_batchbuffer_reset(batch);
+}
+
 void gen9_gpgpu_fillfunc(struct intel_batchbuffer *batch,
 			 const struct igt_buf *dst,
 			 unsigned int x, unsigned int y,
@@ -292,7 +342,7 @@ void gen11_gpgpu_fillfunc(struct intel_batchbuffer *batch,
 			  unsigned int width, unsigned int height,
 			  uint8_t color)
 {
-	__gen9_gpgpu_fillfunc(batch, dst, x, y, width, height, color,
+	__gen11_gpgpu_fillfunc(batch, dst, x, y, width, height, color,
 			      gen11_gpgpu_kernel, sizeof(gen11_gpgpu_kernel));
 }
 void gen12p1_gpgpu_fillfunc(struct intel_batchbuffer *batch,
@@ -301,6 +351,6 @@ void gen12p1_gpgpu_fillfunc(struct intel_batchbuffer *batch,
 			  unsigned int width, unsigned int height,
 			  uint8_t color)
 {
-	__gen9_gpgpu_fillfunc(batch, dst, x, y, width, height, color,
+	__gen11_gpgpu_fillfunc(batch, dst, x, y, width, height, color,
 			      gen12p1_gpgpu_kernel, sizeof(gen12p1_gpgpu_kernel));
 }
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
