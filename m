Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9070B10E41D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 23:04:08 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Mar 2023 16:04:01 -0700
Message-Id: <20230322230402.3342787-2-ashutosh.dixit@intel.com>
In-Reply-To: <20230322230402.3342787-1-ashutosh.dixit@intel.com>
References: <20230322230402.3342787-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_sysfs: Add i915_for_each_gt()
 macro
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

From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Add a macro to iterate over all the gts

v2: s/for_each_gt/i915_for_each_gt/ because of introduction of
    xe_for_each_gt

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_sysfs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 2e3c4813adc..c0fcf6b5739 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -38,6 +38,11 @@
 	     (dirfd__ = igt_sysfs_gt_open(i915__, gt__)) != -1; \
 	     close(dirfd__), gt__++)
 
+#define i915_for_each_gt(i915, gtid, dir) \
+	for ((gtid) = 0; \
+	     ((dir) = igt_sysfs_gt_open((i915), (gtid))) != -1; \
+	     close(dir), (gtid)++)
+
 #define igt_sysfs_rps_write(dir, id, data, len) \
 	igt_sysfs_write(dir, igt_sysfs_dir_id_to_name(dir, id), data, len)
 
-- 
2.38.0
