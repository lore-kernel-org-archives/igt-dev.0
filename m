Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C82C28B2F
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 22:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637EC10E0A5;
	Fri, 14 Mar 2025 22:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYZZIVYw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2C710E36A
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 22:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741992351; x=1773528351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PCZ6NJmpkDtzl4z1NCG7ZqzmKt5pGllrEa3e/SVJkp0=;
 b=KYZZIVYwNg7aA9Q00IGlGdHsIHjM7ScCjsxNj9T5JJ1ExPfgeffcfDIE
 SGcmK5OjpdVOceZaSGhHVTCAZThp6imZIb11D7sim4eAoEsAy1b0HD7Ba
 ADvNMMhwlQt+OgjjE1AzYj7XkDqfEgpfn6Km0PSM1TStlASwxrIJGWvrX
 V98l/atvCCaWJD+4fSI4aCgIkscL9X2jBMicAALBi+hmVYfY6tBBzKEzl
 IZS7ZtlDn/AGn9fKfL5kZRDbH6fo7pRQfoXPGOaimo7tglD8aBYQqlNoA
 XOKNNceVpIOYLxlyzuCYI7jM6Ex6GhSMcC4vblGTn5qsY/Eta3uYKTWls A==;
X-CSE-ConnectionGUID: INO1WGaRSseuV0l0+xiyEg==
X-CSE-MsgGUID: KDtFIqF0QFKHT1WD648gWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="68524122"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68524122"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 15:45:50 -0700
X-CSE-ConnectionGUID: +a08ceHtRLGSBjeM7fxYyw==
X-CSE-MsgGUID: gTYYptviQFKpeUgcrX/HBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121907751"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 15:45:49 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_oa: Fix __for_one_render_engine
Date: Fri, 14 Mar 2025 15:45:44 -0700
Message-ID: <20250314224545.239134-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314224545.239134-1-ashutosh.dixit@intel.com>
References: <20250314224545.239134-1-ashutosh.dixit@intel.com>
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

v2: Use pre-existing xe_find_engine_by_class()

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9bc62c5b9d..03b0acf5db 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4645,13 +4645,10 @@ static const char *xe_engine_class_name(uint32_t engine_class)
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
+	hwe = &xe_find_engine_by_class(drm_fd, DRM_XE_ENGINE_CLASS_RENDER)->instance; \
+	igt_require_f(hwe, "no render engine\n"); \
+	igt_dynamic_f("rcs-%d", hwe->engine_instance)
 
 igt_main
 {
@@ -4895,10 +4892,10 @@ igt_main
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

