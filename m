Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1125F6EA33
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:52 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:29 -0800
Message-Id: <20191211005235.67897-24-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 23/29] lib/igt_kms: Add FreeBSD support
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

Include the FreeBSD header that provides equivalent definitions to
linux/kd.h, and omit igt_hotplug_watch which depends upon udev.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/igt_kms.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d20daaad..790d1fe8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -41,6 +41,9 @@
 #elif HAVE_SYS_KD_H
 #include <sys/kd.h>
 #endif
+#if defined(__FreeBSD__)
+#include <sys/consio.h>
+#endif
 
 #include <libudev.h>
 #include <poll.h>
@@ -4117,6 +4120,7 @@ void igt_reset_connectors(void)
 		igt_sysfs_set(forced_connectors[i].dir, "status",  "detect");
 }
 
+#if defined(__linux__)
 /**
  * igt_watch_hotplug:
  *
@@ -4155,6 +4159,11 @@ struct udev_monitor *igt_watch_hotplug(void)
 
 	return mon;
 }
+#else
+struct udev_monitor *igt_watch_hotplug(void) {
+	return NULL;
+}
+#endif
 
 static bool event_detected(struct udev_monitor *mon, int timeout_secs,
 			   const char *property)
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
