Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BFBC04FF6
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 09:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5440010F52A;
	Fri, 12 Apr 2024 09:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwVHGOo6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B4810F521
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712913108; x=1744449108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L+uAcMe4cxdkrG1IUJsRin1ImzqtIXHkU/HnhPaK05Y=;
 b=kwVHGOo6oIXO2VvBkxpzaC3sW8ruXadtIrlGyy9DfcJsRuiLoI1jmnuo
 FSWdcXm9aEXshu7hVcSZlfZ+wIdClFl0etjaDVXAmFini5z2BnlOTiNBr
 tuWnZsyqdlYQxHFhlpb5VpGuEnwklyUvFI2wqlfSAy5xubi+yJaNDDNYZ
 XeQ//jHvQ37oFBjtw3mF+RQnnQStTHyeF1b8WjJipfL6BGGkKSP5Q/HUU
 niHZVmaPovH3RBeNTU2ub3SoK3In5ZDeXemUsCGfsiTPTJQ/2SDm3LjrE
 JkcAmJ5FR4UVO16lmubFQDvibujPKGElgZWDnUorDRqWTaE2kEpDOzl5J g==;
X-CSE-ConnectionGUID: MN7LSNMyTmm8preNqOsg1Q==
X-CSE-MsgGUID: xU9cGDCSTqG4yA2i8NiZOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="30842837"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="30842837"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:48 -0700
X-CSE-ConnectionGUID: 8P3MXADmToSLLRTMv/UK/A==
X-CSE-MsgGUID: x8Ky62AqTDG1tiACXNhOLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="25625083"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:47 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/4] lib/igt_gt: Add gem_engine_can_block_ggtt_binder
Date: Fri, 12 Apr 2024 10:57:38 +0200
Message-ID: <20240412085744.21196-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412085744.21196-1-nirmoy.das@intel.com>
References: <20240412085744.21196-1-nirmoy.das@intel.com>
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

On MTL GGTT updates happens through MI_UPDATE_GGTT command.
Add a method to detect if a engine can block ggtt binder.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_gt.c | 15 +++++++++++++++
 lib/igt_gt.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index a24a566c7..aa5e75b07 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -659,3 +659,18 @@ int gem_execbuf_flags_to_engine_class(unsigned int flags)
 		igt_assert(0);
 	}
 }
+
+/**
+ * gem_engine_can_block_ggtt_binder:
+ * @fd: open i915 drm file descriptor
+ * @engine: engine to be assessed
+ *
+ * Detect if the platform needs blitter based GGTT
+ * updates.
+ */
+bool gem_engine_can_block_ggtt_binder(int fd,
+		const struct intel_execution_engine2 *engine)
+{
+	return IS_METEORLAKE(intel_get_drm_devid(fd)) &&
+		engine->class == I915_ENGINE_CLASS_COPY;
+}
diff --git a/lib/igt_gt.h b/lib/igt_gt.h
index 3d10349e4..d0c5510b1 100644
--- a/lib/igt_gt.h
+++ b/lib/igt_gt.h
@@ -83,5 +83,7 @@ extern const struct intel_execution_engine2 {
 } intel_execution_engines2[];
 
 int gem_execbuf_flags_to_engine_class(unsigned int flags);
+bool gem_engine_can_block_ggtt_binder(int fd,
+		const struct intel_execution_engine2 *engine);
 
 #endif /* IGT_GT_H */
-- 
2.41.0

