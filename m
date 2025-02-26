Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42CDC021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 19:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8295210E1E6;
	Wed, 26 Feb 2025 19:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihFYtzIB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A8810E1E6
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 19:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740598412; x=1772134412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1+TCHklvMKJVkxd95rylAEYQjgTN5XSi4XLOHuHm3cg=;
 b=ihFYtzIBaHnkazB4LlT50KmIJE1aoSdCEQ6rJ3uW5A9RU9NHowWnQIjg
 HSxqhsoi2mka+gqomDPTNLepN18XMumSGd8UxC3bzgcJTlbw/mFLz9maz
 HM8ZmgC6qeq/oNdyC4tV0EyS1GdlFl6I6TQEUIMB6WnZuxKbkjAzPJGf6
 TanbtglQx2J6OgKgYOAZo58sqZ68aO1VAKbt9x78YTtkpl9h4CmKo8MZX
 sUysfH5r41IMgiJQByAW84Ylb9OCslC/0wNWFdAGrlq5ztWAQJUCOJwGJ
 eTmnc7BJv27vedfmvgyUvaBZo9qPXjkFfym0g2z9luOq5pGuG4xaekV4t A==;
X-CSE-ConnectionGUID: 9YI3aSTgSF+iuJJSe/eLxQ==
X-CSE-MsgGUID: 5DowgIOQQlO5XbcLIv9zFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41168329"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="41168329"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 11:33:32 -0800
X-CSE-ConnectionGUID: 0MsurCkoT6eHVO/o+TLtsg==
X-CSE-MsgGUID: RI3YM/PWRymPXelK42NGqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="121906668"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 11:33:30 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH i-g-t] runner: Parse results harder
Date: Wed, 26 Feb 2025 20:33:28 +0100
Message-ID: <20250226193328.132817-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

  Sometimes an error happens in kernel or in test that leaves
output files in corrupted or incorrect state. While runner or
resume will just move on to executing next test, when generating
results it could end up with no results.json

  Try processing outputs a little more persistently and use any
output file left there, even if only dmesg.txt. Also, when no
useful output files were present, instead of breaking out add
notrun.

  Inform about processing results for each test so a problem
could be spotted more easily.

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c  | 21 +++++++++++++++++++++
 runner/executor.h  |  1 +
 runner/resultgen.c | 45 ++++++++++++++++++++++++++++++---------------
 3 files changed, 52 insertions(+), 15 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 2abb18732..96b8b5057 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -576,6 +576,27 @@ bool open_output_files(int dirfd, int *fds, bool write)
 	return true;
 }
 
