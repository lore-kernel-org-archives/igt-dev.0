Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0311610E087
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Oct 2023 06:34:50 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Oct 2023 12:05:37 +0530
Message-Id: <20231018063537.140125-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_dsc: update debugfs
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

Instead of using i915_capabilities, use i915_display_capabilities.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 76a420c10..1a57a8b23 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -56,7 +56,7 @@ bool igt_is_dsc_supported_by_source(int drmfd)
 	dir = igt_debugfs_dir(drmfd);
 	igt_assert(dir >= 0);
 
-	res = igt_debugfs_simple_read(dir, "i915_capabilities",
+	res = igt_debugfs_simple_read(dir, "i915_display_capabilities",
 				      buf, sizeof(buf));
 	close(dir);
 
-- 
2.25.1
