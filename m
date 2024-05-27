Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05625C25B7C
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 07:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5D010E4B2;
	Mon, 27 May 2024 07:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9q14CvX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDEC10F924
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 07:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716795281; x=1748331281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1GfGYD8jtJgheWm5/Li6tppsk/kVsPSq3aEwtboetmM=;
 b=V9q14CvXFjIIhz/qjJxINxmxB44Gfp/jL/ourkZt6bVyrHXucp5qmTRK
 pHY5GIE5UgSSY8ebnVs6nLKHsuR/oLIPzMw9ti3RwpYbWB2F32FVEF2U5
 hTRuWPKky53UZ283hW9ontI6QcuZdoGjMz0OCz8GpysM1tCyyd+EzZ2ZL
 nufpSKSgJD9RR5+n/Ubpz3T9ZvBgn1noyHxC9U1BWWpvfIHGwuzEzR/zN
 9FzB4CDEzbN8gIEa/LTFjEDWKsHEHFeYvOto/SuTVNUUOt1exyjtTrYBm
 DIv1ZoEXmb3I3qtTeSR1mYWYTHZr5gGR9WHhfnKXHWUa+W/x9WdkQObr0 w==;
X-CSE-ConnectionGUID: dHdJbfaISMGcqGf23nXbrA==
X-CSE-MsgGUID: FwGf/LzfQPuRGK22lmHrSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="24225308"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="24225308"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:40 -0700
X-CSE-ConnectionGUID: 5s/IZvNCT16zuR5O7k24tA==
X-CSE-MsgGUID: GBTfY/+XSpyPZ4Ise9+3Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34584524"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:39 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 09/12] lib/intel_bufops: Preparation for adding software
 tiling for Tile64
Date: Mon, 27 May 2024 09:33:42 +0200
Message-Id: <20240527073345.54729-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
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

Preliminary patch which adds necessary definitions for Tile64 in
bufops.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 70f70bfa9e..eb367be2f3 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -93,6 +93,7 @@
 #undef TILE_Yf
 #undef TILE_Ys
 #undef TILE_4
+#undef TILE_64
 
 #define TILE_DEF(x) (1 << (x))
 #define TILE_NONE   TILE_DEF(I915_TILING_NONE)
@@ -101,6 +102,7 @@
 #define TILE_Yf     TILE_DEF(I915_TILING_Yf)
 #define TILE_Ys     TILE_DEF(I915_TILING_Ys)
 #define TILE_4      TILE_DEF(I915_TILING_4)
+#define TILE_64     TILE_DEF(I915_TILING_64)
 
 #define CCS_OFFSET(buf) (buf->ccs[0].offset)
 #define CCS_SIZE(gen, buf) \
@@ -143,6 +145,7 @@ static const char *tiling_str(uint32_t tiling)
 	case I915_TILING_Yf:   return "Yf";
 	case I915_TILING_Ys:   return "Ys";
 	case I915_TILING_4:    return "4";
+	case I915_TILING_64:   return "64";
 	default:               return "UNKNOWN";
 	}
 }
-- 
2.34.1

