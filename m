Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E6F6E3F4
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Sep 2021 12:26:27 +0000 (UTC)
From: Jigar Bhatt <jigar.bhatt@intel.com>
Date: Thu, 30 Sep 2021 17:50:50 +0530
Message-Id: <20210930122050.2033508-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Changing sysfs open
 attribute to O_RDONLY
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: jigar.bhatt@intel.com, nischal.varide@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Opening /sys/module/drm_kms_helper/parameters/ in read only mode to
avoid permission issue in dc9-dpms test.

Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
---
 tests/i915/i915_pm_dc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index d70ee060..4c9b871c 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -419,7 +419,7 @@ static void setup_dc9_dpms(data_t *data, int dc_target)
 {
 	int prev_dc, sysfs_fd;
 
-	igt_require((sysfs_fd = open(KMS_HELPER, O_RDWR)) >= 0);
+	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
 	kms_poll_saved_state = igt_sysfs_get_boolean(sysfs_fd, "poll");
 	igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
 	close(sysfs_fd);
@@ -449,7 +449,7 @@ static void kms_poll_state_restore(int sig)
 {
 	int sysfs_fd;
 
-	sysfs_fd = open(KMS_HELPER, O_WRONLY);
+	sysfs_fd = open(KMS_HELPER, O_RDONLY);
 	if (sysfs_fd >= 0) {
 		igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
 		close(sysfs_fd);
-- 
2.25.1
