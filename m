Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CD8CA5FFF
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 21:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E32210E6CC;
	Wed,  7 Oct 2026 21:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVcgnWlB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFF510E50D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 21:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791407199; x=1822943199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PZDefgGpU3au1LuXvMUDtz4wORXPCaQwJ5QJRKz+s8I=;
 b=UVcgnWlBCVP3PBTFfTg4aq8/MJKuLXfGkLQkr/km//Mn94o1Cf0PYgpI
 JmQw1Vqz3X8G64YT4p7b0cLa6rUAvzlIXjwjkYKfbmhcUvcwdQvu4i4fl
 V819UbdEw4YHMm9HalmhhBqYJNMLgki+yvcR5A2bZ/DvF4BJwiUCxRmtm
 VRxrFUGGU5PFLoAFwF75grN0RGP4WLm9VWvjKXYhasFL5v7G312mC0/vS
 OJBJ+82i2otp6ijnNAgZnBRXTauFTCW84LcG3kIo3LpI56yizL5iPzJP4
 jUbdzRdUSZkNUkwOvMLqsN/tGtcrTkR/AM+UFJFg8PM+DWea7FAzVO3rh Q==;
X-CSE-ConnectionGUID: HHn2ZWb0TjWIfKaaC2aM4w==
X-CSE-MsgGUID: IlfIeWf7QQG7pjq08Lkmag==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="190306"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="190306"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 14:06:39 -0700
X-CSE-ConnectionGUID: wI//XB7ETYaG+bgNYWewBg==
X-CSE-MsgGUID: cmiJxJF0QPC1cO1bkjT3cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; d="scan'208";a="280840237"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa004.jf.intel.com with ESMTP; 07 Oct 2026 14:06:37 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH 4/4] runner/resultgen: Decode kmsg escapes in ignored dmesg
 regex
Date: Wed,  7 Oct 2026 21:06:03 +0000
Message-Id: <20261007210603.1350158-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007210603.1350158-1-shuicheng.lin@intel.com>
References: <20261007210603.1350158-1-shuicheng.lin@intel.com>
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

igt_emit_ignore_dmesg_regex() passes the regex to igt_runner through
/dev/kmsg, which escapes '\' and non-printable characters as "\xNN".
resultgen compiles the ignore regex from the escaped record, so a regex
like "\(-ECANCELED\)" becomes "\x5c(-ECANCELED\x5c)", which requires a
literal backslash and silently never matches.

Factor the existing escape decoding out of
generate_formatted_dmesg_line() and apply it to the ignore regex before
compiling it. While at it, fix the bound check so that an escape at the
very end of the string is decoded too; dmesg lines always end with a
newline so it didn't matter before, but the ignore regex has it
stripped. Extend the dmesg-escapes json test to cover it.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 .../json_tests_data/dmesg-escapes/0/dmesg.txt |  2 +
 .../json_tests_data/dmesg-escapes/README.txt  |  4 ++
 .../dmesg-escapes/reference.json              |  2 +-
 runner/resultgen.c                            | 48 ++++++++++++-------
 4 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/runner/json_tests_data/dmesg-escapes/0/dmesg.txt b/runner/json_tests_data/dmesg-escapes/0/dmesg.txt
index a585c03a0..2f109f5d4 100644
--- a/runner/json_tests_data/dmesg-escapes/0/dmesg.txt
+++ b/runner/json_tests_data/dmesg-escapes/0/dmesg.txt
@@ -9,5 +9,7 @@
 6,954,3216186101159,-;Kernel shouldn't output this but cutoff escape \x1
 6,954,3216186101159,-;More cutoff \x
 6,954,3216186101159,-;One more \
+14,954,3216186101159,-;[IGT] add ignored dmesg regex: \x5c(-ECANCELED\x5c) .* GT: reset failed
+3,954,3216186101159,-;xe 0000:03:00.0: [drm] *ERROR* SIGID=106 FATAL (-ECANCELED) Tile0: GT0: GT: reset failed
 14,955,3216186101160,-;[IGT] successtest: exiting, ret=0
 6,956,3216186101299,-;Console: switching to colour frame buffer device 240x75
diff --git a/runner/json_tests_data/dmesg-escapes/README.txt b/runner/json_tests_data/dmesg-escapes/README.txt
index fbb7c6c40..9e37f9315 100644
--- a/runner/json_tests_data/dmesg-escapes/README.txt
+++ b/runner/json_tests_data/dmesg-escapes/README.txt
@@ -2,3 +2,7 @@ Unprintable characters in kernel logs, when read via /dev/kmsg, are
 escaped as \xNN where NN the character's ascii code in hex. Those are
 expected to be decoded to results, if they really are
 printable. Kernel's idea of nonprintable is "c < 0x20 || c > 127".
+
+The same applies to regexes from igt_emit_ignore_dmesg_regex(), which
+also go through /dev/kmsg; \x5c must be decoded before the regex is
+compiled so that the error line it matches is ignored.
diff --git a/runner/json_tests_data/dmesg-escapes/reference.json b/runner/json_tests_data/dmesg-escapes/reference.json
index fc1fbd264..0af698fc2 100644
--- a/runner/json_tests_data/dmesg-escapes/reference.json
+++ b/runner/json_tests_data/dmesg-escapes/reference.json
@@ -20,7 +20,7 @@
         "end":0
       },
       "err":"Starting subtest: first-subtest\nSubtest first-subtest: SUCCESS (0.000s)\n",
