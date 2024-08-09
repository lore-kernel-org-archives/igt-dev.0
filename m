Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C50FC52D7C
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 10:55:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69A310E8AE;
	Fri,  9 Aug 2024 10:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRCNDwCc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B3410E8AE
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 10:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723200915; x=1754736915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=65jOdusQX5QNrAMNtGD4sxNrps0h02hJ6Wh8+2HwPMg=;
 b=hRCNDwCc3wDfoaW2fIahRLwvaGqv4MADpOPFEjNkM+4CkMdg6HNyhy/g
 Iu3gKtD4yrEeGPTE3QPcjhbYaG4YuiDJFu9/yWwuHoSX5Dwv9y43ABzDr
 PP/MHmVHg2ieOFBAYm4lBZFFS1OQpK8pBQAUNGjcZ+c9p2nKlPB5LSS22
 0FRV+FkQip2WoHU0virYlwp55jWqDqKibAkS3mPc4thLmck3+7SvRXz/E
 FqLqc12YL7NMyfRmcErPpNfXV98NqdF8/Rno1sXi0SQM90YqJh+s0t0Mo
 bYlF4hn7t8b4R5NO9aPRsDyneXgH1Ncaew8Kxl879pE6U9m45Y0bIjj67 A==;
X-CSE-ConnectionGUID: hFqEgiY6SWuIKVZOzIg0Mg==
X-CSE-MsgGUID: S66Afy7+QoaS2Ivs/RyBwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21028225"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21028225"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:55:15 -0700
X-CSE-ConnectionGUID: WiyO0z8aQnqPmdoQLshAmA==
X-CSE-MsgGUID: syHlqU/+Ti+4CnH3uFgwVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57612429"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:55:14 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t 1/2] drm-uapi/xe: Add wmtp engine capability
Date: Fri,  9 Aug 2024 12:39:21 +0200
Message-ID: <20240809103922.12964-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Align with commit ("drm/xe/uapi: Expose wmtp as engine capability")

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 include/drm-uapi/xe_drm.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 29425d7fd..756c7e110 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -247,13 +247,21 @@ struct drm_xe_engine_class_instance {
 
 /**
  * struct drm_xe_engine - describe hardware engine
+ *
+ * The @capabilities can be:
+ *  - DRM_XE_ENGINE_CAPABILITY_WMTP - represents a engine's mid-thread
+ *  preemption capability.
  */
 struct drm_xe_engine {
 	/** @instance: The @drm_xe_engine_class_instance */
 	struct drm_xe_engine_class_instance instance;
-
+#define DRM_XE_ENGINE_CAPABILITY_WMTP		1
+	/** @capabilities: Capabilities of this engine. */
+	__u32 capabilities;
+	/** @pad: MBZ */
+	__u32 pad;
 	/** @reserved: Reserved */
-	__u64 reserved[3];
+	__u64 reserved[2];
 };
 
 /**
-- 
2.42.0

