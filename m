Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB23C021B3
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEA410E768;
	Tue, 18 Feb 2025 20:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9kpc2zd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0099310E765
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910497; x=1771446497;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=o5j3LM3dtF82oyK1ywp1IBHnqtHZv1sBbkX39R2L4Bk=;
 b=a9kpc2zdiKy126JahsZCDzhDI3zk8pLdpIQPuTdQbWkXpH8sw/Cbav6s
 kFjJgZairu96gcysckN0XNTlqlQj6DVEFbxIYG9YRT19tD3hDu017tL+0
 giHCS4kXOAP5bVy8P37RMyC8ihBac+lxUsHjwYB8UWC0yP8Kv9mNvYlKa
 1VW6cRB1+KK9NJwyGsQrKaP5Y2rms76cdqoagD5Rra9Cfv3ybCW+f76kA
 zhiMKHp+2lbYBmDp6K+esfRvUqQcumkOrL+ozGkOpc5QsUvu34Ch/p+WT
 Qgk8Gx2+ZKU2i1CqTlnXx2x3WyziNxZBNURRbd02rPCQC1EAUuZ8RnFFb w==;
X-CSE-ConnectionGUID: M/s/eBCmRhyGh748hLzzdg==
X-CSE-MsgGUID: zzHzIKPZQIq85TgWZ+8/Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44545845"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44545845"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:15 -0800
X-CSE-ConnectionGUID: nPmGYAJNT6+s8U2dwZY8Xw==
X-CSE-MsgGUID: 6R3gsCAEQcm0eZ76H7cxHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114367471"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:28:16 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t CI run 13/14] tests/intel/xe_oa: Set boundaries for OA
 exponent test
Date: Tue, 18 Feb 2025 12:28:11 -0800
Message-Id: <20250218202812.1679653-14-umesh.nerlige.ramappa@intel.com>
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

