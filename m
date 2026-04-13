Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360EEF531CB
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 20:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF8C10E52D;
	Mon, 13 Apr 2026 20:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGG+I2kd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FA210E52D
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 20:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776111482; x=1807647482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JkxbPlYvveJKAQiSKvGlMZ/L5sAY8DGyK/+J6KQDLD4=;
 b=kGG+I2kdRksS7xDWonvQNcWbBCN/uVvIZXQ5WQ6/x1fGuR3ahqR6tZMq
 osFpFu+NbIjzozYGURi4Y2zgAmmzZ48E1tjxz9hOpOvaUebDDx6PFsg76
 qO3MhlgcRqPx/BnemvRBPkGLYrjXzkXMc91AzjlUs2zp6QtShukkU/jgU
 zVJ5zQ48+1QyJCxoPTsEdsxxCUNKx7pu0BNIL7Xq4/+EFSfJq32BECH6b
 2RBQRaGSeXk9K83aZnEOpMITWuD22Xx99eU5pw16n0Y5ecS3YvSwLMU8U
 mAKGP8hP2jLMSiPIIatzgWxhjdh+A4pEywb+5D3LQd3huu79fjFN/qjkA w==;
X-CSE-ConnectionGUID: jCToGXbeQUiPkbDUouQcYQ==
X-CSE-MsgGUID: V9AYJGW0SJCPGhMNsQVqkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80918949"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="80918949"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:18:01 -0700
X-CSE-ConnectionGUID: 3IflU1LiSaefXvkagOON4Q==
X-CSE-MsgGUID: UXKxlkmnTaO4fwEk6yQMUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="229816453"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.10])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:17:57 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v3 5/5] runner/resultgen: Insert attachments list into
 results.json
Date: Mon, 13 Apr 2026 22:17:28 +0200
Message-ID: <20260413201722.808673-12-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
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
 runner/resultgen.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index f8459385c3..d37f01a433 100644
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
@@ -1156,6 +1159,63 @@ static bool fill_from_dmesg(int fd,
 	return true;
 }
 
+struct json_t *tmp_tests;
+static int ftw_attachments_list(const char *fpath, const struct stat *sb,
+				int typeflag, struct FTW *ftwbuf)
+{
+	struct json_t *obj = NULL, *attobj = NULL;
+	(void)sb;
+	(void)ftwbuf;
+
+	if (typeflag == FTW_F) {
+		char *p;
+
+		p = strstr(fpath + 2, "/");
+		if (!p)
+			return -1;
+		*p = '\0'; /* temporary for acquiring the piglit name */
+		obj = get_or_create_json_object(tmp_tests, fpath + 2);
+		attobj = get_or_create_json_array(obj, "attachments");
+		*p = '/'; /* bring '/' back */
+		json_array_append_new(attobj, escaped_json_stringn(fpath + 2, strlen(fpath + 2)));
+	} else if (typeflag == FTW_DP) {
+		;
+	} else {
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
@@ -2244,6 +2304,9 @@ static bool parse_test_directory(int dirfd,
 		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
 	}
 
+	if (!fill_from_attachments(dirfd, results->tests))
+		fprintf(stderr, "Error parsing attachments directory\n");
+
 	override_results(entry->binary, &subtests, results->tests);
 	prune_subtests(settings, entry, &subtests, results->tests);
 
-- 
2.43.0

