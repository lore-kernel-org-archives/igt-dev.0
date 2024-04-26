Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1951C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 09:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BEE10EF4A;
	Fri, 26 Apr 2024 09:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgMZwPGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D36F10EF4A
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 09:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714122114; x=1745658114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7xaan9+AvnffV3uxTjEiLnrLoY6WrqmGkGnvWLPMFNY=;
 b=QgMZwPGs4dLkb3W9SV85Fs8TsNT0YDZ/KlbkwIrpw9tQC4JUaFH4ICYa
 rbgQlDShrtuZffwmBFr3D0+RcFCJz67ATgceo+1aljD8fvnxAnZYcY/3G
 s/eKScWbYbyKd6bzXqM0mzyDANInUFq6BvDO+vgMFIxTTopsH1H4Cg22i
 TjlOezPjyHW3KCyJ7Fpxv30R1MLKwv3otS0sl66Sl1/R4nhdP63kYZWeH
 aNDOTz4sl8nPlm4QeSzDr4WU7cDSnzf1tiEiAyFyevSItOWcbCWz9DfbG
 N+3f3xzpawWHPHlCZdspV5GV8UFDjGaDF3b9zRT7s+jfaA+sScQGMVxak w==;
X-CSE-ConnectionGUID: V4rNMiL2R66EvYrHRVgfZg==
X-CSE-MsgGUID: SUVadZKuRnO77qmfnI2/Xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="35238771"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="35238771"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:43 -0700
X-CSE-ConnectionGUID: hxsFmEWlSjqjdJDcJL0XWQ==
X-CSE-MsgGUID: ejP44j2GR5+S67X2nHGbdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25316622"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:42 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 05/10] lib/intel_bufops: Start supporting compression
 on Xe2+
Date: Fri, 26 Apr 2024 11:01:12 +0200
Message-Id: <20240426090117.78060-6-zbigniew.kempczynski@intel.com>
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

Xe2+ uses unified compression where PAT index determines using
compressed pages so lets add support of that to intel-buf. It is
necessary to run render-copy with compression on those platforms.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_bufops.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 3bf89798ba..c4ab94b464 100644
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
-- 
2.34.1

