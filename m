Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744F3606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 22:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RaGds6qH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294B310E1B0;
	Fri, 30 Oct 2026 22:43:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE76810E5D2
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793400019; x=1824936019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=asN4z4KUTJgwbMsTGsqJG5yYTg7C16gdUw0GltLbjc8=;
 b=RaGds6qHgS/HAC1qHj8OC5ov/wnVTjZJBCttJ7aO5pHAvIlM8PtmCO7R
 K1ZsemB51wNs1ktIWlcrgeC4L2Lr3ndfjzVs8I5F9cIWxazxjeHh+Tjdn
 ozEhX7+kUdSL0AHiwFOA3BlPpxlMGoJHAssXJk81i1wZ0WzkeFY8vAI9D
 g8VQuCMDfwr8w7H39YdoO8zELIRw+dWK+tjwQqqEQaZLI+2Lhn8XvnP0R
 gxatMySQHv/9R3ST8k9NGezu4w/Ko2IJ6p49/tPw0J44Ef8HVC6h4JRvw
 rem8A4cCjSgsv1IV5Jv5Z3wbyDhfxhtOwCLD+kfUyGQhnd9NZXw69MIcY g==;
X-CSE-ConnectionGUID: pIh//JINS+i3SF2RVdbhkQ==
X-CSE-MsgGUID: 5KjcwFFmTle5mme2MiGrHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2165493"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2165493"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:40:14 -0700
X-CSE-ConnectionGUID: 3UhJoOkUTgmaR498Co+NMA==
X-CSE-MsgGUID: DQNN1INVTnWD74bLkALpxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5874295"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 15:40:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com,
	riana.tauro@intel.com
Subject: [PATCH v2 1/3] tests/intel/xe_oa: Move device setup and teardown into
 helpers
Date: Fri, 30 Oct 2026 15:40:13 -0700
Message-ID: <20261030224011.2268663-6-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030224011.2268663-5-umesh.nerlige.ramappa@intel.com>
References: <20261030224011.2268663-5-umesh.nerlige.ramappa@intel.com>
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
---
 tests/intel/xe_oa.c | 81 ++++++++++++++++++++++++++++++---------------
 1 file changed, 55 insertions(+), 26 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 91d0ad9c4023..07571eeb7e55 100644
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
@@ -4995,25 +5047,8 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 		igt_assert_eq(drm_fd, -1);
 
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
@@ -5222,13 +5257,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
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

