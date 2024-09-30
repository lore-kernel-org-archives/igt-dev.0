Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F22CE8349
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 14:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22A010E4FB;
	Mon, 30 Sep 2024 14:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJvS8NzJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CF610E50D
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727705606; x=1759241606;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dixTM1S5fhT6cKyI6466gP/yznpn03P+ilLHMS1A2W0=;
 b=JJvS8NzJrnd1qE9b098aOZXnkKb3xbmcivwfddzWFary4AEyEXDKp4dy
 UrKu4w160Ku03ZhRmOx/9VFL/FTj2yHxUih3Izs5TKrH2jnfOvhw6lHhr
 6pBJO7KIuZQUR9/AuOTSZdZqe2RGJQ14ap/F8Bex9YJByyGB39PyDP+cs
 htTtFwdji7xHS1wPztBAbLK6j3I8HlJ2fZU6hpcXC+TRAPYXEqvRyA/y0
 ylwWCH1/PDfZGrFcD27o0VbtaPsryfdrxleVJcwPMlqfuHl1M5Czh2kGw
 MnbEvKwYyB7IlDeuZGrx0MKuJF4eLpwZNEQHxe7edtDM5XnTmRh1RF0xJ w==;
X-CSE-ConnectionGUID: p8IopeQTQHO1uMM0p3AqYA==
X-CSE-MsgGUID: /LWwje76T/yMEOotbwOqpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30591116"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="30591116"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 07:13:26 -0700
X-CSE-ConnectionGUID: MhhtgRXWTfOCsdnIW/B+rQ==
X-CSE-MsgGUID: z5s44j7qRkOmvMnGy+tTcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="96645239"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.99])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 07:13:25 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t,v4 1/2] lib/igt_sysfs: Promote driver rebind function
Date: Mon, 30 Sep 2024 16:08:23 +0200
Message-ID: <20240930141248.810483-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240930141248.810483-1-francois.dugast@intel.com>
References: <20240930141248.810483-1-francois.dugast@intel.com>
MIME-Version: 1.0
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

Move the rebind function to the library so that it can be used in other
tests without code duplication. Also extend it to support simple bind
and unbind.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 lib/igt_sysfs.c         | 54 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h         |  9 +++++++
 tests/intel/xe_wedged.c | 36 ++++-----------------------
 3 files changed, 68 insertions(+), 31 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index aec0bb53d..f8e634f8f 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1360,3 +1360,57 @@ int xe_sysfs_get_num_tiles(int xe_device)
 
 	return num_tiles;
 }
+
+/**
+ * xe_sysfs_driver_do:
+ * @xe_device: fd of the device
+ * @pci_slot: PCI slot of the device
+ * @action: the action to perform through sysfs on the driver
+ *
+ * Use sysfs to perform an action on the driver.
+ *
+ * Returns: fd of the device, which renewed if needed
+ */
+int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_action action)
+{
+	int sysfs;
+
+	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
+	igt_assert(sysfs);
+
+	switch(action) {
+	case XE_SYSFS_DRIVER_BIND:
+		igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
+		close(sysfs);
+		break;
+	case XE_SYSFS_DRIVER_TRY_BIND:
+		igt_sysfs_set(sysfs, "bind", pci_slot);
+		close(sysfs);
+		break;
+	case XE_SYSFS_DRIVER_UNBIND:
+		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
+		close(sysfs);
+		break;
+	case XE_SYSFS_DRIVER_REBIND:
+		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
+
+		/*
+		 * We need to close the client for a proper release, before
+		 * binding back again.
+		 */
+		close(xe_device);
+
+		igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
+		close(sysfs);
+
+		/* Renew the client connection */
+		xe_device = drm_open_driver(DRIVER_XE);
+		igt_assert(xe_device);
+
+		break;
+	default:
+		igt_assert(!"missing");
+	}
+
+	return xe_device;
+}
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 2a1e3b1bf..0ee253826 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -175,4 +175,13 @@ int xe_sysfs_get_num_tiles(int xe_device);
 char *xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen);
 int xe_sysfs_engine_open(int xe_device, int gt, int class);
 
+enum xe_sysfs_driver_action {
+	XE_SYSFS_DRIVER_BIND,
+	XE_SYSFS_DRIVER_TRY_BIND,
+	XE_SYSFS_DRIVER_UNBIND,
+	XE_SYSFS_DRIVER_REBIND,
+};
+
+int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_action action);
+
 #endif /* __IGT_SYSFS_H__ */
diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index a3f7a697f..ba790aa8d 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -41,34 +41,6 @@ static void force_wedged(int fd)
 	sleep(1);
 }
 
-static int rebind_xe(int fd)
-{
-	char pci_slot[NAME_MAX];
-	int sysfs;
-
-	igt_device_get_pci_slot_name(fd, pci_slot);
-
-	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
-	igt_assert(sysfs);
-
-        igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
-
-	/*
-	 * We need to close the client for a proper release, before
-	 * binding back again.
-	 */
-	close(fd);
-
-        igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
-	close(sysfs);
-
-	/* Renew the client connection */
-	fd = drm_open_driver(DRIVER_XE);
-	igt_assert(fd);
-
-	return fd;
-}
-
 static int simple_ioctl(int fd)
 {
 	int ret;
@@ -231,9 +203,11 @@ igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
+	char pci_slot[NAME_MAX];
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
+		igt_device_get_pci_slot_name(fd, pci_slot);
 	}
 
 	igt_subtest("basic-wedged") {
@@ -245,7 +219,7 @@ igt_main
 
 		force_wedged(fd);
 		igt_assert_neq(simple_ioctl(fd), 0);
-		fd = rebind_xe(fd);
+		fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
 		igt_assert_eq(simple_ioctl(fd), 0);
 		xe_for_each_engine(fd, hwe)
 			simple_exec(fd, hwe);
@@ -265,7 +239,7 @@ igt_main
 		 */
 		sleep(1);
 		igt_assert_neq(simple_ioctl(fd), 0);
-		fd = rebind_xe(fd);
+		fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
 		igt_assert_eq(simple_ioctl(fd), 0);
 		xe_for_each_engine(fd, hwe)
 			simple_exec(fd, hwe);
@@ -289,7 +263,7 @@ igt_main
 		}
 
 		/* Tests might have failed, force a rebind before exiting */
-		fd = rebind_xe(fd);
+		fd = xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_REBIND);
 
 		drm_close_driver(fd);
 	}
-- 
2.43.0

