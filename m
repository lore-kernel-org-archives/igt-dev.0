Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58C9D44C41
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 12:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683AE10E74B;
	Thu, 15 Jan 2026 12:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCuOddlZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5023D10E74B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 12:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768481869; x=1800017869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g/JtzT5fFvqqJNea8lO1ILpR5wxcjJ/IGn9IySMHmqQ=;
 b=BCuOddlZMlZgB9HN6NAwyj0IgwWNQ56ULl0dOv6qRLJ2i0bMhIMv1PPW
 fEdfbZqNzNu8Kkm9d1kQB2RF5CZXkUSf8DnCJDlFQ5opjemtI/sgyZHy/
 GAsRtlZUpvSCtfmUAlW3J9fCcRH5P8gjbW2KWxG524MLQdAy5udmuyuzw
 LQlyPrWCIUxCjW8YjSzSUN44ZSgygnczNXSwib3CcPAsXUbgutmmafZMS
 Y2LrTtqLzfXr9yjvPIEgLtiIbOKCGegPMP3jdeOOX8B10Edn+KGoZUdZS
 ycz41swZ29vSqs9qvt6tzXTHX8mquopRl2Aj/X/RTiijR1hh/A327BFGx g==;
X-CSE-ConnectionGUID: QXkK2xdcS/KItcUSHQYcqw==
X-CSE-MsgGUID: FxGn+9/6RcKAHti+mHCV1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73628839"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="73628839"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 04:57:49 -0800
X-CSE-ConnectionGUID: ESIrtJhKQfSagqL2M3QSQg==
X-CSE-MsgGUID: v5GcpvTTRmyTcmTYAnlhdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204093193"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.21])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:57:47 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mateusz Grabski <mateusz.grabski@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>
Subject: [PATCH i-g-t v2 2/4] runner: implement dmesg reduction for successful
 case
Date: Thu, 15 Jan 2026 13:57:30 +0100
Message-ID: <20260115125732.20542-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115125732.20542-1-kamil.konieczny@linux.intel.com>
References: <20260115125732.20542-1-kamil.konieczny@linux.intel.com>
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

Create a way for reduction of dmesg size in a successful case,
when there are no kernel warnings detected.  Get the beginning
and the end of a log and also indicate that it was reduced.

Cc: Mateusz Grabski <mateusz.grabski@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Ryszard Knop <rk@dragonic.eu>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 97 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 12 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 1f7e79f24..6080ddc0e 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -961,9 +961,9 @@ static void generate_formatted_dmesg_line(char *message,
 	*f = '\0';
 }
 
-static void add_dmesg(struct json_object *obj,
-		      const char *dmesg, size_t dmesglen,
-		      const char *warnings, size_t warningslen)
+static void __add_dmesg(struct json_object *obj,
+			const char *dmesg, size_t dmesglen,
+			const char *warnings, size_t warningslen)
 {
 	json_object_object_add(obj, "dmesg",
 			       new_escaped_json_string(dmesg, dmesglen));
@@ -974,6 +974,72 @@ static void add_dmesg(struct json_object *obj,
 	}
 }
 
+static void add_dmesg(struct json_object *obj,
+		      size_t reduced_dmesg_size,
+		      const char *dmesg, size_t dmesglen,
+		      const char *warnings, size_t warningslen)
+{
+	static const char *middleinfo = "...dmesg reduced\n";
+	char *reduced, *middle;
+	const char *p, *lastp, *end;
+	size_t len, lastlen, rsize, half;
+
+	if (warnings || !reduced_dmesg_size || dmesglen <= reduced_dmesg_size)
+		return __add_dmesg(obj, dmesg, dmesglen, warnings, warningslen);
+
+	end = dmesg + dmesglen;
+
+	rsize = reduced_dmesg_size + 256;
+	reduced = malloc(rsize); /* +256 for last message */
+	if (!reduced) {
+		fprintf(stderr, "resultgen: malloc error, no reduction\n");
+		return __add_dmesg(obj, dmesg, dmesglen, warnings, warningslen);
+	}
+
+	half = reduced_dmesg_size / 2;
+	memcpy(reduced, dmesg, half);
+
+	for (p = reduced + half - 1; p > reduced; --p)
+		if (*p == '\n')
+			break;
+	for (; p > reduced; --p)
+		if (*p == '\n')
+			break;
+
+	if (p == reduced)
+		p = reduced + half;
+	if (*p == '\n')
+		p++;
+
+	len = p - reduced;
+
+	memcpy(reduced + len, middleinfo, strlen(middleinfo));
+	len += strlen(middleinfo);
+	middle = reduced + len;
+
+	for (p = dmesg + (dmesglen - half); p < end; p++)
+		if (*p == '\n')
+			break;
+
+	if (p == end)
+		lastp = dmesg + (dmesglen - half);
+	else
+		lastp = p + 1;
+
+	lastlen = end - lastp;
+	memcpy(middle, lastp, lastlen);
+	middle += lastlen;
+	len += lastlen;
+
+	/* add also last message to inform about reduction */
+	len += sprintf(middle, "...dmesg reduced from %ld to %ld\n", dmesglen, len);
+	fprintf(stderr, "resultgen: dmesg reduced from %ld to %ld\n", dmesglen, len);
+	json_object_object_add(obj, "dmesg",
+			       new_escaped_json_string(reduced, len));
+
+	free(reduced);
+}
+
 static void add_empty_dmesgs_where_missing(struct json_object *tests,
 					   char *binary,
 					   struct subtest_list *subtests)
