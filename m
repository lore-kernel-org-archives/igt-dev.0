Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4E46E113
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Mar 2021 12:06:25 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 18 Mar 2021 13:05:54 +0100
Message-Id: <20210318120554.961342-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/core_hotunplug: Be more specific on
 sysfs vs. debugfs issues
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Messages displayed on sysfs health check failures don't provide
information which subtree of sysfs actually failed - device sysfs
itself or device debugfs.  That information could make debugging more
easy if available.

Be more specific when reporting sysfs health check failures.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/core_hotunplug.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index e7d2a4472..56a88fefd 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -351,11 +351,13 @@ static void node_healthcheck(struct hotunplug *priv, unsigned flags)
 	if (!priv->failure) {
 		char path[200];
 
-		priv->failure = "Device sysfs healthckeck failure!";
 		local_debug("%s\n", "running device sysfs healthcheck");
-		if (igt_sysfs_path(fd_drm, path, sizeof(path)) &&
-		    igt_debugfs_path(fd_drm, path, sizeof(path)))
-			priv->failure = NULL;
+		priv->failure = "Device sysfs healthckeck failure!";
+		if (igt_sysfs_path(fd_drm, path, sizeof(path))) {
+			priv->failure = "Device debugfs healthckeck failure!";
+			if (igt_debugfs_path(fd_drm, path, sizeof(path)))
+				priv->failure = NULL;
+		}
 	}
 
 	fd_drm = close_device(fd_drm, "", "health checked ");
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
