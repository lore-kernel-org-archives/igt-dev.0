Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E47A10E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 15:45:47 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 17:44:27 +0200
Message-Id: <20230516154434.810356-2-dominik.grzegorzek@intel.com>
In-Reply-To: <20230516154434.810356-1-dominik.grzegorzek@intel.com>
References: <20230516154434.810356-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/8] xe: sync uapi headers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 include/drm-uapi/xe_drm_tmp.h | 76 +++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 include/drm-uapi/xe_drm_tmp.h

diff --git a/include/drm-uapi/xe_drm_tmp.h b/include/drm-uapi/xe_drm_tmp.h
new file mode 100644
index 000000000..9829cd724
--- /dev/null
+++ b/include/drm-uapi/xe_drm_tmp.h
@@ -0,0 +1,76 @@
+#ifndef _UAPI_XE_DRM_TMP_H_
+#define _UAPI_XE_DRM_TMP_H_
+
+#include "xe_drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+#define DRM_XE_EUDEBUG_CONNECT			0x5f
+
+#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect_param)
+
+/**
+ * Do a eudebug event read for a debugger connection.
+ *
+ * This ioctl is available in debug version 1.
+ */
+#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT _IO('j', 0x0)
+
+/* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
+struct drm_xe_eudebug_event {
+	struct xe_user_extension ext;
+
+	__u32 type;
+#define DRM_XE_EUDEBUG_EVENT_NONE     0
+#define DRM_XE_EUDEBUG_EVENT_READ     1
+#define DRM_XE_EUDEBUG_EVENT_OPEN     2
+#define DRM_XE_EUDEBUG_EVENT_VM	      3
+#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT DRM_XE_EUDEBUG_EVENT_VM
+
+	__u32 flags;
+#define DRM_XE_EUDEBUG_EVENT_CREATE	(1 << 0)
+#define DRM_XE_EUDEBUG_EVENT_DESTROY	(1 << 1)
+#define DRM_XE_EUDEBUG_EVENT_STATE_CHANGE (1 << 2)
+
+	__u64 seqno;
+	__u64 size;
+} __attribute__((packed));
+
+struct drm_xe_eudebug_event_client {
+	struct drm_xe_eudebug_event base; /* .flags = CREATE/DESTROY */
+
+	__u64 client_handle; /* This is unique per debug connection */
+} __attribute__((packed));
+
+struct drm_xe_eudebug_event_vm {
+	struct drm_xe_eudebug_event base;
+
+	__u64 client_handle;
+	__u64 vm_handle;
+} __attribute__((packed));
+
+/*
+ * Debugger ABI (ioctl and events) Version History:
+ * 0 - No debugger available
+ * 1 - Initial version
+ */
+#define DRM_XE_EUDEBUG_VERSION 1
+
+struct drm_xe_eudebug_connect_param {
+	struct xe_user_extension ext;
+
+	__u64 pid; /* input: Target process ID */
+	__u32 flags;
+
+	__u32 version; /* output: current ABI (ioctl / events) version */
+	__u64 events;  /* input: event types to subscribe to */
+	__u64 extensions; /* MBZ */
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* _UAPI_XE_DRM_TMP_H_ */
-- 
2.34.1
