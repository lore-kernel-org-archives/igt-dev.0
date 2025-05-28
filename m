Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F38C5B543
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 22:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D43E10E6E1;
	Wed, 28 May 2025 22:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqZqoIGY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F7410E0C6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 22:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748469910; x=1780005910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ZIqkxszLa6Q9P/C7GYlXrcwcKr6tS7AVGMoq+Rnv6g=;
 b=nqZqoIGYdgld+lg/1/Y0QmsbDeXaWsCVFcLjKK0x6SSd8Vu7QSjNh9j0
 ARGL82AzKwokNGc1QVbJSRBY9zy+++qh2skU6pqj052GbgPDDv1DBt1o0
 tLLouYilC6e+gxg9nhibKrtsUHjR2m6fv8RHL3qJCS/8AfK158HeFhUK6
 fqfxKB2V5NavIuW5Is5/w6bmgh1LFUVKCluBCWE5MartK8tUgrSGAfWKR
 HiQFm96Os0P5CIkYq3u9te69s8bp9Sue1L4TPCi/cH2nuBTjBQck+wLrg
 Ui/3Udsx+we8ionyAatW+NamgjZIg+VNqIgGw3nuwZIEnBtDCf1T6PDJB g==;
X-CSE-ConnectionGUID: rcSMkaopTciZL4FNvAG3Ow==
X-CSE-MsgGUID: nJc5pvTaQEC0s5H5NJHhQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50670363"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="50670363"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 15:05:10 -0700
X-CSE-ConnectionGUID: 2CgqpVtvTi22knmF/7Eg/A==
X-CSE-MsgGUID: 8IHc1kltRCaic2yNCIrHmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="147251901"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 15:05:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_configfs: Test engines_allowed
Date: Wed, 28 May 2025 15:04:35 -0700
Message-ID: <20250528-engines-allowed-v1-2-d42708b3317e@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528-engines-allowed-v1-0-d42708b3317e@intel.com>
References: <20250528-engines-allowed-v1-0-d42708b3317e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-d9694
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

Add tests for the parsing of engines_allowed configfs. This doesn't try
to bind the driver and ensure only those engines are available. That's
because the engine uapi instance doesn't necessarily match what is used
for configfs configuration. Maybe we will need an engine map in debugfs
for covering that.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 074cd04d9..c559b4974 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -10,6 +10,7 @@
 #include "igt_fs.h"
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
+#include "xe/xe_query.h"
 
 /**
  * TEST: Check configfs userspace API
@@ -54,6 +55,29 @@ static void test_survivability_mode(int configfs_device_fd)
 	close(fd);
 }
 
+/**
+ * SUBTEST: engines-allowed-invalid
+ * Description: Validate engines_allowed attribute for invalid values
+ */
+static void test_engines_allowed_invalid(int configfs_device_fd)
+{
+	static const char *values[] = {
+		"xcs0",
+		"abcsdcs0",
+		"rcs0,abcsdcs0",
+		"rcs9",
+		"rcs10",
+		"rcs0asdf",
+	};
+
+	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
+		const char *v = values[i];
+
+		igt_debug("Writing '%s' to engines_allowed\n", v);
+		igt_assert(!igt_sysfs_set(configfs_device_fd, "engines_allowed", v));
+	}
+}
+
 static int create_device_configfs_group(int configfs_fd, int fd)
 {
 	int configfs_device_fd;
@@ -88,6 +112,18 @@ igt_main
 		test_survivability_mode(configfs_device_fd);
 	}
 
+	igt_describe("Validate engines_allowed with invalid options");
+	igt_subtest("engines-allowed-invalid") {
+		igt_install_exit_handler(restore);
+		test_engines_allowed_invalid(configfs_device_fd);
+	}
+
+	igt_describe("Validate engines_allowed");
+	igt_subtest("engines-allowed") {
+		igt_install_exit_handler(restore);
+		test_engines_allowed(configfs_device_fd);
+	}
+
 	igt_fixture {
 		igt_fs_remove_dir(configfs_fd, bus_addr);
 		close(configfs_device_fd);

-- 
2.49.0

