Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93C8C021B8
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 18:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA6110E693;
	Tue,  4 Mar 2025 18:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkE763W6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941D610E693
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 18:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741114623; x=1772650623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fbzU365jkR1vMpOtIVoYY4Yra02Zr/vrowZIOvIRL8I=;
 b=TkE763W6ZNk8FVgMQHJGovma3jr7YYWtQCMKoL6jAq06FEVK7S/HTnBt
 VY5tCJfCkxY2hXtngoE7mIgn/P3JCrHE3xScfTZEFRH6ZWF4KtWAIw67t
 /CbOYXhUx3ZmkwiCePzNIT98Kv0jkhpqPYcPptWLzyDL4VjMeGtqKfZN+
 X5i14EgTGGARujcrSO/gjV06+5RkSFjMIKtID8fbP8djF5OTQCsR44Wbd
 7+L45mBkfP8netj6Voze9t/vl8i9KAn6esrh4wDvl8gik/Itj0lTW/7SH
 SahO3qsopML7WO/uTqPo4elR3u30XNZjgvEiLGPm1L9PMaBzzPyiEE5Rk g==;
X-CSE-ConnectionGUID: 0q8d08YPQiWDKSwbXoMOag==
X-CSE-MsgGUID: r3elYgzpQvaUewmq2yv73A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53453133"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="53453133"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 10:57:02 -0800
X-CSE-ConnectionGUID: NSkRzOA6TJ213JRqAEZhBg==
X-CSE-MsgGUID: OptLFsoGQwOEslAfvlmy/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="118284304"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.17.221])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 10:57:00 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_drm_fdinfo: Group utilization tests
 and skip when no utilization data
Date: Tue,  4 Mar 2025 19:56:39 +0100
Message-Id: <20250304185640.1333849-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250304185640.1333849-1-marcin.bernatowicz@linux.intel.com>
References: <20250304185640.1333849-1-marcin.bernatowicz@linux.intel.com>
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

Wrap all utilization-related subtests in an igt_subtest_group and add
a fixture that ensures utilization data is available before running
them.

Link: https://lore.kernel.org/r/20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 122 ++++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 55 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 7330b4330..d18fe10d8 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -735,10 +735,6 @@ igt_main
 	igt_subtest("basic-mem")
 		basic_memory(xe);
 
-	igt_describe("Check if basic fdinfo content is present for engine utilization");
-	igt_subtest("basic-utilization")
-		basic_engine_utilization(xe);
-
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("mem-total-resident")
 		mem_total_resident(xe);
@@ -751,57 +747,73 @@ igt_main
 	igt_subtest("mem-active")
 		mem_active(xe, xe_engine(xe, 0));
 
-	igt_subtest("utilization-single-idle")
-		xe_for_each_engine(xe, hwe)
-			utilization_single(xe, hwe, 0);
-
-	igt_subtest("utilization-single-full-load")
-		xe_for_each_engine(xe, hwe)
-			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
-
-	igt_subtest("utilization-single-full-load-isolation")
-		xe_for_each_engine(xe, hwe)
-			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
-
-	igt_subtest("utilization-single-full-load-destroy-queue")
-		xe_for_each_engine(xe, hwe)
-			utilization_single_destroy_queue(xe, hwe);
-
-	igt_subtest("utilization-others-idle")
-		xe_for_each_engine(xe, hwe)
-			utilization_others_idle(xe, hwe);
-
-	igt_subtest("utilization-others-full-load")
-		xe_for_each_engine(xe, hwe)
-			utilization_others_full_load(xe, hwe);
-
-	igt_subtest("utilization-all-full-load")
-		utilization_all_full_load(xe);
-
-
-	for (const struct section *s = sections; s->name; s++) {
-		igt_subtest_f("%s-utilization-single-idle", s->name)
-			xe_for_each_gt(xe, gt)
-				xe_for_each_engine_class(class)
-					utilization_multi(xe, gt, class, s->flags);
-
-		igt_subtest_f("%s-utilization-single-full-load", s->name)
-			xe_for_each_gt(xe, gt)
-				xe_for_each_engine_class(class)
-					utilization_multi(xe, gt, class,
-							  s->flags |
-							  TEST_BUSY |
-							  TEST_TRAILING_IDLE);
-
-		igt_subtest_f("%s-utilization-single-full-load-isolation",
-			      s->name)
-			xe_for_each_gt(xe, gt)
-				xe_for_each_engine_class(class)
-					utilization_multi(xe, gt, class,
-							  s->flags |
-							  TEST_BUSY |
-							  TEST_TRAILING_IDLE |
-							  TEST_ISOLATION);
+	igt_subtest_group {
+		igt_fixture {
+			struct drm_client_fdinfo info = { };
+
+			igt_require(igt_parse_drm_fdinfo(xe, &info, engine_map,
+							 ARRAY_SIZE(engine_map),
+							 NULL, 0));
+			igt_require(info.num_engines);
+		}
+
+		igt_describe("Check if basic fdinfo content is present for engine utilization");
+		igt_subtest("basic-utilization")
+			basic_engine_utilization(xe);
+
+		igt_subtest("utilization-single-idle")
+			xe_for_each_engine(xe, hwe)
+				utilization_single(xe, hwe, 0);
+
+		igt_subtest("utilization-single-full-load")
+			xe_for_each_engine(xe, hwe)
+				utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
+
+		igt_subtest("utilization-single-full-load-isolation")
+			xe_for_each_engine(xe, hwe)
+				utilization_single(xe, hwe,
+						   TEST_BUSY |
+						   TEST_TRAILING_IDLE |
+						   TEST_ISOLATION);
+
+		igt_subtest("utilization-single-full-load-destroy-queue")
+			xe_for_each_engine(xe, hwe)
+				utilization_single_destroy_queue(xe, hwe);
+
+		igt_subtest("utilization-others-idle")
+			xe_for_each_engine(xe, hwe)
+				utilization_others_idle(xe, hwe);
+
+		igt_subtest("utilization-others-full-load")
+			xe_for_each_engine(xe, hwe)
+				utilization_others_full_load(xe, hwe);
+
+		igt_subtest("utilization-all-full-load")
+			utilization_all_full_load(xe);
+
+		for (const struct section *s = sections; s->name; s++) {
+			igt_subtest_f("%s-utilization-single-idle", s->name)
+				xe_for_each_gt(xe, gt)
+					xe_for_each_engine_class(class)
+						utilization_multi(xe, gt, class, s->flags);
+
+			igt_subtest_f("%s-utilization-single-full-load", s->name)
+				xe_for_each_gt(xe, gt)
+					xe_for_each_engine_class(class)
+						utilization_multi(xe, gt, class,
+								  s->flags |
+								  TEST_BUSY |
+								  TEST_TRAILING_IDLE);
+
+			igt_subtest_f("%s-utilization-single-full-load-isolation", s->name)
+				xe_for_each_gt(xe, gt)
+					xe_for_each_engine_class(class)
+						utilization_multi(xe, gt, class,
+								  s->flags |
+								  TEST_BUSY |
+								  TEST_TRAILING_IDLE |
+								  TEST_ISOLATION);
+		}
 	}
 
 	igt_fixture {
-- 
2.31.1

