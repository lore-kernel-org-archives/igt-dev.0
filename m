Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1475910E60B
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jan 2023 06:49:47 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 24 Jan 2023 12:21:48 +0530
Message-Id: <20230124065152.19747-2-swati2.sharma@intel.com>
In-Reply-To: <20230124065152.19747-1-swati2.sharma@intel.com>
References: <20230124065152.19747-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] lib/dsc: Fix return value
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

0 is usually success, < 0 is error. Fix this.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c               | 7 +++++--
 tests/i915/kms_dsc_helper.c | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 25dcb5840..64dd6b29a 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -35,6 +35,9 @@ static int write_dsc_debugfs(int drmfd, char *connector_name, const char *file_n
 
 	close(debugfs_fd);
 
+	if (ret > 0)
+		return 0;
+
 	return ret;
 }
 
@@ -92,7 +95,7 @@ bool igt_is_force_dsc_enabled(int drmfd, char *connector_name)
  * @drmfd: A drm file descriptor
  * @connector_name: Name of the libdrm connector we're going to use
  *
- * Returns: 1 on success or negative error code, in case of failure.
+ * Returns: 0 on success or negative error code, in case of failure.
  */
 int igt_force_dsc_enable(int drmfd, char *connector_name)
 {
@@ -105,7 +108,7 @@ int igt_force_dsc_enable(int drmfd, char *connector_name)
  * @connector_name: Name of the libdrm connector we're going to use
  * @bpc: Input BPC
  *
- * Returns: No. of bytes written or negative error code, in case of failure.
+ * Returns: 0 on success or negative error code, in case of failure.
  */
 int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc)
 {
diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
index a80f3d787..e2c278c7a 100644
--- a/tests/i915/kms_dsc_helper.c
+++ b/tests/i915/kms_dsc_helper.c
@@ -14,7 +14,7 @@ void force_dsc_enable(int drmfd, igt_output_t *output)
 
 	igt_debug("Forcing DSC enable on %s\n", output->name);
 	ret = igt_force_dsc_enable(drmfd, output->name);
-	igt_assert_f(ret > 0, "forcing dsc enable debugfs_write failed\n");
+	igt_assert_f(ret == 0, "forcing dsc enable debugfs_write failed\n");
 }
 
 void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc)
@@ -24,7 +24,7 @@ void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc)
 	igt_debug("Forcing input DSC BPC to %d on %s\n",
 		  input_bpc, output->name);
 	ret = igt_force_dsc_enable_bpc(drmfd, output->name, input_bpc);
-	igt_assert_f(ret > 0, "forcing input dsc bpc debugfs_write failed\n");
+	igt_assert_f(ret == 0, "forcing input dsc bpc debugfs_write failed\n");
 }
 
 void save_force_dsc_en(int drmfd, igt_output_t *output)
-- 
2.25.1
