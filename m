Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4446E8D6
 for <igt-dev@lists.freedesktop.org>; Mon, 31 May 2021 10:51:43 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 31 May 2021 12:51:38 +0200
Message-Id: <20210531105138.169530-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] Fixup clang compiler warnings.
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

Allows building cleanly with clang again. It complains about using
invalid initialisers like char[][] = { 0 }.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 lib/igt_kms.c               | 2 +-
 lib/igt_nouveau.c           | 2 +-
 tests/i915/gem_exec_fence.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 28fb9c094eb2..fb7a14f940ea 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -292,7 +292,7 @@ struct edid **igt_kms_get_tiled_edid(uint8_t htile, uint8_t vtile)
 {
 	uint8_t top[2];
 	int edids, i;
-	static  char raw_edid[MAX_EDID][256] = {0};
+	static  char raw_edid[MAX_EDID][256] = {{0}};
 	static struct edid *edid[MAX_EDID];
 
 	top[0] = 0x00;
diff --git a/lib/igt_nouveau.c b/lib/igt_nouveau.c
index ae6104e332f1..fdf6020a35af 100644
--- a/lib/igt_nouveau.c
+++ b/lib/igt_nouveau.c
@@ -118,7 +118,7 @@ int igt_nouveau_create_bo(int drm_fd, bool sysmem, igt_fb_t *fb)
 {
 	struct igt_nouveau_dev *dev = get_nouveau_dev(drm_fd);
 	struct nouveau_device *nvdev = dev->dev;
-	union nouveau_bo_config config = {0};
+	union nouveau_bo_config config = { };
 	struct igt_nouveau_fb_priv *priv;
 	uint32_t flags = sysmem ? NOUVEAU_BO_GART : NOUVEAU_BO_VRAM;
 
diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 70bb00113a97..c3a650d89861 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -2382,8 +2382,8 @@ static void submit_timeline_execbuf(struct inter_engine_context *context,
 				    uint32_t signal_syncobj,
 				    uint64_t signal_value)
 {
-	uint64_t values[2] = { 0, };
-	struct drm_i915_gem_exec_fence fences[2] = { 0, };
+	uint64_t values[2] = { };
+	struct drm_i915_gem_exec_fence fences[2] = { };
 	struct drm_i915_gem_execbuffer_ext_timeline_fences fence_list = {
 		.base = {
 			.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES,
-- 
2.31.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
