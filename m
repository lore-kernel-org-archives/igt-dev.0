Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A666F10E24E
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 09:37:35 +0000 (UTC)
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 11:37:18 +0200
Message-Id: <20230609093719.2076046-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: Apply x/y offsets to GPGPU fill
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Actually honour the caller provided destination region and pass the x/y
offsets to the thread group.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/gpgpu_fill.c |  4 +---
 lib/gpu_cmds.c   | 29 +++++++++++++++--------------
 lib/gpu_cmds.h   |  1 +
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/lib/gpgpu_fill.c b/lib/gpgpu_fill.c
index d854fbf7..eed82187 100644
--- a/lib/gpgpu_fill.c
+++ b/lib/gpgpu_fill.c
@@ -315,8 +315,6 @@ __xehp_gpgpu_fillfunc(int i915,
 {
 	struct intel_bb *ibb;
 	struct xehp_interface_descriptor_data idd;
-	(void) x;
-	(void) y;
 
 	ibb = intel_bb_create(i915, PAGE_SIZE);
 	intel_bb_add_intel_buf(ibb, buf, true);
@@ -335,7 +333,7 @@ __xehp_gpgpu_fillfunc(int i915,
 	xehp_emit_state_compute_mode(ibb);
 	xehp_emit_state_binding_table_pool_alloc(ibb);
 	xehp_emit_cfe_state(ibb, THREADS);
-	xehp_emit_compute_walk(ibb, width, height, &idd, color);
+	xehp_emit_compute_walk(ibb, x, y, width, height, &idd, color);
 
 	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
 	intel_bb_ptr_align(ibb, 32);
diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 1f321ae4..aecba928 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -636,10 +636,10 @@ gen7_emit_gpgpu_walk(struct intel_bb *ibb,
 	 * Then thread group X = width / 16 (aligned to 16)
 	 * thread group Y = height;
 	 */
-	x_dim = (width + 15) / 16;
-	y_dim = height;
+	x_dim = (x + width + 15) / 16;
+	y_dim = y + height;
 
-	tmp = width & 15;
+	tmp = (x + width) & 15;
 	if (tmp == 0)
 		right_mask = (1 << 16) - 1;
 	else
@@ -657,11 +657,11 @@ gen7_emit_gpgpu_walk(struct intel_bb *ibb,
 		  0); /* width:1 */
 
 	/* thread group X */
-	intel_bb_out(ibb, 0);
+	intel_bb_out(ibb, x / 16);
 	intel_bb_out(ibb, x_dim);
 
 	/* thread group Y */
-	intel_bb_out(ibb, 0);
+	intel_bb_out(ibb, y);
 	intel_bb_out(ibb, y_dim);
 
 	/* thread group Z */
@@ -693,10 +693,10 @@ gen8_emit_gpgpu_walk(struct intel_bb *ibb,
 	 * Then thread group X = width / 16 (aligned to 16)
 	 * thread group Y = height;
 	 */
-	x_dim = (width + 15) / 16;
-	y_dim = height;
+	x_dim = (x + width + 15) / 16;
+	y_dim = y + height;
 
-	tmp = width & 15;
+	tmp = (x + width) & 15;
 	if (tmp == 0)
 		right_mask = (1 << 16) - 1;
 	else
@@ -715,12 +715,12 @@ gen8_emit_gpgpu_walk(struct intel_bb *ibb,
 		     0); /* width:1 */
 
 	/* thread group X */
-	intel_bb_out(ibb, 0);
+	intel_bb_out(ibb, x / 16);
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, x_dim);
 
 	/* thread group Y */
-	intel_bb_out(ibb, 0);
+	intel_bb_out(ibb, y);
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, y_dim);
 
@@ -948,6 +948,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
 
 void
 xehp_emit_compute_walk(struct intel_bb *ibb,
+		       unsigned int x, unsigned int y,
 		       unsigned int width, unsigned int height,
 		       struct xehp_interface_descriptor_data *pidd,
 		       uint8_t color)
@@ -965,8 +966,8 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
 	 * Then thread group X = width / 16 (aligned to 16)
 	 * thread group Y = height;
 	 */
-	x_dim = (width + 15) / 16;
-	y_dim = height;
+	x_dim = (x + width + 15) / 16;
+	y_dim = y + height;
 
 	intel_bb_out(ibb, XEHP_COMPUTE_WALKER | 0x25);
 
@@ -994,8 +995,8 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
 	intel_bb_out(ibb, 1);					//dw9
 
 	/* group id x/y/z */
-	intel_bb_out(ibb, 0);					//dw10
-	intel_bb_out(ibb, 0);					//dw11
+	intel_bb_out(ibb, x / 16);				//dw10
+	intel_bb_out(ibb, y);					//dw11
 	intel_bb_out(ibb, 0);					//dw12
 
 	/* partition id / partition size */
diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
index 92cbbde9..b7ed64f8 100644
--- a/lib/gpu_cmds.h
+++ b/lib/gpu_cmds.h
@@ -138,6 +138,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb);
 
 void
 xehp_emit_compute_walk(struct intel_bb *ibb,
+		       unsigned int x, unsigned int y,
 		       unsigned int width, unsigned int height,
 		       struct xehp_interface_descriptor_data *pidd,
 		       uint8_t color);
-- 
2.40.1
