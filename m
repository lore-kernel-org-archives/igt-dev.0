Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DD26EA2E
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:54 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:30 -0800
Message-Id: <20191211005235.67897-25-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 24/29] lib/ioctl_wrappers: Support FreeBSD
 in igt_require_gem
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

On FreeBSD, fdescfs is mounted at /dev/fd/ and provides equivalent
functionality to Linux's /proc/self/fd.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/ioctl_wrappers.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 78b92bd2..3b060f56 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1222,7 +1222,7 @@ static void reset_device(int fd)
 
 void igt_require_gem(int fd)
 {
-	char path[256];
+	char path[256] = {0};
 	int err;
 
 	igt_require_intel(fd);
@@ -1232,7 +1232,11 @@ void igt_require_gem(int fd)
 	 * of a wedged device, not for actually waiting on outstanding
 	 * requests! So create a new drm_file for the device that is clean.
 	 */
+#if defined(__linux__)
 	snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
+#elif defined(__FreeBSD__)
+	snprintf(path, sizeof(path), "/dev/fd/%d", fd);
+#endif
 	fd = open(path, O_RDWR);
 	igt_assert_lte(0, fd);
 
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
