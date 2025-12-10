Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E59D3C525
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 03:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2302C10E651;
	Wed, 10 Dec 2025 03:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+m5Bf5R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C432110E654
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 03:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765337009; x=1796873009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cndhcw38/S92v7VF75m/V26guJsmJNb7cojGLxeGj3E=;
 b=M+m5Bf5RkqsxgE6yhY3SP68LHyFgU85TttaicOvHumsao+CPU4k1bDLI
 F8y24Ll8auC13pIOjZbyQglhspynKuAzr66OwrNE4G4AfEpeBw8/Qr9/F
 3m1z/5pymxlehFHEBh/qWF6947munaEJtq8g6lwhXseNA3ubPZrX+K/pE
 n4GIuAHO5b3DeQz65OJsJvqtzaDCyRjv1peCrGITJA0wtkLfmmYpE+bjl
 ns481DWZp7Xe8GxI7+ZkxlhMIAQWfOtwBAcT7BeGCw5jpfOsmBggPvjS6
 xxYypH6dh18JdxDW72kGpethzoy3BVx6uI7Qkq33sCSJhwm0G1q2duevH g==;
X-CSE-ConnectionGUID: /FAH0ry3SdS8v/tgXMYcew==
X-CSE-MsgGUID: Z2ucR3VcSCGDkSBRFceAWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="66481256"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="66481256"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:23:29 -0800
X-CSE-ConnectionGUID: B3Q+IU3US/iduaCs6X7Kwg==
X-CSE-MsgGUID: eLM7XfpTTeSI2PEqm3c+lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="200822738"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:23:28 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/kms_mmap_write_crc: Use lib function to
 paint fb
Date: Wed, 10 Dec 2025 08:53:47 +0530
Message-ID: <20251210032349.2781106-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210032349.2781106-1-karthik.b.s@intel.com>
References: <20251210032349.2781106-1-karthik.b.s@intel.com>
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

