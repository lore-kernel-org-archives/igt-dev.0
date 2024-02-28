Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4A9C5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 14:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01DA10E9FE;
	Wed, 28 Feb 2024 14:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4o8Uyds";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3FC10E9F7
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 14:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709132083; x=1740668083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DH4D81xgR5PolPVKtmfuvmgJPuYJBYBWF8rem9gBlOI=;
 b=B4o8Uydsi5UT25ctob4S1cli3NjnXMJkuHk2XqQBPQbPfCpOG+cLekMH
 CX29k4AwvDmGdQtwEMIJokbkAb1ZbYKYNOYqGb3o4uXmLX11jYcId3aCm
 3n8daSC/QuiynbQHAQ9S3BNMiTMe5zO0Odfte3wxgiDd6txlbwLrugBrq
 GFn4nSmMNnPPCsxeU9AsX5Hxgl50a126C/5Jx/SpkB7DeK+sLcedg+VRO
 NivGs6zqn4pxUJOdOHahB1YR9wItCgqu+/2W480Gayr1oy+mIeTy+mX2Z
 YEB9fvNlm/+5pgV+bg70vycYNf2+lTs0m0oXkR1W6Zk9VRvCowK6O/l6n Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7314227"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7314227"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="8022510"
Received: from wbosek-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:42 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 "Cc : Matthew Auld" <matthew.auld@intel.com>
Subject: [PATCH i-g-t 6/7] lib/intel_bufops: Add png dump helper without
 detiling
Date: Wed, 28 Feb 2024 15:54:06 +0100
Message-Id: <20240228145407.370325-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
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

Sometimes we need to visualy inspect tiled surface. Add appropriate
function which doesn't detile surface before writing to png.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_bufops.c | 34 ++++++++++++++++++++++++++++++++++
 lib/intel_bufops.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 67254ec107..5e2701a7dc 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1337,6 +1337,40 @@ void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename)
 
 	__intel_buf_write_to_png(buf->bops, buf, filename, true);
 }
+static void __intel_buf_raw_write_to_png(struct buf_ops *bops,
+					 struct intel_buf *buf,
+					 const char *filename)
+{
+	cairo_surface_t *surface;
+	cairo_status_t ret;
+	uint8_t *linear;
+	int format, width, height, stride;
+
+	format = CAIRO_FORMAT_RGB24;
+	width = buf->surface[0].stride / 4;
+	height = __get_aligned_height(intel_buf_height(buf),
+				      buf->bpp, buf->tiling);
+	stride = buf->surface[0].stride;
+
+	if (is_xe_device(bops->fd))
+		linear = xe_bo_map(bops->fd, buf->handle, buf->bo_size);
+	else
+		linear = gem_mmap__device_coherent(bops->fd, buf->handle,
+						   0, buf->bo_size, PROT_READ);
+	surface = cairo_image_surface_create_for_data(linear,
+						      format, width, height,
+						      stride);
+	ret = cairo_surface_write_to_png(surface, filename);
+	igt_assert(ret == CAIRO_STATUS_SUCCESS);
+	cairo_surface_destroy(surface);
+
+	munmap(linear, buf->bo_size);
+}
+
+void intel_buf_raw_write_to_png(struct intel_buf *buf, const char *filename)
+{
+	__intel_buf_raw_write_to_png(buf->bops, buf, filename);
+}
 
 static void *alloc_aligned(uint64_t size)
 {
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 75e0ec2c44..363f7abaad 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -221,6 +221,7 @@ const char *intel_buf_set_name(struct intel_buf *buf, const char *name);
 
 void intel_buf_write_to_png(struct intel_buf *buf, const char *filename);
 void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename);
+void intel_buf_raw_write_to_png(struct intel_buf *buf, const char *filename);
 void intel_buf_draw_pattern(struct buf_ops *bops, struct intel_buf *buf,
 			    int x, int y, int w, int h,
 			    int cx, int cy, int cw, int ch,
-- 
2.34.1

