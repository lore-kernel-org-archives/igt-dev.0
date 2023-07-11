Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8605E10E37C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 11:47:16 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Jul 2023 13:45:18 +0200
Message-Id: <20230711114518.93415-1-karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Inform about
 unsupported bpp
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

Log a message when we request an invalid pixel depth in
intel_bb_emit_blt_copy().

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/intel_batchbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 0e92c6f70..0408d62ba 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2742,7 +2742,7 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
 				     XY_SRC_COPY_BLT_WRITE_RGB);
 			break;
 		default:
-			igt_fail(IGT_EXIT_FAILURE);
+			igt_assert_f(0, "Unsupported pixel depth\n");
 		}
 	} else {
 		br13_bits = fast_copy_dword1(ibb->fd, src->tiling, dst->tiling, bpp);
-- 
2.25.1
