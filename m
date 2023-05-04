Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE6110E246
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 05:02:29 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu,  4 May 2023 10:27:21 +0530
Message-Id: <20230504045726.2954788-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
References: <20230504045726.2954788-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/6] lib: Interface to close the drm fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com, mchehab@kernel.org, kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com, karthik.b.s@intel.com, swati2.sharma@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add new helper drm_close_driver() to close the drm fd. So that
every user could call drm_close_driver() instead of close().

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/drmtest.c | 17 +++++++++++++++++
 lib/drmtest.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index c91a91425..03b5239b2 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -604,6 +604,23 @@ int drm_open_driver(int chipset)
 	return fd;
 }
 
+/**
+ * drm_close_driver:
+ * @fd: a drm file descriptor
+ *
+ * Close the drm file descriptor @fd.
+ *
+ * Returns: 0 on success or -1 on error.
+ */
+int drm_close_driver(int fd)
+{
+	/* Avoid closing standard file descriptors (0, 1, and 2). */
+	if (fd < 3)
+		return -1;
+
+	return close(fd);
+}
+
 /**
  * drm_open_driver_master:
  * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 3c88b85c6..2b7ffc765 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -105,6 +105,7 @@ int drm_open_driver_render(int chipset);
 int __drm_open_driver_another(int idx, int chipset);
 int __drm_open_driver(int chipset);
 int __drm_open_driver_render(int chipset);
+int drm_close_driver(int fd);
 
 void igt_require_amdgpu(int fd);
 void igt_require_intel(int fd);
-- 
2.40.0


