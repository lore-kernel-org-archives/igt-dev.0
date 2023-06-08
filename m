Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E9910E5DE
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jun 2023 15:48:02 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  8 Jun 2023 08:47:54 -0700
Message-Id: <20230608154756.2866519-3-ashutosh.dixit@intel.com>
In-Reply-To: <20230608154756.2866519-1-ashutosh.dixit@intel.com>
References: <20230608154756.2866519-1-ashutosh.dixit@intel.com>
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
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
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
