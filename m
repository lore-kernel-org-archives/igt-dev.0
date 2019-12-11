Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3976EA33
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:53 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:32 -0800
Message-Id: <20191211005235.67897-27-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 26/29] lib/igt_device: Implement
 get_card_index for FreeBSD
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

On FreeBSD, the device nodes for drm devices do not have an
st_rdev value that corresponds to the drm card index. Instead we
can use libutil to look up our open file descriptors through the
sysctl interface.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 lib/igt_device.c | 20 ++++++++++++++++++++
 lib/meson.build  |  1 +
 meson.build      |  6 ++++++
 3 files changed, 27 insertions(+)

diff --git a/lib/igt_device.c b/lib/igt_device.c
index 01a9eff4..327c9c63 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -27,6 +27,10 @@
 #include <sys/stat.h>
 #if defined(__linux__)
 #include <sys/sysmacros.h>
+#elif defined(__FreeBSD__)
+#include <sys/user.h>
+#include <libgen.h>
+#include <libutil.h>
 #endif
 #include "igt.h"
 #include "igt_device.h"
@@ -111,11 +115,27 @@ void igt_device_drop_master(int fd)
  */
 int igt_device_get_card_index(int fd)
 {
+#if defined(__linux__)
 	struct stat st;
 
 	igt_fail_on(fstat(fd, &st) || !S_ISCHR(st.st_mode));
 
 	return minor(st.st_rdev);
+#elif defined(__FreeBSD__)
+	struct kinfo_file *files, *f;
+	int nfiles, idx = 0;
+
+	files = kinfo_getfile(getpid(), &nfiles);
+	for (f = files; f < files + nfiles; f++) {
+		if (f->kf_fd == fd) {
+			idx = atoi(basename(f->kf_path));
+			break;
+		}
+	}
+	free(files);
+
+	return idx;
+#endif
 }
 
 #define IGT_DEV_PATH_LEN 80
diff --git a/lib/meson.build b/lib/meson.build
index 2cb944e2..710b89b5 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -86,6 +86,7 @@ lib_deps = [
 	libkmod,
 	libprocps,
 	libudev,
+	libutil,
 	math,
 	pciaccess,
 	pixman,
diff --git a/meson.build b/meson.build
index 4d5003ba..ffe9ae1f 100644
--- a/meson.build
+++ b/meson.build
@@ -93,6 +93,12 @@ config = configuration_data()
 
 null_dep = dependency('', required : false)
 
+if host_machine.system() == 'freebsd'
+	libutil = cc.find_library('libutil')
+else
+	libutil = null_dep
+endif
+
 libdrm_info = []
 libdrm_intel = null_dep
 libdrm_nouveau = null_dep
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
