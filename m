Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8270AF54AAF
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 13:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3334210E668;
	Tue, 24 Mar 2026 13:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVagUTgo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A1110E5D4
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774357982; x=1805893982;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y7075JMjsdyvR0Ddf5pz5jtYqGIcoV9cvFmtpKBtBhU=;
 b=IVagUTgo1w+HfTOVVIRQhFKT1bf6T4D6R564PQzxo6DUPKaiwh4iddFJ
 uj3848k9RfCxjvcV81LSkeRXiRJveNvMRmxNnKiPfQfN/2shR2Qk+34sH
 atvpGpwnwBjf2XJnJECr9auCJPvRE+Yx0hEACGHp/fUz884eo1V5zImGJ
 VkWzbc3PIMCWCyjXRQ3470XSxsUapHXdXVVW0pf7ivnnozV4mptySlM/v
 5aHOo9EkkZCrTFEzd/ZhJgR8Kj0wc75r51iGwvbDIgLP7Nw4AMxA83T9w
 M652kHP+84Kl7cNpXzVNx2chj9e2vXqsMfvi7obQlbkbGpVej2frCVvYZ g==;
X-CSE-ConnectionGUID: J/dXEJdDRh6r/nCWb4g2Vw==
X-CSE-MsgGUID: 8eDU1LHfRI2hJR1nVHGJbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74394787"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="74394787"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:12:56 -0700
X-CSE-ConnectionGUID: ZHNRmKOxSEq/oTZgz9plVw==
X-CSE-MsgGUID: GvCKkZsqRmOdaqRRRjag5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223563563"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.143])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:12:55 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v2 3/6] runner: Add attachments directory content in
 subtests results
Date: Tue, 24 Mar 2026 14:12:39 +0100
Message-ID: <20260324131235.712916-11-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
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

Files produced by hooks which lands in attachments directory should
be called in piglit style, what means they should be in form:

igt@test@subtest@@unique-filename-from-hook
igt@test@subtest@dynsubtest@@unique-filename-from-hook

depending is it normal subtest or dynamic subtest.

Hooks introduced IGT_HOOK_TEST_FULLNAME env variable, which contains

igt@test@subtest
igt@test@subtest@dynsubtest

and it should be used as prefix part (before '@@') of attachment
filename when hook script writes some content to it.

Such defined contract between hook script and resultgen allows to
distinguish subtest/dynsubtest attachments structure in results.json.
So string before '@@' is a subtest/dynsubtest name in results file,
and string after it is a unique key of a base64 file content added
to results.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
---
 runner/resultgen.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 29fc5cbb15..c4ebbd7b6e 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1142,6 +1142,100 @@ static bool fill_from_dmesg(int fd,
 	return true;
 }
 
+static char *get_base64(int dirfd, const char *filename)
+{
+	struct stat st;
+	int fd;
+	unsigned char *data;
+	char *base64 = NULL;
+
+	if (fstatat(dirfd, filename, &st, 0)) {
+		fprintf(stderr, "Can't stat %s\n", filename);
+		return NULL;
+	}
+
+	fd = openat(dirfd, filename, O_RDONLY);
+	if (fd < 0) {
+		fprintf(stderr, "Can't open %s\n", filename);
+		return NULL;
+	}
+
+	data = malloc(st.st_size);
+	if (!data) {
+		fprintf(stderr, "Cannot allocate %zu bytes for data buffer\n",
+			st.st_size);
+		goto err_alloc;
+	}
+
+	if (read(fd, data, st.st_size) != st.st_size) {
+		fprintf(stderr, "Cannot read %zu bytes from data buffer\n",
+			st.st_size);
+		goto err_read;
+	}
+
+	base64 = g_base64_encode(data, st.st_size);
+
+err_read:
+	free(data);
+err_alloc:
+	close(fd);
+
+	return base64;
+}
+
+static bool fill_from_attachments(int dirfd, struct json_t *tests)
+{
+	struct json_t *obj = NULL, *attobj = NULL;
+	char attname[32];
+	int atdir;
+	struct dirent *entry;
+	DIR *dir;
+
+	snprintf(attname, sizeof(attname), "%s", DIR_ATTACHMENTS);
+	if ((atdir = openat(dirfd, attname, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
+		fprintf(stderr, "Error opening '%s' dir\n", DIR_ATTACHMENTS);
+		return false;
+	}
+
+	dir = fdopendir(atdir);
+	if (!dir) {
+		close(atdir);
+		return false;
+	}
+
+	while ((entry = readdir(dir))) {
+		char *base64_data, *piglit_name, *p;
+
+		if (strcmp(entry->d_name, ".") == 0 ||
+		    strcmp(entry->d_name, "..") == 0)
+			continue;
+
+		piglit_name = strdup(entry->d_name);
+		p = strstr(piglit_name, "@@");
+		if (!p) {
+			free(piglit_name);
+			continue;
+		}
+		*p = '\0';
+		p += 2;
+
+		obj = get_or_create_json_object(tests, piglit_name);
+		attobj = get_or_create_json_object(obj, "attachments");
+
+		base64_data = get_base64(atdir, entry->d_name);
+		if (base64_data) {
+			json_object_set_new(attobj, p,
+					    escaped_json_stringn(base64_data, strlen(base64_data)));
+			free(base64_data);
+		}
+		free(piglit_name);
+	}
+
+	closedir(dir);
+
+	return true;
+}
+
 static const char *result_from_exitcode(int exitcode)
 {
 	switch (exitcode) {
@@ -2230,6 +2324,9 @@ static bool parse_test_directory(int dirfd,
 		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
 	}
 
+	if (!fill_from_attachments(dirfd, results->tests))
+		fprintf(stderr, "Error parsing attachments directory\n");
+
 	override_results(entry->binary, &subtests, results->tests);
 	prune_subtests(settings, entry, &subtests, results->tests);
 
-- 
2.43.0

