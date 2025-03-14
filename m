Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33982C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 00:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF37E10E23A;
	Fri, 14 Mar 2025 00:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="afjAdfxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4A610E957
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 00:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741911667; x=1773447667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rG2/tMGt3NhoHT85/isflGGrakZjnLTVhKxccHIOIaQ=;
 b=afjAdfxsLCoG6CuwXGSRaXtSjFu6PBc4LcRSEJwHcilFBNOpvDj1x6j6
 zA6GqMnkEoSmlA8E3w5uAPW9/TC7PSC9RZy+VCtlZo+KLb4fmAyKMDc5J
 OykvKgA85tT5tRAcJ0U1wfDVfDf0+EsToTSQldm+d82AH7ggFZemvDytZ
 uRtHJKtXdQODFKb9XQt9vKAqDp93/5DYtQicF+8sqMYJGOIb5V7QVZo09
 R0lye5KVw95Vkv50TYemsiPIk9BnheNoVz2QIwxIHJ3KKJrfhrqYlW/de
 gu5168vr0zB7v+G12dL3QruMTnpXBAH0nQbXgwRFmq63Vhq1NSi18gxgM Q==;
X-CSE-ConnectionGUID: 6RpVMHvpR0i8+qiS6WqS6Q==
X-CSE-MsgGUID: naAMwg9lTE2cahDpNoGWug==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="46703106"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="46703106"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 17:21:06 -0700
X-CSE-ConnectionGUID: 1g0FEA27QuG1IjRgAGmR7w==
X-CSE-MsgGUID: jYhIqmB0QOe80KQWEgb3fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126149585"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 17:21:06 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/xe_oa: Fix __for_one_render_engine
Date: Thu, 13 Mar 2025 17:20:56 -0700
Message-ID: <20250314002058.220854-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314002058.220854-1-ashutosh.dixit@intel.com>
References: <20250314002058.220854-1-ashutosh.dixit@intel.com>
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

On platforms without render engines, __for_one_render_engine is an infinite
loop. Fix and simplify the macro to reduce chance of such errors in the
future.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9bc62c5b9d..245481f8a3 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -430,6 +430,18 @@ static u64 oa_format_fields(u64 name)
 }
 #define __ff oa_format_fields
 
+static struct drm_xe_engine_class_instance *hwe_of_class(int fd, int class)
+{
+	struct drm_xe_engine_class_instance *hwe;
+
+	for (int m = 0; m < xe_number_engines(fd); m++) {
+		hwe = &xe_engine(drm_fd, m)->instance;
+		if (hwe->engine_class == class)
+			return hwe;
+	}
+	return NULL;
+}
+
 static struct drm_xe_engine_class_instance *oa_unit_engine(int fd, int n)
 {
 	struct drm_xe_query_oa_units *qoa = xe_oa_units(fd);
@@ -4645,13 +4657,10 @@ static const char *xe_engine_class_name(uint32_t engine_class)
 		igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class), \
 			      hwe->engine_instance, str)
 
-#define __for_one_render_engine(hwe)	      \
-	for (int m = 0, done = 0; !done; m++) \
-		for_each_if(m < xe_number_engines(drm_fd) && \
-			    (hwe = &xe_engine(drm_fd, m)->instance) && \
-			    hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER && \
-			    (done = 1)) \
-			igt_dynamic_f("rcs-%d", hwe->engine_instance)
+#define __for_one_render_engine(hwe) \
+	hwe = hwe_of_class(drm_fd, DRM_XE_ENGINE_CLASS_RENDER); \
+	igt_require_f(hwe, "no render engine\n"); \
+	igt_dynamic_f("rcs-%d", hwe->engine_instance)
 
 igt_main
 {
@@ -4895,10 +4904,10 @@ igt_main
 		}
 
 		for (const struct sync_section *s = sync_sections; s->name; s++) {
-			igt_subtest_with_dynamic_f("syncs-%s", s->name)
+			igt_subtest_with_dynamic_f("syncs-%s", s->name) {
 				__for_one_render_engine(hwe)
 					test_syncs(hwe, s->sync_type, s->flags);
-
+			}
 		}
 	}
 
-- 
2.48.1

