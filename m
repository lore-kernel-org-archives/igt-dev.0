Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3D0CE8D65
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8031010EAE7;
	Fri, 14 Nov 2025 17:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfsenTyx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D362310EAE9
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140950; x=1794676950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pk++Lx9chahXZbMAq0FVuDroXzrAQw8zAru+8yVdBPg=;
 b=gfsenTyxf08rLykxWAPl23OtQu2bvS7Bo+oQS9wF3iJSGH3s8n49odCy
 TDLhbfv6ej47F0QWEEbqanB0i2Pl2aw4YtfAspxIipV/vu0bKelpkz8KG
 umWXtsoEzH8clbqRkKOAT28tui9oid+8AgBywEOhQ87eAcSrvf7VgKpMS
 Wfgt/vBS95ZVSOp+PhNUGoYDsC3quZLEieGLl1bI4ahy6XRjU6vlNtjIj
 cHYkYWLtpop6e9eTe22Mpn6voKYvcVDl8e3xWI9prENJICNcK6PODf+FC
 mDo27HM2QYiRKQbGeSwk/WWugcoVbSkCBGkHjutOdmeCNzybJSOUXLPO+ g==;
X-CSE-ConnectionGUID: UyCj8N1yQqGPFRoZvNiV8A==
X-CSE-MsgGUID: n+BJ47zHSXi/a40gzzHhOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871439"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871439"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:30 -0800
X-CSE-ConnectionGUID: 3E2y6dOyTz6loTUqgCWpqg==
X-CSE-MsgGUID: VT48hQpeTX6rZZ7XgWpuyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981405"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:29 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 04/23] tests/kms_color_helper: Add enum for LUT1D types
Date: Fri, 14 Nov 2025 22:58:49 +0530
Message-Id: <20251114172908.1027816-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
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

Introduce kms_colorop_lut1d_type_t to represent different LUT1D types,
such as zero, linear, and max.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_helper.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 694168b45..503d20598 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -139,6 +139,12 @@ typedef struct kms_colorop_lut3d_info {
 	enum drm_colorop_lut3d_interpolation_type interpolation;
 } kms_colorop_lut3d_info_t;
 
+typedef enum kms_colorop_lut1d_type {
+	KMS_COLOROP_LUT1D_ZERO,
+	KMS_COLOROP_LUT1D_LINEAR,
+	KMS_COLOROP_LUT1D_MAX,
+} kms_colorop_lut1d_type_t;
+
 typedef struct kms_colorop {
 	kms_colorop_type_t type;
 
@@ -150,6 +156,7 @@ typedef struct kms_colorop {
 		double multiplier;
 	};
 
+	kms_colorop_lut1d_type_t lut_type;
 	kms_colorop_lut3d_info_t lut3d_info;
 
 	const char *name;
-- 
2.25.1

