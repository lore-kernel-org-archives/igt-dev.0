Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D61F10EA4E
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 12:42:32 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 18:06:39 +0530
Message-Id: <20230120123639.57140-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] lib/igt_kms: Fixed the usage of
 Dereferencing of null pointer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Fixed the usage of Dereferencing of null pointer to avoid crash.

v2: Removed igt_require and return false if proplist empty. (Kamil)
    %s/D/d in subj and description. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/igt_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b4a98ae1..6a0c5ac2 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1941,6 +1941,9 @@ kmstest_get_property(int drm_fd, uint32_t object_id, uint32_t object_type,
 	int i;
 
 	proplist = drmModeObjectGetProperties(drm_fd, object_id, object_type);
+	if (!proplist)
+		return false;
+
 	for (i = 0; i < proplist->count_props; i++) {
 		_prop = drmModeGetProperty(drm_fd, proplist->props[i]);
 		if (!_prop)
-- 
2.25.1
