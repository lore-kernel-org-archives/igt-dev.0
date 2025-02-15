Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C8BC021A7
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 01:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6048310ED50;
	Sat, 15 Feb 2025 01:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTlHl3QG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E555210E4B3
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2025 01:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739581590; x=1771117590;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=o5j3LM3dtF82oyK1ywp1IBHnqtHZv1sBbkX39R2L4Bk=;
 b=WTlHl3QGyCMJL0GGV3pIOil1jVGxAG3yI0r78xzcdRpC5MYvYmjilgZ2
 /GShQF651FNKBDyqbGlqGd10Hb1Pphs/of1y5g3s4v+Y7GsDrStrrqM8U
 YKKeY3tUSv9nlMl66uoYrwmwVRedcg/h9F7W4LhK/lBXrtKvY/oGUyjz/
 bA7pBWI5AMSYMZmbj5RcyVMqAZwyrtXMWXRXozcPjVbwfvtnIaQ2w7b+w
 6DdQQsRvA/XJFtUR9wRFikhqukCgyikmWmJWgi2g8BpLY3I/1UqIc7z3n
 2ZkXmqIbsSVA9ajAYig4LRO1myLV7gvjk4lg8cp7RQ27SDXaxvy8n15/3 g==;
X-CSE-ConnectionGUID: KW44vFyfSGWae0hF0jsVfg==
X-CSE-MsgGUID: WIIbBYlpSaanNZsq0794Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50555121"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="50555121"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:30 -0800
X-CSE-ConnectionGUID: gy/BDmpqT7+pHuUifCv6kQ==
X-CSE-MsgGUID: OrM3V3jnQgSmxwvAjojvLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="118711272"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 13/13] tests/intel/xe_oa: Set boundaries for OA exponent test
Date: Fri, 14 Feb 2025 17:06:28 -0800
Message-Id: <20250215010628.1639986-14-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
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

Define min and max oa exponents for the oa exponent test

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index d44832a8a..22ff3f20d 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -321,6 +321,8 @@ static size_t default_oa_buffer_size;
 static struct intel_mmio_data mmio_data;
 static igt_render_copyfunc_t render_copy;
 static uint32_t rc_width, rc_height;
+static uint32_t max_oa_exponent;
+static uint32_t min_oa_exponent;
 static uint32_t buffer_fill_size;
 static uint32_t num_buf_sizes;
 
@@ -1109,6 +1111,8 @@ init_sys_info(void)
 
 	intel_xe_perf_load_perf_configs(intel_xe_perf, drm_fd);
 
+	min_oa_exponent = 5;
+	max_oa_exponent = 20;
 	rc_width = 1920;
 	rc_height = 1080;
 	buffer_fill_size = SZ_16M;
@@ -1710,7 +1714,7 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
 	 * test can fail due to buffer overflows if it wasn't possible to
 	 * keep up, so we don't start from an exponent of zero...
 	 */
-	for (int exponent = 5; exponent < 20; exponent++) {
+	for (int exponent = min_oa_exponent; exponent < max_oa_exponent; exponent++) {
 		uint64_t properties[] = {
 			DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
 
-- 
2.34.1

