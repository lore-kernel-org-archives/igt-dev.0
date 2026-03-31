Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E4F1061B21
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 10:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD5410E9F5;
	Tue, 31 Mar 2026 10:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EV3yMoxP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2722B10E9F5
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 10:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774953041; x=1806489041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yqQuc5V7dXXVVX/fYbJqhGWMlqBtg9Xul0q8gG/RY9s=;
 b=EV3yMoxPNYSUhnCFPkWsy+xChwrW1WXmb2DbLJ++ghuVjGQtitT8+pL1
 596p4gFLDidQt/eOw6GpC0qdfiPyA44FHBZSa67wYglT5s+UZEJZH09kh
 darQYDZnhbHRNserFeMD6Ixdn60+6dmzOnBVmof5yvpwy/AUxKHLyYUbL
 IK1RtL3ELtAx3DIdP9q3FIV0vVTKQ7qYysKDjFFyvewD17kkj50qVgkE/
 pyGBaD+mYTaWrZ6ZMFNfLfGf1qPkIIBXCI5iv+SjW0uDfOO5oGQZNtNfD
 bBqBzfSCk/0ZDCTxOlefrKPaha3qCYbj5WFECSVSWP9U2G2kYJ/Yy/e2X Q==;
X-CSE-ConnectionGUID: WLXsDnxyTgeIiod4BJJPVA==
X-CSE-MsgGUID: J8YcZ7ZrSS2VYc5jbtA7kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75848676"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="75848676"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 03:30:40 -0700
X-CSE-ConnectionGUID: SqdpiHu+SmyBdLQp6lgVwg==
X-CSE-MsgGUID: h8inMLqqREe13Tu21XBaIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="227935540"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2026 03:30:38 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 1/3] include/drm-uapi: Add atomic_ioctl error codes
Date: Tue, 31 Mar 2026 15:59:21 +0530
Message-Id: <20260331102923.2782569-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260210085333.3250279-1-arun.r.murthy@intel.com>
References: <20260210085333.3250279-1-arun.r.murthy@intel.com>
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

KMD adds a new feature to return a user readable error code on
atomic_ioctl failure. This error code can be used to take corrective
measurements and also be used for error/debug logging.
The corresponding KMD patches are under review @
https://patchwork.freedesktop.org/series/152275/

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/drm-uapi/drm_mode.h | 56 +++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index de10ce859..f5e88cd7a 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -45,6 +45,7 @@ extern "C" {
 #define DRM_CONNECTOR_NAME_LEN	32
 #define DRM_DISPLAY_MODE_LEN	32
 #define DRM_PROP_NAME_LEN	32
+#define DRM_MODE_ATOMIC_FAILURE_STRING_LEN	128
 
 #define DRM_MODE_TYPE_BUILTIN	(1<<0) /* deprecated */
 #define DRM_MODE_TYPE_CLOCK_C	((1<<1) | DRM_MODE_TYPE_BUILTIN) /* deprecated */
@@ -1241,6 +1242,61 @@ struct drm_mode_destroy_dumb {
 		DRM_MODE_ATOMIC_NONBLOCK |\
 		DRM_MODE_ATOMIC_ALLOW_MODESET)
 
+/**
+ * enum drm_mode_atomic_failure_codes -  error codes for failures in atomic_ioctl
+ * @DRM_MODE_ATOMIC_UNSPECIFIED_ERROR: this is the default/unspecified error.
+ * @DRM_MODE_ATOMIC_INVALID_API_USAGE: invallid API usage(DRM_ATOMIC not
+ *				       enabled, invalid falg, page_flip event
+ *				       with test-only, etc)
+ * @DRM_MODE_ATOMIC_NEED_FULL_MODESET: Need full modeset on all connected crtc's
+ * @DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED: Property changed in async flip
+ * @DRM_MODE_ATOMIC_SCANOUT_BW: For a given resolution, refresh rate and the
+ *                              color depth cannot be accomodated. Resolution
+ *                              is to lower the refresh rate or color depth.
+ * @DRM_MODE_ATOMIC_CONNECTOR_BW: Refers to the limitation on the link rate on
+ *                                a given connector.
+ * @DRM_MODE_ATOMIC_PIPE_BW: Limitation on the pipe, either pipe not available
+ *                           or the pipe scaling factor limitation.
+ * @DRM_MODE_ATOMIC_MEMORY_DOMAIN: Any other memory/bandwidth related limitation
+ *                                 other then the ones specified above.
+ * @DRM_MODE_ATOMIC_SPEC_VIOLOATION: Limitation of a particular feature on that
+ *                                   hardware. To get to know the feature, the
+ *                                   property/object causing this is being sent
+ *                                   back to user @failure_objs_ptr in the
+ *                                   struct drm_mode_atomic_err_code
+ */
+enum drm_mode_atomic_failure_codes {
+	DRM_MODE_ATOMIC_UNSPECIFIED_ERROR,
+	DRM_MODE_ATOMIC_INVALID_API_USAGE,
+	DRM_MODE_ATOMIC_NEED_FULL_MODESET,
+	DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED,
+	DRM_MODE_ATOMIC_SCANOUT_BW,
+	DRM_MODE_ATTOMIC_CONNECTOR_BW,
+	DRM_MODE_ATTOMIC_PIPE_BW,
+	DRM_MODE_ATOMIC_MEMORY_DOMAIN,
+	DRM_MODE_ATOMIC_SPEC_VIOLOATION,
+};
+
+/**
+ * struct drm_mode_atomic_err_code - struct to store the error code
+ *
+ * pointer to this struct will be stored in reserved variable of
+ * struct drm_mode_atomic to report the failure cause to the user.
+ *
+ * @failure_code: error codes defined in enum drm_moide_atomic_failure_code
+ * @failure_objs_ptr: pointer to the drm_object that caused error
+ * @reserved: reserved for future use
+ * @count_objs: count of drm_objects if multiple drm_objects caused error
+ * @failure_string: user readable error message string
+ */
+struct drm_mode_atomic_err_code {
+	__u64 failure_code;
+	__u64 failure_objs_ptr;
+	__u64 reserved;
+	__u32 count_objs;
+	char failure_string[DRM_MODE_ATOMIC_FAILURE_STRING_LEN];
+};
+
 struct drm_mode_atomic {
 	__u32 flags;
 	__u32 count_objs;
-- 
2.25.1

