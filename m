Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB1CC48BF8
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 13:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC5910E92D;
	Thu, 22 Feb 2024 13:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EFAdVrKB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE3A10E92D
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 13:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708607894; x=1740143894;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kcZfMe/6N0KDVX3hd6PJgSxJOk5ltTshCprxyzO3Hww=;
 b=EFAdVrKB7b3tdV3uaAAg0JSShEov2BwZvlqRhG6ywrj3DfUWLV5jtbPS
 2BT6ptFk+NvfVw9XKIHFgiBAse8SIO/t/AHEpJL22qmi8mMHLgSgG9owQ
 xdCs6UnVcf5wo1vRjEn9vPyHaNtKl3c86XEZAcfTVQjEKJNBepecu2Vsm
 QJ6taezSTd5Ln++pb2/cgzD0dmuspFO5owyLeKvowi2uh3t0PHDxIci98
 2XHmpOFQbMlWptdvs/FnwRK3/9kS/n8Si10HwKyUDXJqGhBRcGWX5SH6n
 V12oOCzKZvNsYOglEd8h/QI04jlrUvF9hGHXXrZS4n3q4uuQDBejxOAg5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6608758"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="6608758"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 05:18:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="28657712"
Received: from unknown (HELO localhost) ([10.245.102.151])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 05:18:11 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [PATCH i-g-t] lib/igt_draw: Don't call i915 specific ioctls on xe in
 draw rectangle
Date: Thu, 22 Feb 2024 14:18:03 +0100
Message-Id: <20240222131803.61066-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

We've been observing annoying warnings in kernel log during executing
drawing rectangle on xe like:

Ioctl argument check failed at drivers/gpu/drm/xe/xe_exec_queue.c:676:
!len || len > XE_HW_ENGINE_MAX_INSTANCE

If ioctl() specific to the driver needs to be executed it should be
protected by conditional is_i915_device() or is_xe_device(). Add
such condition for i915 what fixes above issue.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 lib/igt_draw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 0757e9801b..1b702e376d 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -882,7 +882,7 @@ void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
 	};
 
 	swizzle = I915_BIT_6_SWIZZLE_NONE;
-	if (tiling != I915_TILING_NONE && gem_available_fences(fd)) {
+	if (is_i915_device(fd) && tiling != I915_TILING_NONE && gem_available_fences(fd)) {
 		gem_get_tiling(fd, buf_handle, &buf_tiling, &swizzle);
 		igt_assert(tiling == buf_tiling);
 	}
-- 
2.34.1

