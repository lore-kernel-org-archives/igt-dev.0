Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9FFD5C0F2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 08:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3B910E771;
	Tue, 16 Dec 2025 08:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9ChQWq/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4679510E771
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 08:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765875141; x=1797411141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rhx4u+AA9sQVrJG9ZRcUQqprogICaWaa5tc/8nKvD2g=;
 b=e9ChQWq/MS528gpnMZqxNs1bWnd3oghQRMbauol0l6sf/qwoZc4nkAwp
 7BhvdcwhrSvDaGvaLhKPfATLUWIFXzMPikjW6k4NWVWKK4nUdbmDYUURy
 5Qr3OEDfHClSPW2+PpvmW5JaBCO2DGRjW/65cuE2t086ai9xM6T4R4nSk
 TumGPt+3vpX/TSdKvuWK/GdHCZwOkpfbxa6dCLqFCg0qO2XytVqr3QwIv
 fLj/bZmbjY6z0El4IH4GynDwAzrZUWwkrkeSwm85yGHpHLY0b06a4ocLe
 //6ZCvt92SsIBPJ1q98Fef+objMXX2UskMyOtI3d2iKELQZL4FjaYoWVk Q==;
X-CSE-ConnectionGUID: eDBN75fcS8SJ/2cfku4REQ==
X-CSE-MsgGUID: Bs1JKpSqRZCEVU9mDQeI+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67670041"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="67670041"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:52:21 -0800
X-CSE-ConnectionGUID: Tdt45CfLQHKo8dyw8fRSlg==
X-CSE-MsgGUID: F3B02nM5SbOMKuOTHX3gfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197710619"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:52:19 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, jeevan.b@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 2/4] tests/intel/kms_mmap_write_crc: Use lib function
 to paint fb
Date: Tue, 16 Dec 2025 14:22:40 +0530
Message-ID: <20251216085242.2916476-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216085242.2916476-1-karthik.b.s@intel.com>
References: <20251216085242.2916476-1-karthik.b.s@intel.com>
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

Use the lib function igt_paint_test_pattern_fb to paint the fb
instead of doing it locally in the test binary.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_mmap_write_crc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index ad3dd1b20..ccde47c2f 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -91,7 +91,6 @@ static void test(data_t *data)
 	igt_output_t *output = data->output;
 	struct igt_fb *fb = &data->fb[1];
 	drmModeModeInfo *mode;
-	cairo_t *cr;
 	char *ptr;
 	void *buf;
 	igt_crc_t crc;
@@ -104,9 +103,7 @@ static void test(data_t *data)
 
 	ptr = dmabuf_mmap_framebuffer(data->drm_fd, fb);
 
-	cr = igt_get_cairo_ctx(data->drm_fd, fb);
-	igt_paint_test_pattern(cr, fb->width, fb->height);
-	igt_put_cairo_ctx(cr);
+	igt_paint_test_pattern_fb(data->drm_fd, fb);
 
 	/* flip to it to make it UC/WC and fully flushed */
 	igt_plane_set_fb(data->primary, fb);
@@ -151,9 +148,7 @@ static void test(data_t *data)
 
 	/* start over, writing non-white to the fb again and flip to it to make it
 	 * fully flushed */
-	cr = igt_get_cairo_ctx(data->drm_fd, fb);
-	igt_paint_test_pattern(cr, fb->width, fb->height);
-	igt_put_cairo_ctx(cr);
+	igt_paint_test_pattern_fb(data->drm_fd, fb);
 
 	igt_plane_set_fb(data->primary, fb);
 	igt_display_commit(display);
-- 
2.43.0

