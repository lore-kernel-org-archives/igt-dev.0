Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B31710E2BB
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 16:54:36 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 18:54:17 +0200
Message-Id: <20230529165417.347129-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230529165417.347129-1-zbigniew.kempczynski@intel.com>
References: <20230529165417.347129-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/intel_batchbuffer: Use COMPUTE
 instead RENDER engine for Xe on PVC
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

For gpgpu fill currently we select I915_EXEC_RENDER which is correct
as pipeline selection allows to submit compute job on it. However
newer platforms like PVC have no render engine so replacing to compute
engine is necessary. At the moment this is workaround - more rework
in intel-bb is necessary to better support both - i915 and xe.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_batchbuffer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 9f65536173..71f62973c8 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2315,7 +2315,10 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
 			break;
 		case I915_EXEC_RENDER:
-			inst.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
+			if (IS_PONTEVECCHIO(xe_dev_id(ibb->fd)))
+				inst.engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
+			else
+				inst.engine_class = DRM_XE_ENGINE_CLASS_RENDER;
 			break;
 		case I915_EXEC_VEBOX:
 			inst.engine_class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
-- 
2.34.1
