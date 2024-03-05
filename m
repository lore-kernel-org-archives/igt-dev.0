Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D2CC54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 05:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DD211270F;
	Tue,  5 Mar 2024 05:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8cEKp0Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311F711270F
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 05:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709617280; x=1741153280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x3ZDNYId5204X4DeVaD1lz9BEyRJ6r6jdc862k7bN/k=;
 b=m8cEKp0Y/hMnlVziLEfLpw89O0KkJSbeQLcGXE4qq1Dm5RnbWkZnNny2
 mpa65str9Q9DM2W48soC1pbBkuaMOpevhQh4GlGGVzgaNx9mgy/v8Fp/G
 RADRgEWxPLXq4z6+tBdXr0nR4+173GjVp/2JX67+5vw2a+tsE7UooqJfo
 UgJtPKNyC4OFsYlL0/M/5hJOc/sXdt9CNvz8Oof4douN3y7bqEWj9Bjrz
 tm5Yu83mR1IY4LwYn/dBD+4yxDCxsr0m+aEN9/fxenuCXF/3jkKmXpTT5
 Y3lh1sd4eFXRdIYxa7jvVOJyRGOTFUhP+fXHgQ9q0u8eSSj0AdL53QZ/E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4009525"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4009525"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:41:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9099948"
Received: from unknown (HELO localhost) ([10.245.244.112])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 21:41:19 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 2/4] lib/intel_bufops: Use printf style filename
 formatting
Date: Tue,  5 Mar 2024 06:40:54 +0100
Message-Id: <20240305054056.139691-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305054056.139691-1-zbigniew.kempczynski@intel.com>
References: <20240305054056.139691-1-zbigniew.kempczynski@intel.com>
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

Dumping to png where we want to pass width, height and/or other
values is much easier when we use printf style filename formatting
instead preparing string with filename separately. Replace current
 write to raw png from single string to string formatting.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_bufops.c | 14 +++++++++++++-
 lib/intel_bufops.h |  2 +-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 5e2701a7dc..e45b17b0a8 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1367,9 +1367,21 @@ static void __intel_buf_raw_write_to_png(struct buf_ops *bops,
 	munmap(linear, buf->bo_size);
 }
 
-void intel_buf_raw_write_to_png(struct intel_buf *buf, const char *filename)
+__attribute__((format(printf, 2, 3)))
+void intel_buf_raw_write_to_png(struct intel_buf *buf, const char *namefmt, ...)
 {
+	char *filename;
+	int ret;
+	va_list ap;
+
+	va_start(ap, namefmt);
+	ret = vasprintf(&filename, namefmt, ap);
+	igt_assert(ret >= 0);
+	va_end(ap);
+
 	__intel_buf_raw_write_to_png(buf->bops, buf, filename);
+
+	free(filename);
 }
 
 static void *alloc_aligned(uint64_t size)
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 363f7abaad..828ed7be9d 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -221,7 +221,7 @@ const char *intel_buf_set_name(struct intel_buf *buf, const char *name);
 
 void intel_buf_write_to_png(struct intel_buf *buf, const char *filename);
 void intel_buf_write_aux_to_png(struct intel_buf *buf, const char *filename);
-void intel_buf_raw_write_to_png(struct intel_buf *buf, const char *filename);
+void intel_buf_raw_write_to_png(struct intel_buf *buf, const char *namefmt, ...);
 void intel_buf_draw_pattern(struct buf_ops *bops, struct intel_buf *buf,
 			    int x, int y, int w, int h,
 			    int cx, int cy, int cw, int ch,
-- 
2.34.1