-	"dmesg":"<6> [3216186.095083] Console: switching to colour dummy device 80x25\n<6> [3216186.095097] [IGT] successtest: executing\n<6> [3216186.101115] [IGT] successtest: starting subtest first-subtest\n<6> [3216186.101159] String with a\nnewline\n<6> [3216186.101159] String with a\ttab\n<6> [3216186.101159] String with an explicit\\x00NUL\n<6> [3216186.101159] The character \\x13 should be nonprintable\n<6> [3216186.101159] Escaped backslash is \\\n<6> [3216186.101159] Kernel shouldn't output this but cutoff escape \\x1\n<6> [3216186.101159] More cutoff \\x\n<6> [3216186.101159] One more \\\n<6> [3216186.101160] [IGT] successtest: exiting, ret=0\n<6> [3216186.101299] Console: switching to colour frame buffer device 240x75\n"
+	"dmesg":"<6> [3216186.095083] Console: switching to colour dummy device 80x25\n<6> [3216186.095097] [IGT] successtest: executing\n<6> [3216186.101115] [IGT] successtest: starting subtest first-subtest\n<6> [3216186.101159] String with a\nnewline\n<6> [3216186.101159] String with a\ttab\n<6> [3216186.101159] String with an explicit\\x00NUL\n<6> [3216186.101159] The character \\x13 should be nonprintable\n<6> [3216186.101159] Escaped backslash is \\\n<6> [3216186.101159] Kernel shouldn't output this but cutoff escape \\x1\n<6> [3216186.101159] More cutoff \\x\n<6> [3216186.101159] One more \\\n<6> [3216186.101159] [IGT] add ignored dmesg regex: \\(-ECANCELED\\) .* GT: reset failed\n<3> [3216186.101159] xe 0000:03:00.0: [drm] *ERROR* SIGID=106 FATAL (-ECANCELED) Tile0: GT0: GT: reset failed\n<6> [3216186.101160] [IGT] successtest: exiting, ret=0\n<6> [3216186.101299] Console: switching to colour frame buffer device 240x75\n"
     }
   },
   "totals":{
diff --git a/runner/resultgen.c b/runner/resultgen.c
index f5a91f542..127d8a9e8 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -877,6 +877,33 @@ static void clean_regex(GRegex **re)
 	*re = NULL;
 }
 
+/*
+ * Decode the "\\xNN" escapes that /dev/kmsg uses for '\\' and non-printable
+ * characters. @dst may be the same as @src, as the decoded string is never
+ * longer than the original.
+ */
+static void decode_kmsg_escapes(char *dst, const char *src)
+{
+	size_t len = strlen(src);
+	const char *p;
+
+	for (p = src; *p; p++, dst++) {
+		if (p - src + 3 < len &&
+		    p[0] == '\\' && p[1] == 'x') {
+			int c = 0;
+			/* newline and tab are not isprint(), but they are isspace() */
+			if (sscanf(p, "\\x%2x", &c) == 1 &&
+			    (isprint(c) || isspace(c))) {
+				*dst = c;
+				p += 3;
+				continue;
+			}
+		}
+		*dst = *p;
+	}
+	*dst = '\0';
+}
+
 static void add_ignored_regex(GRegex **re, char *src)
 {
 	char *s;
@@ -885,6 +912,9 @@ static void add_ignored_regex(GRegex **re, char *src)
 	if (s)
 		*s = 0;
 
+	/* The regex was emitted via /dev/kmsg, undo its escaping */
+	decode_kmsg_escapes(src, src);
+
 	if (*re)
 		g_regex_unref(*re);
 
@@ -929,7 +959,6 @@ static void generate_formatted_dmesg_line(char *message,
 	char prefix[512];
 	size_t messagelen;
 	size_t prefixlen;
-	char *p, *f;
 
 	snprintf(prefix, sizeof(prefix),
 		 "<%u> [%llu.%06llu] ",
@@ -947,22 +976,7 @@ static void generate_formatted_dmesg_line(char *message,
 	*formatted = malloc(strlen(prefix) + messagelen + 1);
 	strcpy(*formatted, prefix);
 
-	f = *formatted + prefixlen;
-	for (p = message; *p; p++, f++) {
-		if (p - message + 4 < messagelen &&
-		    p[0] == '\\' && p[1] == 'x') {
-			int c = 0;
-			/* newline and tab are not isprint(), but they are isspace() */
-			if (sscanf(p, "\\x%2x", &c) == 1 &&
-			    (isprint(c) || isspace(c))) {
-				*f = c;
-				p += 3;
-				continue;
-			}
-		}
-		*f = *p;
-	}
-	*f = '\0';
+	decode_kmsg_escapes(*formatted + prefixlen, message);
 }
 
 static void add_dmesg(struct json_t *obj,
-- 
2.43.0

