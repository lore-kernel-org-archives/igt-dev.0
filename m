Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F6610E139
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 19:45:23 +0000 (UTC)
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Dec 2023 20:45:12 +0100
Message-Id: <20231206194512.332721-1-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Use COMPUTE instead
 of RENDER engine for Xe if missing
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

Make engine fallback in intel_batchbuffer more generic. Up to this
point, we were replacing render with compute only on PVC.
Replace it whenever there is no compute engine. As was stated in
989920cfc4 this still remains only a workaround, more rework
in intel-bb is necessary to better support both - i915 and xe.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_batchbuffer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 472c88129..1268ac8f0 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2366,10 +2366,10 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
 			break;
 		case I915_EXEC_RENDER:
-			if (IS_PONTEVECCHIO(xe_dev_id(ibb->fd)))
-				inst.engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
-			else
+			if (xe_has_engine_class(ibb->fd, DRM_XE_ENGINE_CLASS_RENDER))
 				inst.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
+			else
+				inst.engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
 			break;
 		case I915_EXEC_VEBOX:
 			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
-- 
2.34.1
