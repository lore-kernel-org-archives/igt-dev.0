Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A9510E235
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 13:18:35 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 16:18:31 +0300
Message-Id: <20230912131831.22758-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20230911122256.30665-2-stanislav.lisovskiy@intel.com>
References: <20230911122256.30665-2-stanislav.lisovskiy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/intel/i915_pipe_stress: Fix create_buf
 function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

create_buf currently does wrong assumption what it gets
width in bytes, however reality is that it gets width
in pixels, so "width/4" must be "width * 4" for bpp 32.

v2: - /width * 4/width for intel_buf_init_using_handle
      (Zbigniew Kempczyński)

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 tests/intel/i915_pipe_stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
index 9ceb056a09..3cd84d027f 100644
--- a/tests/intel/i915_pipe_stress.c
+++ b/tests/intel/i915_pipe_stress.c
@@ -201,9 +201,9 @@ create_buf(struct data *data, int width, int height, uint32_t region)
 	 * Legacy code uses 32 bpp after buffer creation.
 	 * Let's do the same due to keep shader intact.
 	 */
-	handle = gem_create_in_memory_regions(data->drm_fd, width * height, region);
+	handle = gem_create_in_memory_regions(data->drm_fd, width * 4 * height, region);
 	intel_buf_init_using_handle(data->bops, handle, buf,
-				    width/4, height, 32, 0,
+				    width, height, 32, 0,
 				    I915_TILING_NONE, 0);
 
 	return buf;
-- 
2.37.3
