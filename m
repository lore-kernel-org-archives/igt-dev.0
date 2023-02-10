Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Fri, 10 Feb 2023 15:22:07 +0000
Message-Id: <20230210152207.585007-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel_gpu_top: Add compute class names
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

No one remembered to add names for the new compute engines.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index c043c8960dd0..e13e35b71f4b 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -281,6 +281,8 @@ static const char *class_display_name(unsigned int class)
 		return "Video";
 	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
 		return "VideoEnhance";
+	case I915_ENGINE_CLASS_COMPUTE:
+		return "Compute";
 	default:
 		return "[unknown]";
 	}
@@ -297,6 +299,8 @@ static const char *class_short_name(unsigned int class)
 		return "VCS";
 	case I915_ENGINE_CLASS_VIDEO_ENHANCE:
 		return "VECS";
+	case I915_ENGINE_CLASS_COMPUTE:
+		return "CCS";
 	default:
 		return "UNKN";
 	}
-- 
2.34.1
