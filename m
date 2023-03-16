Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A9B10E0F8
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 02:32:51 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Mar 2023 19:32:47 -0700
Message-Id: <20230316023250.4115730-2-matthew.brost@intel.com>
In-Reply-To: <20230316023250.4115730-1-matthew.brost@intel.com>
References: <20230316023250.4115730-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/4] xe: Update to latest uAPI
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

Needed to test NULL VM binds.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm-uapi/xe_drm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 593b01ba..4bde1087 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -446,6 +446,14 @@ struct drm_xe_vm_bind_op {
 	 * than differing the MAP to the page fault handler.
 	 */
 #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
+	/*
+	 * When the NULL flag is set, the page tables are setup with a special
+	 * bit which indicates writes are dropped and all reads return zero. The
+	 * NULL flags is only valid for XE_VM_BIND_OP_MAP operations, the BO
+	 * handle MBZ, and the BO offset MBZ. This flag is intended to implement
+	 * VK sparse bindings.
+	 */
+#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
-- 
2.34.1
