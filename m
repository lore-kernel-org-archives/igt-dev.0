Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Wed, 18 Nov 2020 16:38:09 +0000
Message-Id: <20201118163809.959127-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] intel_error_decode: Handle no decoding
 context
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

If decoding context couldn't be created, say the local libdrm does not
support the GPU which created the error state, it is much more handy to
at least decode and dump metadata and rings.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_error_decode.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/intel_error_decode.c b/tools/intel_error_decode.c
index 356ce37274f9..90a18a07ba17 100644
--- a/tools/intel_error_decode.c
+++ b/tools/intel_error_decode.c
@@ -465,7 +465,7 @@ static void decode(struct drm_intel_decode *ctx,
 		       (unsigned)((head_offset + gtt_offset) & 0xffffffff));
 	printf("\n");
 
-	if (decode) {
+	if (decode && ctx) {
 		drm_intel_decode_set_batch_pointer(ctx, data, gtt_offset,
 						   *count);
 		drm_intel_decode(ctx);
@@ -707,7 +707,10 @@ read_data_file(FILE *file)
 			matched = sscanf(line, "  ACTHD: 0x%08x\n", &reg);
 			if (matched == 1) {
 				print_acthd(reg, ring_length);
-				drm_intel_decode_set_head_tail(decode_ctx, reg, 0xffffffff);
+				if (decode_ctx)
+					drm_intel_decode_set_head_tail(decode_ctx,
+								       reg,
+								       0xffffffff);
 			}
 
 			matched = sscanf(line, "  PGTBL_ER: 0x%08x\n", &reg);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
