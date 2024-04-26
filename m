Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F207BC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 09:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B90E10EF1B;
	Fri, 26 Apr 2024 09:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="it8CV3d9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3102F10EF3E
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714122108; x=1745658108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zgVu2A3A0g8ysLMRjbwpaBAf2mefG16ngE5tkK7YqGI=;
 b=it8CV3d9TPGBgYYRIp5FWBsFC5hUXgdtPMGGkoDlIeeB0INvzpbBBK9U
 PFD9cR9/KLc84bgEHYhuHMvPipkOiMvoEvU9QljjUQF1e4HYN/yrFoElQ
 q6tE4IEFms0lMqM9oyBMcXzuZ9a4ZM7YnpZ16oQQlErjzKRC4fnx+yJzB
 myMSwsKRg4nUi9TTILm2Gswbb5THWkJ5MdU1GIJWm6Ko+UCbchTjTiNRA
 4pK+WKZPfijegNeON1GxUoPgXOd3FrPpPjZyjHhOXeKUNm7bzFlNYuIlY
 njG1X4howAlqGTDET1+tiSJRK3huQU7kyP0EqEkjYeb3FxeD0bRRniKiB w==;
X-CSE-ConnectionGUID: LGQD8TOqT7yKiIYfYKBu8g==
X-CSE-MsgGUID: ZYDBiY+cQHKvHjV4S9kTfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="35238703"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="35238703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:28 -0700
X-CSE-ConnectionGUID: mRDAGpxbRGe3/gUWD3VTug==
X-CSE-MsgGUID: /W47cYMEQoWxHXPEcRDsbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25316519"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:27 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 01/10] lib/intel_bufops: Store devid on buffer ops
 creation
Date: Fri, 26 Apr 2024 11:01:08 +0200
Message-Id: <20240426090117.78060-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
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

As I need devid to diverge intel-buf init code lets store it in
bufops structure. This field is commonly used so add function which
returns it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_bufops.c | 20 +++++++++++++++++---
 lib/intel_bufops.h |  1 +
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 51fdf50adb..43d6dd5b43 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -114,6 +114,7 @@ struct buf_ops {
 	int gen_start;
 	int gen_end;
 	unsigned int intel_gen;
+	uint32_t devid;
 	uint32_t supported_tiles;
 	uint32_t supported_hw_tiles;
 	uint32_t swizzle_x;
@@ -1499,12 +1500,11 @@ static bool probe_hw_tiling(struct buf_ops *bops, uint32_t tiling,
 {
 	uint64_t size = 256 * 256;
 	uint32_t handle, buf_tiling, buf_swizzle, phys_swizzle;
-	uint32_t devid, stride;
+	uint32_t stride;
 	int ret;
 	bool is_set = false;
 
-	devid =  intel_get_drm_devid(bops->fd);
-	stride = get_stride(devid, tiling);
+	stride = get_stride(bops->devid, tiling);
 	handle = gem_create(bops->fd, size);
 
 	/* Single shot, if no fences are available we fail immediately */
@@ -1616,6 +1616,7 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 
 	bops->fd = fd;
 	bops->intel_gen = generation;
+	bops->devid = devid;
 	bops->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
 					    is_xe_device(fd) ? INTEL_DRIVER_XE : 0;
 	igt_assert(bops->driver);
@@ -1785,6 +1786,19 @@ int buf_ops_get_fd(struct buf_ops *bops)
 	return bops->fd;
 }
 
+/**
+ * buf_ops_get_devid
+ * @bops: pointer to buf_ops
+ *
+ * Returns: device id
+ */
+uint32_t buf_ops_get_devid(struct buf_ops *bops)
+{
+	igt_assert(bops);
+
+	return bops->devid;
+}
+
 /**
  * buf_ops_get_driver
  * @bops: pointer to buf_ops
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index b959a8cc8e..84e71d41a2 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -118,6 +118,7 @@ struct buf_ops *buf_ops_create(int fd);
 struct buf_ops *buf_ops_create_with_selftest(int fd);
 void buf_ops_destroy(struct buf_ops *bops);
 int buf_ops_get_fd(struct buf_ops *bops);
+uint32_t buf_ops_get_devid(struct buf_ops *bops);
 enum intel_driver buf_ops_get_driver(struct buf_ops *bops);
 
 bool buf_ops_set_software_tiling(struct buf_ops *bops,
-- 
2.34.1

