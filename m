Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F300606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 00:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V+YAs6M7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAAD10F8EE;
	Wed,  4 Nov 2026 00:58:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134D510E4C7
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 00:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793753714; x=1825289714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IAe3AjWfhxRRN36BaCRBe/cUciekvhqNeCklCs+8gwE=;
 b=V+YAs6M7PkAVKh6HWru/kTxqbk3OtA9LRcdBe58ubLaMy8WTa+MkhX1+
 l8zaRr4kn0SVPFPjnj866qR5lP8vAG8LtTtMD5WPnGjKXoBrWGc248Sq0
 udaVPnPn/4/j+k1GEWVmNK115Yc5VAtIYz2wvX4ryQy89frDiXefjzuOw
 ek9S7ylTmf2SAYo+z4JD8MBHA68FnmHHFAM3UEorfE6hZk2ykdBiI9q5v
 ZpRljq7TK/EFi3Dhb0ECejXmRrCK422Eq1GZYa19Y6AZbbnL1hVvZaBHM
 GPZRKxiYlvUCCk4zHrdX9rbIQJuwpBaRH2PRUh+/m5aN2PSSgAyT31gpG g==;
X-CSE-ConnectionGUID: JKukRSSQTIKZixaFc+2P+g==
X-CSE-MsgGUID: LiNZXD/WQZKAwq6bo4DcJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2506015"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2506015"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:09 -0800
X-CSE-ConnectionGUID: oCzU5Od0RW6Gz90k7ZMxEw==
X-CSE-MsgGUID: B6FgCHJDQRi58UCFmcTc0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6421537"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:55:08 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com
Subject: [PATCH v2 1/8] tests/intel/xe_oa: Move device setup and teardown into
 helpers
Date: Tue,  3 Nov 2026 16:55:07 -0800
Message-ID: <20261104005505.3232485-11-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
References: <20261104005505.3232485-10-umesh.nerlige.ramappa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move the device dependent setup from the main fixture into
oa_device_init() and the teardown from the final fixture into
oa_device_fini(), so that the same state can be rebuilt by tests that
unbind and rebind the device.

oa_device_fini() also closes the sysfs fd, drops the xe device cache
entry and resets the state, so oa_device_init() can be called again.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
v2: Drop redundant drm_fd check from main fixture (Shekhar)
---
 tests/intel/xe_oa.c | 86 +++++++++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 31 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 91d0ad9c4023..8758ab15bf46 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1332,6 +1332,59 @@ init_sys_info(void)
 	return true;
 }
 
+/*
+ * Open the xe device and set up all device dependent state. Also used to restore that
+ * state after the device has been unbound and rebound.
+ */
+static void oa_device_init(void)
+{
+	struct xe_device *xe_dev;
+
+	igt_assert_eq(drm_fd, -1);
+
+	drm_fd = drm_open_driver(DRIVER_XE);
+	xe_dev = xe_device_get(drm_fd);
+
+	/* See xe_query_oa_units_new() */
+	igt_require(xe_dev->oa_units);
+	igt_require(xe_dev->oa_units->num_oa_units);
+
+	devid = intel_get_drm_devid(drm_fd);
+	sysfs = igt_sysfs_open(drm_fd);
+
+	/* Currently only run on Xe2+ */
+	igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));
+
+	igt_require(init_sys_info());
+
+	write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
+
+	render_copy = igt_get_render_copyfunc(drm_fd);
+}
+
+/* Release all device dependent state set up by oa_device_init() */
+static void oa_device_fini(void)
+{
+	/* leave sysctl options in their default state... */
+	write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
+
+	if (intel_xe_perf) {
+		intel_xe_perf_free(intel_xe_perf);
+		intel_xe_perf = NULL;
+	}
+
+	if (sysfs >= 0) {
+		close(sysfs);
+		sysfs = -1;
+	}
+
+	if (drm_fd >= 0) {
+		xe_device_put(drm_fd);
+		drm_close_driver(drm_fd);
+		drm_fd = -1;
+	}
+}
+
 /**
  * SUBTEST: non-system-wide-paranoid
  * Description: CAP_SYS_ADMIN is required to open system wide metrics, unless
@@ -4970,7 +5023,6 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 		{ NULL },
 	};
 	const struct drm_xe_oa_unit *oau0, *oau;
-	struct xe_device *xe_dev;
 
 	igt_fixture() {
 		struct stat sb;
@@ -4989,31 +5041,9 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 		test_sysctl_defaults();
 
 	igt_fixture() {
-		/* We expect that the ref count test before these fixtures
-		 * should have closed drm_fd...
-		 */
-		igt_assert_eq(drm_fd, -1);
-
 		enable_trace_log();
-		drm_fd = drm_open_driver(DRIVER_XE);
-		xe_dev = xe_device_get(drm_fd);
-
-		/* See xe_query_oa_units_new() */
-		igt_require(xe_dev->oa_units);
-		igt_require(xe_dev->oa_units->num_oa_units);
+		oa_device_init();
 		oau0 = oa_unit_by_id(drm_fd, 0);
-
-		devid = intel_get_drm_devid(drm_fd);
-		sysfs = igt_sysfs_open(drm_fd);
-
-		/* Currently only run on Xe2+ */
-		igt_require(intel_graphics_ver(devid) >= IP_VER(20, 0));
-
-		igt_require(init_sys_info());
-
-		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
-
-		render_copy = igt_get_render_copyfunc(drm_fd);
 	}
 
 	igt_subtest("non-system-wide-paranoid")
@@ -5222,13 +5252,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture() {
-		/* leave sysctl options in their default state... */
-		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
-
-		if (intel_xe_perf)
-			intel_xe_perf_free(intel_xe_perf);
-
-		drm_close_driver(drm_fd);
+		oa_device_fini();
 		disable_trace_log();
 	}
 }
-- 
2.55.0

