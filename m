Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38113E77180
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 11:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB63410E410;
	Wed, 11 Dec 2024 11:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PcZLr8dR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3670F10E410
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 11:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733917274; x=1765453274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WXTIPmZb66hP9mNtXjh/GtoKtd+hnx46cJzGaP7+mt4=;
 b=PcZLr8dRvVYWnIgelZzP745pCW0efCgSEPbBBphxqjuQ5fLL5+PahtCM
 myu3ADpHSq38CmDSySajNhYGPRc5o3YQeH/Vs4fC7jmvK7leN7K7juyPl
 LcP9m3lPbiXH9AJc9d2uXAQg0iTcEEc+5J6JCClwYcZ0cLww7z8gaFiYk
 1ie9peAh7jNGOLH7VuQQBOKhfpXXZMVhLA9lrL5BWnsFr3TbsWCIzTp7g
 +vo9N3a+hJ8WxonFl9fIjhpOV0Azz2YSDybp5AXA/R/ApY16g9HiUdDT+
 fuenbXwGXecc20e2wf3khinS36VRRxHOk07kxX4c18bACG6QiWMXzbVlf Q==;
X-CSE-ConnectionGUID: THIgbs83RTasYuTNw7LWPQ==
X-CSE-MsgGUID: sGaLO7npROWqN1bz0bjBjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33625096"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="33625096"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:41:13 -0800
X-CSE-ConnectionGUID: b8jMAObmSY6KRrCut8R0pA==
X-CSE-MsgGUID: 2thiBlLFT0iumvBEmcxsPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="99857126"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO dgrzegor-mobl2..)
 ([10.245.244.142])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:41:03 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: andrzej.hajda@intel.com, Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 4/4] lib/xe_query: Fix switch indentation
Date: Wed, 11 Dec 2024 12:40:44 +0100
Message-Id: <20241211114044.210562-4-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211114044.210562-1-dominik.grzegorzek@intel.com>
References: <20241211114044.210562-1-dominik.grzegorzek@intel.com>
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

Correct switch indentation so it follows kernel guidelines.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/xe/xe_query.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 6a7b08006..b9e6cf045 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -225,19 +225,19 @@ static uint32_t __mem_default_alignment(struct drm_xe_query_mem_regions *mem_reg
 const char *xe_engine_class_string(uint32_t engine_class)
 {
 	switch (engine_class) {
-		case DRM_XE_ENGINE_CLASS_RENDER:
-			return "DRM_XE_ENGINE_CLASS_RENDER";
-		case DRM_XE_ENGINE_CLASS_COPY:
-			return "DRM_XE_ENGINE_CLASS_COPY";
-		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
-			return "DRM_XE_ENGINE_CLASS_VIDEO_DECODE";
-		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
-			return "DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE";
-		case DRM_XE_ENGINE_CLASS_COMPUTE:
-			return "DRM_XE_ENGINE_CLASS_COMPUTE";
-		default:
-			igt_warn("Engine class 0x%x unknown\n", engine_class);
-			return "unknown engine class";
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		return "DRM_XE_ENGINE_CLASS_RENDER";
+	case DRM_XE_ENGINE_CLASS_COPY:
+		return "DRM_XE_ENGINE_CLASS_COPY";
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+		return "DRM_XE_ENGINE_CLASS_VIDEO_DECODE";
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return "DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE";
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		return "DRM_XE_ENGINE_CLASS_COMPUTE";
+	default:
+		igt_warn("Engine class 0x%x unknown\n", engine_class);
+		return "unknown engine class";
 	}
 }
 
-- 
2.34.1

