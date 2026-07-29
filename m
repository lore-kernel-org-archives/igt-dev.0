Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9395DC54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 10:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C72910E392;
	Wed, 29 Jul 2026 10:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+LAc1Ns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBD410E392
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785319771; x=1816855771;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YPtRWR50PAy0KNIMoaL/LWqQ55O/gbh7av/56igY77Y=;
 b=F+LAc1NstvwnPtPJiPToZnze0d0gOn8Rd3Pad+noKRvTV9yVopT1D90y
 4aldvBcjFJOP/ovalzFER/pBz6IYcgZGtMGRxNoTH5jFKcc7lErWQ61GG
 IFbI1NXOY/mGgw/94UZqKeETB4GTF/Txlge7XuF29ajCPsc3KBAuNbyjq
 yoMtSxrUZS/F2N6pQ4w3iqk7YQI5rHkr2XJF5of9korZhUYVl+cEAktZD
 cgq1FFRRWFwffqVnWZ2bi0OTWWMnBHUPHeRzrtw2hW62DrppLoXsh5slZ
 JKSGCTNeQbfQ1InHzOp7dm7y0U0E87z96rb7M2NjXDO9nnBL62Nl7WIIu Q==;
X-CSE-ConnectionGUID: S/vGVF7bQRSWuBfhhhM3Qg==
X-CSE-MsgGUID: 1/FqmhtNTV2918qZQyIzmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89739896"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="89739896"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 03:09:31 -0700
X-CSE-ConnectionGUID: /cjKRKxsQZaDGkcZLjgfOg==
X-CSE-MsgGUID: nT4fKMAaToW+XbSxXcAMzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="265005350"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 03:09:30 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	janusz.krzysztofik@intel.com
Subject: [PATCH 1/2] lib/igt_device_scan: Extract helper setting device filter
 from fd
Date: Wed, 29 Jul 2026 12:09:17 +0200
Message-ID: <20260729100918.842807-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
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

Helper sets device filter to the device corresponding to DRM device file
descriptor. Move the implementation from core_hotunplug test into the
library, so it can be reused in other tests.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v3:
 - move it to igt_device_scan (Janusz)
---
 lib/igt_device_scan.c  | 23 +++++++++++++++++++++++
 lib/igt_device_scan.h  |  2 ++
 tests/core_hotunplug.c | 17 +----------------
 3 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index 7c7995224..decf19646 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -2477,3 +2477,26 @@ int igt_device_prepare_filtered_view(const char *vendor)
 
 	return gpu_count;
 }
+
+/**
+ * igt_device_set_filter_from_fd:
+ * @fd: DRM device file descriptor
+ *
+ * Set device filter to the device corresponding to @fd.
+ */
+void igt_device_set_filter_from_fd(int fd)
+{
+	const char *filter_type = "sys:";
+	char filter[strlen(filter_type) + PATH_MAX + 1];
+	char *dst = stpcpy(filter, filter_type);
+	char path[PATH_MAX + 1];
+	struct stat st;
+
+	igt_assert(!fstat(fd, &st) && S_ISCHR(st.st_mode));
+	snprintf(path, sizeof(path), "/sys/dev/char/%d:%d/device",
+		 major(st.st_rdev), minor(st.st_rdev));
+	igt_assert(realpath(path, dst));
+
+	igt_device_filter_free_all();
+	igt_assert_eq(igt_device_filter_add(filter), 1);
+}
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index f24a193cd..ac75fea8c 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -103,4 +103,6 @@ int igt_open_render(struct igt_device_card *card);
 /* Add or use filters to match multiGPU devices */
 int igt_device_prepare_filtered_view(const char *vendor);
 
+void igt_device_set_filter_from_fd(int fd);
+
 #endif /* __IGT_DEVICE_SCAN_H__ */
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7c9dae1bf..33de65369 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -550,21 +550,6 @@ static void post_healthcheck(struct hotunplug *priv)
 	cleanup(priv);
 }
 
-static void set_filter_from_device(int fd)
-{
-	const char *filter_type = "sys:";
-	char filter[strlen(filter_type) + PATH_MAX + 1];
-	char *dst = stpcpy(filter, filter_type);
-	char path[PATH_MAX + 1];
-
-	igt_assert(igt_sysfs_path(fd, path, PATH_MAX));
-	igt_ignore_warn(strncat(path, "/device", PATH_MAX - strlen(path)));
-	igt_assert(realpath(path, dst));
-
-	igt_device_filter_free_all();
-	igt_assert_eq(igt_device_filter_add(filter), 1);
-}
-
 /* Subtests */
 
 static void unbind_rebind(struct hotunplug *priv)
@@ -713,7 +698,7 @@ int igt_main()
 		}
 
 		/* Make sure subtests always reopen the same device */
-		set_filter_from_device(fd_drm);
+		igt_device_set_filter_from_fd(fd_drm);
 
 		igt_assert_eq(close_device(fd_drm, "", "selected "), -1);
 
-- 
2.43.0

