Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3281F6EB87
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 15:14:04 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Tue,  5 Oct 2021 08:10:07 -0700
Message-Id: <20211005151022.2161424-2-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20211005151022.2161424-1-alan.previn.teres.alexis@intel.com>
References: <20211005151022.2161424-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v13 01/16] i915_drm.h sync PXP default
 session
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Sync UAPI for to get I915_PROTECTED_CONTENT_DEFAULT_SESSION define value.

Taken from kernel commit:
commit cbbd3764b2399ad882cda98435b25144e9ea2124
       ("drm/i915/pxp: Create the arbitrary session after boot.")

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 include/drm-uapi/i915_drm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index b9632bb2..f4691fcc 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -2990,6 +2990,9 @@ struct drm_i915_gem_create_ext_memory_regions {
 	__u64 regions;
 };
 
+/* ID of the protected content session managed by i915 when PXP is active */
+#define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.25.1
