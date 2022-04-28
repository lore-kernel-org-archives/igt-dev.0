Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46C510EBEB
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Apr 2022 11:42:00 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
Date: Thu, 28 Apr 2022 17:03:27 +0530
Message-Id: <20220428113327.544230-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_sysfs: Remove igt_debug_on in
 igt_sysfs_gt_open()
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

As igt_sysfs_gt_open() is being used in for_each_sysfs_gt_dirfd,
remove unwanted igt_debug_on in igt_sysfs_gt_open().

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/igt_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index fe77afd7..e42251e6 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -203,7 +203,7 @@ int igt_sysfs_open(int device)
 {
 	char path[80];
 
-	if (igt_debug_on(!igt_sysfs_path(device, path, sizeof(path))))
+	if (!igt_sysfs_path(device, path, sizeof(path)))
 		return -1;
 
 	return open(path, O_RDONLY);
-- 
2.25.1
