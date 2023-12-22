Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A11C10E7D2
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 14:32:43 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 13/15] lib/rendercopy: Always setup clear color for
 TGL
Date: Fri, 22 Dec 2023 16:31:57 +0200
Message-ID: <20231222143159.24662-14-ville.syrjala@linux.intel.com>
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

TGL apparently automagically converts regular output to fast
clears when the output matches the configured clear color.
And if we don't enable the clear color packet at all then we
just get some rainbow gibberish on all black parts of the
output.

To avoid always set up the clear color packet, and when we
don't want fast clear (when not using a _CC modifier) we'll
just stich a bunch of NaNs into the clear value so it'll
never match any legitimate output.

TODO: Hide this better inside rendercopy_gen9.c without
      requring extra allocation in the FB BO
TODO: Figure out if other platforms need this sort stuff

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c          | 23 +++++++++++++++++++++++
 lib/intel_bufops.h    |  2 ++
 lib/rendercopy_gen9.c | 14 +++++++++++---
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 4ed08e44070e..1c65d4343c78 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -965,6 +965,16 @@ void igt_calc_fb_size(struct igt_fb *fb)
 		size += calc_plane_size(fb, plane);
 	}
 
+	/*
+	 * We always need a clear color on TGL, make some extra
+	 * room for one it if it's not explicit in the modifier.
+	 *
+	 * TODO: probably better to allocate this as part of the
+	 * batch instead so the fb size doesn't need to change...
+	 */
+	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS)
+		size = ALIGN(size + 64, 64);
+
 	if (is_xe_device(fb->fd))
 		size = ALIGN(size, xe_get_default_alignment(fb->fd));
 
@@ -2656,6 +2666,19 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 	if (fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC)
 		buf->cc.offset = fb->offsets[1];
 
+	/*
+	 * TGL appears to do automagic fast clear when rendering
+	 * black and the clear color isn't specified. Always specify
+	 * one. It doesn't appear to do fast clears anymore even
+	 * if the clear color is black.
+	 *
+	 * TODO: figure out if other platforms are affected...
+	 */
+	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS) {
+		buf->cc.disable = true;
+		buf->cc.offset = fb->size - 64;
+	}
+
 	return buf;
 }
 
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index b6048402bb6c..ef3df491c677 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -32,6 +32,7 @@ struct intel_buf {
 	enum intel_buf_mocs mocs;
 	bool format_is_yuv;
 	bool format_is_yuv_semiplanar;
+	bool disable_clear_color;
 	struct {
 		uint32_t offset;
 		uint32_t stride;
@@ -43,6 +44,7 @@ struct intel_buf {
 	} ccs[2];
 	struct {
 		uint32_t offset;
+		bool disable;
 	} cc;
 	struct {
 		uint64_t offset;
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index bfac62b0fc23..359dda73182a 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -1078,15 +1078,23 @@ void _gen9_render_op(struct intel_bb *ibb,
 
 	gen12_emit_aux_pgtable_state(ibb, aux_pgtable_state, true);
 
-	if (fast_clear) {
+	if (fast_clear || dst->cc.disable) {
 		for (int i = 0; i < 4; i++) {
 			intel_bb_out(ibb, MI_STORE_DWORD_IMM_GEN4);
 			intel_bb_emit_reloc(ibb, dst->handle,
 					    I915_GEM_DOMAIN_RENDER, I915_GEM_DOMAIN_RENDER,
                                             dst->cc.offset + i*sizeof(float),
 					    dst->addr.offset);
-			intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
-               }
+			if (fast_clear) {
+				intel_bb_out(ibb, *(uint32_t*)&clear_color[i]);
+			} else {
+				/*
+				 * Emit NaN so it'll match nothing and thus prevent
+				 * TGL from doing its automagic fast clear tricks.
+				 */
+				intel_bb_out(ibb, 0xffffffff);
+			}
+		}
        }
 
 
-- 
2.41.0
