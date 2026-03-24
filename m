Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BFDF54AAE
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 13:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDFA10E661;
	Tue, 24 Mar 2026 13:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hN3SLY+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797C110E6AA
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774358004; x=1805894004;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N/r4lxgu72yDb2NnNGRQCtUp27HRzwydrRhGVIi3UgY=;
 b=hN3SLY+5XBSDZtf8e7tilmm8tsYVaBeBONeD7yWMl8iAFt0BL1CEnUYU
 /yssifFztJNwUjsxXTPE0Jhd/Tpx8zlh/tP+Rq429qfU2mp8x8oFSwBZO
 Zl/xxeKzk9ZdJqEycw3jCHyKiTbl84qpY0CXzvtcB/JNnfsSlAYWLlby0
 DvYJ3Oew+g1vnGNq3iUe1BrGwCuPNeQA/0g7hsWTUr/28+PWU0gTUD7Fk
 YCve7vj8iu8aOnwPC3R5JQq6/LnLzZlqrgX9KKTqCxapo9NkQ50VtBMDi
 0cHm2NNKqgx+LBNHnhv6lxEdmhdZVHJd89AGTxBiq2CgY7XkdmYZAVY1w A==;
X-CSE-ConnectionGUID: lb5sT7ejSuuPhp8RmQhTQQ==
X-CSE-MsgGUID: 7c+7xBgpQ5KW59pXyh063Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74395148"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="74395148"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:13:04 -0700
X-CSE-ConnectionGUID: UPQJ7EJrSTyxqDZVitKPqg==
X-CSE-MsgGUID: NsCQZ4POSDmllUOpHfqHew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223563602"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.143])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:13:03 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v2 5/6] runner: Rename parsing function
Date: Tue, 24 Mar 2026 14:12:41 +0100
Message-ID: <20260324131235.712916-13-zbigniew.kempczynski@intel.com>
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

Upcoming changes will use parsing function so rename it to some
generic name is necessary to avoid confusion.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
---
 runner/settings.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index 3ccf718701..7c29f2d3ab 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -364,16 +364,18 @@ static bool add_regex(struct regex_list *list, char *new)
 	return true;
 }
 
-static bool parse_blacklist(struct regex_list *exclude_regexes,
-			    char *blacklist_filename)
+static bool parse_list(struct regex_list *regexes,
+		       char *list_filename,
+		       const char *list_type)
 {
 	FILE *f;
 	char *line = NULL;
 	size_t line_len = 0;
 	bool status = false;
 
-	if ((f = fopen(blacklist_filename, "r")) == NULL) {
-		fprintf(stderr, "Cannot open blacklist file %s\n", blacklist_filename);
+	if ((f = fopen(list_filename, "r")) == NULL) {
+		fprintf(stderr, "Cannot open %s file %s\n",
+			list_filename, list_type);
 		return false;
 	}
 	while (1) {
@@ -398,7 +400,7 @@ static bool parse_blacklist(struct regex_list *exclude_regexes,
 		if (str_size > 0) {
 			char *test_regex = strndup(line, str_size);
 
-			status = add_regex(exclude_regexes, test_regex);
+			status = add_regex(regexes, test_regex);
 			if (!status)
 				break;
 		}
@@ -845,8 +847,9 @@ bool parse_options(int argc, char **argv,
 			}
 			break;
 		case OPT_BLACKLIST:
-			if (!parse_blacklist(&settings->exclude_regexes,
-					     absolute_path(optarg)))
+			if (!parse_list(&settings->exclude_regexes,
+					absolute_path(optarg),
+					"blacklist"))
 				goto error;
 			break;
 		case OPT_LIST_ALL:
-- 
2.43.0

