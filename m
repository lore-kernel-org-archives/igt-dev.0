Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D392C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 05:34:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB7110E13E;
	Thu,  9 May 2024 05:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYO4nizs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1407C10E13E
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 05:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715232869; x=1746768869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Szoq8idfA+CsZL7ej/jM44QgfhisHyPz05HrTD7h3yQ=;
 b=IYO4nizsZ/J7mfGDAipVqc82iJiLLDBhJr6r3GCyLgy97f2I3FLoO3/Q
 4nTrzWXMR10JExiKmm949+aT8KBNs+cMA75kmEwb8HrgChXzQpC4uUTAL
 yQpZT2Y6EBG4998HveROHlOHobrTGvFsBhxEsHBcby/yQ4wCbiKIUxfka
 iYlUgyIjr8SBVTLZU+h6JAkc1wpy+evvSKNGdoLF93vsTogbtoMhZxToB
 iOKDHT18BWYY0pKzAz6ElVDgLNxFfRP1tu5jXZgTc+VahZUYGsaPKmeqJ
 rdiIyPu9oQ04uB8aLsaGBZErNk+pRkIKJdsiW+fkij9YHU63/jQNzbW31 A==;
X-CSE-ConnectionGUID: yYlcY+ttRl6+q02L4DuFTg==
X-CSE-MsgGUID: FOhtisSZQu6tCpXJDtNMYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="21802900"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="21802900"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:34:29 -0700
X-CSE-ConnectionGUID: tY+BCYdcQ6iUpR3st+Bs0A==
X-CSE-MsgGUID: QMp51utHR5urgRVQA4kATQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="29187237"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:34:28 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v5 05/11] lib/intel_bufops: Start supporting compression
 on Xe2+
Date: Thu,  9 May 2024 07:33:53 +0200
Message-Id: <20240509053359.449885-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240509053359.449885-1-zbigniew.kempczynski@intel.com>
References: <20240509053359.449885-1-zbigniew.kempczynski@intel.com>
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

