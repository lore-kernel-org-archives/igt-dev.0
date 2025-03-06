Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9487EC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 20:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0C510E159;
	Thu,  6 Mar 2025 20:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lKJXWczR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE3010E159
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 20:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741291293; x=1772827293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Aw+hWXNz6y9u4vnDr30obWL7m2N6GJFNiV1++uIqYgk=;
 b=lKJXWczRfBp4GIIzkHzI0rxEz58dZHghwxt/mrgszxAPHex+kqBRLg+A
 9RRGfHcqIa8QyP0U/0tZlPu03S0mT3JEp3+3Je1M35QFUZMIATb8zQjax
 zRPmMv1vYosV58Ud0sra2mMNvALYfopvHheBWVd72umaRo7foMae+ia4J
 /AX4q2/+t3ZzqJp+e7TbFjIx9O4b32Vn5K4fvGK5EPKSpa//+p1vJHuFV
 uUyi0VE/zs1+BJ6QwACrnxp9Z6rs91jbyQu+eTC7GtjnKL4pPIit+IUQV
 0LtK43AGUlsKqElLG5rYsvYZwQQrCE2cHwxG4A+zkuNUrER7VwgrQkOw4 Q==;
X-CSE-ConnectionGUID: 7OWyJKdeS2CKuoGG5+RDsQ==
X-CSE-MsgGUID: 1eYWof4zQd6if2/wNycx6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42211418"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="42211418"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 12:01:32 -0800
X-CSE-ConnectionGUID: ph5H2ZwCSsOjG3SDYlYImw==
X-CSE-MsgGUID: ZK1hrj/lRmexr/6z2Vn0ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="149913993"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.143])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 12:01:31 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 i-g-t 1/2] tests/intel/xe_drm_fdinfo: Check prerequisites
 for utilization subtests
Date: Thu,  6 Mar 2025 21:01:17 +0100
Message-Id: <20250306200118.1771514-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250306200118.1771514-1-marcin.bernatowicz@linux.intel.com>
References: <20250306200118.1771514-1-marcin.bernatowicz@linux.intel.com>
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

Introduce require_engine_utilization_data() to verify utilization
data availability in each utilization subtest.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Suggested-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 54 +++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index f17245bea..f166b73d6 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -358,6 +358,16 @@ static void basic_memory(int xe)
 	}
 }
 
+static void require_engine_utilization_data(int xe)
+{
+	struct drm_client_fdinfo info = {};
+
+	igt_require(igt_parse_drm_fdinfo(xe, &info, engine_map,
+					 ARRAY_SIZE(engine_map), NULL, 0));
+	igt_require(info.num_engines);
+	igt_require(info.utilization_mask & DRM_FDINFO_UTILIZATION_CYCLES);
+}
+
 static void basic_engine_utilization(int xe)
 {
 	struct drm_client_fdinfo info = { };
@@ -736,8 +746,10 @@ igt_main
 		basic_memory(xe);
 
 	igt_describe("Check if basic fdinfo content is present for engine utilization");
-	igt_subtest("basic-utilization")
+	igt_subtest("basic-utilization") {
+		require_engine_utilization_data(xe);
 		basic_engine_utilization(xe);
+	}
 
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("mem-total-resident")
@@ -751,50 +763,69 @@ igt_main
 	igt_subtest("mem-active")
 		mem_active(xe, xe_engine(xe, 0));
 
-	igt_subtest("utilization-single-idle")
+	igt_subtest("utilization-single-idle") {
+		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
 			utilization_single(xe, hwe, 0);
+	}
 
-	igt_subtest("utilization-single-full-load")
+	igt_subtest("utilization-single-full-load") {
+		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
 			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
+	}
 
-	igt_subtest("utilization-single-full-load-isolation")
+	igt_subtest("utilization-single-full-load-isolation") {
+		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
 			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
+	}
 
-	igt_subtest("utilization-single-full-load-destroy-queue")
+	igt_subtest("utilization-single-full-load-destroy-queue") {
+		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
 			utilization_single_destroy_queue(xe, hwe);
+	}
 
-	igt_subtest("utilization-others-idle")
+	igt_subtest("utilization-others-idle") {
+		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
 			utilization_others_idle(xe, hwe);
+	}
 
-	igt_subtest("utilization-others-full-load")
+	igt_subtest("utilization-others-full-load") {
+		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
 			utilization_others_full_load(xe, hwe);
+	}
 
-	igt_subtest("utilization-all-full-load")
+	igt_subtest("utilization-all-full-load") {
+		require_engine_utilization_data(xe);
 		utilization_all_full_load(xe);
+	}
 
 
 	for (const struct section *s = sections; s->name; s++) {
-		igt_subtest_f("%s-utilization-single-idle", s->name)
+		igt_subtest_f("%s-utilization-single-idle", s->name) {
+			require_engine_utilization_data(xe);
 			xe_for_each_gt(xe, gt)
 				xe_for_each_engine_class(class)
 					utilization_multi(xe, gt, class, s->flags);
+		}
 
-		igt_subtest_f("%s-utilization-single-full-load", s->name)
+		igt_subtest_f("%s-utilization-single-full-load", s->name) {
+			require_engine_utilization_data(xe);
 			xe_for_each_gt(xe, gt)
 				xe_for_each_engine_class(class)
 					utilization_multi(xe, gt, class,
 							  s->flags |
 							  TEST_BUSY |
 							  TEST_TRAILING_IDLE);
+		}
 
 		igt_subtest_f("%s-utilization-single-full-load-isolation",
-			      s->name)
+			      s->name) {
+			require_engine_utilization_data(xe);
 			xe_for_each_gt(xe, gt)
 				xe_for_each_engine_class(class)
 					utilization_multi(xe, gt, class,
@@ -802,6 +833,7 @@ igt_main
 							  TEST_BUSY |
 							  TEST_TRAILING_IDLE |
 							  TEST_ISOLATION);
+		}
 	}
 
 	igt_fixture {
-- 
2.31.1

