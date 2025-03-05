Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2FCC282EC
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 13:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFD410E76F;
	Wed,  5 Mar 2025 13:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mj4ghPDw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B9B10E723
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741183120; x=1772719120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6JD9bHx/Pr+R34o64hgOJpNXM1EfYQadSKcTSl2dELE=;
 b=Mj4ghPDwlClpCc7neUU6NoEzd65xvEfyrwNynH96Fxekp1ELsf4/TsSb
 /tN00DvBaAK1ol1JuR/Gql+RbbUrsb4TfZz4n2IMaTA6PdmWk0L6aU5jy
 vNR+fqf4mMMnVYa/4wAXTpeV0+55ORU1r43t7a2PNfrl8VPr1Z4fgeJ8T
 HBhzrl7PswfxC4AX4k4+HEmqLSw9P6Dxf/WELT/0sRd+3YpO3Ei7wxwRN
 zwxB6E6fDp18EHn8GYeIxJl466as+s+cWAdFrunVPESCdbK43D+CSp6zf
 /3MGHUsecF/U1gf9sm3W9TRDvHtTtflTLmEvAaI7cHhD+4MuexiGZAAqZ g==;
X-CSE-ConnectionGUID: GbySw9RdTfyFcB3GDZqAoA==
X-CSE-MsgGUID: ixbJfA7uQ3+/ezwCbs1udg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52350152"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="52350152"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:58:40 -0800
X-CSE-ConnectionGUID: yKv2VqHaTdG5rtoE7dZMhA==
X-CSE-MsgGUID: 5oy/7PuyR8WMchG802S1fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118517124"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.38])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:58:38 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel/xe_render_copy: Expose render duration
Date: Wed,  5 Mar 2025 14:57:59 +0100
Message-ID: <20250305135821.37517-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305135821.37517-1-francois.dugast@intel.com>
References: <20250305135821.37517-1-francois.dugast@intel.com>
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

If the argument duration_ns is provided (not NULL), render() writes
into it the duration of the rendering execution, which is only a part
of the overall function. It can be used to observe the relative change
of rendering duration under various hardware stressing conditions.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_render_copy.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index ffe5f7ef1..2125e0667 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -260,7 +260,8 @@ static const char * const testname[] = {
 
 static int render(struct buf_ops *bops, uint32_t tiling,
 		  uint32_t width, uint32_t height,
-		  enum render_copy_testtype testtype)
+		  enum render_copy_testtype testtype,
+		  uint64_t *duration_ns)
 {
 	struct intel_bb *ibb;
 	struct intel_buf src, dst, final, grfs;
@@ -271,6 +272,7 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	int compression = testtype == COPY_FULL_COMPRESSED ? I915_COMPRESSION_RENDER :
 							     I915_COMPRESSION_NONE;
 	bool is_compressed;
+	struct timespec tv;
 	struct posrc {
 		uint32_t x0, y0;
 		uint32_t x1, y1;
@@ -329,6 +331,8 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	render_copy = igt_get_render_copyfunc(devid);
 	igt_assert(render_copy);
 
+	if (duration_ns)
+		igt_gettime(&tv);
 	switch (testtype) {
 	case COPY_SQUARE:
 	case COPY_VSTRIPES:
@@ -404,6 +408,8 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	}
 
 	intel_bb_sync(ibb);
+	if (duration_ns)
+		*duration_ns = igt_nsec_elapsed(&tv);
 	intel_bb_destroy(ibb);
 
 	if (write_png) {
@@ -491,7 +497,7 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
 				tiling_name = blt_tiling_name(tiling);
 				tiling = blt_tile_to_i915_tile(tiling);
 				igt_dynamic_f("render-%s-%ux%u", tiling_name, surfwidth, surfheight)
-					render(bops, tiling, surfwidth, surfheight, id);
+					render(bops, tiling, surfwidth, surfheight, id, NULL);
 			}
 		}
 	}
-- 
2.43.0

