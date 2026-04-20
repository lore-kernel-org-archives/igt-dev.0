Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E87F557EC
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 08:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D64410F4A6;
	Mon, 20 Apr 2026 08:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQyAy+Rd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C9710F4A7
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 08:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776675435; x=1808211435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dCsQjBmX9bVYWaGdTQDcPEtAJRFg30RAacuZ+C9BdbQ=;
 b=YQyAy+Rd6WdT8+C1jW/07eyxGRDSMNYYN656UkCB5jQScptXfLNVlANZ
 5G05IsQFoDj9Xoy9rHatcqE/bKTRa9vRWByHjhbLXn2ncgxIDkKouq1Li
 AqHiZAaNL5mPMlsfo9lKTai/Pof1IBQxFjFjw/wXZrWxJWCXrtfkssK49
 UBEIcrf9OY4vKdpj3zxxcUWfCZV/fZO0OoP1ldD3GRE+ZZ5fKQoko+JoF
 LeVFfMtTx9X++mjuYOG/MOrgvDar9s33pEdJrOZZ0G8tmYnMoE+J6bLLr
 wvc09v8YEfE+OeIIPWPZBWSobgvvpZcmHLDIwv5CpjsG0IxDxi4iehsjJ A==;
X-CSE-ConnectionGUID: EQVWeZ2XRZ65c1fVpNfDuA==
X-CSE-MsgGUID: shgOiAY2QPWb4E13/8Yh+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76613861"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="76613861"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 01:57:15 -0700
X-CSE-ConnectionGUID: VPNumBM8RJK3cHtwNrOFMQ==
X-CSE-MsgGUID: t1+rA8+3SVmx7Esv4AA+yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="231539729"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 01:57:13 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v4 4/4] runner/resultgen: Insert attachments list into
 results.json
Date: Mon, 20 Apr 2026 10:56:58 +0200
Message-ID: <20260420085653.2587750-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420085653.2587750-6-zbigniew.kempczynski@intel.com>
References: <20260420085653.2587750-6-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add list of filenames which were created by hooks in attachments directory
(like GuC log copy) to results.json for allow presenting it in CI.

Due to lack of userdata pointer in nftw() implementation main json
object is passed via temporary static variable. It shouldn't be the
problem because results.json is created in single thread. This change
is not too elegant but allows to minimize the code change and is
much easier to read comparing to recursive readdir().

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
---
v4: use switch/case (Gustavo)
---
 runner/resultgen.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 29fc5cbb15..34253bc735 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1,11 +1,14 @@
 #include <assert.h>
 #include <ctype.h>
+#include <dirent.h>
 #include <fcntl.h>
+#include <ftw.h>
 #include <inttypes.h>
 #include <stdio.h>
 #include <string.h>
 #include <sys/mman.h>
 #include <sys/stat.h>
+#include <sys/types.h>
 #include <unistd.h>
 
 #include <jansson.h>
@@ -271,6 +274,19 @@ static struct json_t *get_or_create_json_object(struct json_t *base, const char
 	return ret;
 }
 
+static struct json_t *get_or_create_json_array(struct json_t *base, const char *key)
+{
+	struct json_t *ret = json_object_get(base, key);
+
+	if (ret)
+		return ret;
+
+	ret = json_array();
+	json_object_set_new(base, key, ret);
+
+	return ret;
+}
+
 static void set_result(struct json_t *obj, const char *result)
 {
 	if (!result)
@@ -1142,6 +1158,66 @@ static bool fill_from_dmesg(int fd,
 	return true;
 }
 
+struct json_t *tmp_tests;
+static int ftw_attachments_list(const char *fpath, const struct stat *sb,
+				int typeflag, struct FTW *ftwbuf)
+{
+	struct json_t *obj = NULL, *attobj = NULL;
+
+	(void)sb;
+	(void)ftwbuf;
+
+	switch (typeflag) {
+	case FTW_F:
+		char *p, *currpath = (char *) fpath + 2;
+
+		p = strstr(currpath, "/");
+		if (!p)
+			return -1;
+		*p = '\0'; /* temporary for acquiring the piglit name */
+		obj = get_or_create_json_object(tmp_tests, currpath);
+		attobj = get_or_create_json_array(obj, "attachments");
+		*p = '/'; /* bring '/' back */
+		json_array_append_new(attobj, escaped_json_stringn(currpath, strlen(currpath)));
+		break;
+	case FTW_DP:
+		break;
+	default:
+		return -1;
+	}
+
+	return 0;
+}
+
+static bool fill_from_attachments(int idirfd, struct json_t *tests)
+{
+	char attname[32];
+	int attdirfd;
+	DIR *currdir;
+	int ret;
+
+	snprintf(attname, sizeof(attname), "%s", DIR_ATTACHMENTS);
+	if ((attdirfd = openat(idirfd, attname, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
+		fprintf(stderr, "Error opening '%s' dir\n", DIR_ATTACHMENTS);
+		return false;
+	}
+
+	currdir = opendir(".");
+	fchdir(attdirfd);
+
+	/*
+	 * ftw doesn't support passing user data so *tests has to be
+	 * set to some global for being visible in callback function.
+	 * As results.json is not processed in multiple threads it is
+	 * not a big problem.
+	 */
+	tmp_tests = tests;
+	ret = nftw(".", ftw_attachments_list, 4, FTW_PHYS | FTW_DEPTH);
+	fchdir(dirfd(currdir));
+
+	return ret ? false : true;
+}
+
 static const char *result_from_exitcode(int exitcode)
 {
 	switch (exitcode) {
@@ -2230,6 +2306,9 @@ static bool parse_test_directory(int dirfd,
 		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
 	}
 
+	if (!fill_from_attachments(dirfd, results->tests))
+		fprintf(stderr, "Error parsing attachments directory\n");
+
 	override_results(entry->binary, &subtests, results->tests);
 	prune_subtests(settings, entry, &subtests, results->tests);
 
-- 
2.43.0

