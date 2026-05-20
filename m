Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33671CD4F3D
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 15:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD87A10E40B;
	Wed, 20 May 2026 15:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7+x89YQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF4510E45C
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779292206; x=1810828206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pa0NQfMJtpq7m6xP0FyuZJ4hagl1LAuZpitdXd9EdwE=;
 b=I7+x89YQgdDKEKnTg7HoLZB9FSFUfTOx8Uq5Fcwep9EGccc0e4vygXgL
 8dLS7TrN3iGy3NZ3GNqeF33DZPEL8060eW906QQSsU5fmnHdcb8cGDQTJ
 HHYZEpRlN3mmJfjLYd7xRacz47ntc0ivMN8Rea2gEghJczwsobDBpAKQH
 b/z+tR0rSi1uURP6mV2jBJ19rJplcEpioNiB8JpxkFruxH7ooXAPgOrSf
 JAWSGidYvo1MkFMZkePjGevRvifATTATyXFutsxnulNW6qQs2Mv72x65Z
 qSOR+5zXyRBibW5oJqfF4iq51n6FGRqNmpN2gR3KbzowQHVJhrSn4BgIa w==;
X-CSE-ConnectionGUID: HNUCRqR6RACOBDO1WFSmWQ==
X-CSE-MsgGUID: m/KGEmQrQvCCmMcpMNMFuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="105657027"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="105657027"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 08:50:06 -0700
X-CSE-ConnectionGUID: JUWSVbCPTEWq6VApPqZkNQ==
X-CSE-MsgGUID: IJONJ9/bTNqYmQkgYgVtFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="237219180"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.126])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 08:50:05 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 4/4] runner/resultgen: Create smaller dmesg report by
 dropping lines matched with skip regex
Date: Wed, 20 May 2026 17:49:46 +0200
Message-ID: <20260520154947.116726-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
References: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
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

Tests can skip some messages to keep generated dmesg report
under disk limit size.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/output_strings.h |  8 ++++++++
 runner/resultgen.c      | 17 +++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/runner/output_strings.h b/runner/output_strings.h
index 91ef5f2c3..943fb67a6 100644
--- a/runner/output_strings.h
+++ b/runner/output_strings.h
@@ -62,6 +62,14 @@ static const char STARTING_DYNAMIC_SUBTEST_DMESG[] = ": starting dynamic subtest
  */
 static const char IGT_ADD_IGNORED_REGEX_DMESG[] = "add ignored dmesg regex: ";
 
+/*
+ * Output in dmesg when a test wants runner to dynamically ignore disklimit.
+ *
+ * Example:
+ * [IGT] ulimit ...params... regex: Skipping madvise reset for vma
+ */
+static const char IGT_ADD_IGNORE_LIMIT_REGEX_DMESG[] = "ulimit";
+
 /*
  * Output when a test process is executed.
  *
diff --git a/runner/resultgen.c b/runner/resultgen.c
index 29fc5cbb1..f4c16ee75 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1008,6 +1008,7 @@ static bool fill_from_dmesg(int fd,
 	size_t i;
 	GRegex *re;
 	GRegex *re_ignore; /* regex for dynamically ignored dmesg line */
+	GRegex *re_skip; /* regex for dynamically skipping dmesg line */
 
 	if (!f) {
 		return false;
@@ -1019,6 +1020,7 @@ static bool fill_from_dmesg(int fd,
 	}
 
 	re_ignore = NULL;
+	re_skip = NULL;
 	while (getline(&line, &linelen, f) > 0) {
 		char *formatted;
 		unsigned flags;
@@ -1078,6 +1080,12 @@ static bool fill_from_dmesg(int fd,
 		if ((ignore = strstr(message, IGT_ADD_IGNORED_REGEX_DMESG)) != NULL)
 			add_ignored_regex(&re_ignore, ignore + strlen(IGT_ADD_IGNORED_REGEX_DMESG));
 
+		if ((ignore = strstr(message, IGT_ADD_IGNORE_LIMIT_REGEX_DMESG)) != NULL) {
+			ignore = strstr(message, "regex: ");
+			add_ignored_regex(&re_skip, ignore + strlen("regex: "));
+			/* TODO: implement rest of params */
+		}
+
 		if (settings->piglit_style_dmesg) {
 			if ((flags & 0x07) <= settings->dmesg_warn_level && continuation != 'c' &&
 			    g_regex_match(re, message, 0, NULL) &&
@@ -1095,8 +1103,12 @@ static bool fill_from_dmesg(int fd,
 					append_line(&dynamic_warnings, &dynamic_warnings_len, formatted);
 			}
 		}
-		append_line(&dmesg, &dmesglen, formatted);
-		append_line(&dynamic_dmesg, &dynamic_dmesg_len, formatted);
+
+		if (not_ignored(re_skip, message)) {
+			append_line(&dmesg, &dmesglen, formatted);
+			append_line(&dynamic_dmesg, &dynamic_dmesg_len, formatted);
+		}
+
 		free(formatted);
 	}
 	free(line);
@@ -1137,6 +1149,7 @@ static bool fill_from_dmesg(int fd,
 	free(warnings);
 	free(dynamic_warnings);
 	clean_regex(&re_ignore);
+	clean_regex(&re_skip);
 	g_regex_unref(re);
 	fclose(f);
 	return true;
-- 
2.54.0

