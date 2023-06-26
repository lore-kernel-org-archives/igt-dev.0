Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405D010E031
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 05:16:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Mon, 26 Jun 2023 10:40:08 +0530
Message-Id: <20230626051031.2363120-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 i-g-t 01/24] lib: Interface to close the drm fd
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

Add new helper drm_close_driver() to close the drm fd. Now
every user could call drm_close_driver() instead of close().

V2: - Fix commit message
    - Add debug prints
V3: - Check the validity of fd before close
V4: - s/igt_debug/igt_warn/

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/drmtest.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 lib/drmtest.h |  1 +
 2 files changed, 45 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 220cfb64d..a226ebd91 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -636,6 +636,50 @@ int drm_open_driver(int chipset)
 	return fd;
 }
 
+static bool is_valid_fd(int fd)
+{
+	char path[32];
+	char buf[PATH_MAX];
+	int len;
+
+	if (fd < 0)
+		return false;
+
+	snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
+
+	memset(buf, 0, sizeof(buf));
+	len = readlink(path, buf, sizeof(buf) - 1);
+	if (len <= 0)
+		return false;
+
+	buf[len] = '\0';
+	if (strstr(buf, "/dev/dri/card") == buf ||
+	    strstr(buf, "/dev/dri/renderD") == buf)
+		return true;
+
+	return false;
+}
+
+/**
+ * drm_close_driver:
+ * @fd: a drm file descriptor
+ *
+ * Check the given drm file descriptor @fd is valid & Close if it is
+ * an valid drm fd.
+ *
+ * Returns: 0 on success or -1 on error.
+ */
+int drm_close_driver(int fd)
+{
+	if (!is_valid_fd(fd)) {
+		igt_warn("Don't attempt to close standard/invalid file "
+			 "descriptor: %d\n", fd);
+		return -1;
+	}
+
+	return close(fd);
+}
+
 /**
  * drm_open_driver_master:
  * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
diff --git a/lib/drmtest.h b/lib/drmtest.h
index ae86ee19a..9c3ea5d14 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -105,6 +105,7 @@ int drm_open_driver_render(int chipset);
 int __drm_open_driver_another(int idx, int chipset);
 int __drm_open_driver(int chipset);
 int __drm_open_driver_render(int chipset);
+int drm_close_driver(int fd);
 
 int drm_reopen_driver(int fd);
 
-- 
2.40.0
