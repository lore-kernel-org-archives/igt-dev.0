Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4E9C83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 07:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B186E10E0D8;
	Tue, 15 Jul 2025 07:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSxUH5FN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B4210E0D8
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 07:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752563210; x=1784099210;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=89TZNaigf6EyELOEhiCPaEKZdbIzlV85dH8giCL+5rA=;
 b=kSxUH5FN1F7SaEE2OGB4SAY8QkJq++z8nOW7nG9v3CWi4/Bxcpl9/ieU
 cSzXNhfrUEkN9p9ClVB9bcdf2rOWMJ0tFJbKX5J6cwq0kANmaixcK6XsY
 GUFavCjsszIpWQsQfUgOKGRABxkjZAM8L3oVnr7OaI5L6N0uOtulx508l
 l+C+KFHIAB/YvxiOprDT0i9tkOJON4DU3QCaaa6qjO9Kjioub5X+CUN4y
 ra+yqz1hdUtln8pwsNDaeY77no0e63IkLExd9lXaydHRMgcyQcbfuYaHf
 gHoA6O9KH2PvLiNJGMYSLnfxgXaKGDgC9A8LVQx1VLBoq0xDvbnElsZi0 A==;
X-CSE-ConnectionGUID: VI0IY2u9QeOq5/rmhvtq8g==
X-CSE-MsgGUID: YE2kXcL6TweJ3nN4p7pkrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77307288"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="77307288"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:06:49 -0700
X-CSE-ConnectionGUID: Wb9TECbMSYCYlAjvTFrBHA==
X-CSE-MsgGUID: XbPVh9gRQZCMKfvEy1K3zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157654302"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:06:47 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org,
	riana.tauro@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_pmu: Skip tests involving engine
 activity on vm
Date: Tue, 15 Jul 2025 12:30:17 +0530
Message-Id: <20250715070017.2900547-1-soham.purkait@intel.com>
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

Skip the tests and subtests involving the engine activity on vm
as engine activity events are not present on vm.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pmu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 0e5a7360f..9ac9d38cf 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -113,6 +113,17 @@ static int total_exec_quantum;
 			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
 				      hwe->engine_instance)
 
+static bool igt_is_running_on_vm(const char *device)
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
@@ -191,6 +202,8 @@ static uint64_t get_event_config(unsigned int gt, struct drm_xe_engine_class_ins
 	uint64_t pmu_config = 0;
 	int ret;
 
+	igt_skip_on(igt_is_running_on_vm(xe_device));
+
 	ret = perf_event_config(xe_device, event, &pmu_config);
 	igt_assert(ret >= 0);
 	pmu_config |= add_format_config("gt", gt);
-- 
2.34.1

