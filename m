Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41361C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 10:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACF410E5C7;
	Thu, 25 Apr 2024 10:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5wn3rX4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 097E310EA10
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714042060; x=1745578060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=51KIu5uypuiXYuLlPeqZdrzEvLtYZksJnanxjD+5tgw=;
 b=d5wn3rX4hidHKya4fW6OXMbPc81ZdSSbnlT39t8F78T1UN9eKp0hvO/h
 rMRnCSbJYmSWDxsVHkVjUOoVR6eEE04DoDl5X4CbMXXOL5sYuTrjaari1
 ftv4a3Z//bW+1c+bdhp4Wls6Kysn7n8QCRJWguRWt+5/rMd3hw9qDpCTP
 vDVGd2zhvkHXU1FwNsPHgOE9QzvaCYN1RogZX4luYw0bwvBwN/vsX90tf
 4rme04ZGraTntLAK6+OSaAcwBPBaZiMK30szj2vCbNllNJoVFQ/q3S/dp
 z1ODAq0XZoAZ3KNY039sL+JXZ01x4D2lLzWDwXTA633SeuflqLmzVsnxw A==;
X-CSE-ConnectionGUID: Xa6apOkAQoqULGEBXvHYmQ==
X-CSE-MsgGUID: 1yCWKULmRoKbJKU0jACmqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9645774"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9645774"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:40 -0700
X-CSE-ConnectionGUID: Ci7qti0iSqWT2JU5aB39aw==
X-CSE-MsgGUID: zt9ht8vpSXSt0PxWmS8Hdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="55977720"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:39 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 3/7] lib/intel_blt: Add i915 -> blt tile helper converter
Date: Thu, 25 Apr 2024 12:47:17 +0200
Message-Id: <20240425104721.52376-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
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

We have two kind of buffers in IGT - intel-buf for render and
blt-object for blitter. intel-buf uses I915_TILING* whereas
blt-object blt_tiling_type (T_*). To construct blt-object from
intel-buf we need to convert I915_TILING* to T_*. Add function
which does this conversion.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c | 21 +++++++++++++++++++++
 lib/intel_blt.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 5a281036c4..946adc538b 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -560,6 +560,27 @@ int blt_tile_to_i915_tile(enum blt_tiling_type tiling)
 	return 0;
 }
 
+/**
+ * i915_tile_to_blt_tile:
+ * @tiling: tiling id
+ *
+ * Returns:
+ * id of blt tiling like T_LINEAR, T_XMAJOR, etc
+ */
+enum blt_tiling_type i915_tile_to_blt_tile(uint32_t tiling)
+{
+	switch (tiling) {
+	case I915_TILING_NONE:	return T_LINEAR;
+	case I915_TILING_X:	return T_XMAJOR;
+	case I915_TILING_Y:	return T_YMAJOR;
+	case I915_TILING_4:	return T_TILE4;
+	case I915_TILING_64:	return T_TILE64;
+	case I915_TILING_Yf:	return T_YFMAJOR;
+	default:
+		igt_assert_f(0, "Unknown tiling!\n");
+	}
+}
+
 /**
  * blt_get_min_stride
  * @width: width in pixels
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index fcfce69bee..6daf46aea4 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -214,6 +214,7 @@ bool blt_uses_extended_block_copy(int fd);
 
 const char *blt_tiling_name(enum blt_tiling_type tiling);
 int blt_tile_to_i915_tile(enum blt_tiling_type tiling);
+enum blt_tiling_type i915_tile_to_blt_tile(uint32_t tiling);
 
 uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
 			    enum blt_tiling_type tiling);
-- 
2.34.1

