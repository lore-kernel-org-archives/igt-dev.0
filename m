Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6844CC87FCC
	for <igt-dev@archiver.kernel.org>; Thu, 31 Jul 2025 12:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEE310E3A7;
	Thu, 31 Jul 2025 12:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lqEb23DE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C0D10E3A7
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jul 2025 12:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753963352; x=1785499352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1bhM8+bwAmHwASRSr6WKN6OIF8bbfEydDdUsHamc+zs=;
 b=lqEb23DETVRXe8FwvzATCSDcCZPK5gTenUXNnXIktifiBIIbmOP7/iWe
 EABUsKuWV0Hf+VIuvRhDKdl+ZrOWhe6FqM9WY1PQ77FrWmzFt/j+2cVH7
 90eiS+XRVQdB9NEKCrhQQ0JiCBhNfrIxKQ2fB0KdVaZEAlnO9Uz86sHNT
 xD+yOwf+Areg6q1M9Pb9L0y3P8EYEjKEinIwSLiYcwpzFlwsyOCiUs1EL
 UsOncMc+kj4TW1PexPzU2gm3QT8zqqAjm/0xD0kW8klklkkMfKiZHKEII
 W57hQDjAglbt5Go8MiZ/ccpAbUSWecsnsMxp8yiSshApP8s2r416yUwiR w==;
X-CSE-ConnectionGUID: K8nwNY5eRX2BGGZ+yjacZA==
X-CSE-MsgGUID: 7wDfpO8tQ7iUeowHq1xbHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56150145"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="56150145"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 05:02:32 -0700
X-CSE-ConnectionGUID: FVJpuJATSy2D0IAxd/c7fA==
X-CSE-MsgGUID: Ic8cc/dvS8CMB85PFV1wbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="167494090"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 05:02:30 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: soham.purkait@intel.com, riana.tauro@intel.com, lucas.demarchi@intel.com,
 jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v3] tests/intel/xe_pmu: Skip tests if the
 engine-active-ticks event is not present
Date: Thu, 31 Jul 2025 17:25:30 +0530
Message-Id: <20250731115530.3237139-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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

Skip the tests and subtests involving the engine activity if the
engine-active-ticks event is not present for the respective
device.

v1:
 - Add a variable has_engine_active_ticks to check for the
   existence of engine-active-ticks event. (Riana)
v2:
 - Refactor commit title. (Jakub)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel/xe_pmu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 0e5a7360f..a98fba5a4 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -106,6 +106,7 @@ const double tolerance = 0.1;
 static char xe_device[NAME_MAX];
 static bool autoprobe;
 static int total_exec_quantum;
+static bool has_engine_active_ticks;
 
 #define test_each_engine(test, fd, hwe) \
 	igt_subtest_with_dynamic(test) \
@@ -113,6 +114,17 @@ static int total_exec_quantum;
 			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
 				      hwe->engine_instance)
 
+static bool has_event(const char *device, const char *event)
+{
+	char buf[512];
+
+	snprintf(buf, sizeof(buf),
+		 "/sys/bus/event_source/devices/%s/events/%s",
+		 device,
+		 event);
+	return (!!access(buf, F_OK));
+}
+
 static int open_pmu(int xe, uint64_t config)
 {
 	int fd;
@@ -191,6 +203,8 @@ static uint64_t get_event_config(unsigned int gt, struct drm_xe_engine_class_ins
 	uint64_t pmu_config = 0;
 	int ret;
 
+	igt_skip_on(has_engine_active_ticks);
+
 	ret = perf_event_config(xe_device, event, &pmu_config);
 	igt_assert(ret >= 0);
 	pmu_config |= add_format_config("gt", gt);
@@ -907,6 +921,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 		xe_perf_device(fd, xe_device, sizeof(xe_device));
 		num_engines = xe_number_engines(fd);
+		has_engine_active_ticks = has_event(xe_device, "engine-active-ticks");
 	}
 
 	igt_describe("Validate PMU gt-c6 residency counters when idle");
-- 
2.34.1

