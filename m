Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289FA10E056
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 05:01:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Nov 2023 10:21:12 +0530
Message-Id: <20231116045113.1590173-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 1/2] lib/igt_kms: Don't read max dotclock on
 non-display platforms
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

On non-display platforms, there is no point in checking for
max dotclock.

V2: Fix resource leak
V3: Drop unwanted 'else'

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/9672
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 89510ff22..b2208ac54 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6055,10 +6055,18 @@ int igt_get_max_dotclock(int fd)
 	char buf[4096];
 	char *s;
 	int dir, res, max_dotclock = 0;
+	drmModeRes *resources;
 
 	if (!is_intel_device(fd))
 		return max_dotclock;
 
+	/* If there is no display, then no point to check for dotclock. */
+	resources = drmModeGetResources(fd);
+	if (!resources)
+		return max_dotclock;
+
+	drmModeFreeResources(resources);
+
 	dir = igt_debugfs_dir(fd);
 	igt_require(dir);
 
-- 
2.40.0
