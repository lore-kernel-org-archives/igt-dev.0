Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B1DC10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 07:59:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0BF112040;
	Tue,  7 May 2024 07:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flNSV9Ii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E4C112040
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715068740; x=1746604740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rWvsnYqdwJo8cwA+UuKxAFapslTzFSXsPYc5bx8RZFE=;
 b=flNSV9IiCC/anUKoBLN5WWkpa+NNyqrsV91+ybnCZu51abGBzgSCRnab
 dOS63s6ZjACUkhUYHEgyWg9F5hB+9ANDlZlUOBSMdEEekpzv6RBYSghSE
 A82gr82KzX6j6cCBGqaXKEMjTCib6jd0CIWYwcTRIqymVCYaEpu60WXc4
 /n/Binlqqcm06Do/alfj2G7jZtgWgE19LrmE5hi6VMmjLB/dn/Hp+b7UZ
 zm1EOjmRVzW4LJlEe/4Nlnkxyd9SGm+UMs8OAskHCJlYFR/6Yaoad4mE9
 4v7MrGntp0FGdEI8tPIMgYXL48RnQk8hizeE3pRB0NtZo7v1vce5w2Fg7 w==;
X-CSE-ConnectionGUID: ADtRc+S1TP6i073hF+dsTQ==
X-CSE-MsgGUID: 0BDYyA9ISgGr0Ih68E1ikw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14656316"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="14656316"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:59:00 -0700
X-CSE-ConnectionGUID: OlzpFxG9QiWTqi0QlnbTiQ==
X-CSE-MsgGUID: 7ZmqM3fDSaeijUzJYfq2iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="32943825"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:58:58 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH i-g-t v3 03/11] lib/intel_blt: Add i915 -> blt tile helper
 converter
Date: Tue,  7 May 2024 09:58:28 +0200
Message-Id: <20240507075836.259581-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
References: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
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
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
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

