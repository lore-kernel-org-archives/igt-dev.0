Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01297606A332
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLQnOidw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A4910E3EB;
	Fri, 27 Nov 2026 12:02:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC6D10E516
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 12:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795780833; x=1827316833;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=whRK7raHvtTcVcEOAmTc5sK1KZ1OxxyxomAqQaNU/O4=;
 b=nLQnOidwVH9d0PTYjWr26PdcwH2JHCkYR4oCQBBLqOxeSrw7J4wHg4qk
 N61dr5EhsO0JWkUCYT2p8RPRt9d/3PWWmo8D1wfA+9CRqyefvuRG9tlf2
 MtWZ2Al42QUcN0YZ+mD7S3GdObbUHAB0NH57LHBJwottxOp7FKQX3loLH
 dVzSpImZ9v4CEqaYzW9T4mrcvETWf+TiWsXjRgR0siwZTfqAqHtAZou3x
 wgiGUkcd5sB7WbYyw8wrhf/mgXp8poecx1d/YdsbM4T4cMh41zGOc82Lz
 GTM6DrSmOSkTADHekvTY/baIfFWrcciZ5cZ+EdqRODheqSZ9n4d9+a079 Q==;
X-CSE-ConnectionGUID: SOztZnrZQK+J48I3ulgW2A==
X-CSE-MsgGUID: sUHzrGc9RlKvXwCNkhu0Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4585876"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4585876"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:00:32 -0800
X-CSE-ConnectionGUID: HsoaLtIfSSSyPlvW/wBWqQ==
X-CSE-MsgGUID: AerdYJX2QGmuqFEa2S1I9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12521149"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.129])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:00:30 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 David Francis <David.Francis@amd.com>,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH i-g-t] drm-uapi/drm: sync with kernel a1b6cf8e5e7e
Date: Fri, 27 Nov 2026 13:00:12 +0100
Message-ID: <20261127120012.79600-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sync drm.h with drm-next kernel, this will bring following
changes:

a1b6cf8e5e7e ("drm: uapi: Use SPDX in DRM core uAPI headers")
dc2d30e7db83 ("drm/doc: document DRM_IOCTL_SYNCOBJ_EVENTFD")

Cc: David Francis <David.Francis@amd.com>
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 include/drm-uapi/drm.h | 124 +++++++++++++++++++++++++++++------------
 1 file changed, 87 insertions(+), 37 deletions(-)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index baa620e3f..b051d2da4 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Header for the Direct Rendering Manager
  *
@@ -11,25 +12,6 @@
  * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
  * Copyright 2000 VA Linux Systems, Inc., Sunnyvale, California.
  * All rights reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * VA LINUX SYSTEMS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
  */
 
 #ifndef _DRM_H_
@@ -591,34 +573,65 @@ struct drm_set_version {
 	int drm_dd_minor;
 };
 
-/* DRM_IOCTL_GEM_CLOSE ioctl argument type */
+/**
+ * struct drm_gem_close - Argument for &DRM_IOCTL_GEM_CLOSE ioctl.
+ * @handle: Handle of the object to be closed.
+ * @pad: Padding.
+ *
+ * Releases the handle to an mm object.
+ */
 struct drm_gem_close {
-	/** Handle of the object to be closed. */
 	__u32 handle;
 	__u32 pad;
 };
 
-/* DRM_IOCTL_GEM_FLINK ioctl argument type */
+/**
+ * struct drm_gem_flink - Argument for &DRM_IOCTL_GEM_FLINK ioctl.
+ * @handle: Handle for the object being named.
+ * @name: Returned global name.
+ *
+ * Create a global name for an object, returning the name.
+ *
+ * Note that the name does not hold a reference; when the object
+ * is freed, the name goes away.
+ */
 struct drm_gem_flink {
-	/** Handle for the object being named */
 	__u32 handle;
-
-	/** Returned global name */
 	__u32 name;
 };
 
