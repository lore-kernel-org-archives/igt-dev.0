Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711396E037
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2020 14:20:57 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Mon, 23 Nov 2020 16:20:35 +0200
Message-Id: <20201123142035.1426734-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/rendercopy_gen9: Ensure to cover all
 destination area
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

To ensure to cover all destination area during fast clear,
we need to round up the destination coordinates at the lower
right corner.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 lib/rendercopy_gen9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index dd8c8c7c..eecf73d3 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -293,7 +293,7 @@ gen7_fill_vertex_buffer_data(struct intel_bb *ibb,
 		emit_vertex_normalized(ibb, src_x, intel_buf_width(src));
 		emit_vertex_normalized(ibb, src_y, intel_buf_height(src));
 	} else {
-		emit_vertex_2s(ibb, (dst_x + width)/64, DIV_ROUND_UP(dst_y + height, 16));
+		emit_vertex_2s(ibb, DIV_ROUND_UP(dst_x + width, 64), DIV_ROUND_UP(dst_y + height, 16));
 
 		emit_vertex_normalized(ibb, 0, 0);
 		emit_vertex_normalized(ibb, 0, 0);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
