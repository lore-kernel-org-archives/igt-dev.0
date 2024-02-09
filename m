Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3DFC4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 18:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A374410F997;
	Fri,  9 Feb 2024 18:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzlZpNi+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5042B10F9A5
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707503724; x=1739039724;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c9lHHw0SQWctQEJTe17d94h+/5/1IaNR7KCQCByx+KA=;
 b=JzlZpNi+1L/y06859p2OZiq3rIMUdmE1i6sZAm1NF3yvA3DNJp8rrWyE
 8FpMwFd99jYG70A1/n1bmVYZjnSuTSMH+ewBdeg9mSHJkxEzTlu14KrPn
 07tv6zNljVBIZfYu0nlDjwo/4i9ymaVfLQPkeuEtRtDVi9/IWp0aTQhSy
 2hh2FrJP/9WEI8Jqs4G+MUBxsNxPziJjgcXxuq41On3o2BAo2lSwGfflq
 N/woXzzRLKZu7yTnL4Dkpj9rE+/o2jKhf9stv1bTTwaYh8O70dopewu4n
 zYQuOrP5vHNeLmvBTB60qB8w0QYOyaPwvbPqHlNhKyVe4ASPMiS8AhHut w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12049332"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="12049332"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 10:35:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="6647802"
Received: from vdegtyar-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.20.246])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 10:35:22 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 7/8] lib/intel_bufops: keep bo_size separate
Date: Fri,  9 Feb 2024 18:34:32 +0000
Message-ID: <20240209183433.375099-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209183433.375099-1-matthew.auld@intel.com>
References: <20240209183433.375099-1-matthew.auld@intel.com>
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

If the caller provides some bo_size, like for an existing object handle,
then we currently trample the buf->size here, which seems quite
inconsistent. Rather treat bo_size and size separate, just ensuring that
bo_size is large enough.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_bufops.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 7f72f4762..2ef2c1c70 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -903,11 +903,6 @@ static void __intel_buf_init(struct buf_ops *bops,
 		size = buf->surface[0].stride * ALIGN(height, align_h);
 	}
 
-	if (bo_size > 0) {
-		igt_assert(bo_size >= size);
-		size = bo_size;
-	}
-
 	/* Store buffer size to avoid mistakes in calculating it again */
 	buf->size = size;
 	buf->handle = handle;
@@ -918,17 +913,22 @@ static void __intel_buf_init(struct buf_ops *bops,
 	buf->region = region;
 
 	if (!handle) {
+		if (!bo_size)
+			bo_size = size;
+
 		if (bops->driver == INTEL_DRIVER_I915) {
-			if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &size, region))
-				igt_assert_eq(__gem_create(bops->fd, &size, &buf->handle), 0);
+			if (__gem_create_in_memory_regions(bops->fd, &buf->handle, &bo_size, region))
+				igt_assert_eq(__gem_create(bops->fd, &bo_size, &buf->handle), 0);
 		} else {
-			size = ALIGN(size, xe_get_default_alignment(bops->fd));
-			buf->handle = xe_bo_create(bops->fd, 0, size, region, 0);
+			bo_size = ALIGN(bo_size, xe_get_default_alignment(bops->fd));
+			buf->handle = xe_bo_create(bops->fd, 0, bo_size, region, 0);
 		}
+	} else {
+		igt_assert(bo_size >= size);
 	}
 
 	/* Store gem bo size */
-	buf->bo_size = size;
+	buf->bo_size = bo_size;
 
 	if (bops->driver == INTEL_DRIVER_I915)
 		set_hw_tiled(bops, buf);
-- 
2.43.0

