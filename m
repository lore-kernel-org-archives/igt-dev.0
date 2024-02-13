Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168EDC48260
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 10:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA2C10E343;
	Tue, 13 Feb 2024 10:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLb+srV5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578F710E318
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Feb 2024 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707818502; x=1739354502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OPb20G8ogeEu+Vfbx9AywAQMo/5PdmGKJ5MapLOgBbQ=;
 b=BLb+srV5okNyZAuYxcpDwwltM4GA5RovIuYaX6L2WySeW3/QiDoDt12z
 xZnV86x1ise5AJ/3fjATNMVnCNdIwdjgULNLoahNCDPxrontPd29HmxZS
 z23lNKXsJhXZUEqMlZpptHNbZGryfyDIsYvHKsUeRK9c+MNI7gDW1zefu
 lIZVgQJQtNEeLce8KpaE9OrteS0IG34CRKcO2MlLTRot4/n1zDU6NmRLo
 KpNZ7o/X5XnvfiEhFPzoNvGw5VHTj5E8DeeFX1lelRGyhd83FJUevl0x0
 5pH6zaEiX2PULzGlZdpd8ba60ZKHOF5KFLZI8VqqyFScMt9BLi+kG5Z+O A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19232361"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="19232361"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2815517"
Received: from gfmckenx-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.21.42])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:40 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 6/8] tests/intel/kms_dirtyfb: pass the bo_size
Date: Tue, 13 Feb 2024 10:01:23 +0000
Message-ID: <20240213100125.90085-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213100125.90085-1-matthew.auld@intel.com>
References: <20240213100125.90085-1-matthew.auld@intel.com>
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

Looks possible for the derived bo_size to not be page aligned leading to
broken behaviour when vm_binding it with xe. Pass through the bo_size,
instead of leaving as zero. This will be enforced in the next patch.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/kms_dirtyfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 7bf49cb15..26b82e50a 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -254,7 +254,7 @@ static void run_test(data_t *data)
 				    igt_drm_format_to_bpp(data->fbs[1].drm_format),
 				    0,
 				    igt_fb_mod_to_tiling(data->fbs[1].modifier),
-				    0, 0, 0, is_xe_device(data->drm_fd) ?
+				    0, data->fbs[1].size, 0, is_xe_device(data->drm_fd) ?
 				    system_memory(data->drm_fd) : 0,
 				    intel_get_pat_idx_uc(data->drm_fd));
 	dst = intel_buf_create_full(data->bops, data->fbs[2].gem_handle,
@@ -262,7 +262,7 @@ static void run_test(data_t *data)
 				    data->fbs[2].height,
 				    igt_drm_format_to_bpp(data->fbs[2].drm_format),
 				    0, igt_fb_mod_to_tiling(data->fbs[2].modifier),
-				    0, 0, 0, is_xe_device(data->drm_fd) ?
+				    0, data->fbs[2].size, 0, is_xe_device(data->drm_fd) ?
 				    system_memory(data->drm_fd) : 0,
 				    intel_get_pat_idx_uc(data->drm_fd));
 	ibb = intel_bb_create(data->drm_fd, PAGE_SIZE);
-- 
2.43.0

