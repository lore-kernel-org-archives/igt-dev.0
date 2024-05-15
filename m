Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626ABC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 12:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C193210E05A;
	Wed, 15 May 2024 12:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJ3FRrMu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F4E10E05A
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 12:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715775601; x=1747311601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ne/CrNYd26L/zucSX3liymTGHA0A8DNEp+4QfT6wEzU=;
 b=mJ3FRrMuPQbmHESjzIXgK2eR+qD2cgBlgzQVR0cH717rvQdb54Q2BXJF
 AkA3C5Ou8Hh8jlMnC0+U5rVjdSlMLaLHJ05G19wyGm9CHz7xqeMQ9y4Cf
 fxTsbaH0t4MQHThopap3Q5puIeNHqrAH1hWRVKFg2QE1tthhw1MPQZBQT
 Mm0n34LthdKGUpVt8TT1Rv9QiqtK6GR0dJWGO1ceYdSitHqhOwaMfTUKS
 oZU5HYF1MGtgcF1IdU3kp6mspKcdws89fAVF+6sVPE6viM1fAS+hJlJnI
 XxevK71jv8N0B9g3jeUSpY3M8+tTGo7D0UqYm3GcuV4phfzD0Xwpy116+ g==;
X-CSE-ConnectionGUID: lU4+a2ZQSjq3DanVWc+A9g==
X-CSE-MsgGUID: AKq3Q0T2SgyuxuZ1gka6xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="12036137"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="12036137"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:01 -0700
X-CSE-ConnectionGUID: 3DGznIMcTxuNxTAKK0NNWw==
X-CSE-MsgGUID: fi8QQEs8TImngM1cyop1cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="31039682"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:00 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v6 1/9] lib/intel_bufops: Store devid on buffer ops
 creation
Date: Wed, 15 May 2024 14:19:41 +0200
Message-Id: <20240515121949.245280-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
References: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
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
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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

