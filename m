Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0F1C282CD
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 17:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AD110E4AF;
	Mon,  3 Mar 2025 17:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VeSawlX3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EEF10E4AF
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 17:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741021836; x=1772557836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yMNtWebZqwBm1Htr34wTdwBw3HK1cnPYp8y8NG20yaA=;
 b=VeSawlX3Y5QQyxmoQgVXMna47vJ+FMIjyYG5X0z5oRqePHSU6medjR+m
 yygmNQSvZfLUTKFJMHsvPotk0SZWHwItYRaEUqtJXKJnvltojD9pcRl3X
 X5PT5mU2CfsoZIJ2nnOllthOLsJOniCaCxkJR7SFsdIE8oPiajYsTf+IL
 zoaGG3Xvwg+NACQ8Zps8bigSRkfAp9W1vuEu0pdOmftaWEattLglAHyh2
 Lm2IDN5luxRz/i+KCbGxJAukliJdIvETHUFO+jHoQQ30LpvPaLkX1apXJ
 EkAzAhq3fucP3cKfn3njKP0Q7dK/4PMAczz9/NX3WwtCIPT95IsnnvVh5 Q==;
X-CSE-ConnectionGUID: IT69zCn8RUeG4RyBdjFCiw==
X-CSE-MsgGUID: Jyb27/p5TxO+Kc2ZKZtaHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52544372"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="52544372"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:10:35 -0800
X-CSE-ConnectionGUID: g5FLVDUJQomEtp2yC0X8Pg==
X-CSE-MsgGUID: 6ba2XdZ9ToG4ucNx5Ta/CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="155276914"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.30])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:10:32 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: [PATCH v3 i-g-t] runner: Parse results harder
Date: Mon,  3 Mar 2025 18:10:29 +0100
Message-ID: <20250303171029.70318-1-kamil.konieczny@linux.intel.com>
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

v2: removed ')' from 'notrun\n)' (Kamil)
 using bool var, added more prints about errors (Ryszard)
v3: reused open_for_reading, removed bool var (Krzysztof)
 closing only positive fds[] in close_outputs(), checking
 file sizes also if all opens succeeded (Kamil)

Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c  | 34 ++++++++++++++++++++++++++++-
 runner/executor.h  |  2 ++
 runner/resultgen.c | 53 ++++++++++++++++++++++++++++++++++------------
 3 files changed, 74 insertions(+), 15 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 2abb18732..cdf970514 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -576,15 +576,47 @@ bool open_output_files(int dirfd, int *fds, bool write)
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
+		if ((fds[i] = open_for_reading(dirfd, filenames[i])) < 0) {
+			fds[i] = -errno;
+			ret = false; /* Remember failure */
+		}
+
+	return ret;
+}
+
 void close_outputs(int *fds)
 {
 	int i;
 
 	for (i = 0; i < _F_LAST; i++) {
-		close(fds[i]);
+		if (fds[i] > 0)
+			close(fds[i]);
 	}
 }
 
+const char *get_out_filename(int fid)
+{
+	if (fid >= 0 && fid < _F_LAST)
+		return filenames[fid];
+
+	return "output-filename-index-error";
+}
+
 /* Returns the number of bytes written to disk, or a negative number on error */
 static long dump_dmesg(int kmsgfd, int outfd, ssize_t size)
 {
diff --git a/runner/executor.h b/runner/executor.h
index ab6a0c176..3b1cabcf5 100644
--- a/runner/executor.h
+++ b/runner/executor.h
@@ -26,7 +26,9 @@ enum {
 };
 
 bool open_output_files(int dirfd, int *fds, bool write);
+bool open_output_files_rdonly(int dirfd, int *fds);
 void close_outputs(int *fds);
+const char *get_out_filename(int fid);
 
 /*
  * Initialize execute_state object to a state where it's ready to
diff --git a/runner/resultgen.c b/runner/resultgen.c
index 0d3a569cf..ebafe7665 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -2176,14 +2176,38 @@ static bool parse_test_directory(int dirfd,
 {
 	int fds[_F_LAST];
 	struct subtest_list subtests = {};
-	bool status = true;
 	int commsparsed;
+	struct stat statbuf;
+	size_t fsizes[_F_LAST]; /* checks for both comm and out/err empty */
+	int fst_err;
+
+	open_output_files_rdonly(dirfd, fds);
+	for (int i = 0; i < _F_LAST; ++i) {
+		fsizes[i] = 0;
+		if (fds[i] > 0) {
+			fst_err = fstat(fds[i], &statbuf);
+			if (!fst_err)
+				fsizes[i] = statbuf.st_size;
+			else
+				fprintf(stderr, "results: %s: stats failed: %s\n",
+					get_out_filename(i), strerror(errno));
+		} else {
+			fprintf(stderr, "results: %s: open failed: %s\n",
+				get_out_filename(i), strerror(-fds[i]));
+		}
+	}
+
+	if (!fsizes[_F_SOCKET] && !fsizes[_F_OUT] && !fsizes[_F_ERR] &&
+	    !fsizes[_F_DMESG]) {
+		fprintf(stderr, "results: no valid output files\n");
+		close_outputs(fds);
 
-	if (!open_output_files(dirfd, fds, false)) {
-		fprintf(stderr, "Error opening output files\n");
 		return false;
 	}
 
+	if (!fsizes[_F_SOCKET] && !fsizes[_F_OUT] && !fsizes[_F_ERR])
+		fprintf(stderr, "results: comms/err/out empty, using only dmesg\n");
+
 	/*
 	 * Get test output from socket comms if it exists, otherwise
 	 * parse stdout/stderr
@@ -2191,8 +2215,6 @@ static bool parse_test_directory(int dirfd,
 	commsparsed = fill_from_comms(fds[_F_SOCKET], entry, &subtests, results);
 	if (commsparsed == COMMSPARSE_ERROR) {
 		fprintf(stderr, "Error parsing output files (comms)\n");
-		status = false;
-		goto parse_output_end;
 	}
 
 	if (commsparsed == COMMSPARSE_EMPTY) {
@@ -2200,20 +2222,17 @@ static bool parse_test_directory(int dirfd,
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
@@ -2221,11 +2240,10 @@ static bool parse_test_directory(int dirfd,
 
 	add_to_totals(entry->binary, &subtests, results);
 
- parse_output_end:
 	close_outputs(fds);
 	free_subtests(&subtests);
 
-	return status;
+	return true;
 }
 
 static void try_add_notrun_results(const struct job_list_entry *entry,
@@ -2359,14 +2377,21 @@ struct json_object *generate_results_json(int dirfd)
 		char name[16];
 
 		snprintf(name, 16, "%zd", i);
+		fprintf(stderr, "results: parsing output: %s/ for test: %s\n",
+			name, job_list.entries[i].binary);
 		if ((testdirfd = openat(dirfd, name, O_DIRECTORY | O_RDONLY)) < 0) {
+			if (settings.log_level >= LOG_LEVEL_NORMAL)
+				fprintf(stderr, "results: no output, setting notrun\n");
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

