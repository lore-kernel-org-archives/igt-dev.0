Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C73810E6AF
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 16:15:50 +0000 (UTC)
From: Nemesa Garg <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Sep 2023 21:43:02 +0530
Message-Id: <20230922161302.440145-1-nemesa.garg@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_rmfb: Add check for xe driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nemesa Garg <nemesa.garg@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As the xe check is missing the value of open_count
variable is not incrementing and because of this
during drm_close_driver operation based on open_count
value mutex is acquired and there is a callback to
lastclose function.

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 lib/drmtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index e1da66c87..99b655680 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -649,7 +649,7 @@ int drm_open_driver(int chipset)
 	 * starting a test and we install an exit handler to wait until
 	 * idle before quitting.
 	 */
-	if (is_i915_device(fd)) {
+	if (is_i915_device(fd) || is_xe_device(fd)) {
 		if (__sync_fetch_and_add(&open_count, 1) == 0) {
 			__cancel_work_at_exit(fd);
 			at_exit_drm_fd = drm_reopen_driver(fd);
-- 
2.25.1
