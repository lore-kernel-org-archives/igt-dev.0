Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4C2C0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD44B10E385;
	Thu, 30 Jan 2025 17:22:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpikFqkh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F9810E36D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738257735; x=1769793735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1zYrNgVj+QVxq5C4fnen8rvdz5YG2rjFYiSmETB+Cik=;
 b=EpikFqkh7g7/i3piTAWUFVIPFsqj4H9AF23DJI5X82kg7nEMdewYpf1s
 fc86+g9D8Iikze08ebUz6znvHOMPGyx18m8VXMPnvTErBb3jbSEl3nCrS
 yO/ObJloWJIYAJtPmMzLbb8bp4BGBH6sre/MP+NuYDyxmYdTwMLstpjs6
 NigOrRq5oDyMKZAeZ+ic8ogvfqobBF6Km9Qtsk84wDlDOs28SlB2z4T+n
 mAuTRSlMvW+AJu+AIBwnHJLd8DNHQ3MGcWvN9HJ3d4feIisD2O54mPtWT
 GuTMd/jNp63ynQ7Yt3MSJzZL5hmBYHVw0t9E6G3rYPCSWnEX9aFHWNZ+q A==;
X-CSE-ConnectionGUID: XLLA3w9JTBKTGLXVUEsVCg==
X-CSE-MsgGUID: UhQNBWOaRRe98PTdEgas7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42567081"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="42567081"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:12 -0800
X-CSE-ConnectionGUID: SL729KuJSNC3n0Cr9uv40g==
X-CSE-MsgGUID: M88b2NDgSyiHkcLdYmeirA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109539666"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 07/10] runner: Fix use of newline on arguments
Date: Thu, 30 Jan 2025 09:21:46 -0800
Message-ID: <20250130172149.3657144-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250130172149.3657144-1-lucas.demarchi@intel.com>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
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

For compatibility with previous parsing, it still prints "(null)" for
NULL pointers: ideally there would be nothing printed to avoid the
special case for this string.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/runner/settings.c b/runner/settings.c
index 693c5484e..b527c01d9 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1052,10 +1052,79 @@ static bool serialize_hook_strs(struct settings *settings, int dirfd)
 	return true;
 }
 
+/*
+ * Serialize @s to @f, escaping '\' and '\n'. See unescape_str()
+ */
+static void escape_str(const char *s, FILE *f)
+{
+	if (!s) {
+		fputs("(null)", f);
+		return;
+	}
+
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
+static size_t unescape_str(char *buf, size_t *n_src)
+{
+	size_t dst_len = 0;
+	char *s = buf;
+
+	while (*s) {
+		char next = *(s + 1);
+
+		if (*s != '\\') {
+			buf[dst_len++] = *s++;
+		} else if (*s == '\\' && next == 'x') {
+			s += 2;
+			buf[dst_len++] = strtoul(s, &s, 16);
+			if (*s != 'h') {
+				/* this shouldn't happen */
+				return 0;
+			}
+			s++;
+		} else {
+			return 0;
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
+#define SERIALIZE_STR(f, s, name) do {	\
+		fputs(#name " : ", f);	\
+		escape_str(s->name, f);	\
+		fputc('\n', f);		\
+	} while (0)
 bool serialize_settings(struct settings *settings)
 {
 	FILE *f;
@@ -1171,6 +1240,12 @@ static char *parse_str(char **val)
 {
 	char *ret = *val;
 
+	/*
+	 * Unescaping a string is guaranteed to produce a string that is
+	 * smaller or of the same size. Just modify it in place and leak the
+	 * buffer
+	 */
+	unescape_str(ret, NULL);
 	*val = NULL;
 
 	return ret;
-- 
2.48.0