+/**
+ * open_output_files_rdonly:
+ * @dirfd: fd of output directory with err.txt, dmesg.txt and other files
+ * @fds: array for fd's of opened output files
+ *
+ * Tries to open output files in read-only mode and saves file descriptors
+ * in fds arrray.
+ *
+ * Returns: true if all files opened, false otherwise
+ */
+bool open_output_files_rdonly(int dirfd, int *fds)
+{
+	bool ret = true;
+
+	for (int i = 0; i < _F_LAST; i++)
+		if ((fds[i] = openat(dirfd, filenames[i], O_RDONLY)) < 0)
+			ret = false; /* Remember failure */
+
+	return ret;
+}
+
 void close_outputs(int *fds)
 {
 	int i;
diff --git a/runner/executor.h b/runner/executor.h
index ab6a0c176..56c7323a8 100644
--- a/runner/executor.h
+++ b/runner/executor.h
@@ -26,6 +26,7 @@ enum {
 };
 
 bool open_output_files(int dirfd, int *fds, bool write);
+bool open_output_files_rdonly(int dirfd, int *fds);
 void close_outputs(int *fds);
 
 /*
diff --git a/runner/resultgen.c b/runner/resultgen.c
index 0d3a569cf..b50c417e3 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -2176,12 +2176,26 @@ static bool parse_test_directory(int dirfd,
 {
 	int fds[_F_LAST];
 	struct subtest_list subtests = {};
-	bool status = true;
 	int commsparsed;
 
-	if (!open_output_files(dirfd, fds, false)) {
-		fprintf(stderr, "Error opening output files\n");
-		return false;
+	if (!open_output_files_rdonly(dirfd, fds)) {
+		struct stat statbuf;
+		size_t sz = 0;
+
+		for (int i = 0; i < _F_LAST; ++i) {
+			if (fds[i] > 0 && !fstat(fds[i], &statbuf) && statbuf.st_size != 0)
+				sz = statbuf.st_size;
+		}
+
+		if (sz == 0) {
+			/* no output saved in any file */
+			fprintf(stderr, "results: Error opening output files\n");
+			close_outputs(fds);
+
+			return false;
+		}
+
+		fprintf(stderr, "results: Missing few output file(s)\n");
 	}
 
 	/*
@@ -2191,8 +2205,6 @@ static bool parse_test_directory(int dirfd,
 	commsparsed = fill_from_comms(fds[_F_SOCKET], entry, &subtests, results);
 	if (commsparsed == COMMSPARSE_ERROR) {
 		fprintf(stderr, "Error parsing output files (comms)\n");
-		status = false;
-		goto parse_output_end;
 	}
 
 	if (commsparsed == COMMSPARSE_EMPTY) {
@@ -2200,20 +2212,17 @@ static bool parse_test_directory(int dirfd,
 		 * fill_from_journal fills the subtests struct and
 		 * adds timeout results where applicable.
 		 */
-		fill_from_journal(fds[_F_JOURNAL], entry, &subtests, results);
+		if (fds[_F_JOURNAL] > 0)
+			fill_from_journal(fds[_F_JOURNAL], entry, &subtests, results);
 
 		if (!fill_from_output(fds[_F_OUT], entry->binary, "out", &subtests, results->tests) ||
 		    !fill_from_output(fds[_F_ERR], entry->binary, "err", &subtests, results->tests)) {
 			fprintf(stderr, "Error parsing output files (out.txt, err.txt)\n");
-			status = false;
-			goto parse_output_end;
 		}
 	}
 
 	if (!fill_from_dmesg(fds[_F_DMESG], settings, entry->binary, &subtests, results->tests)) {
 		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
-		status = false;
-		goto parse_output_end;
 	}
 
 	override_results(entry->binary, &subtests, results->tests);
@@ -2221,11 +2230,10 @@ static bool parse_test_directory(int dirfd,
 
 	add_to_totals(entry->binary, &subtests, results);
 
- parse_output_end:
 	close_outputs(fds);
 	free_subtests(&subtests);
 
-	return status;
+	return true;
 }
 
 static void try_add_notrun_results(const struct job_list_entry *entry,
@@ -2359,14 +2367,21 @@ struct json_object *generate_results_json(int dirfd)
 		char name[16];
 
 		snprintf(name, 16, "%zd", i);
+		fprintf(stderr, "results: parsing output: %s/ for test: %s\n",
+			name, job_list.entries[i].binary);
 		if ((testdirfd = openat(dirfd, name, O_DIRECTORY | O_RDONLY)) < 0) {
+			if (settings.log_level >= LOG_LEVEL_NORMAL)
+				fprintf(stderr, "results: no output, setting notrun\n)");
+
 			try_add_notrun_results(&job_list.entries[i], &settings, &results);
 			continue;
 		}
 
 		if (!parse_test_directory(testdirfd, &job_list.entries[i], &settings, &results)) {
-			close(testdirfd);
-			return NULL;
+			if (settings.log_level >= LOG_LEVEL_NORMAL)
+				fprintf(stderr, "results: no useful output, setting notrun\n");
+
+			try_add_notrun_results(&job_list.entries[i], &settings, &results);
 		}
 		close(testdirfd);
 	}
-- 
2.48.1

