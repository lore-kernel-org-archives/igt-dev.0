Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4254BC021B0
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F301110E765;
	Tue, 18 Feb 2025 20:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpzAaGjO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B4710E761
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910496; x=1771446496;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Hu3I6byLOAQ3nXsIl3vhL9YeNHNH0W5gj6xrjjj77I0=;
 b=bpzAaGjOs4e3qPSSHE98oU+LSqt8Xxt+iDXM7QwjH5Fp8i3sCVE+ofCJ
 p15kjX4uSLLKedl3MQg8nEdGmFhMoyRgyQRmVmMhq2tFgkrxo4fQjhXqJ
 0uHJyQfXduF7ceEXyUdC6562wuawYobNSsOBJL0LVM0+QILZ/lyQXyUVx
 0G4/NWWokJNMFeENB6IGFgIDsVkGL+YdX7Ra6phyztMzgDBCge6NaI1py
 mt/f7p9NIQGQH+rXrih50TjqC3dJ09spLbTHAQan8rJYjRkr1+uuBFhq1
 pYlTIQK2DgWFanvBzp6OGfX2KPiiS7/fCkUh3Gl6XZcO+yTIDDNxNoKr5 A==;
X-CSE-ConnectionGUID: R5/XAxj0ScaD7HU/hJwqbw==
X-CSE-MsgGUID: WD7g4dbQS7qoTLqVD6/IFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44545841"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44545841"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
X-CSE-ConnectionGUID: V7DyFWFUSt2UYayVk7Cejw==
X-CSE-MsgGUID: JLVzDPnMRE6lr1gCtrcyyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114367460"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t CI run 09/14] tests/intel/xe_oa: Test oa buffer sizes
Date: Tue, 18 Feb 2025 12:28:07 -0800
Message-Id: <20250218202812.1679653-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
References: <20250218202812.1679653-1-umesh.nerlige.ramappa@intel.com>
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

Introduce oa buffer size test separately. Pick a random valid buffer
size for the test.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 03d223df4..ee87b7338 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -93,6 +93,23 @@ struct accumulator {
 	uint64_t deltas[MAX_RAW_OA_COUNTERS];
 };
 
+struct oa_buf_size {
+	char name[12];
+	uint32_t size;
+} buf_sizes[] = {
+	{ "128K", SZ_128K },
+	{ "256K", SZ_256K },
+	{ "512K", SZ_512K },
+	{ "1M", SZ_1M },
+	{ "2M", SZ_2M },
+	{ "4M", SZ_4M },
+	{ "8M", SZ_8M },
+	{ "16M", SZ_16M },
+	{ "32M", SZ_32M },
+	{ "64M", SZ_64M },
+	{ "128M", SZ_128M },
+};
+
 /* OA unit types */
 enum {
 	OAG,
@@ -305,6 +322,7 @@ static struct intel_mmio_data mmio_data;
 static igt_render_copyfunc_t render_copy;
 static uint32_t rc_width, rc_height;
 static uint32_t buffer_fill_size;
+static uint32_t num_buf_sizes;
 
 static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
 {
@@ -1094,6 +1112,7 @@ init_sys_info(void)
 	rc_width = 1920;
 	rc_height = 1080;
 	buffer_fill_size = SZ_16M;
+	num_buf_sizes = ARRAY_SIZE(buf_sizes);
 	oa_exponent_default = max_oa_exponent_for_period_lte(1000000);
 
 	default_oa_buffer_size = get_default_oa_buffer_size(drm_fd);
@@ -4805,6 +4824,17 @@ igt_main
 		__for_one_hwe_in_oag(hwe)
 			test_buffer_fill(hwe);
 
+	/**
+	 * SUBTEST: buffer-size
+	 * Description: Test various OA buffer sizes
+	 */
+	igt_subtest_with_dynamic("buffer-size") {
+		long k = random() % num_buf_sizes;
+
+		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
+			test_non_zero_reason(hwe, buf_sizes[k].size);
+	}
+
 	igt_subtest_with_dynamic("non-zero-reason")
 		__for_one_hwe_in_oag(hwe)
 			test_non_zero_reason(hwe, 0);
-- 
2.34.1

