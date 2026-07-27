Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82F6C53209
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jul 2026 18:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C5D10E6CA;
	Mon, 27 Jul 2026 18:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggnv+5tx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C4F10E6CA
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jul 2026 18:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785177994; x=1816713994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H0d0XwWOJShbpESRmwIF/04gVr2GZex+t8eu/g87kwo=;
 b=ggnv+5txGbymM2mf6fEewGlsTFNLb+H9hzXNhx/NGETcifU3lrR7VbQv
 haeE3t3Gzqo3SQCsWZgxrDuoTkOqJnB91nvKr+dGmLVncHrtPq+X9sVhe
 mjojf6QAKonJDHhTQDEQWu17zzM3oKfDUycOxrmT0W/zRz0sliehz0hhz
 I1nESLn5NMuceCMLmpOcnmdsr3dseUzJYJWx+m8cqskknmbDJKnCNbuzq
 SidESxDRO/1QEB8LqHLYtroS+GtMxZ4fxuQNJLXMJd2PrEpLy4x4IT5ie
 MUFW0/1OBt//j68/sPBKXOCDaOyBvKC4M4W/3X7njU30SgKQV2oldUDqB Q==;
X-CSE-ConnectionGUID: DDqs4LSETcizuOoMtb1K1w==
X-CSE-MsgGUID: QeTyuZTaSRefdypbizo92w==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103296100"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="103296100"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 11:46:34 -0700
X-CSE-ConnectionGUID: PisBWtPSTsaa/zV+hu+kEg==
X-CSE-MsgGUID: vzEpz15yS3ijkIjcfrf4Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="259545261"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:46:32 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/6] lib/igt_kms: Add FIXED_MATRIX_TYPE colorop property
Date: Tue, 28 Jul 2026 00:25:27 +0530
Message-Id: <20260727185531.4046807-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260727185531.4046807-1-swati2.sharma@intel.com>
References: <20260727185531.4046807-1-swati2.sharma@intel.com>
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

Assisted-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 1 +
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2eefb773b..1f2a70ba7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -725,6 +725,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
 	[IGT_COLOROP_NEXT] = "NEXT",
+	[IGT_COLOROP_FIXED_MATRIX_TYPE] = "FIXED_MATRIX_TYPE",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 521a03c01..22164fca9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -363,6 +363,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_LUT3D_INTERPOLATION,
 	IGT_COLOROP_NEXT,
+	IGT_COLOROP_FIXED_MATRIX_TYPE,
 	IGT_NUM_COLOROP_PROPS
 };
 
-- 
2.25.1

