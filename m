Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD5EF8D770
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 19:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AC710E213;
	Thu, 16 Apr 2026 19:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYiPmukP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5FB10E16B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 19:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776367127; x=1807903127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GBb+fM/sVg94Ivj/usFET/fpd307gzUtiyfb3zoMt5g=;
 b=PYiPmukPp60RNnlRaRDDmHmbadGG7xJ6qRZePiJx4VaUgYdZx+D6qacy
 u8IdJ6w3/fsLeJPThvSBCr1QH3VGwpidUwvoodvKvfv/wEvAdeNUIgjse
 4E1DVA5LNycaXvnPNbPV/qXkDjpxjavinDR7YHw5Jzg+08lW/MOXgZeVm
 Sl42kd8kJ/VPmErqcL4MlVFQace1zKplCUDnZpsBScC5y6oKcXa0YxkFJ
 bDnOPePTbJJe/AUkse0xI9RidCbMUemTg8x4ToQLK5Dco8me5xh31dypP
 JZDgYb+Ioo70W20lFrLDexHFL333+PdFScGcaXD8v4LIV8oc/UfEjd3o7 g==;
X-CSE-ConnectionGUID: zyjfGfloSOWklWmo9lqIzQ==
X-CSE-MsgGUID: s/lXIPCLRQaFsAj6GfBQhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81260625"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81260625"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:18:24 -0700
X-CSE-ConnectionGUID: nW8o2DUnSLqTu1VajJ5eVw==
X-CSE-MsgGUID: Ra7QS4+6T9+XENGX9PsrmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="229818016"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 12:18:23 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC PATCH,
 v2 2/5] lib/igt_kms: Add FIXED_MATRIX_TYPE colorop property
Date: Fri, 17 Apr 2026 00:56:57 +0530
Message-Id: <20260416192700.1579042-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260416192700.1579042-1-swati2.sharma@intel.com>
References: <20260416192700.1579042-1-swati2.sharma@intel.com>
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

Add IGT_COLOROP_FIXED_MATRIX_TYPE to the colorop property enumeration
and register the "FIXED_MATRIX_TYPE" property name string. This enables
IGT to discover and configure the FIXED_MATRIX_TYPE enum property on
fixed-matrix colorops exposed by the driver.

v2: -Naming changes (CSC_FF_TYPE -> FIXED_MATRIX_TYPE)

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 1 +
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2d758b63c..913116cd8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -717,6 +717,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
 	[IGT_COLOROP_NEXT] = "NEXT",
+	[IGT_COLOROP_FIXED_MATRIX_TYPE] = "FIXED_MATRIX_TYPE",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9e7eb499f..ea61cba91 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -359,6 +359,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_LUT3D_INTERPOLATION,
 	IGT_COLOROP_NEXT,
+	IGT_COLOROP_FIXED_MATRIX_TYPE,
 	IGT_NUM_COLOROP_PROPS
 };
 
-- 
2.25.1

