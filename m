Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500FEC83F17
	for <igt-dev@archiver.kernel.org>; Thu, 31 Jul 2025 12:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A1210E038;
	Thu, 31 Jul 2025 12:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSo+mVtX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C933210E038
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jul 2025 12:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753964124; x=1785500124;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sT+lpKTzu49xGscpEmk48y37r73SsifAPH8JXJB9ycA=;
 b=GSo+mVtXzNQIDFeh2h7C7Kra3mJ+aQEAkvJL2KUzCR+qTAm9xhBozPMK
 YfCBBNUu9XjonlLLRwZ8SnzgaFOstnhc7dsO30nPfWRvKPgb90V1cBLr+
 dYslgbR4Le1Rpz2le/OSprWst3/a+Hm/WKZ5Yr3WnyiD12skawGbfJNpL
 UkH1qWkuiJjCA/VNSwJSsOok7qNYvYs2+yvE6VYQoAWnmM9zU2jfA3T+P
 JUqrqcGfquMkj0O4xlZbqL53bUlX4+Z4PMu6iYyIf+pdthG64aDvorH5O
 SGyjRHIWIMeDtHLsfsLOVgBD2cfIFo2/7hisE0G1MNJeCTcDmpz/dhR38 A==;
X-CSE-ConnectionGUID: ZRH5CR72SHm+PuAArqs6sQ==
X-CSE-MsgGUID: zkuHwVA5QXqoQVAMIKAidw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="67649238"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="67649238"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 05:15:24 -0700
X-CSE-ConnectionGUID: 40YhQW/3TEum2RIPDJTPBw==
X-CSE-MsgGUID: fXrtzHGjRliYhJ9SJLHYfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; d="scan'208";a="162521227"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 05:15:22 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org,
	anshuman.gupta@intel.com
Cc: soham.purkait@intel.com, riana.tauro@intel.com, lucas.demarchi@intel.com,
 jakub1.kolakowski@intel.com
Subject: [PATCH i-g-t v4] tests/intel/xe_pmu: Skip tests if the
 engine-active-ticks event is not present
Date: Thu, 31 Jul 2025 17:38:15 +0530
Message-Id: <20250731120815.3237941-1-soham.purkait@intel.com>
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
v3:
 - Add generic function has_event. (Riana)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
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

