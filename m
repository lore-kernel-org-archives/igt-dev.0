Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E956FC3DA6D
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 23:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFAB10E588;
	Tue, 20 May 2025 23:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RZ52h0im";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08ED10E5C0
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 23:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747783263; x=1779319263;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cSSSqSYa9jjn7ykPT7HNREx9/7cbzpmT2KoUPkcI50U=;
 b=RZ52h0imWojhTySRzLPrwJNCkGYGgMjEDiR7tuVr80KkmJEKrU+t0yp3
 WrTcmO8NR9OdW0tlFdSwNv4qreV6zC+wT89kD3ubAuU/4eOsqrH6lvGge
 GGLeoruY/mc10Te3QBrplE6BEvY4Jpt6o2CCNn1SNJxBdFAv+dSmRb+og
 oEOrzIN7q25WMYVLyK1CeRFrKD6XE6lx3SAn1F4+uDlMu+Sdj9TCMQjQo
 7rV+PciXonptPN91wJLSS5fq3eQW3zDSXzsDv3v9IzWwg3AGmoB/llKS/
 U7hSbR2jPBcEYMYoDl0vlXSGi5XHTXpBUqYyUAJ0nAiL+b+jPeNsoToIF w==;
X-CSE-ConnectionGUID: 1LkGtD4NS9+B0jYNaOZoBg==
X-CSE-MsgGUID: KNEa9x8iRhCDyCMIwSjBdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49875549"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49875549"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 16:21:01 -0700
X-CSE-ConnectionGUID: rmSUObGITDWrV/bsI/7p6g==
X-CSE-MsgGUID: qIL4igDHRESfgPIJZSE8/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="145095708"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 16:21:00 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH i-g-t 3/4] tests/intel/xe_drm_fdinfo: Rename TEST_BUSY to
 TEST_WITH_LOAD
Date: Tue, 20 May 2025 16:20:31 -0700
Message-ID: <20250520232027.351497-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520232027.351497-6-umesh.nerlige.ramappa@intel.com>
References: <20250520232027.351497-6-umesh.nerlige.ramappa@intel.com>
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

TEST_BUSY flag really means test with a spinner/load, so rename it
accordingly.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 98f249bb0da4..ec439ce7a6d2 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -69,7 +69,7 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
 #define BO_SIZE (65536)
 
 /* flag masks */
-#define TEST_BUSY		(1 << 0)
+#define TEST_WITH_LOAD		(1 << 0)
 #define TEST_ISOLATION		(1 << 2)
 #define TEST_VIRTUAL		(1 << 3)
 #define TEST_PARALLEL		(1 << 4)
@@ -444,7 +444,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 		new_fd = drm_reopen_driver(fd);
 
 	vm = xe_vm_create(fd, 0, 0);
-	if (flags & TEST_BUSY) {
+	if (flags & TEST_WITH_LOAD) {
 		cork = xe_cork_create_opts(fd, hwe, vm, 1, 1);
 		xe_cork_sync_start(fd, cork);
 	}
@@ -460,7 +460,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 	if (flags & TEST_ISOLATION)
 		read_engine_cycles(new_fd, pceu2[1]);
 
-	expected_load = flags & TEST_BUSY ?
+	expected_load = flags & TEST_WITH_LOAD ?
 	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
 
 	check_results(pceu1[0], pceu2[0], hwe->engine_class, 1,
@@ -681,7 +681,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 		fd_spill = drm_reopen_driver(fd);
 
 	vm = xe_vm_create(fd, 0, 0);
-	if (flags & TEST_BUSY) {
+	if (flags & TEST_WITH_LOAD) {
 		cork = xe_cork_create_opts(fd, eci, vm, width, num_placements);
 		xe_cork_sync_start(fd, cork);
 	}
@@ -697,7 +697,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 	if (flags & TEST_ISOLATION)
 		read_engine_cycles(fd_spill, pceu_spill[1]);
 
-	expected_load = flags & TEST_BUSY ?
+	expected_load = flags & TEST_WITH_LOAD ?
 	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
 
 	check_results(pceu[0], pceu[1], class, width,
@@ -771,13 +771,13 @@ igt_main
 	igt_subtest("utilization-single-full-load") {
 		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
-			utilization_single(xe, hwe, TEST_BUSY);
+			utilization_single(xe, hwe, TEST_WITH_LOAD);
 	}
 
 	igt_subtest("utilization-single-full-load-isolation") {
 		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
-			utilization_single(xe, hwe, TEST_BUSY | TEST_ISOLATION);
+			utilization_single(xe, hwe, TEST_WITH_LOAD | TEST_ISOLATION);
 	}
 
 	igt_subtest("utilization-single-full-load-destroy-queue") {
@@ -818,7 +818,7 @@ igt_main
 				xe_for_each_engine_class(class)
 					utilization_multi(xe, gt, class,
 							  s->flags |
-							  TEST_BUSY);
+							  TEST_WITH_LOAD);
 		}
 
 		igt_subtest_f("%s-utilization-single-full-load-isolation",
@@ -828,7 +828,7 @@ igt_main
 				xe_for_each_engine_class(class)
 					utilization_multi(xe, gt, class,
 							  s->flags |
-							  TEST_BUSY |
+							  TEST_WITH_LOAD |
 							  TEST_ISOLATION);
 		}
 	}
-- 
2.43.0

