Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4439AC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 12:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFF110E5C7;
	Wed, 15 May 2024 12:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGx21MZW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA8D10E5C7
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715775608; x=1747311608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jWi/c0UOPrn1UqpRBq0UzQzyaCIeWbG+kql5wH/VnTQ=;
 b=ZGx21MZWxL8fO4LSGK8H0rj0CwHpCSclO0HNOCmEghePxdZRCppOG5Lv
 /y8AQctBFQ19PiNQiyL5qoxX2DIedpK/GiOQJhtaSSFAZCF2J+JNPOFNv
 EtGcaMG4aeDXhj2dgU6nR/I3+lPIYP3MbwqWemgNMpPYVaWobd7lH/eb3
 pfkRP3u+sryWEzXIq97vb4MlwcLfmswaMLd7A9Xw+0qO8nbXNnLmUx5M4
 +YYulvUrGEMHHldRNu6UG2Xxulce2DoIXtziST3Km8bVr+nI2zZ5cEm6g
 fmFhBY54sFYS5AenNgtjZNoQV+cOwqEjz4XFzvvaVQQLgUpph3T/y/pQM Q==;
X-CSE-ConnectionGUID: hd+2B3CmT6Ot657TVx1WmQ==
X-CSE-MsgGUID: kHbdlaw7TLK/YwVoxExHtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="12036153"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="12036153"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:08 -0700
X-CSE-ConnectionGUID: 9F8Id5JdT22ubeKOylijPA==
X-CSE-MsgGUID: iM2FPG6ZS0Ko1BPsjKfhMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="31039709"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:08 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v6 3/9] lib/intel_bufops: Start supporting compression
 on Xe2+
Date: Wed, 15 May 2024 14:19:43 +0200
Message-Id: <20240515121949.245280-4-zbigniew.kempczynski@intel.com>
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

Xe2+ uses unified compression where PAT index determines using
compressed pages so lets add support of that to intel-buf. It is
necessary to run render-copy with compression on those platforms.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 7118272e5f..52a5f322ea 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -934,8 +934,14 @@ static void __intel_buf_init(struct buf_ops *bops,
 			if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &bo_size, region))
 				igt_assert_eq(__gem_create(bops->fd, &bo_size, &buf->handle), 0);
 		} else {
+			uint16_t cpu_caching = __xe_default_cpu_caching(bops->fd, region, 0);
+
+			if (AT_LEAST_GEN(bops->devid, 20) && compression)
+				cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+
 			bo_size = ALIGN(bo_size, xe_get_default_alignment(bops->fd));
-			buf->handle = xe_bo_create(bops->fd, 0, bo_size, region, 0);
+			buf->handle = xe_bo_create_caching(bops->fd, 0, bo_size, region, 0,
+							   cpu_caching);
 		}
 	}
 
@@ -970,11 +976,16 @@ void intel_buf_init(struct buf_ops *bops,
 		    uint32_t tiling, uint32_t compression)
 {
 	uint64_t region;
+	uint8_t pat_index = DEFAULT_PAT_INDEX;
+
+	if (compression && AT_LEAST_GEN(bops->devid, 20))
+		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
 
 	region = bops->driver == INTEL_DRIVER_I915 ? I915_SYSTEM_MEMORY :
 						     system_memory(bops->fd);
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
-			 tiling, compression, 0, 0, region, DEFAULT_PAT_INDEX,
+			 tiling, compression, 0, 0, region,
+			 pat_index,
 			 DEFAULT_MOCS_INDEX);
 
 	intel_buf_set_ownership(buf, true);
@@ -991,8 +1002,14 @@ void intel_buf_init_in_region(struct buf_ops *bops,
 			      uint32_t tiling, uint32_t compression,
 			      uint64_t region)
 {
+	uint8_t pat_index = DEFAULT_PAT_INDEX;
+
+	if (compression && AT_LEAST_GEN(bops->devid, 20))
+		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
+
 	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
-			 tiling, compression, 0, 0, region, DEFAULT_PAT_INDEX,
+			 tiling, compression, 0, 0, region,
+			 pat_index,
 			 DEFAULT_MOCS_INDEX);
 
 	intel_buf_set_ownership(buf, true);
@@ -1053,10 +1070,16 @@ void intel_buf_init_using_handle_and_size(struct buf_ops *bops,
 					  uint32_t req_tiling, uint32_t compression,
 					  uint64_t size)
 {
+	uint8_t pat_index = DEFAULT_PAT_INDEX;
+
 	igt_assert(handle);
 	igt_assert(size);
+
+	if (compression && AT_LEAST_GEN(bops->devid, 20))
+		pat_index = intel_get_pat_idx_uc_comp(bops->fd);
+
 	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
-			 req_tiling, compression, size, 0, -1, DEFAULT_PAT_INDEX,
+			 req_tiling, compression, size, 0, -1, pat_index,
 			 DEFAULT_MOCS_INDEX);
 }
 
-- 
2.34.1

