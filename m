Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7467BC25B78
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 07:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA18C10F8AD;
	Mon, 27 May 2024 07:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfMQXHCX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83F610F8AD
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716795276; x=1748331276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b6CEReC0kqREUp1h5OiaE2+o6mKVNRnTM7IUdTGC7p0=;
 b=YfMQXHCX3xYSHnNIY2Sc40ZjODS6OBOoYOmPyH7aUz9R8qEWqusgCfYo
 IInOSKORulwxE3nJXGR9QmSnDw26+IgyTvWxBRymP60EhmoqtloyfFIv0
 PYXFPIHmw/JbCKKSHG7e+UsOJJLVBd+A+6PSnf6826tXE13ex5TSiY2ph
 /45Hokx5EARNADbRLLR1cb3676nBusQGkudM8lP3ATLUrzGCGMH+A8qne
 iMwaYqkbe/vCoAABdswcpF+HamEN7nItF96NApbB8cTWxFdyLrbjHWom1
 Ta/LEkx0a25b+eRqg2DX6aqhIPx473U2vpg4z865drR+BrptTWIGm2DB2 g==;
X-CSE-ConnectionGUID: 0lJyubAmRR6SH45MMlKLfA==
X-CSE-MsgGUID: BqsbyWBrQhepLFYW5Ep+vQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="24225295"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="24225295"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:36 -0700
X-CSE-ConnectionGUID: wj9p804OTGmR24Rf9F6BEg==
X-CSE-MsgGUID: /+/sgT+2ROKOEmAScfbhAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34584500"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:31 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 07/12] lib/intel_bufops: Add Ys tiling in linear_to and
 to_linear path
Date: Mon, 27 May 2024 09:33:40 +0200
Message-Id: <20240527073345.54729-8-zbigniew.kempczynski@intel.com>
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

To iterate over all tilings we need to have each case addressed
in the code. Add missing Ys case.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_blt.c       | 3 +++
 lib/intel_bufops.c    | 6 ++++--
 lib/intel_cmds_info.h | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index d1200ca862..20c42eec14 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -540,6 +540,7 @@ const char *blt_tiling_name(enum blt_tiling_type tiling)
 	case T_TILE4:  return "tile4";
 	case T_TILE64: return "tile64";
 	case T_YFMAJOR: return "yfmajor";
+	case T_YSMAJOR: return "ysmajor";
 	default:
 		break;
 	}
@@ -582,6 +583,7 @@ int blt_tile_to_i915_tile(enum blt_tiling_type tiling)
 	case T_TILE4:  return I915_TILING_4;
 	case T_TILE64: return I915_TILING_64;
 	case T_YFMAJOR: return I915_TILING_Yf;
+	case T_YSMAJOR: return I915_TILING_Ys;
 	default:
 		break;
 	}
@@ -606,6 +608,7 @@ enum blt_tiling_type i915_tile_to_blt_tile(uint32_t tiling)
 	case I915_TILING_4:	return T_TILE4;
 	case I915_TILING_64:	return T_TILE64;
 	case I915_TILING_Yf:	return T_YFMAJOR;
+	case I915_TILING_Ys:	return T_YSMAJOR;
 	default:
 		igt_assert_f(0, "Unknown tiling!\n");
 	}
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 36b9aa2a8c..38b720624e 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1697,8 +1697,6 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 		bops->y_to_linear = copy_y_to_linear;
 		bops->linear_to_tile4 = copy_linear_to_tile4;
 		bops->tile4_to_linear = copy_tile4_to_linear;
-		bops->linear_to_ys = NULL;
-		bops->ys_to_linear = NULL;
 
 		return bops;
 	}
@@ -1956,6 +1954,10 @@ bool buf_ops_set_software_tiling(struct buf_ops *bops,
 		igt_debug("-> use SW on tiling Yf\n");
 		break;
 
+	case I915_TILING_Ys:
+		igt_debug("-> use SW on tiling Ys\n");
+		break;
+
 	default:
 		igt_warn("Invalid tiling: %d\n", tiling);
 		was_changed = false;
diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
index 6f7d655083..7960e0412e 100644
--- a/lib/intel_cmds_info.h
+++ b/lib/intel_cmds_info.h
@@ -14,6 +14,7 @@ enum blt_tiling_type {
 	T_YMAJOR,
 	T_TILE4,
 	T_YFMAJOR,
+	T_YSMAJOR,
 	T_TILE64,
 	__BLT_MAX_TILING
 };
-- 
2.34.1

