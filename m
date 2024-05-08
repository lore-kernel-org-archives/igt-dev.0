Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4F7C19F4F
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 12:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBC01128C5;
	Wed,  8 May 2024 12:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlmSlGNV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23ABC1128C5
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715172895; x=1746708895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ne/CrNYd26L/zucSX3liymTGHA0A8DNEp+4QfT6wEzU=;
 b=OlmSlGNVoinuZWPXwyHXcXjQKo0xrhwKvJj8OX16IfOdaHeibK6Um90h
 bvmOP8tLnRHoKZ9teiKe+2qZ5Mn0/eGwy2hw+dbsxWarhg6anSRaR8ePT
 9AKHULff1ZyuQeK3HMPFJs9ZRM18xB7b41u7uj/Xu9/WkxDpp8mSMwwS/
 5aRhMG8wJAiDmrGxhLxMbXrUIrxiUqgtlzoYHROaMb+LVP4tq55cv2D+h
 oOFdEQHnPjjJffpUfhAo9gBBvziI90rd80xPIpwTsMdT61nYIBpd9ik81
 4pRhapbfxJKbZCe4cM36rd2CBLaBOOZRVEqMUjCTiSF7wQTayTTjUI6vw w==;
X-CSE-ConnectionGUID: h9YExJlBTt+PWZsc64R9Pw==
X-CSE-MsgGUID: 7JJnL/i9TBW4YyxR7TApVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="21698981"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="21698981"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:54:54 -0700
X-CSE-ConnectionGUID: /sTaRbSRSNSjwjV6OpwREA==
X-CSE-MsgGUID: i+3F/jEcTWOPr2E5uLpH9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28976571"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:54:53 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v4 01/11] lib/intel_bufops: Store devid on buffer ops
 creation
Date: Wed,  8 May 2024 14:54:33 +0200
Message-Id: <20240508125443.404402-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
References: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
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

