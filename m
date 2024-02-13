Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5DAC4829A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 10:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EF310E347;
	Tue, 13 Feb 2024 10:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S+JSQBfm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632EA10E31A
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Feb 2024 10:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707818503; x=1739354503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2g5VVbwa6IbE8YefWPlHYPsVG35I4VdbxME2hS3ep08=;
 b=S+JSQBfmINzM8aVgyC5MaxMwX9/reTdChL3BzSbO+GPG2iw0oALPnX4s
 r01S7r8dCa2gooP6zzVXdX+6xU535dupGuJTpsCq2N85NAtLaZFwe+SBC
 jfSzRPdnpC/tuNIFoh7EukKEQrwdYv/FJX2rACa+Eo4ffQDCUZquOLdMr
 yQDKQ2OjHqw5nJ4Xp4MHHXlP6i9cnDYawAS6ciq9VbwWc/SkfrM06bWuJ
 7FGzJoBUzBY676VOsQvXOeaHACBbymUpKbaBa9eqKBuqcq93U+Vk+4j9I
 SLsHhv549yeK3LJXmHIP0T0qL7d8Uobdq3Bs2eruj/f/sdVNEz9bRw4cG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19232362"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="19232362"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2815520"
Received: from gfmckenx-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.21.42])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:41 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 7/8] lib/intel_bufops: keep bo_size separate
Date: Tue, 13 Feb 2024 10:01:24 +0000
Message-ID: <20240213100125.90085-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213100125.90085-1-matthew.auld@intel.com>
References: <20240213100125.90085-1-matthew.auld@intel.com>
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

v2:(Zbigniew)
  - Always assert bo_size >= size.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_bufops.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 10e2d3dac..c8f91aef8 100644
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
 	}
 
+	igt_assert(bo_size >= size);
+
 	/* Store gem bo size */
-	buf->bo_size = size;
+	buf->bo_size = bo_size;
 
 	if (bops->driver == INTEL_DRIVER_I915)
 		set_hw_tiled(bops, buf);
-- 
2.43.0

