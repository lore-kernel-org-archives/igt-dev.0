Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575AA10E7A1
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Oct 2023 10:09:36 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Oct 2023 12:09:00 +0200
Message-ID: <20231026100909.13317-6-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231026100909.13317-1-kamil.konieczny@linux.intel.com>
References: <20231026100909.13317-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 5/6] drm-uapi/vmwgfx: sync with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>, Martin Krastev <krastevm@vmware.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Simon Ser <contact@emersion.fr>

Sync vmwgfx drm-uapi header with drm-next commit ("52920704df878050123dfeb469aa6ab8022547c1")

v1: split virtgpu and vmwgfx to one separate patch (Kamil)
v2: correct spelling in commit description, remove unreachable
  e-mail, split virtgpu and vmwgfx into two patches, keep a-b
  for vmwgfx (Kamil)

Signed-off-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Martin Krastev <krastevm@vmware.com>
Acked-by: Zack Rusin <zackr@vmware.com> #vmwgfx
---
 include/drm-uapi/vmwgfx_drm.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/vmwgfx_drm.h b/include/drm-uapi/vmwgfx_drm.h
index 9078775fe..26549c86a 100644
--- a/include/drm-uapi/vmwgfx_drm.h
+++ b/include/drm-uapi/vmwgfx_drm.h
@@ -1,6 +1,6 @@
 /**************************************************************************
  *
- * Copyright © 2009-2015 VMware, Inc., Palo Alto, CA., USA
+ * Copyright © 2009-2022 VMware, Inc., Palo Alto, CA., USA
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -92,6 +92,12 @@ extern "C" {
  *
  * DRM_VMW_PARAM_SM5
  * SM5 support is enabled.
+ *
+ * DRM_VMW_PARAM_GL43
+ * SM5.1+GL4.3 support is enabled.
+ *
+ * DRM_VMW_PARAM_DEVICE_ID
+ * PCI ID of the underlying SVGA device.
  */
 
 #define DRM_VMW_PARAM_NUM_STREAMS      0
@@ -110,6 +116,8 @@ extern "C" {
 #define DRM_VMW_PARAM_HW_CAPS2         13
 #define DRM_VMW_PARAM_SM4_1            14
 #define DRM_VMW_PARAM_SM5              15
+#define DRM_VMW_PARAM_GL43             16
+#define DRM_VMW_PARAM_DEVICE_ID        17
 
 /**
  * enum drm_vmw_handle_type - handle type for ref ioctls
-- 
2.42.0
