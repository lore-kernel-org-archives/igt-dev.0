Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D22BCD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F45E10E32F;
	Mon,  2 Sep 2024 14:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="is3xGrGj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5AD10E32F
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287907; x=1756823907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0JF1PFE75RX/ab2ibMTHFFcI2DgbIBnUEInZGeLmwsM=;
 b=is3xGrGjqnleXNOI98jpHyRBqHrud99FQ1M4QQ1ycLFKDndOLVXOIvl0
 FxUqMuLyOLiVfvwa3pktiDMeYiXa5zPln2BT6hSsAWmgPPwWcVE671EWm
 Q+F67UrTp+O2Tc/UKnfDkwbTlT2peogjSLsD2u3ju2zPSBHfwyrZhyu0l
 epHGjvlZRi7cL0rCq0hBoei+BRAJ/y0qJoXyNcCl8qh+FF6x1pobevNW4
 +4i9hDVXVkDL1W7/fzohpkKYvkXZcmSG7vghxnVCs62T93TNdi8UanZ4M
 yr4fLUzPUJQL0O1dZ/bvwqKr4nrj0vzfQWneMKG2xx/vkRDX/9k5ZMXph A==;
X-CSE-ConnectionGUID: q95Jz5gESfWOP1liIC3yyA==
X-CSE-MsgGUID: KWm0Bx8wRiyfYHpx4WrBKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009454"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009454"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:27 -0700
X-CSE-ConnectionGUID: crggggX7QmS93auq6+Keng==
X-CSE-MsgGUID: IgS/vO8xTzeOpXokvm2tMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639401"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:24 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 09/23] lib/rendercopy: Extract {dg2,
 lnl}_compression_format()
Date: Mon,  2 Sep 2024 17:37:44 +0300
Message-ID: <20240902143758.21036-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Extract the code to determine the SURFACE_STATE compression
format for dg2/lnl+ into helper. We'll need more formats here
soon.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen9.c | 41 ++++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 11f456a70d2f..eafdf50581d3 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -146,6 +146,28 @@ static const uint32_t xe2_render_copy[][4] = {
 	{ 0x8010c031, 0x00000004, 0x58000c24, 0x00c40000 },
 };
 
+static uint32_t lnl_compression_format(const struct intel_buf *buf)
+{
+	switch (buf->bpp) {
+	case 32:
+		return 0x2; /* CMF_R8_G8_B8_A8 */
+	default:
+		igt_assert(0);
+		return 0;
+	}
+}
+
+static uint32_t dg2_compression_format(const struct intel_buf *buf)
+{
+	switch (buf->bpp) {
+	case 32:
+		return 0x8;
+	default:
+		igt_assert(0);
+		return 0;
+	}
+}
+
 /* Mostly copy+paste from gen6, except height, width, pitch moved */
 static uint32_t
 gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
@@ -272,21 +294,10 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
 			ss->ss7.dg2.disable_support_for_multi_gpu_atomics = 1;
 
-			if (AT_LEAST_GEN(ibb->devid, 20)) {
-				/*
-				 * For Xe2+ R8G8B8A8 best compression ratio is
-				 * achieved with compression format = '2'
-				 */
-				ss->ss12.lnl.compression_format = 2;
-			} else {
-				/*
-				 * For now here is coming only 32bpp rgb format
-				 * which is marked below as B8G8R8X8_UNORM = '8'
-				 * If here ever arrive other formats below need to be
-				 * fixed to take that into account.
-				 */
-				ss->ss12.dg2.compression_format = 8;
-			}
+			if (AT_LEAST_GEN(ibb->devid, 20))
+				ss->ss12.lnl.compression_format = lnl_compression_format(buf);
+			else
+				ss->ss12.dg2.compression_format = dg2_compression_format(buf);
 		}
 	}
 
-- 
2.44.2

