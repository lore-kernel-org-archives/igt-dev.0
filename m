Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCF9C54FB3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 16:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CE310E568;
	Mon,  2 Jun 2025 16:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4i0sJBu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0628110E566
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 16:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748881511; x=1780417511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HKvcCrlKou8ttpdXXj8+suc04VC1fnhNEn3UyA6aE3s=;
 b=i4i0sJBuVozTIyCAWfiMVQOGyo/P4OPBvSkJn5FvER5GjS26xsIVgaxl
 hFu2OMBCBCatYo1JNunlxDJwdeeClOqNk1qlgnDOlXOFdF1MnUG6XfLH7
 gsC67KKLIb3g/easlmtIV6cqm1c73Z0yxjuO9D+mO/uJPapzKV5uZizkC
 I+p1aeZXmDGKtER8KAFpZhj617ElW3mpgz2bv25SoDTWC9OF97P2GowYJ
 Gazu+6WS/9GOfA/6ywZ+0iQtzhyCyKB9cUunSCdypvWaWozunwi4wIGs4
 +TpppTdMwTQctPTxAutfng8fWl5TDu8IQldI4h234QsxcHmaJqw7EVkHv Q==;
X-CSE-ConnectionGUID: 1QExoTg7TJut00NIk9lM7g==
X-CSE-MsgGUID: XhieAI3mRZGjdWJWMD9A9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="51042171"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="51042171"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 09:25:11 -0700
X-CSE-ConnectionGUID: 0SBstnEATFiPfwi9DvI41w==
X-CSE-MsgGUID: wT84tK9LQJKeXgyVECfStw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="145527380"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 09:25:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_configfs: Test engines_allowed
Date: Mon,  2 Jun 2025 09:24:45 -0700
Message-ID: <20250602-engines-allowed-v2-2-52bffe717766@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602-engines-allowed-v2-0-52bffe717766@intel.com>
References: <20250602-engines-allowed-v2-0-52bffe717766@intel.com>
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
 tests/intel/xe_configfs.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 074cd04d9..e4fffd0b9 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -10,6 +10,7 @@
 #include "igt_fs.h"
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
+#include "xe/xe_query.h"
 
 /**
  * TEST: Check configfs userspace API
@@ -54,6 +55,49 @@ static void test_survivability_mode(int configfs_device_fd)
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
+/**
+ * SUBTEST: engines-allowed
+ * Description: Validate engines_allowed attribute
+ */
+static void test_engines_allowed(int configfs_device_fd)
+{
+	static const char *values[] = {
+		"rcs0", "rcs*", "rcs0,bcs0", "bcs0,rcs0",
+		"bcs0\nrcs0", "bcs0\nrcs0\n",
+		"rcs000",
+	};
+
+	for (size_t i = 0; i < ARRAY_SIZE(values); i++) {
+		const char *v = values[i];
+
+		igt_debug("Writing '%s' to engines_allowed\n", v);
+		igt_assert(igt_sysfs_set(configfs_device_fd, "engines_allowed", v));
+	}
+}
+
 static int create_device_configfs_group(int configfs_fd, int fd)
 {
 	int configfs_device_fd;
@@ -88,6 +132,18 @@ igt_main
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

