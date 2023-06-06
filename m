Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16ECF10E0EE
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 01:21:55 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Jun 2023 18:21:48 -0700
Message-Id: <20230606012150.2119065-3-ashutosh.dixit@intel.com>
In-Reply-To: <20230606012150.2119065-1-ashutosh.dixit@intel.com>
References: <20230606012150.2119065-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/igt_sysfs: Don't assert in
 igt_sysfs_dir_id_to_name
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

Old platforms (BLB/ELK) don't have any freq attributes even in legacy
per-device sysfs. Asserting for this platforms shows up as a CI
regression. So don't assert, just return the device level attribute and let
file open on the non-existent attribute fail to preserve previous behavior.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_sysfs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 8021ba9cbb2e..35a4faa9aab5 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -115,10 +115,8 @@ const char *igt_sysfs_dir_id_to_name(int dir, enum i915_attr_id id)
 
 	if (igt_sysfs_has_attr(dir, i915_attr_name[RPS][id]))
 		return i915_attr_name[RPS][id];
-	if (igt_sysfs_has_attr(dir, i915_attr_name[GT][id]))
-		return i915_attr_name[GT][id];
 
-	igt_assert_f(0, "attr_id not found %d\n", id);
+	return i915_attr_name[GT][id];
 }
 
 /**
-- 
2.38.0
