Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1844B6E90D
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2020 10:36:14 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Wed,  1 Apr 2020 13:36:06 +0300
Message-Id: <20200401103606.138917-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tools/i915-perf-recorder: fix topology
 alignment issue
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The additional alignment added when writing into the output was not
accounted in the header. This is preventing reading the recorded data.

Instead of adding the alignment when writing, just account for it when
querying the topology.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Fixes: f08865e58cd3 ("tools: add i915 perf recorder tool")
---
 tools/i915-perf/i915_perf_recorder.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index 4d729b0e..104a425b 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -485,8 +485,8 @@ get_topology(int drm_fd, uint32_t *topology_size)
 		return NULL;
 
 	assert(item.length > 0);
-	*topology_size = item.length;
-	topo_info = malloc(item.length);
+	*topology_size = ALIGN(item.length, 8);
+	topo_info = malloc(*topology_size);
 	item.data_ptr = (uintptr_t) topo_info;
 
 	ret = perf_ioctl(drm_fd, DRM_IOCTL_I915_QUERY, &query);
@@ -510,12 +510,6 @@ write_topology(FILE *output, struct recording_context *ctx)
 	if (fwrite(ctx->topology, ctx->topology_size, 1, output) != 1)
 		return false;
 
-	/* Align the size to align all other packets to 8 bytes. */
-	if (ctx->topology_size % 8) {
-		if (fwrite(pad, ctx->topology_size % 8, 1, output) != 1)
-			return false;
-	}
-
 	return true;
 }
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
