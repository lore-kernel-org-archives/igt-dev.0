Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD918FF8868
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 14:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EC310EB1E;
	Tue, 28 Apr 2026 14:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYxdth03";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF0410EB1E
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 14:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777386402; x=1808922402;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G8NUVvd0mu/OUAiQpaHix6OpFwJsiYtQeIGi8NKu0UI=;
 b=MYxdth03HrqjBda+5um3hrFYr6qUOIuy7BH+E/tRdCHOWJjHklsrUvH7
 RdOkeqBdFnFsQfGqAfNLoSrPb8W5sjdqaHZ93IcP0jGZFCeIfWCGIJYZz
 5Vm2AtZgIGOTqVzqabmC8sbVSmjDnwG5w1pxv1uz3YcNz0U4byrYTsDYt
 Z9qjn3vP/sXBWbO08Z0X4xvQnRdlfrmN9x/JPhH2ztEOZ3iggf6KPWSBu
 mb8qDMvaK1ie5xHFickEEUAQSswBjodu2UQ6XD59breHEaj0xmlkEZ31q
 mckK4/6wCayxlttbLz8d9p2LKg73rAuXItT5Nxl0aNIIdFgHuVEgqabBK A==;
X-CSE-ConnectionGUID: DkhjVOYFSHqEs+jC4KmKmw==
X-CSE-MsgGUID: Mq/ATf7UQy+fpAxHXCqXqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="95862246"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="95862246"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:26:41 -0700
X-CSE-ConnectionGUID: vlsPVRV6S7GMKofXXa10Kw==
X-CSE-MsgGUID: JMmbaR5cQdeixaj/HLPexg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238942163"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.10])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 07:26:39 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v3] lib/drmtest: Create proper error report when open
 driver fails
Date: Tue, 28 Apr 2026 16:26:29 +0200
Message-ID: <20260428142629.78347-1-kamil.konieczny@linux.intel.com>
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
index 4a788ea7a..af3da4b99 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -323,6 +323,7 @@ static void log_opened_device_path(const char *device_path)
  * __drm_open_device:
  * @name: DRM node name
  * @chipset: OR'd flags for chipset to be opened
+ * @error: pointer for errno when open() fails
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
+	} else {
+		if (error)
+			*error = 0;
+	}
 
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
+			igt_debug("Error at open %s errno: %d %m\n", name, err);
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

