Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBB5CA0FFD
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 08:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1890E10E3AC;
	Mon,  1 Sep 2025 08:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1ysJzvu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5356810E3B0
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Sep 2025 08:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756716228; x=1788252228;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=czFyySzao8CjACi3pQpLBniYiMoKYbWqZZQFFjdSybI=;
 b=V1ysJzvudVsWTHtXv2LeMD+D5hx5KZwVs736LEaLOcb42CkrQiSVQBKw
 5KsmfseJUs8n0ZvXbRoBLzZWuonLEg0wp0wWaxxtKhKnEFWFLbMqhxiVm
 WMAT65R0xAboVMqmrHt2Ba5Re1YtfT0yzzIpjwGr53boxRW/ynW532ag3
 Tho6i7ETbLsVGbWR5HZBU31pOWVFDjQs8644N30lyrooNb2KapSHBq1B5
 jq2D+k60kGjiCUSpPiSoUqIyKadWrz0dfmrFTRSRGDDdZB45McIb9BHGu
 1YT35+AeYH0d6Z1KUv9RU6OR55Te3gZJeM/Hmm/siRUk/lUTaOmRpSl/I w==;
X-CSE-ConnectionGUID: T8qIZYsJTQCfnyugj9ye4Q==
X-CSE-MsgGUID: YPJptGS6RxqM75DgHBrMAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59033166"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59033166"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 01:43:47 -0700
X-CSE-ConnectionGUID: 8RjJwXjMTJe1KRVafprWqw==
X-CSE-MsgGUID: ykmrdx1mTTSg++3SGuIZzA==
X-ExtLoop1: 1
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 01:43:46 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] lib/intel_blt: Fix MEM_SET instruction for Xe2+ platforms
Date: Mon,  1 Sep 2025 14:15:34 +0530
Message-Id: <20250901084534.909825-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

The structure of the MEM_SET instruction has changed related to the
destination MOCS starting with Xe2 platforms.

Bspec: 57562
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 lib/intel_blt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 8a05f482f..71ed891c3 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -2117,6 +2117,7 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd,
 	int b;
 	uint32_t *batch;
 	uint32_t value;
+	uint32_t devid = intel_get_drm_devid(fd);
 
 	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
 					  0, mem->dst.pat_index);
@@ -2131,7 +2132,11 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd,
 	batch[b++] = mem->dst.pitch - 1;
 	batch[b++] = dst_offset;
 	batch[b++] = dst_offset << 32;
-	batch[b++] = value | mem->dst.mocs_index;
+	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+		batch[b++] = value | (mem->dst.mocs_index << 3);
+	else
+		batch[b++] = value | mem->dst.mocs_index;
+
 	batch[b++] = MI_BATCH_BUFFER_END;
 
 	munmap(batch, mem->bb.size);
-- 
2.34.1

