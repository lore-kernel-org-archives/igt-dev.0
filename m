Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24756C00A94
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 09:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDE110F53C;
	Fri, 12 Apr 2024 09:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkW4M21O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6892F10F54F
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 09:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712913326; x=1744449326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ft8Co/V/P7uCKYkiKd89wEL/NZFG4TuoVQNafmIRBbs=;
 b=VkW4M21OkX5OD+htyC/SrgM4OxvEqpzXUrcrKsot75MJQnJbxnCj6DaV
 wH0qOmxOfhReliXgIcGSGutO8rnzrWNHJPwnH7bC9Jic8GTQvX05FiW+L
 iJucYZASQZ43/lkI5GMxbkWqCWK3JWQ6qHLP4NzCVAa6+KPtUJ3J7K4GH
 nn/ctVUscIBZDBX+n8w7vkwW835Mz5gZrMwEUgxXNNUICgS29T2DC6G3o
 8yss+3G9MbJwbJHgQjHN0e6/JwePWieadGuGJN1maHLIAYHQ7a1uYg3jl
 AJVN28xytp3lQVsh5TCC7r6pQW062eEMyS5HNWChm/Vq8W8YLf1AcmNbs Q==;
X-CSE-ConnectionGUID: VcjJFa+nRGOfM4ggDZsO3w==
X-CSE-MsgGUID: mDF6YXD/TeKlMUBD2vhbZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12146413"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="12146413"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:15:18 -0700
X-CSE-ConnectionGUID: JnS8tQ+VTNmyPjQIzXx0OA==
X-CSE-MsgGUID: m39Wl5LKStuyeJ/YwiwaIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21165131"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:15:17 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t 2/4] drm-uapi/xe: Add query flag for dev atomics on SMEM
Date: Fri, 12 Apr 2024 11:01:15 +0200
Message-ID: <20240412090117.32727-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412090117.32727-1-nirmoy.das@intel.com>
References: <20240412090117.32727-1-nirmoy.das@intel.com>
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
 include/drm-uapi/xe_drm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 9171cc0f1..992bd75e1 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -394,6 +394,8 @@ struct drm_xe_query_mem_regions {
  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
  *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
  *    available exec queue priority
+ *  - %DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM - Flag is set if the device
+ *    supports device atomics on system memory
  */
 struct drm_xe_query_config {
 	/** @num_params: number of parameters returned in info */
@@ -408,6 +410,7 @@ struct drm_xe_query_config {
 #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
 #define DRM_XE_QUERY_CONFIG_VA_BITS			3
 #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
+#define DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM	5
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
-- 
2.42.0

