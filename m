Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB9DC27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 05:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB6510E56D;
	Tue, 18 Jun 2024 05:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOT5qKh8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E587110E56D
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 05:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718688254; x=1750224254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=alw4FtoZ8u2GcgLpFEEfuSWsbpmjfSLjCncnBKySw2c=;
 b=BOT5qKh8+4Nwmu8eJ+bWEOmMntm+n67cQmBZznErGrzpGGMkHi5qYCh8
 3gvcnVUsuWoOhuSAurhx2Kq40W63/vwoxqhNk4rmftOrjo+VFQ9osEiMz
 dA3d+gNIYr85RGE264gz+Vcb0F9emgzDjhXbLQOeuuYHKPWFbzK8otohf
 ol8kTVfWipecy0/tO/biwTrAMATwK7y09DP2R66sXgqR2rgU9gWHOA7L4
 fJtbRX4pNrcLOmWX2l8iSyv/x84jrbXKE0CD25YBXElBmA52OgGTOnAbQ
 JG9eA70+gCVW1NN5MQKaq4JZI+E1UFU4Non6rWTk0XBu2Q5KLiM+BeDgg A==;
X-CSE-ConnectionGUID: be2e/YiQRcux1M9HTZj7cA==
X-CSE-MsgGUID: g8BgJR9ES8ykSwbMzjmlOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15666159"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="15666159"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:24:13 -0700
X-CSE-ConnectionGUID: cia6cOJBQ6iqdTdJjHfUgg==
X-CSE-MsgGUID: BmAuZh9zQ4+kHFDoxtB+Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41286629"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.150])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:24:13 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 09/12] lib/intel_bufops: Preparation for adding
 software tiling for Tile64
Date: Tue, 18 Jun 2024 07:23:32 +0200
Message-Id: <20240618052335.152588-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618052335.152588-1-zbigniew.kempczynski@intel.com>
References: <20240618052335.152588-1-zbigniew.kempczynski@intel.com>
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
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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

