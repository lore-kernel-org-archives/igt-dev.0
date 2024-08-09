Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1606FC531DA
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 10:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA43D10E8AF;
	Fri,  9 Aug 2024 10:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FuHLQMTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB9F10E8AE
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 10:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723200917; x=1754736917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AQbroyakqZMap1V5j6J/cwWA2kFEC5m8QPI7xn7r94k=;
 b=FuHLQMTW1pGl9/Sjdg1dGr292Ll3D64dsKSrnzK1RLfypv2izaC1i1j4
 Khs2emviY7iVjeqZlJVPk5Zwj9u0X5mGpVPM38BxTSc0WIYlWXeRnJjKi
 e7qXWldkZFHdTPjnnjbix2msybL5azCpeZAOZZhoM1mOav38xSYrpJP3X
 C1DooQaTQmzB9rCCjtkqouACm/s6oa0x6yTxAtr60XhO2kP7HnTXZQESF
 O1fmAa8bSc87fRfL/CTswuEaVhawj1uFCZanb/aeTAW3h6jeiXSoHPIcg
 m2z+IhlBhQ9vYO40LZjkQo2odwmJorMbI0VrtQ/AYSXvLm4KxRPCGccAg A==;
X-CSE-ConnectionGUID: JuPCyz0bRXe75RHPqnoO2Q==
X-CSE-MsgGUID: dOGWyHSdQKOvzHzbFE9knQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21028229"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21028229"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:55:16 -0700
X-CSE-ConnectionGUID: 4iaZob6tSc6N6hlOc80MJw==
X-CSE-MsgGUID: bI2obRAFRaG/muKZE1jaPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57612441"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 03:55:16 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_query: Query engine capabilities
Date: Fri,  9 Aug 2024 12:39:22 +0200
Message-ID: <20240809103922.12964-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240809103922.12964-1-nirmoy.das@intel.com>
References: <20240809103922.12964-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Query engine capabilities.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Mateusz Jablonski <mateusz.jablonski@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_query.c | 48 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index ddb2e76e5..36eb58f0d 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -203,6 +203,53 @@ test_query_engines(int fd)
 	igt_assert_lt(0, i);
 }
 
+/**
+ * SUBTEST: query-engines-capabilities
+ * Description: Display engine capabilities for classes available for xe device
+ * Test category: functionality test
+ *
+ * SUBTEST: multigpu-query-engines-capabilities
+ * Description: Display engine capabilities for classes available for all Xe devices.
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: MultiGPU
+ * Test category: functionality test
+ */
+static void
+test_query_engine_capabilities(int fd)
+{
+	struct drm_xe_engine *e;
+	int i = 0, class;
+	static const struct {
+		u32 flag;
+		const char *name;
+	} capabilities[] = {
+		{DRM_XE_ENGINE_CAPABILITY_WMTP, "wmtp"},
+	};
+
+
+	xe_for_each_engine_class(class) {
+		struct drm_xe_engine_class_instance *hwe;
+
+		e = xe_engine(fd, class);
+		hwe = &e->instance;
+
+		igt_assert(hwe);
+		igt_info("engine %d: %s, tile: TILE-%d, capabilities: ", i++,
+			 xe_engine_class_string(hwe->engine_class),
+			 hwe->gt_id);
+		for (int j = 0; j < ARRAY_SIZE(capabilities); j++) {
+			igt_info("%s: %s, ", capabilities[j].name,
+				 e->capabilities & capabilities[j].flag ?
+				 "yes" : "no");
+
+		}
+		igt_info("\n");
+	}
+
+	igt_assert(i > 0);
+}
+
 /**
  * SUBTEST: query-mem-usage
  * Test category: functionality test
@@ -1077,6 +1124,7 @@ igt_main
 		void (*func)(int);
 	} funcs[] = {
 		{ "query-engines", test_query_engines },
+		{ "query-engines-capabilities", test_query_engine_capabilities },
 		{ "query-mem-usage", test_query_mem_regions },
 		{ "query-gt-list", test_query_gt_list },
 		{ "query-config", test_query_config },
-- 
2.42.0

