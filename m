Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D4D10E6F6
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 15:03:51 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jan 2023 20:27:57 +0530
Message-Id: <20230118145757.14070-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kms: Fixed the usage of
 Dereferencing of null pointer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, kamil.konieczny@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Fixed the usage of Dereferencing of null pointer to avoid crash.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/igt_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b4a98ae1..b3334b3a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1941,6 +1941,7 @@ kmstest_get_property(int drm_fd, uint32_t object_id, uint32_t object_type,
 	int i;
 
 	proplist = drmModeObjectGetProperties(drm_fd, object_id, object_type);
+	igt_require(proplist);
 	for (i = 0; i < proplist->count_props; i++) {
 		_prop = drmModeGetProperty(drm_fd, proplist->props[i]);
 		if (!_prop)
-- 
2.25.1
