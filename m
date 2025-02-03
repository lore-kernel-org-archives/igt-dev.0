Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296D7C02192
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 18:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB8E10E087;
	Mon,  3 Feb 2025 18:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6aj2OpD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14D510E087
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 18:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738606931; x=1770142931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gFffuY90jmKMFP7qdqnZqH4h9cftSaKM0rRKof+u1O0=;
 b=Q6aj2OpDqsYxMgVXl/MsXgvgT6sGt9/1P0LudL9h+EYLLTyORWhvfa2C
 STOv6uPpvGz/jPTVQUGRNeNmAFvVUupl7nTM8LFK9zWHj1F+M+NgBdywf
 0AQZsC2sVoEUaDrxHOD4Bw38RHAFQ4mH/HQRQBc9+RNkqToFTEvHyWq1P
 4gvFB2oK/H1MAKGtm4yCOVTcCQAMawj9yEK6nPbQDl0gcCa2+B26MmJYt
 wpA1/uGHbZzyvihp/Gv5ssDdv8SQ1hEDpMJIys8QFFGxG5HNx0l3ojKIO
 az1ZiCCsn96pZ39NJTq64+OqS5lqTL6MBJIQu3A35mrcKuVfgDE8jHNtt g==;
X-CSE-ConnectionGUID: fbn0jb6qSxWJ9YdjDvGtVQ==
X-CSE-MsgGUID: jKquxH8oTjykCnMqZQlfVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38820093"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="38820093"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 10:22:11 -0800
X-CSE-ConnectionGUID: yTI1/a8VQkyemdbOUNENlQ==
X-CSE-MsgGUID: SPoPpSyjTf2DKBaTc2KolA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="110923761"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 10:22:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 07/10] runner: Fix use of newline on arguments
Date: Mon,  3 Feb 2025 10:09:04 -0800
Message-ID: <20250203182141.617229-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <yeb7toxw7aqtrwlncbuhsuhdlpmckwve2iwhz2crep62fqdifn@by2yiutcan4f>
References: <yeb7toxw7aqtrwlncbuhsuhdlpmckwve2iwhz2crep62fqdifn@by2yiutcan4f>
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

Currently there's no support for newlines on arguments passed to runner.
However it's also a silent failure:

	# igt_runner --test-list '/tmp/test
	list2.txt' build/tests/ /tmp/results

	# head /tmp/results/metadata.txt
	disk_usage_limit : 0
	test_list : /tmp/test
	list2.txt
	name : results
	...

	# ./build/runner/igt_resume /tmp/results
	[9840425.334900] All tests already executed.
	resume failed at generating results
	Done.

Embedding a newline like this is very dubious for test-list, but it's
used for e.g. hooks. In future we will add the command line to the
metadata and possibly migrate the hooks, so add support for
escaping/unescaping the string on save/restore.

The method chosen is slightly different than the one used for hooks:
instead of adding a escape char and keeping the char escaped, this just
prefers using an hex representation of the char with a \x<HEX>h
sequence. This makes it easier when unescaping since the reader can
continue reading one line per iteration. In future this can also be
adopted by the hooks or even migrating the hooks to use metadata.txt.

Another fix is that now we just skip null values on the serialization
side.  Previously it would serialize "(null)" and then load that string
instead of NULL. Add code_coverage_script to the runner_test to cover
that, which would previously fail.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

- Fix NULL string (bug already present)
- Add sanity check on the unescape_str() side to differentiate invalid
  from empty strings. Now unescape_str() returns negative in cases of
  error and there's better validation for the escaped char

 runner/runner_tests.c |  1 +
 runner/settings.c     | 85 +++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 8441763f2..93b3ebc9f 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -200,6 +200,7 @@ static void assert_settings_equal(struct settings *one, struct settings *two)
 	igt_assert_eq(one->use_watchdog, two->use_watchdog);
 	igt_assert_eqstr(one->test_root, two->test_root);
 	igt_assert_eqstr(one->results_path, two->results_path);
+	igt_assert_eqstr(one->code_coverage_script, two->code_coverage_script);
 	igt_assert_eq(one->piglit_style_dmesg, two->piglit_style_dmesg);
 	igt_assert_eq(one->dmesg_warn_level, two->dmesg_warn_level);
 	igt_assert_eq(one->prune_mode, two->prune_mode);
diff --git a/runner/settings.c b/runner/settings.c
index 693c5484e..03402a385 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -7,6 +7,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <getopt.h>
+#include <inttypes.h>
 #include <libgen.h>
 #include <limits.h>
 #include <stdio.h>
@@ -1052,10 +1053,80 @@ static bool serialize_hook_strs(struct settings *settings, int dirfd)
 	return true;
 }
 
+/*
+ * Serialize @s to @f, escaping '\' and '\n'. See unescape_str()
+ */
+static void escape_str(const char *s, FILE *f)
+{
+	while (*s) {
+		size_t len = strcspn(s, "\\\n");
+
+		if (len > 0) {
+			fwrite(s, len, 1, f);
+			s += len;
+		}
+
+		if (*s) {
+			fprintf(f, "\\x%xh", *s);
+			s++;
+		}
+	}
+}
+
+/*
+ * Unescape a '\' and '\n': undo escape_str
+ *
+ * Exacpe chars using the form '\x<hex>h' so they don't interfere with the line
+ * parser.
+ *
+ * Return the number of chars saved in buf and optionally
+ * the number of chars scanned in @n_src if that is non-nul.
+ */
+static ssize_t unescape_str(char *buf, size_t *n_src)
+{
+	size_t dst_len = 0;
+	char *s = buf;
+
+	while (*s) {
+		char next = *(s + 1);
+
+		if (*s != '\\') {
+			buf[dst_len++] = *s++;
+		} else if (next == 'x') {
+			unsigned long num;
+
+			s += 2;
+
+			num = strtoul(s, &s, 16);
+			/* cover both error due to overflow or invalid char */
+			if (num > UINT8_MAX || *s != 'h')
+				return -EINVAL;
+
+			buf[dst_len++] = num;
+			s++;
+		} else {
+			return -EINVAL;
+		}
+	}
+
+	buf[dst_len] = '\0';
+
+	if (n_src)
+		*n_src = s - buf;
+
+	return dst_len;
+}
+
 #define SERIALIZE_LINE(f, s, name, fmt) fprintf(f, "%s : " fmt "\n", #name, s->name)
 #define SERIALIZE_INT(f, s, name) SERIALIZE_LINE(f, s, name, "%d")
 #define SERIALIZE_UL(f, s, name) SERIALIZE_LINE(f, s, name, "%lu")
-#define SERIALIZE_STR(f, s, name) SERIALIZE_LINE(f, s, name, "%s")
+#define SERIALIZE_STR(f, s, name) do {		\
+		if (s->name) {			\
+			fputs(#name " : ", f);	\
+			escape_str(s->name, f);	\
+			fputc('\n', f);		\
+		}				\
+	} while (0)
 bool serialize_settings(struct settings *settings)
 {
 	FILE *f;
@@ -1171,9 +1242,17 @@ static char *parse_str(char **val)
 {
 	char *ret = *val;
 
-	*val = NULL;
+	/*
+	 * Unescaping a string is guaranteed to produce a string that is
+	 * smaller or of the same size. Just modify it in place and leak the
+	 * buffer
+	 */
+	if (unescape_str(ret, NULL) >= 0) {
+		*val = NULL;
+		return ret;
+	}
 
-	return ret;
+	return NULL;
 }
 
 #define PARSE_LINE(s, name, val, field, _f)	\
-- 
2.48.1

