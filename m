Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC83CC369D1
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 15:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D86610E6DB;
	Wed, 23 Apr 2025 15:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNQdfAY4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102D510E6DB
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745420941; x=1776956941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vT2kCHn4X2tWYzKyf66tbQWb5gWQDWhvRn3Tj2zfLCU=;
 b=WNQdfAY40wyoji5X5wqvyKrX08r44uAyE3dAMcBYCJWcH8Le21dErDDq
 vjmHgUBOKBno8jN4VcfGB6zhkZ0WYUfh70Pdx0LKvg3VkyWFHG58zU7mt
 WrUqefc2GH5akNTI/0ki3h3SHXynk3a3+GLU3SRIwet7qO3LSCjeZWWGx
 GsTY+GcXRAgRjbJW3+bynQK6b2yJNzJ2JslEdeGO2nnXx+DMiefaQNA14
 QaZIvosir7b9RUqINPM5L6HGB2swyif8gz9OQ8p03p+Cn96C/IPvxYpdD
 iXWmRmtKXVFMzVi5TMopjx99GGXKVKpJp4RlTx8mR2e+icyomXaB+fnZN Q==;
X-CSE-ConnectionGUID: i0KziUjjSOK+K+1mioUCjA==
X-CSE-MsgGUID: 8toOJBy3TFyN+P1+eOzU4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46140859"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46140859"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 08:09:01 -0700
X-CSE-ConnectionGUID: 0NxSo44rRPueSuyqBVVpzw==
X-CSE-MsgGUID: w8Dns2wGQiSPaq325oRlow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132642302"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 08:08:59 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH v4 2/2] tests/kms_async_flips: Use tiling modifiers
Date: Wed, 23 Apr 2025 20:31:24 +0530
Message-Id: <20250423150124.2945350-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423150124.2945350-1-santhosh.reddy.guddati@intel.com>
References: <20250423150124.2945350-1-santhosh.reddy.guddati@intel.com>
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

As async with linear modifiers is not a practical and common use case,
override the default modifier with tiled for all the async flip subtests

V2:
move handling to default_modifier (Karthik)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_async_flips.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 3d73c217f..8053d3766 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -194,6 +194,9 @@ static void wait_flip_event(data_t *data)
 static uint64_t default_modifier(data_t *data)
 {
 	if (igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888,
+				       I915_FORMAT_MOD_4_TILED))
+		return I915_FORMAT_MOD_4_TILED;
+	else if (igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888,
 				       I915_FORMAT_MOD_X_TILED))
 		return I915_FORMAT_MOD_X_TILED;
 	else
-- 
2.34.1

