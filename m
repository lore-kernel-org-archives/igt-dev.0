Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FB6C4451C
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 19:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268B010E3BF;
	Tue, 21 Jul 2026 19:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muiNaBp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540B610E3BF
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 19:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784660435; x=1816196435;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=6pLg2dNSa54m1EjlNVybaWGjKNg2zXwVqCO8TEtI1W8=;
 b=muiNaBp4ApCSS4ePjaRNG43OFx4vAu/Z3W5R9NO5HuQ1Ys0u8yXmc6RV
 ma5UAd8CGcbIlUT7F4kJJmjs/7O0Bvo/o41/xwuGtRSTH746Vnqb1HaZs
 t52n5mF3NtRlwEiCsKBgB07D0Ocx6/e8iSMp0K1ShqP14fYqViaWyIAFT
 uiU69L8OlqoGCl1oD2gClDQg/vtF8LjP/GYi0RF4+AK2biHsOLrxihaGZ
 I1NIOLvVK5+KQ7RO41JncLopy3Qm/PGbh2oZPW9CBSKyhBCy4Jik+Gk2y
 k8ear1j/3B+GRZqjWPE3osnFV8jHENMtKPnaQJZjdCB+9a1TFD/fR3w/V g==;
X-CSE-ConnectionGUID: AmAHCf5kRge2g3Wx5LRVhA==
X-CSE-MsgGUID: 2J/kt9gHS8Codo5czr4xGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95637692"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95637692"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:35 -0700
X-CSE-ConnectionGUID: EpSsNE8qQKGTYx0N65GVUg==
X-CSE-MsgGUID: mHpWGDpzQXW9iROlOd7zzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="258516557"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.232])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 12:00:33 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 21 Jul 2026 15:59:55 -0300
Subject: [PATCH i-g-t 02/10] lib/xe: Use stricter line-equality check when
 checking for workarounds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-wa_14026539277-v1-2-0c147eeefefa@intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
In-Reply-To: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Currently debugfs_file_has_wa() uses strstr() to check if a workaround
name is present in the debugfs dump.  Using strstr() would match the
workaround name anywhere in the dump buffer and with that we risk
producing unexpected results if the checked workaround name happens to
be a substring of another workaround present in the dump.

Fix that by making sure we match the workaround name with the full
line from the dump.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/xe/xe_wa.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
index ff5daf529831..d44431e7e61f 100644
--- a/lib/xe/xe_wa.c
+++ b/lib/xe/xe_wa.c
@@ -13,6 +13,43 @@
 #include "xe/xe_wa.h"
 #include "xe/xe_query.h"
 
+static bool debugfs_dump_has_wa(char *dump, const char *wa)
+{
+	char *a = dump;
+
+	while (*a) {
+		const char *b = wa;
+
+		/*
+		 * Each workaround name is indented by one tab
+		 * character; unindented lines are used as "section
+		 * names" identifying the type of workarounds that
+		 * follow (e.g. "GT Workarounds", "Engine Workarounds"
+		 * etc).
+		 */
+		if (*a++ != '\t')
+			goto next_line;
+
+		while (*a == *b && !(*a == '\0' || *a == '\n' || *b == '\0')) {
+			a++;
+			b++;
+		}
+
+		if ((*a == '\0' || *a == '\n') && *b == '\0')
+			return true;
+
+	next_line:
+		/* No match for this line, advance to the next one. */
+		while (*a != '\n' && *a != '\0')
+			a++;
+
+		if (*a == '\n')
+			a++;
+	}
+
+	return false;
+}
+
 static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
 			       const char *debugfs_name, const char *wa)
 {
@@ -23,7 +60,7 @@ static int debugfs_file_has_wa(int drm_fd, int debugfs_fd,
 
 	debugfs_dump = igt_sysfs_get(debugfs_fd, debugfs_name);
 	if (debugfs_dump) {
-		char *has_wa = strstr(debugfs_dump, wa);
+		bool has_wa = debugfs_dump_has_wa(debugfs_dump, wa);
 
 		free(debugfs_dump);
 

-- 
2.55.0

