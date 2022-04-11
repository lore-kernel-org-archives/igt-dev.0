Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <igt-dev@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Date: Tue, 12 Apr 2022 00:20:42 +0530
Message-ID: <20220411185042.24338-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/drm_buddy: Add drm buddy test cases
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 matthew.auld@intel.com, daniel@ffwll.ch, christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add a set of drm buddy test cases to validate the
drm/drm_buddy.c memory allocator.

v2: sorted in alphabetical order

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/drm_buddy.c | 14 ++++++++++++++
 tests/meson.build |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 tests/drm_buddy.c

diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
new file mode 100644
index 00000000..06876e0c
--- /dev/null
+++ b/tests/drm_buddy.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_kmod.h"
+
+IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_buddy)");
+
+igt_main
+{
+	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
+}
diff --git a/tests/meson.build b/tests/meson.build
index b0eab3d6..7261e9aa 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -8,6 +8,7 @@ test_progs = [
 	'debugfs_test',
 	'dmabuf',
 	'device_reset',
+	'drm_buddy',
 	'drm_import_export',
 	'drm_mm',
 	'drm_read',
-- 
2.25.1
