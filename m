Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021F2C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 21:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7327010E535;
	Tue, 30 Apr 2024 21:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bplKtfmj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D6B10E535
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 21:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714512009; x=1746048009;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bSGZRVve/cw8bTRmOvXOsu+JZ5FJSlWl+JQt5sbt67o=;
 b=bplKtfmjnUTJ85sT9qA2tsVoImb5H1GV6boSfTM9yF8AaPmDqSrINNO7
 6I3FsLik55CfP4r8szXC/KYlArhdJk9t1PMrjKTqrwVa93LGxqHXPRS07
 dmyoDO1YA/rm5WpkcFbkowjMJ54alzufWsYYnfveHxDl8Z6lE8JmhUAT6
 AHYNpTiWDqsBINeY1L752cYqXongJicSBnGzzdL3GWUI2nfpgVQ2tUh3o
 GqNZbuqqlSjLfzA1No3AIPGMCSQS9TnAtYOPrHG7Oji/i4lBjZyGYovOK
 fx5TIgwo0RwbgdzKN729XlP1PNoAw7KC41EZwrAUxK4wbY4cJDRr2KlGb Q==;
X-CSE-ConnectionGUID: Ex+8vSelTTCGtWnhNc4Tjg==
X-CSE-MsgGUID: zIR0J6KwTnSzKm0lHUWDtw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14068399"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="14068399"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 14:20:09 -0700
X-CSE-ConnectionGUID: 3bT2VvcKRKOkvk4McN/gWg==
X-CSE-MsgGUID: Qp8vKllcRjmEA4sBqKvk3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; d="scan'208";a="31419928"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.124.221.121])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 14:20:08 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] runner: Remove useless null check for delim in
 job_list_from_test_list
Date: Tue, 30 Apr 2024 18:19:35 -0300
Message-ID: <20240430211934.349775-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.44.0
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

The function job_list_from_test_list() uses a while loop to read entries
from the testlist.

The condition ((delim = strchr(binary, '@')) != NULL) checks if the
current entry specifies a subtest. When no subtest is specified, the
else clause will cause a jump to the next iteration. That means that we
are certain any statement executed after that if block has (delim !=
NULL). As such, all null checks on that variable after that point are
pointless.

In fact, certain unnecessary null checks might even cause confusion to
readers. One example is the block meant to display the "Unexpected test
without subtests ..." message: it would never happen, since that
condition is handled earlier in the iteration (i.e. the full set of
subtests is expanded for that entry in the else clause previously
mentioned). The following execution (done before this change)
illustrates that:

    $ cat <<EOF > /tmp/foo.testlist
    igt@xe_pm@s2idle-basic
    igt@xe_pm
    igt@xe_pm@s2idle-exec-after
    EOF

    $ ./build/runner/igt_runner -d -m --test-list /tmp/foo.testlist build/tests /tmp/results
    [36408.109043] Dry run, not executing. Invoke igt_resume if you want to execute.
    Done.

    $ cat /tmp/results/joblist.txt | sed 's/^\(.\{50\}\).\+/\1.../'
    xe_pm s2idle-basic
    xe_pm s2idle-basic,s2idle-basic-exec,s2idle-exec-a...
    xe_pm s2idle-exec-after

Let's remove those unnecessary checks.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 runner/job_list.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/runner/job_list.c b/runner/job_list.c
index 27cbb10bce56..aeabb59f49d3 100644
--- a/runner/job_list.c
+++ b/runner/job_list.c
@@ -276,16 +276,7 @@ static bool job_list_from_test_list(struct job_list *job_list,
 			 * specified, also start a new entry.
 			 */
 			if (entry.binary && !strcmp(entry.binary, binary) &&
-			    (delim == NULL || strchr(delim, '@') == NULL)) {
-				if (!delim) {
-					/* ... except we didn't get a subtest */
-					fprintf(stderr,
-						"Error: Unexpected test without subtests "
-						"after same test had subtests\n");
-					free(binary);
-					fclose(f);
-					return false;
-				}
+			    strchr(delim, '@') == NULL) {
 				entry.subtest_count++;
 				entry.subtests = realloc(entry.subtests,
 							 entry.subtest_count *
@@ -303,7 +294,7 @@ static bool job_list_from_test_list(struct job_list *job_list,
 
 			memset(&entry, 0, sizeof(entry));
 
-			if (delim != NULL && strchr(delim, '@') != NULL) {
+			if (strchr(delim, '@') != NULL) {
 				/* Dynamic subtest specified. Add to job list alone. */
 				char **subtests;
 
@@ -314,11 +305,9 @@ static bool job_list_from_test_list(struct job_list *job_list,
 				any = true;
 			} else {
 				entry.binary = strdup(binary);
-				if (delim) {
-					entry.subtests = malloc(sizeof(*entry.subtests));
-					entry.subtests[0] = strdup(delim);
-					entry.subtest_count = 1;
-				}
+				entry.subtests = malloc(sizeof(*entry.subtests));
+				entry.subtests[0] = strdup(delim);
+				entry.subtest_count = 1;
 			}
 
 			free(binary);
-- 
2.44.0

