Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9178110E056
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 05:01:13 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Nov 2023 10:21:13 +0530
Message-Id: <20231116045113.1590173-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20231116045113.1590173-1-bhanuprakash.modem@intel.com>
References: <20231116045113.1590173-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 2/2] lib/igt_kms: Read max dotclock info from
 i915_cdclk_info only
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

If fail to read 'i915_cdclk_info' debugfs, simply return
max dotclock as 0, and no need to fallback to read from
'i915_frequency_info'.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b2208ac54..13bb58dbd 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6046,7 +6046,7 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
  * @fd: A drm file descriptor
  *
  * Get the Max pixel clock frequency from intel specific debugfs
- * "i915_frequency_info".
+ * "i915_cdclk_info".
  *
  * Returns: Max supported pixel clock frequency.
  */
@@ -6070,19 +6070,12 @@ int igt_get_max_dotclock(int fd)
 	dir = igt_debugfs_dir(fd);
 	igt_require(dir);
 
-	/*
-	 * Display specific clock frequency info is moved to i915_cdclk_info,
-	 * On older kernels if this debugfs is not found, fallback to read from
-	 * i915_frequency_info.
-	 */
 	res = igt_debugfs_simple_read(dir, "i915_cdclk_info",
 				      buf, sizeof(buf));
-	if (res <= 0)
-		res = igt_debugfs_simple_read(dir, "i915_frequency_info",
-					      buf, sizeof(buf));
 	close(dir);
 
-	igt_require(res > 0);
+	if (res <= 0)
+		return max_dotclock;
 
 	igt_assert(s = strstr(buf, "Max pixel clock frequency:"));
 	igt_assert_eq(sscanf(s, "Max pixel clock frequency: %d kHz", &max_dotclock), 1);
-- 
2.40.0
