Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1376D37494
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC3E10EBA4;
	Fri,  5 Dec 2025 19:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZiKj4gA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB1D10EBA6
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 19:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764963981; x=1796499981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t+8vr+9elLvR3OeCU4+NnzVjxi4jJJqy1BjQbDQlBhA=;
 b=AZiKj4gAPh6MPckGW3Qfi+9jp3C8IS7CcYtlwIYmXp5456hN0TM2dpd2
 uiyHZ9Vn3RdzL9mV315y3iUe/gBS0jtxw4zGadAkqhCjcrGP7ZFmoWC+R
 URE9kUXLuj5B9As+ZujZMNC2mYXHNs1/GpgfOg5WvqxgYnanX0svOfAso
 Op9RuwgaoXVrJgg3ZoFwhqyj4zLIPWbWcajbIft8z7nmyC8zqDgc+AnH0
 FGb3HzZVC0PiCCTv4x5Ce1z16orsxtFI6sSYDwq5BMsl1Dohz6B4F2pyt
 P198PtGMHePUftTBa9Vm8WBPz5WhuKw13+emscf7fcRmgfn6kyOdm2X+4 Q==;
X-CSE-ConnectionGUID: GHeZLxbvTgeRH8PHXOG9IA==
X-CSE-MsgGUID: sPV8h6d4SOKeh98Sh2adbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84606654"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84606654"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 11:46:21 -0800
X-CSE-ConnectionGUID: OLkD+bD6SyyZd+vYw8acdw==
X-CSE-MsgGUID: jkorIlYPR/aPiLckB4YDOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195624875"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 11:46:19 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org,
	alex.hung@amd.com
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 03/13] tests/kms_colorop_helper: Add enum for LUT1D types
Date: Sat,  6 Dec 2025 01:23:02 +0530
Message-Id: <20251205195312.1234330-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251205195312.1234330-1-swati2.sharma@intel.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
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
 tests/kms_colorop_helper.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index 79bd5db3e..e865f9e15 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -49,6 +49,12 @@ typedef struct kms_colorop_lut3d_info {
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
 
@@ -60,6 +66,7 @@ typedef struct kms_colorop {
 		double multiplier;
 	};
 
+	kms_colorop_lut1d_type_t lut_type;
 	kms_colorop_lut3d_info_t lut3d_info;
 
 	const char *name;
-- 
2.25.1

