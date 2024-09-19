Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09954CF3959
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 15:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB6510E040;
	Thu, 19 Sep 2024 15:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jp6iRUCN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B03A10E040
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 15:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726758700; x=1758294700;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P91sNUQSwZAd7lWf7WrFCRGQ/tuqaFdYOTuCr8+4HEk=;
 b=jp6iRUCNl6cmZiGxiAJ0Ji94M2oZkq6w6qlc6qdCvikcx6CAa8zsoxKK
 0bWwRDgJESX9NqtzZc3w1PGwqabic6F9BonOaJE4AQxe5DoMdM7PgwCWT
 CZlcrReo8YjrnJM9PtHpRcpPp2yftjzgPVpJrr1aSeWJV39egje6wquEq
 i39AFemV4P998nUNlCluyNzCl327ndj5t80Ui9kMTLJnDeufMf2Wiy2Jo
 mpFZJngR8jy9f3Y29xuMcTVt5vzdhjsQH7y25O+d1zbY5lH6f3MoXg1i7
 nFcwb4PRd5uehUH/MMUVWv5kFQMXQVmIgUG+9Yuybe9kN0YjFop6JoBmZ w==;
X-CSE-ConnectionGUID: mUCBhB+gR+Gq4kknWXIW0g==
X-CSE-MsgGUID: H1lnl1owSVGfSZafg1iQfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25872266"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="25872266"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 08:11:40 -0700
X-CSE-ConnectionGUID: PyNa6KTKRau8qM2jEf3U2Q==
X-CSE-MsgGUID: bkNwIrvgTleDU4thJ4/pGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="74750682"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 08:11:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t v2] lib/igt_kmod: Rewrite xe unload logic
Date: Thu, 19 Sep 2024 08:11:30 -0700
Message-ID: <20240919151130.1410357-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
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

Stop trying to unload possibly-dependent modules. Loading a module and
probing a module are 2 different things, although the Linux kernel will
by default probe devices when a module is loaded (for pci, configurable
in /sys/bus/pci/drivers_autoprobe).

For the unloading part we can simplify: instead of trying to unload
the modules directly (which may complain that module is already in use)
we just unplug the HW first.  For each possible device bound.

This will become part of libkmod in future, but we don't need to wait:
we can implement it in igt too as it's straightforward.

For now this only switches the unload path for xe, but if it works well,
we can switch others in future too.

v2:
- Rename function since now it works for any PCI driver
- Move function so it will be available for i915 too.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2362
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kmod.h |  5 +----
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 464c0dcf4..75a0d057c 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -660,6 +660,51 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 	return 0;
 }
 
+/*
+ * Unbind driver from devices. Currently supports only PCI bus
+ */
+static int unbind(const char *driver)
+{
+	char path[PATH_MAX];
+	struct dirent *de;
+	int dirlen;
+	DIR *dir;
+
+	dirlen = snprintf(path, sizeof(path), "/sys/module/%s/drivers/pci:%s/",
+			  driver, driver);
+	igt_assert(dirlen < sizeof(path));
+
+	dir = opendir(path);
+
+	/* Module may be loaded, but without any device bound */
+	if (!dir)
+		return 0;
+
+	while ((de = readdir(dir))) {
+		int devfd;
+		bool ret;
+
+		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
+			continue;
+
+		devfd = openat(dirfd(dir), de->d_name, O_RDONLY | O_CLOEXEC);
+		igt_assert(devfd >= 0);
+
+		ret = igt_sysfs_set(devfd, "power/control", "auto");
+		igt_assert(ret);
+
+		ret = igt_sysfs_set(devfd, "driver/unbind", de->d_name);
+		igt_assert(ret);
+
+		close(devfd);
+		errno = 0;
+	}
+
+	igt_assert_eq(errno, 0);
+
+	return 0;
+}
+
 /**
  * igt_intel_driver_unload:
  *
@@ -697,6 +742,17 @@ igt_intel_driver_unload(const char *driver)
 	return 0;
 }
 
+int igt_xe_driver_unload(void)
+{
+	unbind("xe");
+
+	igt_kmod_unload("xe");
+	if (igt_kmod_is_loaded("xe"))
+		return IGT_EXIT_FAILURE;
+
+	return IGT_EXIT_SUCCESS;
+}
+
 /**
  * igt_amdgpu_driver_load:
  * @opts: options to pass to amdgpu driver
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index efb46da12..ee1719a8f 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -63,10 +63,7 @@ static inline int igt_xe_driver_load(const char *opts)
 }
 
 
-static inline int igt_xe_driver_unload(void)
-{
-	return igt_intel_driver_unload("xe");
-}
+int igt_xe_driver_unload(void);
 
 int igt_amdgpu_driver_load(const char *opts);
 int igt_amdgpu_driver_unload(void);
-- 
2.46.1

