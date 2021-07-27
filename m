Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Matthew Brost <matthew.brost@intel.com>
Date: Tue, 27 Jul 2021 08:21:57 -0700
Message-Id: <20210727152202.9527-3-matthew.brost@intel.com>
In-Reply-To: <20210727152202.9527-1-matthew.brost@intel.com>
References: <20210727152202.9527-1-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 2/7] include/drm-uapi: Add logical mapping
 uAPI
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

v2:
 (CI)
  - Fix off by 1 error in size of reserved fields

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm-uapi/i915_drm.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index 3c1aac348..332c07e3d 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -2518,14 +2518,20 @@ struct drm_i915_engine_info {
 
 	/** @flags: Engine flags. */
 	__u64 flags;
+#define I915_ENGINE_INFO_HAS_LOGICAL_INSTANCE		(1 << 0)
 
 	/** @capabilities: Capabilities of this engine. */
 	__u64 capabilities;
 #define I915_VIDEO_CLASS_CAPABILITY_HEVC		(1 << 0)
 #define I915_VIDEO_AND_ENHANCE_CLASS_CAPABILITY_SFC	(1 << 1)
 
+	/** @logical_instance: Logical instance of engine */
+	__u16 logical_instance;
+
 	/** @rsvd1: Reserved fields. */
-	__u64 rsvd1[4];
+	__u16 rsvd1[3];
+	/** @rsvd2: Reserved fields. */
+	__u64 rsvd2[3];
 };
 
 /**
-- 
2.28.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
