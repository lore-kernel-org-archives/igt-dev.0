Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3382110E30D
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Oct 2022 06:53:46 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Oct 2022 08:53:37 +0200
Message-Id: <20221020065337.26978-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/i915_blt: Equalize pitch and aux-ccs
 for full resolve
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

According to documentation and hw team suggestion use source pitch
and aux-ccs in destination object when inplace decompression is
performed (full-resolve operation).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Drobnik <karolina.drobnik@intel.com>

---
v2: group assignments in if/else
---
 lib/i915/i915_blt.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index 8d46e51fb7..a886c1d72d 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -317,8 +317,14 @@ static void fill_data(struct gen12_block_copy_data *data,
 	data->dw00.special_mode = __special_mode(blt);
 	data->dw00.length = extended_command ? 20 : 10;
 
-	data->dw01.dst_pitch = blt->dst.pitch - 1;
-	data->dw01.dst_aux_mode = __aux_mode(&blt->dst);
+	if (__special_mode(blt) == SM_FULL_RESOLVE) {
+		data->dw01.dst_pitch = blt->src.pitch - 1;
+		data->dw01.dst_aux_mode = __aux_mode(&blt->src);
+	} else {
+		data->dw01.dst_pitch = blt->dst.pitch - 1;
+		data->dw01.dst_aux_mode = __aux_mode(&blt->dst);
+	}
+
 	data->dw01.dst_mocs = blt->dst.mocs;
 	data->dw01.dst_compression = blt->dst.compression;
 	data->dw01.dst_tiling = __block_tiling(blt->dst.tiling);
-- 
2.34.1
