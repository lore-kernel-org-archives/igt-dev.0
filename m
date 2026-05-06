Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B59CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 15:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC27F10EDED;
	Wed,  6 May 2026 15:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="In+Zl+I+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4139710EDED
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778082846; x=1809618846;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+JRYyg8gbXyL1VgtjN+DYYVBKvkUM84ReO2JpSebxn8=;
 b=In+Zl+I+j3gzjT0toYJtU0Xv/nEgNOU+/JVTBd12E0n1urFc3/1nNwry
 XdpHj8llnZFrbvReyulDEqOAiKCZyCSGDqwtw5O2i8QL9lk62mkzwOt5Z
 VCj8LL3g0lGa5ck6VdYZAL6VXBQ6NIWB/Hkn/6WLhITB2Kgf9tUJHaQeh
 7v9QSQssTf5d6zghb5y5tRd4PBLhAGuYE+gxFmHKbg8tJOU45lkvIlw3H
 26uynLqmJMegzjrktqeKA73caWl62+gXZTD0pInNZ62GMjkWZBz63SckM
 beFInl+XK6z6V+Q8gdITBzl0PFCjTLstmUQH60czCWX4mVhB5EgEijDP1 Q==;
X-CSE-ConnectionGUID: 1sOaoXZWS0Wg9hXmz9t7lw==
X-CSE-MsgGUID: upfTtrAuRbCwB9kA5GOvtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="96447409"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="96447409"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 08:54:05 -0700
X-CSE-ConnectionGUID: wnlyPiDfROaVX6aQ4LmNIQ==
X-CSE-MsgGUID: cy2utA7IQXenx/Cuzp9N9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="240167085"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 08:54:03 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t] lib/drmtest: Create proper error report when open
 driver fails
Date: Wed,  6 May 2026 17:53:58 +0200
Message-ID: <20260506155358.183560-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

When first try for opening driver fails then opening function is
searching for next available device. When that also fails
reporting is printing last errno which could mislead developer:

$ build/tests/kms_dp_aux_dev
IGT-Version: 2.3-NO-GIT (x86_64) (Linux: 6.17.0-19-generic x86_64)
Test requirement not met in function drm_open_driver, file ../lib/drmtest.c:754:
Test requirement: !(fd<0)
No known gpu found for chipset flags 0x4294965755 (any)
Last errno: 2, No such file or directory
SKIP (0.006s)

ls /dev/dri
by-path  card1  renderD128

The real problem here is lack of permissions as there was a card
but program could not open it. Break looking for a card as soon
as an error is different from ENOENT. It will create a proper
error report which will print:

Last errno: 13, Permission denied

v3: break only when errno actually happens in open() (Kamil)
v4: removed 'else', removed errno printing as there is already
 %m which prints error (Zbigniew)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c          | 26 +++++++++++++++++++++-----
 lib/drmtest.h          |  2 +-
 lib/igt_sriov_device.c |  2 +-
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 4a788ea7a..8801c7197 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -323,6 +323,7 @@ static void log_opened_device_path(const char *device_path)
  * __drm_open_device:
  * @name: DRM node name
  * @chipset: OR'd flags for chipset to be opened
+ * @error: pointer for saving errno when open() fails
  *
  * Open a drm legacy device node with given @name and compatible with given
  * @chipset flag.
@@ -334,8 +335,10 @@ static void log_opened_device_path(const char *device_path)
  * name, even when driver was excluded by ANY or is not listed in known drivers.
  *
  * Returns: DRM file descriptor or -1 on error
+ *
+ * When open() succeeds, sets @error to zero otherwise to errno
  */
-int __drm_open_device(const char *name, unsigned int chipset)
+int __drm_open_device(const char *name, unsigned int chipset, int *error)
 {
 	const char *forced;
 	char dev_name[16] = "";
@@ -343,8 +346,15 @@ int __drm_open_device(const char *name, unsigned int chipset)
 	int fd;
 
 	fd = open(name, O_RDWR);
-	if (fd == -1)
+	if (fd == -1) {
+		if (error)
+			*error = errno;
+
 		return -1;
+	}
+
+	if (error)
+		*error = 0;
 
 	if (__get_drm_device_name(fd, dev_name, sizeof(dev_name) - 1) == -1)
 		goto err;
@@ -426,6 +436,7 @@ static bool _is_already_opened(const char *path, int as_idx)
 static int __search_and_open(const char *base, int offset, unsigned int chipset, int as_idx)
 {
 	const char *forced;
+	int err;
 
 	forced = forced_driver();
 	if (forced)
@@ -440,9 +451,14 @@ static int __search_and_open(const char *base, int offset, unsigned int chipset,
 		if (_is_already_opened(name, as_idx))
 			continue;
 
-		fd = __drm_open_device(name, chipset);
+		fd = __drm_open_device(name, chipset, &err);
 		if (fd != -1)
 			return fd;
+
+		if (err) {
+			igt_debug("Error at open %s %m\n", name);
+			break;
+		}
 	}
 
 	return -1;
@@ -500,13 +516,13 @@ static int __open_driver_exact(const char *name, unsigned int chipset)
 {
 	int fd;
 
-	fd = __drm_open_device(name, chipset);
+	fd = __drm_open_device(name, chipset, NULL);
 	if (fd != -1)
 		return fd;
 
 	drm_load_module(chipset);
 
-	return __drm_open_device(name, chipset);
+	return __drm_open_device(name, chipset, NULL);
 }
 
 /*
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 37874d729..126feffda 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -117,7 +117,7 @@ unsigned int drm_get_chipset(int fd);
  */
 #define IS_ALIGNED(v, a)	(((v) & ((typeof(v))(a) - 1)) == 0)
 
-int __drm_open_device(const char *name, unsigned int chipset);
+int __drm_open_device(const char *name, unsigned int chipset, int *error);
 void drm_load_module(unsigned int chipset);
 int drm_open_driver_another(int idx, int chipset);
 int drm_open_driver(int chipset);
diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 1f4c3ac04..21d23298b 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -284,7 +284,7 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
 	if (!found)
 		return -1;
 
-	fd = __drm_open_device(dev_name, DRIVER_ANY);
+	fd = __drm_open_device(dev_name, DRIVER_ANY, NULL);
 	if (fd >= 0 && is_xe_device(fd))
 		xe_device_get(fd);
 
-- 
2.54.0

