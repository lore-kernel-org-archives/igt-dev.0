Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9C51061B21
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 10:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC3C10EA16;
	Tue, 31 Mar 2026 10:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZzaYwCi/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE62110E9F5
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 10:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774953043; x=1806489043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X4m5UQPsu+oxqJxFxyvHUAgTZvmV2iKdBysUzljvqJg=;
 b=ZzaYwCi/PVZuz2xDTAZGdoN79Lo0TBnBrAu4fJQ0tDCPhcumgnhrY460
 YyZoNlEgoT/qzcyOi6YZgmAGyhh36wy6yRgUA/ePbhU/mFFEzv7qZgvJJ
 Yty6y40APoD/KVfhSdICAmLnz/gsMDQaPjnZwbt6+kPc7i2l72bRjWxZ4
 6gRfEELY/ohYfmAVKqf/rjA+yXEn33Vq+bo/rn7R7gWkYnigW+72ew6U6
 xqpe9m0gVR9DCCW4d8W37xnLQm/OFAudT10EVIigARECy9c+R8z053kAb
 FjcQGlwzlrOltC9I4hWABGZoBl/OsZQghDnRDIKDf2jA569ElkuQO//EQ g==;
X-CSE-ConnectionGUID: P/nHbz9KTk2YxHxyjodcVw==
X-CSE-MsgGUID: dNlt9kfHT52uaUpGLfZ8xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75848690"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="75848690"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 03:30:43 -0700
X-CSE-ConnectionGUID: DrxsxZkiRDqPoHvuSgaYtg==
X-CSE-MsgGUID: SOe672QuR6u+FEI7rVR7ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="227935553"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2026 03:30:41 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 2/3] include/drm-uapi: Add ERROR_REPORTING capability
Date: Tue, 31 Mar 2026 15:59:22 +0530
Message-Id: <20260331102923.2782569-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260331102923.2782569-1-arun.r.murthy@intel.com>
References: <20260210085333.3250279-1-arun.r.murthy@intel.com>
 <20260331102923.2782569-1-arun.r.murthy@intel.com>
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

KMD adds error reporting on atomic_ioctl failure. A capability has been
added for the same to check the compatability.

KMD patch is under review @
https://patchwork.freedesktop.org/series/152275/

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/drm-uapi/drm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index baa620e3f..dd3fa4350 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -775,6 +775,13 @@ struct drm_gem_open {
  * commits.
  */
 #define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP	0x15
+/**
+ * DRM_CAP_ATOMIC_ERROR_REPORTING
+ *
+ * If set to 1, the driver supports reporting of failure codes on error in
+ * atomic ioctl().
+ */
+#define DRM_CAP_ATOMIC_ERROR_REPORTING	0x16
 
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
-- 
2.25.1

