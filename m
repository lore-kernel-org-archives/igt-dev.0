Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3600C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 14:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7915A11263D;
	Mon, 15 Apr 2024 14:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRfun7ct";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9F611263C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713192572; x=1744728572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w0NAkFWHGr+GCXgTOvitchju4WnXXiTPgAS4dDLsCI8=;
 b=CRfun7ctUssQJYiWDGpyaQUBC4WthYt5fHjtIuqJmS33JNNg4RTu26xA
 4e42jAFGcc9+lzvCYjwzqGYv27DyoiGFYrLZuDo4NIAzAu7g9slN8gdp3
 NRYWYJ5yYSeGXNBDHhLyTaAuD0ZnHmWiYvVhIvvuqWzLoTSq/r5Wblywl
 crpOSXHemUaPqEhDLV0q3wBzr/3iqPagzy5kCFOjrFK8Ykrp3os8nlc3I
 HFkPZDq9XqMXWD8LxE++MPb7j/zvK1wwq3vt16ZSF/7O6TV3+faMyWF68
 CY+My3yphenPEiGSqgmSv92fsQe2ojOv75cRCvOAdgNE+OezLC79mX1Va g==;
X-CSE-ConnectionGUID: HB8S2JLvQWu/ipSAMStM1Q==
X-CSE-MsgGUID: VvmCSeljSoWfocbh2LZw6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19735083"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19735083"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 07:49:32 -0700
X-CSE-ConnectionGUID: 04f4b1GXQACI0I1ce3rkmw==
X-CSE-MsgGUID: ob7yjj0WR9eHhrqFJQChpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="26580057"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 07:49:29 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t v3 2/4] drm-uapi/xe: Add query flag for dev atomics on
 SMEM
Date: Mon, 15 Apr 2024 16:35:26 +0200
Message-ID: <20240415143528.4107-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240415143528.4107-1-nirmoy.das@intel.com>
References: <20240415143528.4107-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Align with commit ("drm/xe/uapi: Add a query flag for
 has_device_atomics_on_smem")

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 include/drm-uapi/xe_drm.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 9171cc0f1..f898ea6d2 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -389,6 +389,8 @@ struct drm_xe_query_mem_regions {
  *
  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
  *      has usable VRAM
+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM - Flag is set if the device
+ *      supports device atomics on system memory
  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
  *    required by this device, typically SZ_4K or SZ_64K
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
@@ -404,7 +406,8 @@ struct drm_xe_query_config {
 
 #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
 #define DRM_XE_QUERY_CONFIG_FLAGS			1
-	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM		(1 << 0)
+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM	(1 << 1)
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
-- 
2.42.0