-/* DRM_IOCTL_GEM_OPEN ioctl argument type */
+/**
+ * struct drm_gem_open - Argument for &DRM_IOCTL_GEM_OPEN ioctl.
+ * @name: Name of object being opened.
+ * @handle: Returned handle for the object.
+ * @size: Returned size of the object
+ *
+ * Open an object using the global name, returning a handle and the size.
+ *
+ * This handle (of course) holds a reference to the object, so the object
+ * will not go away until the handle is deleted.
+ */
 struct drm_gem_open {
-	/** Name of object being opened */
 	__u32 name;
-
-	/** Returned handle for the object */
 	__u32 handle;
-
-	/** Returned size of the object */
 	__u64 size;
 };
 
+/**
+ * struct drm_gem_change_handle - Argument for &DRM_IOCTL_GEM_CHANGE_HANDLE ioctl.
+ * @handle: The handle of a gem object.
+ * @new_handle: An available gem handle.
+ *
+ * This ioctl changes the handle of a GEM object to the specified one.
+ * The new handle must be unused. On success the old handle is closed
+ * and all further IOCTL should refer to the new handle only.
+ * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
+ */
+struct drm_gem_change_handle {
+	__u32 handle;
+	__u32 new_handle;
+};
+
 /**
  * DRM_CAP_DUMB_BUFFER
  *
@@ -872,14 +885,15 @@ struct drm_get_cap {
 /**
  * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
  *
- * If set to 1, the DRM core will
- * - expose plane COLOR_PIPELINE properties for pre-blending color management.
- * - reject setting of these plane properties:
- *   - COLOR_ENCODING
- *   - COLOR_RANGE
+ * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
+ * property on a &drm_plane, as well as drm_colorop properties.
  *
- * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ * Setting of these plane properties will be rejected when this client
+ * cap is set:
+ * - COLOR_ENCODING
+ * - COLOR_RANGE
  *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
  */
 #define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
 
@@ -913,13 +927,17 @@ struct drm_syncobj_destroy {
 };
 
 #define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_IMPORT_SYNC_FILE (1 << 0)
+#define DRM_SYNCOBJ_FD_TO_HANDLE_FLAGS_TIMELINE         (1 << 1)
 #define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE (1 << 0)
+#define DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE         (1 << 1)
 struct drm_syncobj_handle {
 	__u32 handle;
 	__u32 flags;
 
 	__s32 fd;
 	__u32 pad;
+
+	__u64 point;
 };
 
 struct drm_syncobj_transfer {
@@ -1032,6 +1050,13 @@ struct drm_crtc_queue_sequence {
 	__u64 user_data;	/* user data passed to event */
 };
 
+#define DRM_CLIENT_NAME_MAX_LEN		64
+struct drm_set_client_name {
+	__u64 name_len;
+	__u64 name;
+};
+
+
 #if defined(__cplusplus)
 }
 #endif
@@ -1274,6 +1299,13 @@ extern "C" {
  */
 #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
 
+/**
+ * DRM_IOCTL_SYNCOBJ_EVENTFD - Register an eventfd to be signalled by a syncobj.
+ *
+ * This can be used to integrate a syncobj in an event loop.
+ *
+ * The IOCTL argument is a struct drm_syncobj_eventfd.
+ */
 #define DRM_IOCTL_SYNCOBJ_EVENTFD	DRM_IOWR(0xCF, struct drm_syncobj_eventfd)
 
 /**
@@ -1296,6 +1328,24 @@ extern "C" {
  */
 #define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
 
+/**
+ * DRM_IOCTL_SET_CLIENT_NAME - Attach a name to a drm_file
+ *
+ * Having a name allows for easier tracking and debugging.
+ * The length of the name (without null ending char) must be
+ * <= DRM_CLIENT_NAME_MAX_LEN.
+ * The call will fail if the name contains whitespaces or non-printable chars.
+ */
+#define DRM_IOCTL_SET_CLIENT_NAME	DRM_IOWR(0xD1, struct drm_set_client_name)
+
+/**
+ * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
+ *
+ * Some applications (notably CRIU) need objects to have specific gem handles.
+ * This ioctl changes the object at one gem handle to use a new gem handle.
+ */
+#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
-- 
2.55.0

