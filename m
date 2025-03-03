Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62EAC28B22
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 23:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FF010E4F6;
	Mon,  3 Mar 2025 23:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lP8OBFNi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5218D10E4F4
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 23:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741043710; x=1772579710;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LlWConDOtZHbW1yxQBgeTxaucc/20Hjkb0Ojx8y+N8Q=;
 b=lP8OBFNitLpcsHs9XjEA6HIWDI0JHVuZ+BpzWJzwBz+LytH9P1uaACL/
 9+7SEfnzc3+Pg9OolSGf/iQvvgI66IJ5XaKL9b9cWuoumZCcn65JuscmL
 aARxFB3wxZhT+UYjq8m+3lbsB8hJvv9lfrbWzWRQMgSLFGZmXmxvKS7He
 NAgxiBUs+yEXFyKiThxJZZLLb6rcRhmItla+EgKUJKHcKFYj1tyVciRf5
 jJke5byZJyh8qqSFPIRwn0QHdplrUrOiRlImMsvXiZukmeVWy1bD0WrYI
 tZs++RdjvCjLryW300sXqYjp/Qvfcf6r5Iu8trMVIXq2eLG+dCQDRg/xq w==;
X-CSE-ConnectionGUID: ERwwJzRAQkS5h33hwrBU+w==
X-CSE-MsgGUID: tI3VNMRsTVWEEDkuJfR0YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41793054"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41793054"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:09 -0800
X-CSE-ConnectionGUID: FNeHnfhGRui0btcA2PWr7g==
X-CSE-MsgGUID: UM1m/xw2TdaZxYuMp3WZ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118716729"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:09 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 14/14] tests/intel/xe_oa: Set boundaries for OA
 exponent test
Date: Mon,  3 Mar 2025 15:15:02 -0800
Message-Id: <20250303231502.135720-15-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
References: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
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

Define min and max oa exponents for the oa exponent test so that they
can be set differently on slow platforms.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index bf6764345..0afa2bdc9 100644
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

