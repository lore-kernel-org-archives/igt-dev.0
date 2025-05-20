Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBD2C54E71
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 23:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3F310E5C6;
	Tue, 20 May 2025 23:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0v4Brkl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D4210E575
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 23:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747783263; x=1779319263;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xPluWNWvDHBQLG8eF1WEMo/G87qCBtfm4Gme4YxuRAw=;
 b=i0v4BrklXk8Tx8VIC86N+intJRLBJzwj6ddt1PXEvsqnJ4cEZz8z7KTQ
 qJ8Ti/ZzDF1ptQYv9GLB5w4o/XKpSCT+ZwAfXaRvTCY8tRNdxt+QskER7
 y9B6yueveTaTSbm2jBgocDSns2He5UMm5upHjEQEDoXm3sUgL3o+80LFi
 aihhKIKuMK6ZmC5UvMj80Mmv6WzIGGdnAl7DaLHnQfbLLMzRLptS18fsI
 BY2Ecem/h/tPwZlTQU6kHLNqqM8BUYrcyBdTRuMSRZtc1lwvkRy5kZHq7
 VBbVmk5nYOMavMeMpHGJVevfS9FdaGsgEfxGOcuZHK7I36bsdQ3lgX6BE g==;
X-CSE-ConnectionGUID: u1OMQnt5TKy946WHMw97AA==
X-CSE-MsgGUID: 2FjeNBdvR6eJZmlujuEjHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49875548"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49875548"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 16:21:01 -0700
X-CSE-ConnectionGUID: 5007ygc7RoqFsOWJUNir+Q==
X-CSE-MsgGUID: N1mP47LEQrWXf4xiAQyDnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="145095704"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 16:21:00 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 lucas.demarchi@intel.com
Subject: [PATCH i-g-t 2/4] tests/intel/xe_drm_fdinfo: Drop TEST_TRAILING_IDLE
Date: Tue, 20 May 2025 16:20:30 -0700
Message-ID: <20250520232027.351497-8-umesh.nerlige.ramappa@intel.com>
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

All current tests are ending the spinners before taking the second
sample of utilization, so no need for this flag.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 83b7cd617c34..98f249bb0da4 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -70,7 +70,6 @@ IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine u
 
 /* flag masks */
 #define TEST_BUSY		(1 << 0)
-#define TEST_TRAILING_IDLE	(1 << 1)
 #define TEST_ISOLATION		(1 << 2)
 #define TEST_VIRTUAL		(1 << 3)
 #define TEST_PARALLEL		(1 << 4)
@@ -455,8 +454,7 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
 		read_engine_cycles(new_fd, pceu1[1]);
 
 	usleep(batch_duration_usec);
-	if (flags & TEST_TRAILING_IDLE)
-		end_cork(fd, cork);
+	end_cork(fd, cork);
 
 	read_engine_cycles(fd, pceu2[0]);
 	if (flags & TEST_ISOLATION)
@@ -693,8 +691,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
 		read_engine_cycles(fd_spill, pceu_spill[0]);
 
 	usleep(batch_duration_usec);
-	if (flags & TEST_TRAILING_IDLE)
-		end_cork(fd, cork);
+	end_cork(fd, cork);
 
 	read_engine_cycles(fd, pceu[1]);
 	if (flags & TEST_ISOLATION)
@@ -774,13 +771,13 @@ igt_main
 	igt_subtest("utilization-single-full-load") {
 		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
-			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE);
+			utilization_single(xe, hwe, TEST_BUSY);
 	}
 
 	igt_subtest("utilization-single-full-load-isolation") {
 		require_engine_utilization_data(xe);
 		xe_for_each_engine(xe, hwe)
-			utilization_single(xe, hwe, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
+			utilization_single(xe, hwe, TEST_BUSY | TEST_ISOLATION);
 	}
 
 	igt_subtest("utilization-single-full-load-destroy-queue") {
@@ -821,8 +818,7 @@ igt_main
 				xe_for_each_engine_class(class)
 					utilization_multi(xe, gt, class,
 							  s->flags |
-							  TEST_BUSY |
-							  TEST_TRAILING_IDLE);
+							  TEST_BUSY);
 		}
 
 		igt_subtest_f("%s-utilization-single-full-load-isolation",
@@ -833,7 +829,6 @@ igt_main
 					utilization_multi(xe, gt, class,
 							  s->flags |
 							  TEST_BUSY |
-							  TEST_TRAILING_IDLE |
 							  TEST_ISOLATION);
 		}
 	}
-- 
2.43.0

