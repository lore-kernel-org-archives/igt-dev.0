Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78662C55ABF
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 11:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259D610EA23;
	Thu,  6 Aug 2026 11:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OnGmOqHW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8F010F19E
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 11:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786017297; x=1817553297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ilow7VR/rj95P7FYgKNJtpPOSXZJN/SXEmE2glybHsk=;
 b=OnGmOqHWugiYd9YmQz+m2uJB3EQkMwENY9OmKTuWkYXQHq7gD0/L2ccs
 +MvWL/W1kUZejxzHve9+Ug5Iogv+zoSZAy4/1ocTE9BzMceLaL/+FE9W6
 ZksfZNGy7jvm3sY+X5N5GCL8bEnM95a3u/a5wdf34CwHgNsaM27p/cUYt
 DoYd5OLkTW0g7h8UzlM0fQ7twjVrekqZJtrVS6+qz6NQxSyLx6HtBX9db
 BbsoJ0Vg/wJKESPHvpqNQ4VUn1vsPjxzZ090j3UzNqTWwxCCGyBBvnX15
 IwftL3dmxlRyuOQWgQ4y6exr2uSkA9SN2RGgxz+y57HygmhxYXTJiuQ0Z A==;
X-CSE-ConnectionGUID: ofcOGCw6SpqGaHyMX0Djjg==
X-CSE-MsgGUID: JUqKWeOxRzC9Jt1n8KSX4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97204781"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="97204781"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:54:57 -0700
X-CSE-ConnectionGUID: o7/MrD7dROmfRgCfkMLSgw==
X-CSE-MsgGUID: BiPa/+tzQnWVi7DXH+AIyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="261552845"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 04:54:56 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/6] lib/igt_kms: Add FIXED_MATRIX_TYPE colorop property
Date: Thu,  6 Aug 2026 17:33:41 +0530
Message-Id: <20260806120345.19406-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260806120345.19406-1-swati2.sharma@intel.com>
References: <20260806120345.19406-1-swati2.sharma@intel.com>
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
index ef9496741..9095aa634 100644
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

