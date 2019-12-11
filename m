Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A08D6EA2E
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:55 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:33 -0800
Message-Id: <20191211005235.67897-28-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 27/29] lib/igt_debugfs: Implement mount()
 for FreeBSD
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

debugfs is typically mounted at a different path on FreeBSD, and
the mount function prototype is slightly different.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/igt_debugfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 5a9c8c3c..33592df3 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -116,6 +116,7 @@ static bool is_mountpoint(const char *path)
 
 static const char *__igt_debugfs_mount(void)
 {
+#if defined(__linux__)
 	if (is_mountpoint("/sys/kernel/debug"))
 		return "/sys/kernel/debug";
 
@@ -126,6 +127,17 @@ static const char *__igt_debugfs_mount(void)
 		return NULL;
 
 	return "/sys/kernel/debug";
+#elif defined(__FreeBSD__)
+	if (is_mountpoint("/compat/linux/debug"))
+		return "/compat/linux/debug";
+
+	if (mount("lindebugfs", "/compat/linux/debug", 0, NULL))
+		return NULL;
+
+	return "/compat/linux/debug";
+#else
+#error Do not know how to mount debugfs
+#endif
 }
 
 /**
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
