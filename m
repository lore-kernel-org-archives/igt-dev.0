Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16662C3601C
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 14:05:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B840310E5CB;
	Tue,  1 Apr 2025 14:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCSRmV5K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC0410E5E6
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743516334; x=1775052334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cbN5N1PyAkcVX4BsmSZrjweukYmIsmOkzs0H79mYT2Q=;
 b=OCSRmV5K1y308NUEa2E45GD81M16nNDAE57VXB/Ncm0aA1n8NpYBTYns
 KyJicHo5RKxjrHfmaO3mwjdyIyLQ5JzMkhIzKWjU7t9yA99VBFxOCAF2P
 WCCr5HVHTXvaQ90Tb895nR5zyKkDJpjxwGB09CelkkiSaxGZC8EgcHiCl
 wy2Ulo7daPqNFo65r//lFRxZ1GCbEjjnSsuWckn7Ka6Puh8gmF24GMFku
 yCJ8lCjlgWC81Hk1A4oZQvpfSHvP4YpcMXIOVj+jrIDwhEnXotZdd5VTU
 3o9h+yYDnKbha5wMf8zoKDfEO07OB8+ECyansHMRuGnS/BPTKYhPolcec A==;
X-CSE-ConnectionGUID: JwbOjQ6SRryis+ufP59Qgg==
X-CSE-MsgGUID: GJP9x2fnQKyTMX2J7tiCOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70198597"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="70198597"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 07:05:34 -0700
X-CSE-ConnectionGUID: Oma8rQnIRvO3gZ+5PwSr0w==
X-CSE-MsgGUID: tQs76/9BS8GGN435qsRp8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126364599"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.4])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 07:05:34 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v4 4/5] tests/intel/xe_render_copy: Expose render duration
Date: Tue,  1 Apr 2025 16:00:59 +0200
Message-ID: <20250401140510.38142-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401140510.38142-1-francois.dugast@intel.com>
References: <20250401140510.38142-1-francois.dugast@intel.com>
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