@@ -987,7 +1053,7 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
 		generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
 		current_test = get_or_create_json_object(tests, piglit_name);
 		if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
-			add_dmesg(current_test, "", 0, NULL, 0);
+			__add_dmesg(current_test, "", 0, NULL, 0);
 		}
 
 		for (k = 0; k < subtests->subs[i].dynamic_size; k++) {
@@ -995,7 +1061,7 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
 							 dynamic_piglit_name, sizeof(dynamic_piglit_name));
 			current_test = get_or_create_json_object(tests, dynamic_piglit_name);
 			if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
-				add_dmesg(current_test, "", 0, NULL, 0);
+				__add_dmesg(current_test, "", 0, NULL, 0);
 			}
 		}
 	}
@@ -1048,7 +1114,8 @@ static bool fill_from_dmesg(int fd,
 		if ((subtest = strstr(message, STARTING_SUBTEST_DMESG)) != NULL) {
 			if (current_test != NULL) {
 				/* Done with the previous subtest, file up */
-				add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
+				add_dmesg(current_test, settings->reduce_dmesg,
+					  dmesg, dmesglen, warnings, warningslen);
 
 				free(dmesg);
 				free(warnings);
@@ -1056,7 +1123,8 @@ static bool fill_from_dmesg(int fd,
 				dmesglen = warningslen = 0;
 
 				if (current_dynamic_test != NULL)
-					add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
+					add_dmesg(current_dynamic_test, settings->reduce_dmesg,
+						  dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
 
 				free(dynamic_dmesg);
 				free(dynamic_warnings);
@@ -1075,7 +1143,8 @@ static bool fill_from_dmesg(int fd,
 		    (dynamic_subtest = strstr(message, STARTING_DYNAMIC_SUBTEST_DMESG)) != NULL) {
 			if (current_dynamic_test != NULL) {
 				/* Done with the previous dynamic subtest, file up */
-				add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
+				add_dmesg(current_dynamic_test, settings->reduce_dmesg,
+					  dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
 
 				free(dynamic_dmesg);
 				free(dynamic_warnings);
@@ -1116,9 +1185,10 @@ static bool fill_from_dmesg(int fd,
 	free(line);
 
 	if (current_test != NULL) {
-		add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
+		add_dmesg(current_test, settings->reduce_dmesg, dmesg, dmesglen, warnings, warningslen);
 		if (current_dynamic_test != NULL) {
-			add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
+			add_dmesg(current_dynamic_test, settings->reduce_dmesg,
+				  dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
 		}
 	} else {
 		/*
@@ -1134,13 +1204,13 @@ static bool fill_from_dmesg(int fd,
 			 * there are would have skip as their result
 			 * anyway.
 			 */
-			add_dmesg(current_test, dmesg, dmesglen, NULL, 0);
+			add_dmesg(current_test, settings->reduce_dmesg, dmesg, dmesglen, NULL, 0);
 		}
 
 		if (subtests->size == 0) {
 			generate_piglit_name(binary, NULL, piglit_name, sizeof(piglit_name));
 			current_test = get_or_create_json_object(tests, piglit_name);
-			add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
+			add_dmesg(current_test, settings->reduce_dmesg, dmesg, dmesglen, warnings, warningslen);
 		}
 	}
 
@@ -2323,6 +2393,9 @@ struct json_object *generate_results_json(int dirfd)
 		return NULL;
 	}
 
+	if (settings.reduce_dmesg)
+		fprintf(stderr, "resultgen: dmesg reduction set to %ldKB\n", settings.reduce_dmesg / 1024);
+
 	obj = json_object_new_object();
 	json_object_object_add(obj, "__type__", json_object_new_string("TestrunResult"));
 	json_object_object_add(obj, "results_version", json_object_new_int(10));
-- 
2.52.0

