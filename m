Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A836C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 09:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A888C10EF3E;
	Fri, 26 Apr 2024 09:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBiB/GmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2245C10EF3E
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 09:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714122111; x=1745658111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NJn8U2T4EHTNc4Q0z/lAy+8vFjOivYmx+L4NUOwzjjU=;
 b=hBiB/GmZmV/WH2FmnrfQc1SrlOyho2eQpsArqCPxnadxuodxEU8qqzJk
 +diz1uBVBSe/UbGAMaTE5o/wbLWzdFS356Xzpwgf7yNkBsy10GBkdYU9b
 mz0/2Yrrdw/BQ188jXQLC+QoCXdDBkz8TUKQ29URnUNj7gJhn0bjsK6F5
 CB9E3hT0x4gM2ook1YL6EnlUpC0VAzn6PahSWpFIonnZLui8LdXQx+NBQ
 fGKiUFaog52Atvjrpe6ZQj6MNbTTrWdJZbmZ0LSM5FJOZddmH+ss6RLzt
 JVPXCyE9WZ69uaZ0zQmcCVbnc7cimcWwQegk9xc4XD67OnDvzUwoJcXie A==;
X-CSE-ConnectionGUID: tkHSNJ/yRdaOFXDQQatl4w==
X-CSE-MsgGUID: N/7H4ipkSQyOs3uHXMBubg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="35238741"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="35238741"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:32 -0700
X-CSE-ConnectionGUID: 8cyTt0TAR7eQZw4NV7CK4Q==
X-CSE-MsgGUID: qer2aFplTG6ONwBED3pdPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25316549"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:31 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 02/10] lib/intel_blt: Rename confusing fb tile to
 i915 tile
Date: Fri, 26 Apr 2024 11:01:09 +0200
Message-Id: <20240426090117.78060-3-zbigniew.kempczynski@intel.com>
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

Fb tile is defacto drm modifier, thus blt_tile_to_fb_tile() name
is confusing as it converts to I915_TILING*, not drm modifier.
Lets rename it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c              | 4 ++--
 lib/intel_blt.h              | 2 +-
 tests/intel/xe_render_copy.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 4da5cc855e..5a281036c4 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -536,14 +536,14 @@ static int __block_tiling(enum blt_tiling_type tiling)
 }
 
 /**
- * blt_tile_to_fb_tile:
+ * blt_tile_to_i915_tile:
  * @tiling: tiling id
  *
  * Returns:
  * id of tiling introduced in i915 like I915_TILING_* used for example
  * in render-copy code.
  */
-int blt_tile_to_fb_tile(enum blt_tiling_type tiling)
+int blt_tile_to_i915_tile(enum blt_tiling_type tiling)
 {
 	switch (tiling) {
 	case T_LINEAR: return I915_TILING_NONE;
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index cc59666862..fcfce69bee 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -213,7 +213,7 @@ bool blt_platform_has_flat_ccs_enabled(int fd);
 bool blt_uses_extended_block_copy(int fd);
 
 const char *blt_tiling_name(enum blt_tiling_type tiling);
-int blt_tile_to_fb_tile(enum blt_tiling_type tiling);
+int blt_tile_to_i915_tile(enum blt_tiling_type tiling);
 
 uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
 			    enum blt_tiling_type tiling);
diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index 4f98cb7dfa..ef75c4ce6d 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -407,7 +407,7 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 					continue;
 
 				tiling_name = blt_tiling_name(tiling);
-				tiling = blt_tile_to_fb_tile(tiling);
+				tiling = blt_tile_to_i915_tile(tiling);
 				igt_dynamic_f("render-%s-%ux%u", tiling_name, surfwidth, surfheight)
 					render(bops, tiling, surfwidth, surfheight, id);
 			}
-- 
2.34.1

