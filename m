Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2808BEEC2B9
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 00:42:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BB610E46A;
	Tue, 24 Feb 2026 00:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/rcuI13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D10810E468
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 00:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771893720; x=1803429720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zmj9o3JWnxI46jwoYQoWO0I0WdYlUq/sN/58qYUa9Vk=;
 b=E/rcuI1352FDV/Hf8AGXc+6CCHlm3z/thP6oN/2tcNNZ9MEMpZG0XYwf
 Iqt89IDQ81oPz6d66o9m2zTIm9Qp6ge40b89ZBge3gxLVIoD+kj3/dj/h
 W3uSntb37LrhogbZrlB/DA01WVVZSGDVZ5G43tiZNZ1gh4f2hFfMqbY7g
 VrP+33lzMXpKA3Ks5cRLjTGdA6b9oLMqlSc9i8hhPsRncHflNP5VWC6Qg
 Gh6J1zz+EjROnO1AmXbtjN+lY1SeVxY0zsLtMNoIeUnnItXPx0AhBpaFK
 aM4DAsx5aJGrpKLbUSdJamXQI2E3AQz1ZI8XGNKVvcKYPKSrnmLrIuh0j g==;
X-CSE-ConnectionGUID: HcBwGcszQzqSVe1/MUVKJA==
X-CSE-MsgGUID: wKlW2jDYTZGAm1XaJXOyzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83224689"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="83224689"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 16:41:59 -0800
X-CSE-ConnectionGUID: xZJNVCxQSs6kebvgV/4Fqg==
X-CSE-MsgGUID: vmRyHxHuSe2HVlm9SJIgYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="246322609"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 16:41:59 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jose.souza@intel.com,
	sushma.venkatesh.reddy@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_oa: more CRI changes
Date: Mon, 23 Feb 2026 16:41:51 -0800
Message-ID: <20260224004151.1836090-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260224004151.1836090-1-ashutosh.dixit@intel.com>
References: <20260224004151.1836090-1-ashutosh.dixit@intel.com>
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

Changes to consume the CRI metric set xml and for the mertoa unit.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/xe/xe_oa.c      | 3 +++
 tests/intel/xe_oa.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 229deafa71..b2f447c944 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -40,6 +40,7 @@
 #include "xe_oa_metrics_lnl.h"
 #include "xe_oa_metrics_bmg.h"
 #include "xe_oa_metrics_ptl.h"
+#include "xe_oa_metrics_cri.h"
 
 static struct intel_xe_perf_logical_counter_group *
 intel_xe_perf_logical_counter_group_new(struct intel_xe_perf *perf,
@@ -303,6 +304,8 @@ intel_xe_perf_for_devinfo(uint32_t device_id,
 		intel_xe_perf_load_metrics_bmg(perf);
 	} else if (devinfo->is_pantherlake) {
 		intel_xe_perf_load_metrics_ptl(perf);
+	} else if (devinfo->is_crescentisland) {
+		intel_xe_perf_load_metrics_cri(perf);
 	} else if (intel_graphics_ver(device_id) >= IP_VER(20, 0)) {
 		intel_xe_perf_load_metrics_lnl(perf);
 	} else {
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 927f3f4f20..2c739f6363 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -359,6 +359,7 @@ static const char *oa_unit_name[] = {
 	[DRM_XE_OA_UNIT_TYPE_OAG] = "oag",
 	[DRM_XE_OA_UNIT_TYPE_OAM] = "oam",
 	[DRM_XE_OA_UNIT_TYPE_OAM_SAG] = "sag",
+	[DRM_XE_OA_UNIT_TYPE_MERT] = "mert",
 };
 
 /* Wrapper to deconstify @inst for xe_exec_queue_create */
@@ -381,6 +382,8 @@ static struct intel_xe_perf_metric_set *oa_unit_metric_set(const struct drm_xe_o
 		 (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM ||
 		  oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM_SAG))
 		test_set_name = "MediaSet1";
+	else if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_MERT)
+		test_set_name = "MertExtSet";
 	else
 		igt_assert_f(!"reached", "Unknown oa_unit_type %d\n", oau->oa_unit_type);
 
-- 
2.48.1

