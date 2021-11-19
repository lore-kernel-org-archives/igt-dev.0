Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Fri, 19 Nov 2021 12:59:45 +0000
Message-Id: <20211119125945.55056-6-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
References: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 6/6] intel_gpu_top: Add a sanity check
 discovered busy metric is per engine
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
Cc: Intel-gfx@lists.freedesktop.org, Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Adding a cross-check with ABI config name space and not just relying on
sysfs names.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>
---
 tools/intel_gpu_top.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 41c59a72c09d..81c724d1fe1c 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -376,6 +376,12 @@ static struct engines *discover_engines(char *device)
 			break;
 		}
 
+		/* Double check config is an engine config. */
+		if (engine->busy.config >= __I915_PMU_OTHER(0)) {
+			free((void *)engine->name);
+			continue;
+		}
+
 		engine->class = (engine->busy.config &
 				 (__I915_PMU_OTHER(0) - 1)) >>
 				I915_PMU_CLASS_SHIFT;
-- 
2.32.0
