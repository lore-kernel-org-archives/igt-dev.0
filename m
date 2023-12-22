Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364E910E798
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 14:32:49 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 15/15] lib/rendercopy: Enable clear color consistently
Date: Fri, 22 Dec 2023 16:31:59 +0200
Message-ID: <20231222143159.24662-16-ville.syrjala@linux.intel.com>
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

We are computing the clear color enable bit differently
for the reloc vs. what we stuff into the surface state
directly. Unify.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen9.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 359dda73182a..f3f3f06d8d21 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -136,6 +136,12 @@ static const uint32_t gen12p71_render_copy[][4] = {
 	{ 0x80041131, 0x00000004, 0x50007144, 0x00c40000 },
 };
 
+static bool cc_enable(struct intel_bb *ibb,
+		      const struct intel_buf *buf, bool fast_clear)
+{
+	return fast_clear || (buf->cc.offset && !HAS_FLATCCS(ibb->devid));
+}
+
 /* Mostly copy+paste from gen6, except height, width, pitch moved */
 static uint32_t
 gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
@@ -222,7 +228,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 
 			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
 								   read_domain, write_domain,
-								   (buf->cc.offset ? (1 << 10) : 0)
+								   (cc_enable(ibb, buf, fast_clear) ? (1 << 10) : 0)
 								   | buf->ccs[0].offset,
 								   intel_bb_offset(ibb) + 4 * 10,
 								   buf->addr.offset);
@@ -230,7 +236,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;
 		}
 
-		if (fast_clear || (buf->cc.offset && !HAS_FLATCCS(ibb->devid))) {
+		if (cc_enable(ibb, buf, fast_clear)) {
 			igt_assert(buf->compression == I915_COMPRESSION_RENDER);
 
 			ss->ss10.clearvalue_addr_enable = 1;
-- 
2.41.0
