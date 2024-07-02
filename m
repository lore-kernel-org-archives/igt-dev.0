Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61628C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2E910E701;
	Tue,  2 Jul 2024 23:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ev1GSMSM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4F610E701
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962930; x=1751498930;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yvfCJHAcg7Kt/cIrhkO6FC2AYOFCQdVTw/BZJAxBFM8=;
 b=ev1GSMSMR3KBeqMUyQwsISfyh8Wn4hM1B5jVY6Y6CmbYLwoWPNWUaJzH
 pHY0tZe3YfGBDmhdzlinVoCKisSb2G7kCfA/dhmjtFiIbzgkjf9pu00VU
 loy+alpoxv5ijU+qZTIqziosdzjPEWp9HBUk4CbYcqWYU2TTJlQbGLzD6
 N8vAyiVDemu6pePXn8lA0HlmS6M946HxUD2yTz5TJu8sQNvArG3BRaBq+
 y2tf1/GTZmsW1znceOR1e0t8gDI5dqH790bf1/WVId0GNDxUhQmgOBc2C
 5tz9uLSS0Cf7CeYSLPitcS/5TUzOWOXd/kuT4II2dqc3rGJmZHs7fpHWp g==;
X-CSE-ConnectionGUID: uCgPZD97Rj+ffjg8Oo4G9g==
X-CSE-MsgGUID: 3l6ZkJnBSCCGW9kISGCwOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559540"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559540"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:28:49 -0700
X-CSE-ConnectionGUID: KxvA7PMGT9+/Hn4etaYzUQ==
X-CSE-MsgGUID: fchuZo+iRZu0cwZ+TwZReg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043788"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:28:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:28:46 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/37] lib/rendercopy: Extract {dg2,
 lnl}_compression_format()
Date: Wed,  3 Jul 2024 02:27:50 +0300
Message-ID: <20240702232817.31147-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
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

