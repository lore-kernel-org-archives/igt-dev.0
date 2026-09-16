Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4DFC982CC
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 15:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E243410E3DA;
	Wed, 16 Sep 2026 15:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+QQ6VRx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D1710E3DA
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 15:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789573680; x=1821109680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0O9R9mytZF8Gv8OEt9fU6rbU5cscEOF2aMygYOAH4vY=;
 b=K+QQ6VRxIjix7wHeF2KzYKc8Q6e8FkcfQ5g8nbQeflyaXXX59bAow/Id
 0RG4ScE3Ys5kXXOhMcLKIlGV2i8ajcmbvXwQtBnHLhQVNjCOAp7P4qVnu
 Q+N8i84Q0sV8N0KQTx7Ce7/MelwpUeecKK1aE3tpYr5wDwyxHrxcAVeat
 BO/iAh3eXqYhvfW757DNcWRYueVzButJsiQL0fFMRVH4rHcRxNliW4g6y
 xRquF8qZQMhu8L1tl4PYsx2nT8csgc1kHp1vX6F3zH17wEFR4IeisBKCo
 bGBLnqKTBDnb+q+VMz3OSH/TfRBzgt9ba5jyTzYmYkV7YWfMMcRTQ0R0c Q==;
X-CSE-ConnectionGUID: N3v/sr12QvuDfcc3OB+qCA==
X-CSE-MsgGUID: BsGRBbS8SPeXGiY8uGMexw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115490181"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="115490181"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:48:00 -0700
X-CSE-ConnectionGUID: cNinVzLfTEiwcWKyp8Jq6A==
X-CSE-MsgGUID: IANT0tqPRlyKEy3Alqivqg==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.146])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:47:59 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/2] runner: Create results after each tests end
Date: Wed, 16 Sep 2026 17:47:40 +0200
Message-ID: <20260916154740.130190-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916154740.130190-1-kamil.konieczny@linux.intel.com>
References: <20260916154740.130190-1-kamil.konieczny@linux.intel.com>
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

Sometimes it is desireable to have results present after an
execution of each test, so if any unexpected reboot happen, there
is at least result with already executed ones. Before creating
new results.json, previous one from test before is saved into
results.old file.

This will have one drawback of not containing any info about last
test which causes sudden machine reboot.

v2: renamed function which saves partial results (Ryszard)
  use name results.old, not results.bak (Kamil)
  do not write results on error at writing endtime (Kamil)

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c  | 63 +++++++++++++++++++++++++++++++++++++++++++---
 runner/resultgen.c |  6 ++++-
 2 files changed, 64 insertions(+), 5 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 35ea704c2..bbe011cbc 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -42,6 +42,7 @@
 #include "executor.h"
 #include "kmemleak.h"
 #include "output_strings.h"
+#include "resultgen.h"
 #include "runnercomms.h"
 
 #define KMSG_HEADER "[IGT] "
@@ -2036,6 +2037,11 @@ static bool clear_old_results(char *path)
 		return false;
 	}
 
+	if (remove_file(dirfd, "results.old")) {
+		errf("Error clearing results.old : %m\n");
+		return false;
+	}
+
 	if (remove_file(dirfd, "uname.txt") ||
 	    remove_file(dirfd, "starttime.txt") ||
 	    remove_file(dirfd, "endtime.txt") ||
@@ -2472,6 +2478,48 @@ static int open_comms_if_valid(int resdirfd, size_t testidx)
 	return -1;
 }
 
+static int write_endtime(int resdirfd, double a_time)
+{
+	int timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666);
+
+	if (timefd >= 0) {
+		dprintf(timefd, "%f\n", a_time);
+		close(timefd);
+		return 0;
+	}
+
+	return -errno;
+}
+
+static bool generate_partial_results(int resdirfd, struct settings *settings)
+{
+	char *results_path = settings->results_path;
+	double beg_time = timeofday_double();
+	double end_time;
+	bool ret;
+
+	if (!settings->save_results_after_each_test)
+		return true;
+
+	if (write_endtime(resdirfd, beg_time))
+		return true;
+
+	remove_file(resdirfd, "results.old");
+	renameat(resdirfd, "results.json", resdirfd, "results.old");
+
+	ret = generate_results_path(results_path);
+	if (settings->sync)
+		fsync(resdirfd);
+
+	end_time = timeofday_double();
+	if (settings->log_level >= LOG_LEVEL_NORMAL) {
+		outf("generating results took: %.6ffs\n", end_time - beg_time);
+		fflush(stdout);
+	}
+
+	return ret;
+}
+
 bool execute(struct execute_state *state,
 	     struct settings *settings,
 	     struct job_list *job_list)
@@ -2724,8 +2772,18 @@ bool execute(struct execute_state *state,
 			if (!initialize_execute_state_from_resume(resdirfd, state, settings, job_list))
 				return false;
 			state->time_left = time_left;
+			/* it should check option, also measure time taken */
+			if (!generate_partial_results(resdirfd, settings))
+				return false;
+
 			return execute(state, settings, job_list);
 		}
+
+		/* it should check option, also measure time taken */
+		if (!generate_partial_results(resdirfd, settings)) {
+			status = false;
+			break;
+		}
 	}
 
 	/* Collect facts after the last test runs */
@@ -2737,10 +2795,7 @@ bool execute(struct execute_state *state,
 				     settings->kmemleak_each, settings->sync))
 			errf("Failed to collect kmemleak logs after the last test\n");
 
-	if ((timefd = openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY | O_EXCL, 0666)) >= 0) {
-		dprintf(timefd, "%f\n", timeofday_double());
-		close(timefd);
-	}
+	write_endtime(resdirfd, timeofday_double());
 
  end:
 	if (settings->enable_code_coverage && !settings->cov_results_per_test) {
diff --git a/runner/resultgen.c b/runner/resultgen.c
index 1ee167fb0..f5a91f542 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -2555,9 +2555,13 @@ bool generate_results(int dirfd)
 bool generate_results_path(char *resultspath)
 {
 	int dirfd = open(resultspath, O_DIRECTORY | O_RDONLY);
+	bool ret;
 
 	if (dirfd < 0)
 		return false;
 
-	return generate_results(dirfd);
+	ret = generate_results(dirfd);
+	close(dirfd);
+
+	return ret;
 }
-- 
2.55.0

