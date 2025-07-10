Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EFBC83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 08:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112FA10E89E;
	Thu, 10 Jul 2025 08:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZ89B0Qr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9439B10E89B
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752134877; x=1783670877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JizrmnyjUUg6jj/unpUuE4b9dtUp1DeN8unz2jWtmDw=;
 b=PZ89B0Qr890gFLzMYBXNVHYlNCU9Fyt300jLZSXhEN+hYQ6SoDHpe7EW
 V8G78DM7vRxTGuoMXTPCT0YRDQ5ylpbCZOwLiqkbglC1BgwiZ+/x8ujkv
 gQMuti5LMHjCR9++45cxyNIWvK006fQkcix2xDt5gmCRZkFW1eiiFBk0f
 nf0KxhgsoU94wR5monERfU2JZsmQV92uW1vBIFWmi+WXbtnhA2X9e3VJF
 GaE0ghacYs7KV01SpMaVXc+k0tbca9k2cQ9ahKFIWoQLhg1Z/cSM97LrQ
 YLio54cormeeZifSz9hu8fNC3BOciCq6GhIC5ux5QCqoPShnXZBt+/mRA Q==;
X-CSE-ConnectionGUID: rEr4ptKyTruvDJsQQ6m9EQ==
X-CSE-MsgGUID: S98XKBJKRWCetLYwPKgfpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54379547"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54379547"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 01:07:56 -0700
X-CSE-ConnectionGUID: BAaMxMaBTn6jXZl1fcYAHA==
X-CSE-MsgGUID: J3xJu6AqQpuc/bKZIhSa0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="156114259"
Received: from artdev273.igk.intel.com ([172.28.176.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 01:07:55 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/intel/xe_pm: Reduce debug loglevel
Date: Thu, 10 Jul 2025 08:09:29 +0000
Message-Id: <20250710080929.412509-2-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710080929.412509-1-jan.sokolowski@intel.com>
References: <20250710080929.412509-1-jan.sokolowski@intel.com>
MIME-Version: 1.0
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

This test exceeds disk usage limit on CI environment
due to logging too many logs.

Reduce the debug log level to a CI-friendly value
if it's bigger than that.

Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 tests/intel/xe_pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 7e9324eec..16b5fc686 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -826,6 +826,9 @@ igt_main
 		igt_assert(igt_setup_runtime_pm(device.fd_xe));
 		sysfs_fd = igt_sysfs_open(device.fd_xe);
 		device.res = drmModeGetResources(device.fd_xe);
+
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+		update_debug_mask_if_ci(DRM_UT_KMS);
 	}
 
 	for (const struct s_state *s = s_states; s->name; s++) {
-- 
2.34.1

