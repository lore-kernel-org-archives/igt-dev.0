Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BA1C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7684810E948;
	Thu,  1 Aug 2024 12:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnBFfAye";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F91A10E945
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722515047; x=1754051047;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=siGyuOjzF1v42qUk0+5w6To+nGUrWTvG2oqsTcocISw=;
 b=HnBFfAyeE9G9B1dMusu8xb/9RzoL4PyBeF80dbg1hr/vzb/cu9m0Iss9
 nUjcNNwqqi7WrIKPfsLfHRctaDGo97MMPiWt6inxVVP2p6vic1UREjt9M
 y/nLPBGVchG6KcY6hFEA0w/KtlRj6s6/UpdPtCkeYve38PAXvkTewH7Vq
 lx6cD4m+I1MtX1S0GkhtCelKTMSpb2tqMlm+mYWhpGl9swC0qpwrHewxz
 /VNKFYb/y8RqPj2IAF+Sdbe/0bVDIPuh24J/13HLLisYGJU8kg66SPzGP
 aXSgkjkfSyoeVUGS18oXCRU+inehX58U0ibFZffSQRkHnAkWWZORc0jjK g==;
X-CSE-ConnectionGUID: /4wdAKgURXe362YrqH0xqA==
X-CSE-MsgGUID: PhSm+w6wS3WdbBgHRuFZfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24323875"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24323875"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:24:07 -0700
X-CSE-ConnectionGUID: KXvp3IfoShuu6xMvIgU9Pw==
X-CSE-MsgGUID: o1vEnnG7RXeLvi97K86lNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="78313457"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:24:05 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] tests/intel/xe_create: Remove the elapsed time validation
Date: Thu,  1 Aug 2024 18:03:12 +0530
Message-Id: <20240801123312.1539769-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
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

Time check used is incorrect. Time limit used for validation is
arbitrarily chosen as 5 seconds with no real resoning behind it.
With different execution environments taking different execution times,
limit can't be fixed and leads to unnecessary hacks.
So remove this time check completely.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 tests/intel/xe_create.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 76ffdcef2..80de07789 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -157,7 +157,6 @@ enum vm_count {
 };
 
 #define MAXEXECQUEUES 2048
-#define MAXTIME 5
 
 /**
  * SUBTEST: create-execqueues-%s
@@ -175,10 +174,8 @@ enum vm_count {
 static void create_execqueues(int fd, enum exec_queue_destroy ed,
 			      enum vm_count vc)
 {
-	struct timespec tv = { };
 	uint32_t num_engines, exec_queues_per_process, vm;
-	int nproc = sysconf(_SC_NPROCESSORS_ONLN), seconds;
-	int real_timeout = MAXTIME * (vc == SHARED ? 4 : 1);
+	int nproc = sysconf(_SC_NPROCESSORS_ONLN);
 
 	if (vc == SHARED) {
 		fd = drm_reopen_driver(fd);
@@ -189,8 +186,6 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
 	exec_queues_per_process = max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
 	igt_debug("nproc: %u, exec_queues per process: %u\n", nproc, exec_queues_per_process);
 
-	igt_nsec_elapsed(&tv);
-
 	igt_fork(n, nproc) {
 		struct drm_xe_engine *engine;
 		uint32_t exec_queue, exec_queues[exec_queues_per_process];
@@ -236,16 +231,6 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
 		xe_vm_destroy(fd, vm);
 		drm_close_driver(fd);
 	}
-
-	seconds = igt_seconds_elapsed(&tv);
-	if (seconds > real_timeout) {
-		if (igt_run_in_simulation())
-			igt_info("Creating %d exec_queues took too long: %d [limit: %d] seconds\n",
-				 MAXEXECQUEUES, seconds, real_timeout);
-		else
-			igt_assert_f(false, "Creating %d exec_queues took too long: %d [limit: %d] seconds\n",
-				     MAXEXECQUEUES, seconds, real_timeout);
-	}
 }
 
 /**
-- 
2.34.1

