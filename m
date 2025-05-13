Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFF7C3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1514D10E5DF;
	Tue, 13 May 2025 18:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUrDdGeG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984BF10E5DF
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747162712; x=1778698712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sW5430z8VKKZWeXFaMHt0wimlS2HX3sALPJVIT4Quw8=;
 b=eUrDdGeGlk5ELEcWzhwFx4jxdq/QB3+YQKp2tDH85yi6QJ+qMHtn3k+J
 TbugZ2i9Na76Hx+HmDReyWWN9QSWYigdtwtvQ2tHHOPj3Pl3+kLlC1xwU
 m1Nw0MF+E4LQhjUcvSxr0shKhzBw1VeSWIx+j/+q02UUnJpmGGqY8rEYj
 MGF6OUivvMfCi2lrPovKtQcUVJMFUop/MJcMJBUcbHB54fpcPCYdYNCKC
 RfPSs7kb97YCDUmBLy4GTKs5kT8Cu+rra2emuL29+/NXXWAdmgE/W0Ma2
 /Kb/lMa2s5/InpjMaLbWYX3FXiYJiE40y/HUuhB1knRBg8FjMQDIuJHoZ A==;
X-CSE-ConnectionGUID: TEPG6ioAS1aW4vEDM8+91w==
X-CSE-MsgGUID: IEZGXXc4QlWu7RPF+j+/cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48960604"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="48960604"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:32 -0700
X-CSE-ConnectionGUID: ncLH6iJ5SReLsrIuLrC2Yw==
X-CSE-MsgGUID: SqLKouEaS9CwhDuOjdvVYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137679147"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:31 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 04/15] tests/xe_copy_basic: use non-zero pitch
Date: Tue, 13 May 2025 20:57:59 +0200
Message-ID: <20250513185811.897232-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
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

Passing zero leads to use turn all bits on what's incorrect. Pass
width as pitch to avoid undefined behavior in mem-copy and mem-set.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_copy_basic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index a43842e398..d4300b85c0 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -57,10 +57,10 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
 
 	blt_mem_init(fd, &mem);
-	blt_set_mem_object(&mem.src, src_handle, size, 0, width, height,
+	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
 			   region, src_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
 			   COMPRESSION_DISABLED);
-	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height,
+	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
 			   region, dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
 			   COMPRESSION_DISABLED);
 	mem.src.ptr = xe_bo_map(fd, src_handle, size);
@@ -108,7 +108,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
 
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
 	blt_mem_init(fd, &mem);
-	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height, region,
+	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height, region,
 			   dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR, COMPRESSION_DISABLED);
 	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
 	blt_set_batch(&mem.bb, bb, bb_size, region);
-- 
2.43.0

