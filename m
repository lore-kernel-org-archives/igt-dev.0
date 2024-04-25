Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AB0C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 10:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6532210F1AC;
	Thu, 25 Apr 2024 10:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTpg78OZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D59810F1AC
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 10:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714042068; x=1745578068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=atB0t7whfyYlEZ24Fs88iXM3xsAm4zp1CKJ8cM0trY8=;
 b=eTpg78OZDYzmpvwBOdl/VdF+x2jtun0RiNM3WOEOhvJ7R+tDDzEBWdVS
 qL4XfJawvaUEG8B9A/mphnWeP8hmLudAhFm+2VunKNTmNcBhtKP7EcIm9
 BfIpPxG+LuJj0Jgtm89roqw4kNcf5P0tDeVvtu3KRfm8F1jeRfyJysAmV
 uCD081UFVotZA33E9f5EQxUQzGmHdh2CYH9LBzyfs3wb3GeLyX3/8yKi0
 3VylXA5Qc62GhdMSnUrWOBE6bGaort1G1c5jNXK56FGF+29OU2KZBYH4t
 u113SNzu7iQqIYGFd9D6HyRyT4tCEcqq0PMhR7KUZrNHhs+KXEegTUyZP w==;
X-CSE-ConnectionGUID: I1u7cdReSS2wkQwYrFCcqQ==
X-CSE-MsgGUID: lzrRGX/VSxO0cNBf4jIImQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="32209698"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="32209698"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:48 -0700
X-CSE-ConnectionGUID: 9zFU2eiGSN2hRM6sI3G77Q==
X-CSE-MsgGUID: VCb33gzvQ/SLqDrl3lJjsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25018138"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:47 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 5/7] lib/intel_bufops: Start supporting compression on
 Xe2+
Date: Thu, 25 Apr 2024 12:47:19 +0200
Message-Id: <20240425104721.52376-6-zbigniew.kempczynski@intel.com>
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

Xe2+ uses unified compression where PAT index determines using
compressed pages so lets add support of that to intel-buf. It is
necessary to run render-copy with compression on those platforms.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_bufops.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index b96275e485..5e89c7e5a6 100644
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

