Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E10ECD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 07:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1B9112F2A;
	Mon,  1 Jun 2026 07:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJk7Answ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DE3112F21
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 07:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780300328; x=1811836328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9NcBddlZlFEjRVeZ6MR2wxWy+/tQ0aHuSetQu9ENXbo=;
 b=oJk7AnswJ9j53WCH3Dzg8KxpmqDK9Ftyx30OqwUjX3YlvN/hA0fPAFkx
 Q7/gYXYBGcHSlm06WHAvNgU2EswpeZx1goqFDd0vw5ItkQ8oUs2EpFXVJ
 Ba5dhlIJB0hg6KqLhOxp+/BDzjDywGIgCagFj/OEZowQ7lRQj4jXngK3M
 BZU688PCuJBvwLpOEpGMMf/zT5IL6/D+r3OS0CXoCD4MEANtee133iza5
 JvTO/3W4EgAsdUKjC0R9ftlhfTqziuE3vfmgjbcouH29cgR7yHOjR6+pA
 2JCWSI1JEY8vHbZFYTIvhnqYSU1H6ldq/kIHaJ062cLnzkpZBNwGHgjHU Q==;
X-CSE-ConnectionGUID: 3JKuZIuERseK6OPjcdWm7g==
X-CSE-MsgGUID: F2c9E+iCQMCWEn0uAUeUKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="98619038"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="98619038"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 00:52:07 -0700
X-CSE-ConnectionGUID: lVEHVd06T/qxI2LVtOorGg==
X-CSE-MsgGUID: 27iHz8SYS8WynR47+o8Idw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="243332073"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.64])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 00:52:06 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v3 4/4] runner/resultgen: Insert attachments list into
 results.json
Date: Mon,  1 Jun 2026 09:51:48 +0200
Message-ID: <20260601075143.187633-10-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601075143.187633-6-zbigniew.kempczynski@intel.com>
References: <20260601075143.187633-6-zbigniew.kempczynski@intel.com>
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
Absolute path to attachment directory was added to results.json
as this is necessary to build full path to attachment file related to
test/subtest name.

Due to lack of userdata pointer in nftw() implementation main json
object is passed via temporary static variable. It shouldn't be the
problem because results.json is created in single thread. This change
is not too elegant but allows to minimize the code change and is
much easier to read comparing to recursive readdir().

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Reviewed-by: Ryszard Knop <ryszard.knop@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

---
v3: Comment nftw() processing
---
 runner/resultgen.c | 96 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 29fc5cbb15..a1938b3f65 100644
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
@@ -1142,6 +1158,83 @@ static bool fill_from_dmesg(int fd,
 	return true;
 }
 
+static struct json_t *tmp_tests;
+static int ftw_attachments_list(const char *fpath, const struct stat *sb,
+				int typeflag, struct FTW *ftwbuf)
+{
+	struct json_t *obj = NULL, *attobj = NULL;
+
+	(void)sb;
+	(void)ftwbuf;
+
+	switch (typeflag) {
+	/*
+	 * There're two keys set/updated here:
+	 * - attachments-dir - absolute path to results
+	 * - attachments - list of files relative to attachments-dir
+	 *
+	 * nftw() call uses "." as traversed directory, so fpath looks like:
+	 * ./igt@xe_exec_basic@once-basic@rcs0/current-date.txt
+	 *
+	 * To extract piglit test name (igt@xe_exec_basic@once-basic@rcs0
+	 * in this case) we have to start from fpath + 2 and finish at the '/'.
+	 * Instead of duplicating string we temporarily overwrite '/' with '\0'.
+	 */
+	case FTW_F:
+		const char *attdirkey = "attachments-dir";
+		char *p, *currpath = (char *) fpath + 2;
+		char currdir[PATH_MAX];
+
+		p = strstr(currpath, "/");
+		if (!p)
+			return -1;
+		*p = '\0'; /* temporary for acquiring the piglit name */
+		obj = get_or_create_json_object(tmp_tests, currpath);
+		attobj = get_or_create_json_array(obj, "attachments");
+		*p = '/'; /* bring '/' back */
+		json_array_append_new(attobj, escaped_json_stringn(currpath, strlen(currpath)));
+		if (getcwd(currdir, PATH_MAX) && !json_object_get(obj, attdirkey))
+			json_object_set_new(obj, attdirkey,
+					    escaped_json_stringn(currdir, strlen(currdir)));
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
@@ -2230,6 +2323,9 @@ static bool parse_test_directory(int dirfd,
 		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
 	}
 
+	if (!fill_from_attachments(dirfd, results->tests))
+		fprintf(stderr, "Error parsing attachments directory\n");
+
 	override_results(entry->binary, &subtests, results->tests);
 	prune_subtests(settings, entry, &subtests, results->tests);
 
-- 
2.54.0

