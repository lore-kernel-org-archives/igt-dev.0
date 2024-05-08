Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039ACC25B5F
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 12:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BF71128CD;
	Wed,  8 May 2024 12:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDXeRgKY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA581128C7
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 12:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715172919; x=1746708919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RrhzmVqtg87Pftb+qGn4QjIykLUUPa8A4BlahOYJYFo=;
 b=gDXeRgKYS/7DaCHKJKm1NbJJAuTRkipWDz/T+DJky3Ol9tFVT+PyNAkp
 2aCp4vjYfjUvfImXTiuZZv0JY+GOqzC2+uZFx5GBwSdNcPI6aLo9zqgIC
 6ySsuHs2HDtOFmpLEwvbFHjfxLSHGhtWabmXnPZarQLippxf7fmA7bvHF
 Tz6kw7jGeGQlrpdkloQOsAlWo8gizChTZYxd6t742vikkM0DqoCbQ6e25
 52yzhMcUOHNgeu9bA4o3IFoLX9WMQ7JcAoHlxobTnzREatVGCnpCOeCI3
 1OKTXCOk3msmw8Rfy+JIfpEOBc6sMzTXTGxWmikvebrj299/vZ5jGOpvS w==;
X-CSE-ConnectionGUID: rVgNY4p8QD63QJseQ0NPBw==
X-CSE-MsgGUID: EXKANA2aQYuWUhrD47RhrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10865096"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="10865096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:55:18 -0700
X-CSE-ConnectionGUID: a0HKTmE+RyamGv1D+EvY4Q==
X-CSE-MsgGUID: qhCWhoBeTbK03WTYvsBkFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33716350"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:55:16 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v4 06/11] lib/rendercopy_gen9: Separate xe and xe2
 compression format
Date: Wed,  8 May 2024 14:54:38 +0200
Message-Id: <20240508125443.404402-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
References: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Xe and beyond differ how compression format is handled. For Xe it
is 5-bit long whereas for Xe2+ this is 4-bit long field. Instead of
artifically packing 0-15 into 5-bit field lets separate this structures
to conform with the documentation.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/gen9_render.h     | 31 +++++++++++++++++++++----------
 lib/rendercopy_gen9.c | 24 ++++++++++++++++--------
 2 files changed, 37 insertions(+), 18 deletions(-)

diff --git a/lib/gen9_render.h b/lib/gen9_render.h
index 8ed60a2a54..4c1ed4726a 100644
--- a/lib/gen9_render.h
+++ b/lib/gen9_render.h
@@ -154,16 +154,27 @@ struct gen9_surface_state {
 		uint32_t aux_base_addr_hi;
 	} ss11;
 
-	struct {
-		/*
-		 * compression_format is used only dg2 onward.
-		 * prior to dg2 full ss12 is used for the address
-		 * but due to alignments bits 0..6 will be zero
-		 * and asserted in code to be so
-		 */
-		uint32_t compression_format:5;
-		uint32_t pad0:1;
-		uint32_t clear_address:26;
+	union {
+		struct {
+			/*
+			 * compression_format is used only dg2 onward.
+			 * prior to dg2 full ss12 is used for the address
+			 * but due to alignments bits 0..6 will be zero
+			 * and asserted in code to be so
+			 */
+			uint32_t compression_format:5;
+			uint32_t pad0:1;
+			uint32_t clear_address:26;
+		} xe;
+
+		struct {
+			/*
+			 * On Xe2+ compression format is 4-bit long.
+			 */
+			uint32_t compression_format:4;
+			uint32_t mip_region_depth_in_log:4;
+			uint32_t pad0:24;
+		} xe2;
 	} ss12;
 
 	struct {
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 7c7563d50c..35d79acbab 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -264,7 +264,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			igt_assert(__builtin_ctzl(address + buf->cc.offset) >= 6 &&
 				   (__builtin_clzl(address + buf->cc.offset) >= 16));
 
-			ss->ss12.clear_address = (address + buf->cc.offset) >> 6;
+			ss->ss12.xe.clear_address = (address + buf->cc.offset) >> 6;
 			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
 		}
 
@@ -274,13 +274,21 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
 			ss->ss7.dg2.disable_support_for_multi_gpu_atomics = 1;
 
-			/*
-			 * For now here is coming only 32bpp rgb format
-			 * which is marked below as B8G8R8X8_UNORM = '8'
-			 * If here ever arrive other formats below need to be
-			 * fixed to take that into account.
-			 */
-			ss->ss12.compression_format = 8;
+			if (AT_LEAST_GEN(ibb->devid, 20)) {
+				/*
+				 * For Xe2+ R8G8B8A8 best compression ratio is
+				 * achieved with compression format = '2'
+				 */
+				ss->ss12.xe2.compression_format = 2;
+			} else {
+				/*
+				 * For now here is coming only 32bpp rgb format
+				 * which is marked below as B8G8R8X8_UNORM = '8'
+				 * If here ever arrive other formats below need to be
+				 * fixed to take that into account.
+				 */
+				ss->ss12.xe.compression_format = 8;
+			}
 		}
 	}
 
-- 
2.34.1

