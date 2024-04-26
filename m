Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1F0C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 09:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B0410F069;
	Fri, 26 Apr 2024 09:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l2KVevJF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7729510EF4A
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714122116; x=1745658116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=51KIu5uypuiXYuLlPeqZdrzEvLtYZksJnanxjD+5tgw=;
 b=l2KVevJFlRb5+EC4ZwE9BcBI+Y/J75tV14vZXkgtJ2ULltjjWNBlCSpo
 D0VddSlxshNSzIZ971JBUc4BdcILVyjIxFDjkfG4Vp1B0C5gKjyT6nVco
 qNiP025UR0SYhgnLxvEusEAmB0KYcgHSYQL63jxWqpubeyUxhItI9V8hV
 ZJfAodzwKtmarT0USa7hUyOq571b/9i6MSWrtFXayL3qVxBiE6GEUl62Q
 e0TjyVadHfrI2dXqbRKpy5Im4Um8b8pA4S9Alxq4FuEWOY6tyMeApLbvo
 JanY1R44P85k5czQLlxFpCchOesbO/5yIlW495M1ZQA1DEr6Hd/QGTJ2t g==;
X-CSE-ConnectionGUID: +cvCI57mR9+I8uaTF74DNQ==
X-CSE-MsgGUID: UsmdGvMARBG9WlA+4d35Lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9717783"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9717783"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:36 -0700
X-CSE-ConnectionGUID: bDZ7AWiJTNyTeBdsXvF4Mg==
X-CSE-MsgGUID: IGZOJvu6RZ2PF45pXV26HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25402823"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:35 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 03/10] lib/intel_blt: Add i915 -> blt tile helper
 converter
Date: Fri, 26 Apr 2024 11:01:10 +0200
Message-Id: <20240426090117.78060-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
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

