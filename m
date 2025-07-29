Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD290C87FC9
	for <igt-dev@archiver.kernel.org>; Tue, 29 Jul 2025 10:20:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721EC10E609;
	Tue, 29 Jul 2025 10:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MztrqIvm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA54110E60B
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jul 2025 10:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753784446; x=1785320446;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NrRs2nqeMznuenSY1yppB3fB2B/hlASYvMsPGTSRs60=;
 b=MztrqIvmnbR0iZOBmipoiRjpkuMACCNuEfAV/OadKfxScnMbSOEpyNi/
 k51s9BnOK+TdkUEHYLwuN3T+7c1uYiyfv8nG+RwJywFi1tkmxbakwLG2+
 Xa9INmuUzx9Gsf2KRLlsdTsHrD3At9PZsC/t+GtnhIgCTW96o9oMG8QR5
 e1njXi2tac3utnqF5VDPe8zlTlDgV7DLsBU+VfP8lwVZmJbfntjfaZIOK
 unFG1YsV1JEkVDXZ+SyH4UoxAukrz6cFh2e6x/2gR+6Xkvc7sg/T9hY/E
 srzUNjh+RqM3h9mb2Io9gGm7gA4NKgKqm/VbGaGfZSG8kxbnSZXtB9bHI w==;
X-CSE-ConnectionGUID: 4xk3EmQ9S8yk/pcmlKJ/RQ==
X-CSE-MsgGUID: smKe+Z7oReqdeMe0yB0HfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="81487392"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="81487392"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 03:20:45 -0700
X-CSE-ConnectionGUID: NfRSTD8sSli8lUDWjZvskQ==
X-CSE-MsgGUID: 4FAyzZTISLKV+hO8Z9X+Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="167969321"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 03:20:43 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org,
	riana.tauro@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v1] tests/intel/xe_pmu: Skip tests involving engine
 activity on vm
Date: Tue, 29 Jul 2025 15:43:49 +0530
Message-Id: <20250729101349.3208545-1-soham.purkait@intel.com>
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

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pmu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 0e5a7360f..b0bd235e6 100644
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
 
+static bool _has_engine_active_ticks(const char *device)
+{
+	char buf[512];
+
+	snprintf(buf, sizeof(buf),
+		 "/sys/bus/event_source/devices/%s/events/%s",
+		 device,
+		 "engine-active-ticks");
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
+		has_engine_active_ticks = _has_engine_active_ticks(xe_device);
 	}
 
 	igt_describe("Validate PMU gt-c6 residency counters when idle");
-- 
2.34.1

