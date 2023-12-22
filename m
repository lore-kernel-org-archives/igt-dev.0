Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F8210E0DC
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 14:32:22 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 01/15] lib/rendercopy: Add deltas to all surface
 relocs
Date: Fri, 22 Dec 2023 16:31:45 +0200
Message-ID: <20231222143159.24662-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
References: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

In order to copy stuff not at offset 0 in the BO we need
to include the delta in the relocs/etc.

v2: fix the address in the command packets

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen4.c | 11 ++++++-----
 lib/rendercopy_gen6.c | 11 ++++++-----
 lib/rendercopy_gen7.c | 11 ++++++-----
 lib/rendercopy_gen8.c | 13 +++++++------
 lib/rendercopy_gen9.c | 13 +++++++------
 lib/rendercopy_i830.c | 10 +++++++---
 lib/rendercopy_i915.c |  6 ++++--
 7 files changed, 43 insertions(+), 32 deletions(-)

diff --git a/lib/rendercopy_gen4.c b/lib/rendercopy_gen4.c
index 8536d6b632c5..8582e0efb886 100644
--- a/lib/rendercopy_gen4.c
+++ b/lib/rendercopy_gen4.c
@@ -148,11 +148,12 @@ gen4_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
 	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
 	ss->ss0.color_blend = 1;
 
-	address = intel_bb_offset_reloc(ibb, buf->handle,
-					read_domain, write_domain,
-					intel_bb_offset(ibb) + 4,
-					buf->addr.offset);
-	ss->ss1.base_addr = (uint32_t) address;
+	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
+						   read_domain, write_domain,
+						   buf->surface[0].offset,
+						   intel_bb_offset(ibb) + 4,
+						   buf->addr.offset);
+	ss->ss1.base_addr = address + buf->surface[0].offset;
 
 	ss->ss2.height = intel_buf_height(buf) - 1;
 	ss->ss2.width  = intel_buf_width(buf) - 1;
diff --git a/lib/rendercopy_gen6.c b/lib/rendercopy_gen6.c
index e941257eb606..ec197661702f 100644
--- a/lib/rendercopy_gen6.c
+++ b/lib/rendercopy_gen6.c
@@ -91,11 +91,12 @@ gen6_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
 	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
 	ss->ss0.color_blend = 1;
 
-	address = intel_bb_offset_reloc(ibb, buf->handle,
-					read_domain, write_domain,
-					intel_bb_offset(ibb) + 4,
-					buf->addr.offset);
-	ss->ss1.base_addr = (uint32_t) address;
+	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
+						   read_domain, write_domain,
+						   buf->surface[0].offset,
+						   intel_bb_offset(ibb) + 4,
+						   buf->addr.offset);
+	ss->ss1.base_addr = address + buf->surface[0].offset;
 
 	ss->ss2.height = intel_buf_height(buf) - 1;
 	ss->ss2.width  = intel_buf_width(buf) - 1;
diff --git a/lib/rendercopy_gen7.c b/lib/rendercopy_gen7.c
index 267f6f8038ba..095ba7bde654 100644
--- a/lib/rendercopy_gen7.c
+++ b/lib/rendercopy_gen7.c
@@ -86,11 +86,12 @@ gen7_bind_buf(struct intel_bb *ibb,
 		 gen7_tiling_bits(buf->tiling) |
 		format << GEN7_SURFACE_FORMAT_SHIFT);
 
-	address = intel_bb_offset_reloc(ibb, buf->handle,
-					read_domain, write_domain,
-					intel_bb_offset(ibb) + 4,
-					buf->addr.offset);
-	ss[1] = address;
+	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
+						   read_domain, write_domain,
+						   intel_bb_offset(ibb) + 4,
+						   buf->surface[0].offset,
+						   buf->addr.offset);
+	ss[1] = address + buf->surface[0].offset;
 	ss[2] = ((intel_buf_width(buf) - 1)  << GEN7_SURFACE_WIDTH_SHIFT |
 		 (intel_buf_height(buf) - 1) << GEN7_SURFACE_HEIGHT_SHIFT);
 	ss[3] = (buf->surface[0].stride - 1) << GEN7_SURFACE_PITCH_SHIFT;
diff --git a/lib/rendercopy_gen8.c b/lib/rendercopy_gen8.c
index ba7897fb475f..8c08bab6d52e 100644
--- a/lib/rendercopy_gen8.c
+++ b/lib/rendercopy_gen8.c
@@ -109,12 +109,13 @@ gen8_bind_buf(struct intel_bb *ibb,
 		ss->ss1.memory_object_control = BDW_MOCS_PTE |
 			BDW_MOCS_TC_L3_PTE | BDW_MOCS_AGE(0);
 
-	address = intel_bb_offset_reloc(ibb, buf->handle,
-					read_domain, write_domain,
-					intel_bb_offset(ibb) + 4 * 8,
-					buf->addr.offset);
-	ss->ss8.base_addr = address;
-	ss->ss9.base_addr_hi = address >> 32;
+	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
+						   read_domain, write_domain,
+						   buf->surface[0].offset,
+						   intel_bb_offset(ibb) + 4 * 8,
+						   buf->addr.offset);
+	ss->ss8.base_addr = (address + buf->surface[0].offset);
+	ss->ss9.base_addr_hi = (address + buf->surface[0].offset) >> 32;
 
 	ss->ss2.height = intel_buf_height(buf) - 1;
 	ss->ss2.width  = intel_buf_width(buf) - 1;
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 363bc6c1b203..bfac62b0fc23 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -194,12 +194,13 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 	else if (buf->tiling == I915_TILING_Ys)
 		ss->ss5.trmode = 2;
 
