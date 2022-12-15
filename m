Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1256310E52D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Dec 2022 11:35:55 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Dec 2022 12:35:17 +0100
Message-Id: <20221215113519.36660-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221215113519.36660-1-zbigniew.kempczynski@intel.com>
References: <20221215113519.36660-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/3] lib/i915_blt: Remove src == dst
 pitch restriction
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

During debugging phase we established there's not necessary to enforce
same pitch for destination surface in FULL_RESOLVE mode. Relax this
condition allowing caller to pass requirement surface configuration.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/i915/i915_blt.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index 3776c56c60..42c28623f9 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -317,13 +317,11 @@ static void fill_data(struct gen12_block_copy_data *data,
 	data->dw00.special_mode = __special_mode(blt);
 	data->dw00.length = extended_command ? 20 : 10;
 
-	if (__special_mode(blt) == SM_FULL_RESOLVE && blt->src.tiling == T_TILE64) {
-		data->dw01.dst_pitch = blt->src.pitch - 1;
+	if (__special_mode(blt) == SM_FULL_RESOLVE)
 		data->dw01.dst_aux_mode = __aux_mode(&blt->src);
-	} else {
-		data->dw01.dst_pitch = blt->dst.pitch - 1;
+	else
 		data->dw01.dst_aux_mode = __aux_mode(&blt->dst);
-	}
+	data->dw01.dst_pitch = blt->dst.pitch - 1;
 
 	data->dw01.dst_mocs = blt->dst.mocs;
 	data->dw01.dst_compression = blt->dst.compression;
-- 
2.34.1
