Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E49C54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 15:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E2A113264;
	Wed,  6 Mar 2024 15:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZ4Qdcj0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF403113264
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 15:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709737355; x=1741273355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ibS4pj5wfh4pz63eiJbjmZKMN4VFungZKBozgxsEDZg=;
 b=MZ4Qdcj0MlDxwulygnkl4T+QSTbOQztHDC/GGfHjCz6yA0uTqss/stRw
 1TPw5PLc8014wZFfltLMAhd65BXiSx8Axm3muIEjyHFsquFlxeiy/lLGT
 BCbxPJM0rJ5xY7yt2QDISSQfFHsf1+F5tkTugaFZ6iuxAPFaeUjjCTwp+
 /NG50FP9oZzttCgZ2+BopLNOQwFVrB1DbLD5dCDJUGgYdehSeUyC+erkG
 FbOImwkBglo0Atu8cPL4Ip5bTg1UIh6dXwnEmCqNt+besk9AtpLIyo3pC
 UxPoaDdLNIEAz7vgYdjQb0Fzz0vq+28D7iCTv4WWdhaAul9MV9hecaQSU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4467141"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4467141"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:02:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9927800"
Received: from unknown (HELO localhost) ([10.245.244.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:02:32 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v2 2/4] lib/intel_bufops: Use printf style filename
 formatting
Date: Wed,  6 Mar 2024 16:02:17 +0100
Message-Id: <20240306150219.301977-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306150219.301977-1-zbigniew.kempczynski@intel.com>
References: <20240306150219.301977-1-zbigniew.kempczynski@intel.com>
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

Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Link: https://lore.kernel.org/r/20240305054056.139691-3-zbigniew.kempczynski@intel.com
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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

