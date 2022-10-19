Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F230910F24C
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 14:41:00 +0000 (UTC)
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: petri.latvala@intel.com, kamil.konieczny@linux.intel.com,
 igt-dev@lists.freedesktop.org
Date: Wed, 19 Oct 2022 15:40:46 +0100
Message-Id: <20221019144048.2421051-2-adrian.larumbe@collabora.com>
In-Reply-To: <20221019144048.2421051-1-adrian.larumbe@collabora.com>
References: <20221019144048.2421051-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 1/3] lib/i915/i915_drm_local: Remove
 COMPUTE class engine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: adrian.larumbe@collabora.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Remove local compute engine definition as it was already synchronised into
include/drm-uapi/i915_drm.h from the kernel sources in a past commit.

Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
---
 lib/i915/i915_drm_local.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index 9a2273c4e4a9..17e823564f11 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -19,8 +19,6 @@ extern "C" {
  * or local_ prefix and without any #ifndef's. Attempt should be made to
  * clean these up when kernel uapi headers are sync'd.
  */
-#define I915_ENGINE_CLASS_COMPUTE 4
-
 #define DRM_I915_QUERY_GEOMETRY_SUBSLICES      6
 
 #if defined(__cplusplus)
-- 
2.38.0
