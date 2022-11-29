Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B586410E265
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 22:03:39 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 29 Nov 2022 15:03:09 -0700
Message-ID: <20221129220309.1472045-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/kms_plane: check before calling i915
 libraries
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

for_each_memory_region calls functions in lib/i915/ and let's
check is_i915_device first.

Fixes: db2bdd3a (tests/kms_plane: skip memory demanding modes in test_plane_panning)
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_plane.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index fc530d2c..164dacf4 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -391,9 +391,12 @@ test_plane_panning(data_t *data, enum pipe pipe)
 
 	test_init(data, pipe);
 
-	for_each_memory_region(r, data->drm_fd)
-		if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE)
-			mem_size = r->cpu_size;
+	if (is_i915_device(data->drm_fd)) {
+		for_each_memory_region(r, data->drm_fd)
+			if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE)
+				mem_size = r->cpu_size;
+
+	}
 
 	for_each_connector_mode(output) {
 		drmModeModeInfo *m = &output->config.connector->modes[j__];
-- 
2.34.1