-	address = intel_bb_offset_reloc(ibb, buf->handle,
-					read_domain, write_domain,
-					intel_bb_offset(ibb) + 4 * 8,
-					buf->addr.offset);
-	ss->ss8.base_addr = address;
-	ss->ss9.base_addr_hi = address >> 32;
+	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
+						   read_domain, write_domain,
+						   buf->surface[0].offset,
+						   intel_bb_offset(ibb) + 4 * 8,
+						   buf->addr.offset);
+	ss->ss8.base_addr = (address + buf->surface[0].offset);
+	ss->ss9.base_addr_hi = (address + buf->surface[0].offset) >> 32;
 
 	ss->ss2.height = intel_buf_height(buf) - 1;
 	ss->ss2.width  = intel_buf_width(buf) - 1;
diff --git a/lib/rendercopy_i830.c b/lib/rendercopy_i830.c
index 4c4271493b4b..4b0ea3b859e2 100644
--- a/lib/rendercopy_i830.c
+++ b/lib/rendercopy_i830.c
@@ -158,8 +158,10 @@ static void gen2_emit_target(struct intel_bb *ibb,
 	intel_bb_out(ibb, _3DSTATE_BUF_INFO_CMD);
 	intel_bb_out(ibb, BUF_3D_ID_COLOR_BACK | tiling |
 		     BUF_3D_PITCH(dst->surface[0].stride));
-	intel_bb_emit_reloc(ibb, dst->handle, I915_GEM_DOMAIN_RENDER,
-			    I915_GEM_DOMAIN_RENDER, 0, dst->addr.offset);
+	intel_bb_emit_reloc(ibb, dst->handle,
+			    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
+			    dst->surface[0].offset,
+			    dst->addr.offset);
 
 	intel_bb_out(ibb, _3DSTATE_DST_BUF_VARS_CMD);
 	intel_bb_out(ibb, format |
@@ -199,7 +201,9 @@ static void gen2_emit_texture(struct intel_bb *ibb,
 		tiling |= TM0S1_TILE_WALK;
 
 	intel_bb_out(ibb, _3DSTATE_LOAD_STATE_IMMEDIATE_2 | LOAD_TEXTURE_MAP(unit) | 4);
-	intel_bb_emit_reloc(ibb, src->handle, I915_GEM_DOMAIN_SAMPLER, 0, 0,
+	intel_bb_emit_reloc(ibb, src->handle,
+			    I915_GEM_DOMAIN_SAMPLER, 0,
+			    src->surface[0].offset,
 			    src->addr.offset);
 	intel_bb_out(ibb, (intel_buf_height(src) - 1) << TM0S1_HEIGHT_SHIFT |
 		     (intel_buf_width(src) - 1) << TM0S1_WIDTH_SHIFT |
diff --git a/lib/rendercopy_i915.c b/lib/rendercopy_i915.c
index 3e421301e6a6..94cdfb99af9a 100644
--- a/lib/rendercopy_i915.c
+++ b/lib/rendercopy_i915.c
@@ -112,7 +112,8 @@ void gen3_render_copyfunc(struct intel_bb *ibb,
 		intel_bb_out(ibb, (1 << TEX_COUNT) - 1);
 		intel_bb_emit_reloc(ibb, src->handle,
 				    I915_GEM_DOMAIN_SAMPLER, 0,
-				    0, src->addr.offset);
+				    src->surface[0].offset,
+				    src->addr.offset);
 		intel_bb_out(ibb, format_bits | tiling_bits |
 			     (intel_buf_height(src) - 1) << MS3_HEIGHT_SHIFT |
 			     (intel_buf_width(src) - 1) << MS3_WIDTH_SHIFT);
@@ -155,7 +156,8 @@ void gen3_render_copyfunc(struct intel_bb *ibb,
 			     BUF_3D_PITCH(dst->surface[0].stride));
 		intel_bb_emit_reloc(ibb, dst->handle,
 				    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
-				    0, dst->addr.offset);
+				    dst->surface[0].offset,
+				    dst->addr.offset);
 
 		intel_bb_out(ibb, _3DSTATE_DST_BUF_VARS_CMD);
 		intel_bb_out(ibb, format_bits |
-- 
2.41.0
