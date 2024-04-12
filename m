Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF67C00A94
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 09:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C461810F535;
	Fri, 12 Apr 2024 09:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLmKzB2/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2283710F52A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 09:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712913109; x=1744449109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ft8Co/V/P7uCKYkiKd89wEL/NZFG4TuoVQNafmIRBbs=;
 b=nLmKzB2/vGKWFPdFa4A7OIuwdZKjJK4C8X8P36+cBEy4UjrkiAwt4OXr
 GEq2E6dHcNLrDKDSRxdnPmZBJu7SCS6jmr5VX5d6Y3mo2n95gkfwJZp72
 ijg02/xdOx/sCy6XHNoV3KNUf6zK14lZtvGPDugIyLEzpbOoSCiBwojNq
 pPBjWYEmMSfKyEAZv4iCQpXUkegC1aw5cSn/sb69nskWWZDXgSYG3FUW0
 jywOQkXtenlHO5narKnwEvOU7K2EXLQfuExQtp5sDW9tXVckUi9XPzHwe
 E3ggyZVDoqxEba5ZH+YyUhsKVn1aGYyZYiaxSD2MF49lBzTCcYPg5e5l5 w==;
X-CSE-ConnectionGUID: 0XIfVWX9SDa7M/2EKF7IBA==
X-CSE-MsgGUID: O39cPtDFS6afSCHVJau5tQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="30842839"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="30842839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:49 -0700
X-CSE-ConnectionGUID: LQ8RWESvRN6vAHn0sc+zbA==
X-CSE-MsgGUID: 9W7VBcqnTayNwcJQ8brsbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="25625087"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:11:48 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t 2/4] drm-uapi/xe: Add query flag for dev atomics on SMEM
Date: Fri, 12 Apr 2024 10:57:39 +0200
Message-ID: <20240412085744.21196-4-nirmoy.das@intel.com>
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

