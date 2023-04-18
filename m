Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E30610E819
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 16:50:01 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 22:14:44 +0530
Message-Id: <20230418164501.1687266-29-bhanuprakash.modem@intel.com>
In-Reply-To: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 28/45] tests/kms_content_protection: Add XE support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_content_protection.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 638e1301a..344cac505 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -392,7 +392,12 @@ static bool sink_hdcp_capable(igt_output_t *output)
 	if (fd < 0)
 		return false;
 
-	if (is_i915_device(data.drm_fd))
+	/*
+	 * FIXME: As of now XE's debugfs is using i915 namespace. Once Kernel
+	 * changes got landed, please update this logic to use XE specific
+	 * debugfs.
+	 */
+	if (is_intel_device(data.drm_fd))
 		debugfs_read(fd, "i915_hdcp_sink_capability", buf);
 	else
 		debugfs_read(fd, "hdcp_sink_capability", buf);
@@ -413,7 +418,8 @@ static bool sink_hdcp2_capable(igt_output_t *output)
 	if (fd < 0)
 		return false;
 
-	if (is_i915_device(data.drm_fd))
+	/* FIXME: XE specific debugfs as mentioned above. */
+	if (is_intel_device(data.drm_fd))
 		debugfs_read(fd, "i915_hdcp_sink_capability", buf);
 	else
 		debugfs_read(fd, "hdcp_sink_capability", buf);
@@ -763,7 +769,7 @@ static const struct {
 	  .content_type = HDCP_CONTENT_TYPE_1,
 	},
 	{ .desc = "Test the teardown and rebuild of the interface between "
-		  "I915 and mei hdcp.",
+		  "Intel and mei hdcp.",
 	  .name = "mei_interface",
 	  .cp_tests = CP_MEI_RELOAD,
 	  .content_type = HDCP_CONTENT_TYPE_1,
-- 
2.40.0
