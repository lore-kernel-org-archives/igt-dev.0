Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02BAC54E49
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 14:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C18B10E342;
	Wed, 28 Feb 2024 14:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mbsv6XBL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DA210E342
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 14:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709132059; x=1740668059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EiN6GjU+tyNxSWjhj0FpVVl8Dr83GzfaaGDg+G0DrLg=;
 b=Mbsv6XBLB9mUQO44sHSHVzkTIrjgn9hZwfom+vaHLg4x3MQrnddYpX18
 UXZjeIMP3UXRMyXffjE1gScbL0H4ppb2JJ2bcppoFv1ciZyHPYrOgP6Fi
 ON1YEykxpZM41I0/B0093/MF0uum4mPlMM0ovyjtcfr/ywEqySH4fx2Jb
 2h/VEiOkdQx3LAjwtfi02LiNWinsCHk6iEFfX5mkiBlnWETQdgGzCQB01
 vx1Y/aWFHPxn3akd9CpptobjnoFNiMYajfCbvHDt11n/X1yxnbMrRN2Sf
 JoSsNNpKdQVA9CU8AEiHUTQVc20lxbVBrTtynDa8yc7ye1jrd43tDBIbm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7314185"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7314185"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="8022472"
Received: from wbosek-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:18 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 1/7] lib/intel_batchbuffer: Add I915_TILING_64 definition
Date: Wed, 28 Feb 2024 15:54:01 +0100
Message-Id: <20240228145407.370325-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
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

Add Tile64 format previously not defined in igt.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_batchbuffer.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 8738cb5c40..8041377382 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -13,7 +13,7 @@
 #define BATCH_SZ 4096
 
 /*
- * Yf/Ys/4 tiling
+ * Yf/Ys/4/64 tiling
  *
  * Tiling mode in the I915_TILING_... namespace for new tiling modes which are
  * defined in the kernel. (They are not fenceable so the kernel does not need
@@ -24,6 +24,7 @@
 #define I915_TILING_4	(I915_TILING_LAST + 1)
 #define I915_TILING_Yf	(I915_TILING_LAST + 2)
 #define I915_TILING_Ys	(I915_TILING_LAST + 3)
+#define I915_TILING_64	(I915_TILING_LAST + 4)
 
 enum i915_compression {
 	I915_COMPRESSION_NONE,
-- 
2.34.1

