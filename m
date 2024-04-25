Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B91C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 10:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232BF10EA17;
	Thu, 25 Apr 2024 10:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S8n5iBzs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E56B10E5C7
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 10:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714042052; x=1745578052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HyAHtCdqZdNiGrnFWzKCRAPjq+zU4xhoWIRP/7U0LLU=;
 b=S8n5iBzsmbLlmOh5lymWZ0BzxRM1A9alM/Q2eFvtDWKrwByT3hqOD2I1
 P2wtoFjf1yUYyjEEm0riiNcTKaeajPOLd4eBf2mjznfejBNSRehyyRpPX
 vm9LIy2rosoBnCTlAKhUBC3xuYMqDUawK/M3BUuK8HRVTSLy3ESC1cjdE
 bQYakKTZdc39WWl/WwWlh9fFyj9TA8gy8TFhZMAF6Hp82BWUj5kXmueag
 1on/NlOqJH/7Cw4OzwhGidT0CpA4sie/0M9d11Y0aZhiU15qvBRlgtoA6
 qHujKTcSVxvwgJvH7li7mngIhaNHQQfnrkSzJnRmfC8uHEaNeM1JkZB0s w==;
X-CSE-ConnectionGUID: ZEkULAyjSyq/RIgGGX9ntw==
X-CSE-MsgGUID: Sw+OjSjYRbG2tcml8pKoTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9645754"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9645754"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:32 -0700
X-CSE-ConnectionGUID: ue+bCKUaQ6eu+QcG2lDLkg==
X-CSE-MsgGUID: h0qokc2JQwiqgKBKdyVIzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="55977700"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:31 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 1/7] lib/intel_bufops: Store devid on buffer ops creation
Date: Thu, 25 Apr 2024 12:47:15 +0200
Message-Id: <20240425104721.52376-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
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
bufops structure. I decided to use it in tiling probe function
in same patch to avoid two-lines patch noise.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_bufops.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 51fdf50adb..007ccdb953 100644
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
-- 
2.34.1

