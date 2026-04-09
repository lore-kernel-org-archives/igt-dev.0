Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBBEE98FD8
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 09:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203B810E2E9;
	Thu,  9 Apr 2026 09:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kS7xaW+m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B05110E2E9
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 09:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775727525; x=1807263525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1mvubuwuPDIBtrE6GdI/mcHqL01A+BkNbqp5ElU3LSk=;
 b=kS7xaW+mEFtldVv5vyn8tU+N2HiVlWMDH2iiqWXSMNqAZoOMETeh4wif
 EJA2+iE9lQdJh0JVimlMgsPGFWOO9rhWeqdv98MlzOS6TzW4eHFT7c7tE
 rzolH6w1qZ2IC6tH0HXsFF+x9pN3ot1VPzKdicZySaPT7bVSaA5bcRE9t
 ru81AarCPq4p+aOAl+W4f2GVdsJ4HVNx8hcmyU6gnfsIXCCkDDWmUecvZ
 eA/J0BI/5kZ4HlZzMMo1uOfVjn7EGrQxUqL28jJXnJ+SqY5/5HhRdXEMy
 hzkGVP48VmcGIgAvmwh3Lcrmqvzj0OtGyeVfHuCBFgQRoVOLPEQ6pXLaP w==;
X-CSE-ConnectionGUID: rMI9FstoT9CWriUiZKNswg==
X-CSE-MsgGUID: UibBH2GsTeq5EXm5GwMmUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76798818"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="76798818"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 02:38:45 -0700
X-CSE-ConnectionGUID: nnFisuJYQZ2xjZhZJdB8+A==
X-CSE-MsgGUID: stKENnVWS7Gd5uiSg+dHYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="230391530"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 02:38:44 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/3] DONT_MERGE: include/drm-uapi: Add atomic_ioctl
 error codes
Date: Thu,  9 Apr 2026 15:06:37 +0530
Message-ID: <20260409093639.27449-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409093639.27449-1-jeevan.b@intel.com>
References: <20260409093639.27449-1-jeevan.b@intel.com>
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

The corresponding KMD patches are under review
https://patchwork.freedesktop.org/series/152275/

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 include/drm-uapi/drm_mode.h | 60 +++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index de10ce859..2c6e05e48 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -45,6 +45,7 @@ extern "C" {
 #define DRM_CONNECTOR_NAME_LEN	32
 #define DRM_DISPLAY_MODE_LEN	32
 #define DRM_PROP_NAME_LEN	32
+#define DRM_MODE_ATOMIC_FAILURE_STRING_LEN     128
 
 #define DRM_MODE_TYPE_BUILTIN	(1<<0) /* deprecated */
 #define DRM_MODE_TYPE_CLOCK_C	((1<<1) | DRM_MODE_TYPE_BUILTIN) /* deprecated */
@@ -1241,6 +1242,65 @@ struct drm_mode_destroy_dumb {
 		DRM_MODE_ATOMIC_NONBLOCK |\
 		DRM_MODE_ATOMIC_ALLOW_MODESET)
 
+
+/**
+ * enum drm_mode_atomic_failure_codes -  error codes for failures in
+ * atomic_ioctl
+ * @DRM_MODE_ATOMIC_UNSPECIFIED_ERROR: this is the default/unspecified error.
+ * @DRM_MODE_ATOMIC_INVALID_API_USAGE: invallid API usage(DRM_ATOMIC not
+ *                                     enabled, invalid falg, page_flip event
+ *                                     with test-only, etc)
+ * @DRM_MODE_ATOMIC_NEED_FULL_MODESET: Need full modeset on all
+ * 				       connected crtc's
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
+ * @failure_code: error codes defined in enum
+ * 		  drm_moide_atomic_failure_code
+ * @failure_objs_ptr: pointer to the drm_object that caused error
+ * @reserved: reserved for future use
+ * @count_objs: count of drm_objects if multiple drm_objects caused
+ * 		error
+ * @failure_string: user readable error message string  */ struct
+drm_mode_atomic_err_code {
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
2.43.0

