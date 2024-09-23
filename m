Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56070CF9C71
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 20:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A1210E499;
	Mon, 23 Sep 2024 20:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7j5Pvx1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E8710E499
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 20:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727124371; x=1758660371;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8yFpoS3rVSsrnJcb5e2HbVRnjWAYoZBUx4E/lPIzwIM=;
 b=a7j5Pvx1qOGWXZSG3hFvpH1oHyfW0EzOaybHkW+O+34Fq1danEt0qF19
 PJtV1sEL4V9az2SeAYw0DxvNXxjZd7DIlKjw7OoEUGbLmxOlkXgJj0JT5
 BDrjzWdky8q6chiABfZbfst42whVrsHrLPAN53Zj8G2mGkUcXS1btosSV
 IAw3JlOXplGYVFXzY3Jpmnt0pKsMvwIWtDGtk1oNF+YrD5JYiGV5wfJa6
 zvA6yX0qj9EmkgsvN6XYaoxCn0AH1O1bxUQyeM20o5hs1tYKQ2UnazDVh
 YZyX0DOz/O8Jj++FrB9lx8CIiGPeGPRMnEJOKx35brjkcBgJlw/fFDur4 Q==;
X-CSE-ConnectionGUID: UXz/fHmnSiWj9S4EDmRkhA==
X-CSE-MsgGUID: 4wuiv6DIRh+UlGzp9fAjKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25955997"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="25955997"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:46:11 -0700
X-CSE-ConnectionGUID: XT+sF/OqS7CuXwXVTjbK+A==
X-CSE-MsgGUID: HvL5AMYfTmqbBM1gM1QfZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71326810"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 13:46:09 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 23:46:08 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/6] tests/xe_ccs: Use logical && instead of bitwise &
Date: Mon, 23 Sep 2024 23:45:55 +0300
Message-ID: <20240923204557.32123-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
References: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The code appears to want to use a logical AND instead
of a bitwise AND. Make it so.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/xe_ccs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index a55ee5abd5b3..e656e5123841 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -344,8 +344,8 @@ static void block_copy(int xe,
 	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
-							!xe_has_vram(xe)) ? region1 : region2;
+	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &&
+			       !xe_has_vram(xe)) ? region1 : region2;
 	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
@@ -479,8 +479,8 @@ static void block_multicopy(int xe,
 	uint64_t bb_size = xe_bb_size(xe, SZ_4K);
 	uint64_t ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
 	uint32_t run_id = mid_tiling;
-	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &
-							!xe_has_vram(xe)) ? region1 : region2;
+	uint32_t mid_region = (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) &&
+			       !xe_has_vram(xe)) ? region1 : region2;
 	uint32_t bb;
 	enum blt_compression mid_compression = config->compression;
 	int mid_compression_format = param.compression_format;
-- 
2.44.2

