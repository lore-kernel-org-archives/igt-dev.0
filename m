Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD336F618
 for <igt-dev@lists.freedesktop.org>; Sat,  1 May 2021 01:50:50 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Sat,  1 May 2021 04:50:43 +0300
Message-Id: <20210501015044.4139096-2-imre.deak@intel.com>
In-Reply-To: <20210501015044.4139096-1-imre.deak@intel.com>
References: <20210501015044.4139096-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/veboxcopy_gen12: Add support for
 MC_CCS/XYUV8888 conversions
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
List-ID: <igt-dev@lists.freedesktop.org>

Use the AYUV encodings for both the surface format and the AUX page
table tag. This matches the layout of XYUV8888, except for the missing
alpha channel, and this is the closest format I found in bspec.

Tested by igt/kms_plane and kms_ccs.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/intel_aux_pgtable.c | 5 +++++
 lib/veboxcopy_gen12.c   | 8 +++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index f29a30916..d89b0575a 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -34,6 +34,7 @@
 #define AUX_FORMAT_YCRCB	0x03
 #define AUX_FORMAT_P010		0x07
 #define AUX_FORMAT_P016		0x08
+#define AUX_FORMAT_AYUV		0x09
 #define AUX_FORMAT_ARGB_8B	0x0A
 #define AUX_FORMAT_NV12_21	0x0F
 
@@ -305,6 +306,10 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
 			entry.e.format = AUX_FORMAT_YCRCB;
 			entry.e.depth = DEPTH_VAL_RESERVED;
 			break;
+		case 32:
+			entry.e.format = AUX_FORMAT_AYUV;
+			entry.e.depth = DEPTH_VAL_RESERVED;
+			break;
 		default:
 			igt_assert(0);
 		}
diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
index b4cd7bddb..175644938 100644
--- a/lib/veboxcopy_gen12.c
+++ b/lib/veboxcopy_gen12.c
@@ -28,6 +28,7 @@
 
 #define YCRCB_NORMAL	0
 #define PLANAR_420_8	4
+#define PACKED_444A_8	5
 #define R8G8B8A8_UNORM	8
 #define PLANAR_420_16	12
 
@@ -136,6 +137,7 @@ static bool format_is_interleaved_yuv(int format)
 {
 	switch (format) {
 	case YCRCB_NORMAL:
+	case PACKED_444A_8:
 	case PLANAR_420_8:
 	case PLANAR_420_16:
 		return true;
@@ -279,9 +281,9 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
 							 YCRCB_NORMAL;
 		break;
 	case 32:
-		igt_assert(!src->format_is_yuv &&
-			   !src->format_is_yuv_semiplanar);
-		format = R8G8B8A8_UNORM;
+		igt_assert(!src->format_is_yuv_semiplanar);
+		format = src->format_is_yuv ? PACKED_444A_8 :
+					      R8G8B8A8_UNORM;
 		break;
 	default:
 		igt_assert_f(0, "Unsupported bpp: %u\n", src->bpp);
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
