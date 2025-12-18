Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FC7D6E2BF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 17:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7846610E42E;
	Thu, 18 Dec 2025 17:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXkNPbFs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4593410E42E
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766080019; x=1797616019;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=itvYOcHKTe7HH853/TNEG58jni6leQnXE193uOC73zY=;
 b=fXkNPbFsF4UyLFMRAh5haXcvMMLlRXBa08/Cv6Q4SVlyvGtuFHFnA9ld
 qrV9uDCUMnQhfXqCTwF0DNRn80R5B/zclrEg0gtYYBjoEB1FwpRvPxoFU
 2I+J67CcqDnAjk1+LoDIevdkLdwtATTcpJrvU+K7lElDuVuGyGt0ewXAT
 3ec8SKQHkXik1c833jZBTzEJyO68ZlHHoCFqTEtKMd3wae1i2nws4piee
 sPED4cFKoeLJk7IJEJJXI4sJYc9jI5SXe1NovQ7oeoS0bRxPp/7pXU58e
 HWzz5FBXl+0JVQv7uEnmtTKtw4eU3wAq9/zgfuPKCeVpKXRbVjHPy6XkJ w==;
X-CSE-ConnectionGUID: jEPUUNBlQ9+EZicQ5QdnQQ==
X-CSE-MsgGUID: tE2WxnWwT4SrDE6EyVBPpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67933054"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="67933054"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 09:46:58 -0800
X-CSE-ConnectionGUID: XyOoRx7wTdWpRscAf8FKtA==
X-CSE-MsgGUID: PckPDX76ShazabFhAvnFqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="197908008"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.111])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 09:46:56 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mateusz Grabski <mateusz.grabski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>
Subject: [PATCH i-g-t] RFC: runner/results: Allow generate partial json
Date: Thu, 18 Dec 2025 18:46:50 +0100
Message-ID: <20251218174650.120788-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

When json-c hits 2GB barrier it fails to generate results.json:

resultgen: Failed to create json representation of the results.
           This usually means that the results are too big

Allow to select start and end folder for generation, so it could
be done if a few steps, for example when there are 0...5432
output folders, it could be done with:

./igt_results /path/to/results 0 3000
mv /path/to/results/results.json /path/to/results/results-0-3000.json

./igt_results /path/to/results 3001 5432
mv /path/to/results/results.json /path/to/results/results-3001-5432.json

Cc: Mateusz Grabski <mateusz.grabski@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Ryszard Knop <rk@dragonic.eu>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 25 +++++++++++++++++++++----
 runner/resultgen.h |  2 +-
 runner/results.c   | 31 +++++++++++++++++++++++++++++--
 3 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 1f7e79f24..5e0f5d320 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -47,6 +47,9 @@ struct results
 	struct json_object *runtimes;
 };
 
+static int r_start = -1;
+static int r_end = -1;
+
 static void add_dynamic_subtest(struct subtest *subtest, char *dynamic)
 {
 	size_t len = strlen(dynamic);
@@ -2309,6 +2312,7 @@ struct json_object *generate_results_json(int dirfd)
 	struct results results;
 	int testdirfd, fd;
 	size_t i;
+	size_t tests_count;
 
 	init_settings(&settings);
 	init_job_list(&job_list);
@@ -2379,7 +2383,17 @@ struct json_object *generate_results_json(int dirfd)
 	 * - options
 	 */
 
-	for (i = 0; i < job_list.size; i++) {
+	i = r_start == -1 ? 0 : (size_t)r_start;
+
+	tests_count = r_end == -1 ? job_list.size : (size_t)r_end;
+	if (tests_count > job_list.size)
+		tests_count = job_list.size;
+
+	fprintf(stderr, "Number of tests for parsing: %ld\n", job_list.size);
+	if (r_start != -1 || r_end != -1)
+		fprintf(stderr, "Parsing only partial results, from %ld to %ld\n", i, tests_count);
+
+	for (; i < tests_count; i++) {
 		char name[16];
 
 		snprintf(name, 16, "%zd", i);
@@ -2434,12 +2448,15 @@ struct json_object *generate_results_json(int dirfd)
 	return obj;
 }
 
-bool generate_results(int dirfd)
+bool generate_results(int dirfd, int start, int end)
 {
-	struct json_object *obj = generate_results_json(dirfd);
+	struct json_object *obj;
 	const char *json_string;
 	int resultsfd;
 
+	r_start = start;
+	r_end = end;
+	obj = generate_results_json(dirfd);
 	if (obj == NULL)
 		return false;
 
@@ -2475,5 +2492,5 @@ bool generate_results_path(char *resultspath)
 	if (dirfd < 0)
 		return false;
 
-	return generate_results(dirfd);
+	return generate_results(dirfd, -1, -1);
 }
diff --git a/runner/resultgen.h b/runner/resultgen.h
index ab0bf1082..14ae96a54 100644
--- a/runner/resultgen.h
+++ b/runner/resultgen.h
@@ -3,7 +3,7 @@
 
 #include <stdbool.h>
 
-bool generate_results(int dirfd);
+bool generate_results(int dirfd, int start, int end);
 bool generate_results_path(char *resultspath);
 
 struct json_object *generate_results_json(int dirfd);
diff --git a/runner/results.c b/runner/results.c
index 3eb7cb155..62ae8a1c0 100644
--- a/runner/results.c
+++ b/runner/results.c
@@ -9,6 +9,7 @@
 int main(int argc, char **argv)
 {
 	int dirfd;
+	int start, end;
 
 	if (argc < 2)
 		exit(1);
@@ -17,10 +18,36 @@ int main(int argc, char **argv)
 	if (dirfd < 0)
 		exit(1);
 
-	if (generate_results(dirfd)) {
-		printf("Results generated\n");
+	if (argc == 3) {
+		start = 0;
+		end = atoi(argv[2]);
+		if (end >= 0)
+			++end;
+	} else if (argc == 4) {
+		start = atoi(argv[2]);
+		end = atoi(argv[3]);
+		if (end >= 0)
+			++end;
+	} else {
+		start = -1;
+		end = -1;
+	}
+
+	if (start < -1 || end < -1) {
+		printf("Error: start and end options should be numbers >= 0\n");
+		start = -1;
+		end = -1;
+	}
+
+	if (generate_results(dirfd, start, end)) {
+		if (start >= 0)
+			printf("Results generated from %d to %d\n", start, end);
+		else
+			printf("Results generated\n");
 		exit(0);
 	}
 
+	if (start >= 0)
+		printf("Error: cannot generate results from %d to %d\n", start, end);
 	exit(1);
 }
-- 
2.52.0

