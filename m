Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4A010E033
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 13:41:41 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Jan 2023 19:05:40 +0530
Message-Id: <20230120133540.58340-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230120123639.57140-1-mohammed.thasleem@intel.com>
References: <20230120123639.57140-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] lib/igt_kms: Fixed the usage of
 dereferencing of null pointer
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

Fixed the usage of dereferencing of null pointer to avoid crash.

v2: Removed igt_require and return false if proplist empty. (Kamil)

v3: Corrected commit msg and description. (Kamil)

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
