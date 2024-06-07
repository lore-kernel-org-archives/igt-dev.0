Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F46C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 09:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E83910E03B;
	Fri,  7 Jun 2024 09:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cn0Hbjet";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0572710E03B
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 09:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717753704; x=1749289704;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oxJfyEM5wXnJ/LWPx9RXaHAkPhmAb6QgEMw6+HorXio=;
 b=Cn0Hbjet0x8skJhV4nCtNWEYzF42IIaVfJFoZjwlNK/Ena0WgW92pdgj
 gbkSM8CtJer4/zZrwOn6l45fRY3eJYcYH4Q/UqYZktmdeQANHxq4SHdEA
 nnvha33WcFD/+Uj3N94OMTxMddwj8EDmE061IFdkMPqChFnXCvH1rSX8P
 ehI8GeTQMzHt38wPTfByp8HJPLqroU4eoBYkW0lkWTLD+17Nokbu2tCKo
 7M6aYW9FDQHEB0lwjpTdQJ5nblh0yKMfdLVq9Pe6Q2eZKuULrGwaDlWRc
 S3Dkzsfz3je4t9/EDpz1BmtVNPoUJwuULorMCl0/rYXIAgYcw6InvNc94 Q==;
X-CSE-ConnectionGUID: 5r1W6FGgSPS7dBb/2euoqg==
X-CSE-MsgGUID: Q4acygPpREyUHbMLfmM+SA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25871639"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="25871639"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 02:48:15 -0700
X-CSE-ConnectionGUID: 4m+FniQZSfmwKAl2GcRY2g==
X-CSE-MsgGUID: a0QfO5PLRMS6I5DQVeXcRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38362791"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 02:48:14 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Venkata Ramana Nayana <venkata.ramana.nayana@intel.com>
Subject: [PATCH] tests/intel/xe_create: Isolate performance tests
Date: Fri,  7 Jun 2024 15:19:36 +0530
Message-Id: <20240607094936.1564474-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
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

create_execqueues subtest is testing the time required for creating
execqueues along with testing the functionality.
Performance measurements are mostly not relevant when testing on PreSi
environments. Isolate the performance checks into new tests allowing it
to be skipped for PreSi testing.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 tests/intel/xe_create.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index d41557c85..346c807c0 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -171,9 +171,11 @@ enum vm_count {
  * @leak:				destroy exec_queues in close() path
  * @noleak-shared:			same as noleak, but with a shared vm
  * @leak-shared:			same as leak, but with a shared vm
+ * @performance:			Measure time required for creating execqueues
+ * @performance-shared:			same as performance, but with a shared vm
  */
 static void create_execqueues(int fd, enum exec_queue_destroy ed,
-			      enum vm_count vc)
+			      enum vm_count vc, bool perf)
 {
 	struct timespec tv = { };
 	uint32_t num_engines, exec_queues_per_process, vm;
@@ -237,10 +239,12 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed,
 		drm_close_driver(fd);
 	}
 
-	seconds = igt_seconds_elapsed(&tv);
-	igt_assert_f(seconds < real_timeout,
-		     "Creating %d exec_queues tooks too long: %d [limit: %d]\n",
-		     MAXEXECQUEUES, seconds, real_timeout);
+	if (perf) {
+		seconds = igt_seconds_elapsed(&tv);
+		igt_assert_f(seconds < real_timeout,
+			     "Creating %d exec_queues tooks too long: %d [limit: %d]\n",
+			     MAXEXECQUEUES, seconds, real_timeout);
+	}
 }
 
 /**
@@ -410,16 +414,22 @@ igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
 	}
 
 	igt_subtest("create-execqueues-noleak")
-		create_execqueues(xe, NOLEAK, MULTI);
+		create_execqueues(xe, NOLEAK, MULTI, false);
 
 	igt_subtest("create-execqueues-leak")
-		create_execqueues(xe, LEAK, MULTI);
+		create_execqueues(xe, LEAK, MULTI, false);
 
 	igt_subtest("create-execqueues-noleak-shared")
-		create_execqueues(xe, NOLEAK, SHARED);
+		create_execqueues(xe, NOLEAK, SHARED, false);
 
 	igt_subtest("create-execqueues-leak-shared")
-		create_execqueues(xe, LEAK, SHARED);
+		create_execqueues(xe, LEAK, SHARED, false);
+
+	igt_subtest("create-execqueues-performance")
+		create_execqueues(xe, NOLEAK, MULTI, true);
+
+	igt_subtest("create-execqueues-performance-shared")
+		create_execqueues(xe, NOLEAK, SHARED, true);
 
 	igt_subtest("create-massive-size") {
 		create_massive_size(xe);
-- 
2.25.1

