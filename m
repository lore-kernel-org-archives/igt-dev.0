Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680BD606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 17:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PrpL0TPi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069D810EA87;
	Mon, 19 Oct 2026 17:04:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFC710E169
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 17:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792429357; x=1823965357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NtzNcqoddBhL1NSTdwdjkKJd1xZh17o3Q0l67j0kYsg=;
 b=PrpL0TPiCOiG0hwaqpZxvRwZpF+WmpA9bLU9HWSfasegyWtipIbgT7vp
 vbCVzHuteTBFSu/Yr+Ts71qx9EhigL5AegUWYJs/C5MOXex5t/In+MZeS
 DoHUMkltGP+MKV6KN51aCfrbWF98UdxHWoYb1MupO97N7woAT+L45eh47
 3PoeDhwVJ2R/KzUbvyFCLQWGHVpXSdbsjoAmoSLRk/J7385JEgBO9Sk9a
 E6c+sBslP5qaUcc3x0fC0mKm1ztXcqULhKM3L33QKYMK9sYUMdAVeKODj
 aMTeC0Xg8PvgAyjydkGSv079P36INYCLCdJJb978p0Lv1dvAU7/xjRfTd Q==;
X-CSE-ConnectionGUID: z+j+3YIGTBOMh2SiYimUjw==
X-CSE-MsgGUID: 4K2E6xBLScmiU2g1zeWmEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1155988"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1155988"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 10:02:37 -0700
X-CSE-ConnectionGUID: rjkL4+iWRwCQQmBuEV9lpw==
X-CSE-MsgGUID: LXXNcox0T5aZ7GAW061wTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="3007810"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.31])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 10:02:36 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/2] runner/resultgen: Report limited number of dmesg
 warns/fails
Date: Mon, 19 Oct 2026 19:01:52 +0200
Message-ID: <20261019170152.139409-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019170152.139409-1-kamil.konieczny@linux.intel.com>
References: <20261019170152.139409-1-kamil.konieczny@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When parsing dmesg for fails or warns, report only first seen
ones up to maximum number given by max-reported-warns option.
Usually the very first ones seen in dmesg are useful for search
of root cause.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 94cdd0e2e..0375a9e57 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1029,6 +1029,7 @@ static bool fill_from_dmesg(int fd,
 	char *dmesg = NULL, *dynamic_dmesg = NULL;
 	size_t linelen = 0;
 	size_t warningslen = 0, dynamic_warnings_len = 0;
+	int warns_count = 0;
 	size_t dmesglen = 0, dynamic_dmesg_len = 0;
 	struct json_t *current_test = NULL;
 	struct json_t *current_dynamic_test = NULL;
@@ -1079,6 +1080,7 @@ static bool fill_from_dmesg(int fd,
 				dynamic_dmesg = dynamic_warnings = NULL;
 				dynamic_dmesg_len = dynamic_warnings_len = 0;
 				current_dynamic_test = NULL;
+				warns_count = 0;
 			}
 
 			subtest += strlen(STARTING_SUBTEST_DMESG);
@@ -1097,6 +1099,7 @@ static bool fill_from_dmesg(int fd,
 				free(dynamic_warnings);
 				dynamic_dmesg = dynamic_warnings = NULL;
 				dynamic_dmesg_len = dynamic_warnings_len = 0;
+				warns_count = 0;
 			}
 
 			dynamic_subtest += strlen(STARTING_DYNAMIC_SUBTEST_DMESG);
@@ -1111,7 +1114,9 @@ static bool fill_from_dmesg(int fd,
 		if (settings->piglit_style_dmesg) {
 			if ((flags & 0x07) <= settings->dmesg_warn_level && continuation != 'c' &&
 			    g_regex_match(re, message, 0, NULL) &&
-			    not_ignored(re_ignore, message)) {
+			    not_ignored(re_ignore, message) &&
+			    warns_count < settings->max_reported_warns) {
+				++warns_count;
 				append_line(&warnings, &warningslen, formatted);
 				if (current_test != NULL)
 					append_line(&dynamic_warnings, &dynamic_warnings_len, formatted);
@@ -1119,7 +1124,9 @@ static bool fill_from_dmesg(int fd,
 		} else {
 			if ((flags & 0x07) <= settings->dmesg_warn_level && continuation != 'c' &&
 			    !g_regex_match(re, message, 0, NULL) &&
-			    not_ignored(re_ignore, message)) {
+			    not_ignored(re_ignore, message) &&
+			    warns_count < settings->max_reported_warns) {
+				++warns_count;
 				append_line(&warnings, &warningslen, formatted);
 				if (current_test != NULL)
 					append_line(&dynamic_warnings, &dynamic_warnings_len, formatted);
-- 
2.55.0

