Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24DB10E671
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 09:37:35 +0000 (UTC)
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 11:37:19 +0200
Message-Id: <20230609093719.2076046-2-christoph.manszewski@intel.com>
In-Reply-To: <20230609093719.2076046-1-christoph.manszewski@intel.com>
References: <20230609093719.2076046-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib: Apply rightmost execution mask to
 xehp gpu walker
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

The final thread group in each row may need partial execution (not the
full simd16) in order to fit within the region of interest.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/gpu_cmds.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index aecba928..48fe1e13 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -953,7 +953,7 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
 		       struct xehp_interface_descriptor_data *pidd,
 		       uint8_t color)
 {
-	uint32_t x_dim, y_dim;
+	uint32_t x_dim, y_dim, mask;
 
 	/*
 	 * Simply do SIMD16 based dispatch, so every thread uses
@@ -969,6 +969,12 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
 	x_dim = (x + width + 15) / 16;
 	y_dim = y + height;
 
+	mask = (x + width) & 15;
+	if (mask == 0)
+		mask = (1 << 16) - 1;
+	else
+		mask = (1 << mask) - 1;
+
 	intel_bb_out(ibb, XEHP_COMPUTE_WALKER | 0x25);
 
 	intel_bb_out(ibb, 0); /* debug object */		//dw1
@@ -980,7 +986,7 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
 	intel_bb_out(ibb, 1 << 30 | 1 << 25 | 1 << 17);		//dw4
 
 	/* Execution mask */
-	intel_bb_out(ibb, 0xffffffff);				//dw5
+	intel_bb_out(ibb, mask);				//dw5
 
 	/* x/y/z max */
 	intel_bb_out(ibb, (x_dim << 20) | (y_dim << 10) | 1);	//dw6
-- 
2.40.1
