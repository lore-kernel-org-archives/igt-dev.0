Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3560EC369B8
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 07:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D724710E672;
	Tue, 15 Apr 2025 07:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1qxnRsP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CF010E670
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 07:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744702743; x=1776238743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cbN5N1PyAkcVX4BsmSZrjweukYmIsmOkzs0H79mYT2Q=;
 b=H1qxnRsPjRemo1y8lz6ZrAN76cc4Zk+rjbqw5lf2tTPoSkF4m56U9fXu
 AN2shirT/rjs2v3paPjFdxEBGLLREpGO2xzqAj6EFk+0VYbDqyRe5yyv8
 gQcLH+Yal4KlOEThDZE7hJ+sZ0J8hQKidijUwqPBfKEDtzWhDWQcC1YYI
 BeYB2h6cr1sfIMLbG0Vr0YZ6F9jA37MltOoTMVWiPSEsECpRbsU50Dlxj
 BEZxLh/ODXHaW7gcYsijSMgUzU/NIyddIhT8/zMS6lYXihbNAxsuumowY
 kgd+3kYFKUXwr3ig7J5k+QH1a8lAP+m2wDbu1zSCASFfABU6I0SynPpCP g==;
X-CSE-ConnectionGUID: k0vibeHeR0OQ90OQlnJjAw==
X-CSE-MsgGUID: fNKTi/3wTS+sZ14Axpyt4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46076401"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46076401"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 00:39:03 -0700
X-CSE-ConnectionGUID: GCD+fSTGQNmAHBh3amYzhg==
X-CSE-MsgGUID: DtFx/WxxQLyj6vcKwW+BaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129806719"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.8])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 00:39:01 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v7 4/5] tests/intel/xe_render_copy: Expose render duration
Date: Tue, 15 Apr 2025 09:36:04 +0200
Message-ID: <20250415073833.121611-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415073833.121611-1-francois.dugast@intel.com>
References: <20250415073833.121611-1-francois.dugast@intel.com>
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

If the argument duration_ns is provided (not NULL), render() writes
into it the duration of the rendering execution, which is only a part
of the overall function. It can be used to observe the relative change
of rendering duration under various hardware stressing conditions.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_render_copy.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index a9a3821ab..e2fbbc0f8 100644
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
@@ -270,6 +271,7 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	int compression = testtype == COPY_FULL_COMPRESSED ? I915_COMPRESSION_RENDER :
 							     I915_COMPRESSION_NONE;
 	bool is_compressed;
+	struct timespec tv;
 	struct posrc {
 		uint32_t x0, y0;
 		uint32_t x1, y1;
@@ -328,6 +330,8 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	render_copy = igt_get_render_copyfunc(xe);
 	igt_assert(render_copy);
 
+	if (duration_ns)
+		igt_gettime(&tv);
 	switch (testtype) {
 	case COPY_SQUARE:
 	case COPY_VSTRIPES:
@@ -403,6 +407,8 @@ static int render(struct buf_ops *bops, uint32_t tiling,
 	}
 
 	intel_bb_sync(ibb);
+	if (duration_ns)
+		*duration_ns = igt_nsec_elapsed(&tv);
 	intel_bb_destroy(ibb);
 
 	if (write_png) {
@@ -490,7 +496,7 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
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

