Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434EBC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 12:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1AF10E61E;
	Wed, 15 May 2024 12:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOyl4XUR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B7A10E61E
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715775612; x=1747311612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C21A5vQ85KYZFausg/jrgAfv7jpMoDBaZl0xFv8kVjA=;
 b=mOyl4XUR00cONkezGZUnAL2LgbRvJwcPLWGJ1auyCvKP6N+2AeDUZulr
 Zty9C/yygpBltUJBIou5rnz0GWr6oHirvS7vHGjfF5lJYzPYnV4TgcMB7
 RiFavrxt13h0lpgsgCUStv9sRyioKBE4eNJyE+YHsO0Im5208MFhcnZ6R
 cz/6v7QCLEUNHODslFVv4hholM6dxaF6eeCROiwwAUyFzxpxzZ+3KkayE
 TbSA5QPbEKEVJ/pH9GTz+roimGAwaRDNNZJoMKVsMwuMeEg0HLXl67+cC
 fSRXcvr/2B9+ZtHssNMa2PDKxJ4Tim3LNq1ucfi/o1d8c5eqPMPl2K86Z g==;
X-CSE-ConnectionGUID: GdWgCREpTriljqxk8VGYtA==
X-CSE-MsgGUID: YOJU3K8nTJumxNEZvUkD3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="12036157"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="12036157"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:12 -0700
X-CSE-ConnectionGUID: SjuFQjFjTSKe8OuWz43I8Q==
X-CSE-MsgGUID: W/CxjiCJSpCXUJK7beuZNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="31039725"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:11 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v6 4/9] lib/rendercopy_gen9: Separate xe and xe2
 compression format
Date: Wed, 15 May 2024 14:19:44 +0200
Message-Id: <20240515121949.245280-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
References: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
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
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
v6: Keep platform convention on structures (Juha-Pekka)
---
 lib/gen9_render.h     | 31 +++++++++++++++++++++----------
 lib/rendercopy_gen9.c | 24 ++++++++++++++++--------
 2 files changed, 37 insertions(+), 18 deletions(-)

diff --git a/lib/gen9_render.h b/lib/gen9_render.h
index 8ed60a2a54..244bb6ed8b 100644
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
+		} dg2;
+
+		struct {
+			/*
+			 * On Xe2+ compression format is 4-bit long.
+			 */
+			uint32_t compression_format:4;
+			uint32_t mip_region_depth_in_log:4;
+			uint32_t pad0:24;
+		} lnl;
 	} ss12;
 
 	struct {
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 7c7563d50c..726f1a087b 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -264,7 +264,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			igt_assert(__builtin_ctzl(address + buf->cc.offset) >= 6 &&
 				   (__builtin_clzl(address + buf->cc.offset) >= 16));
 
-			ss->ss12.clear_address = (address + buf->cc.offset) >> 6;
+			ss->ss12.dg2.clear_address = (address + buf->cc.offset) >> 6;
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
+				ss->ss12.lnl.compression_format = 2;
+			} else {
+				/*
+				 * For now here is coming only 32bpp rgb format
+				 * which is marked below as B8G8R8X8_UNORM = '8'
+				 * If here ever arrive other formats below need to be
+				 * fixed to take that into account.
+				 */
+				ss->ss12.dg2.compression_format = 8;
+			}
 		}
 	}
 
-- 
2.34.1

