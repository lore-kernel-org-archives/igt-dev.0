Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0084010E266
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 09:52:10 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.2.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0DDBA580E3D
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 02:52:10 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qxOwK-000S7y-03
 for igt-dev@lists.freedesktop.org; Mon, 30 Oct 2023 10:52:08 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 Oct 2023 10:49:56 +0100
Message-ID: <20231030095206.108025-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20231030095206.108025-1-mauro.chehab@linux.intel.com>
References: <20231030095206.108025-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/7] runner: Normalize testlist entries
 that don't list subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Petri Latvala <adrinael@adrinael.net>

As the syntax for "all subtests" and "test that doesn't have subtests"
is the same, check the subtest listing when building the execution
plan. Doing that makes it possible to still have "all subtests" in
testlists (albeit not originally designed to support that) and enables
blocklisting particular subtests.

Signed-off-by: Petri Latvala <adrinael@adrinael.net>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/149
---
 runner/job_list.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/runner/job_list.c b/runner/job_list.c
index e6ea836310fd..27cbb10bce56 100644
--- a/runner/job_list.c
+++ b/runner/job_list.c
@@ -230,8 +230,28 @@ static bool job_list_from_test_list(struct job_list *job_list,
 			continue;
 
 		if (sscanf(line, "igt@%ms", &binary) == 1) {
-			if ((delim = strchr(binary, '@')) != NULL)
+			if ((delim = strchr(binary, '@')) != NULL) {
 				*delim++ = '\0';
+			} else {
+				/*
+				 * No subtests specified. Check
+				 * whether the user means "all
+				 * subtests" or if the test doesn't
+				 * have any.
+				 */
+				if (entry.binary) {
+					/* First flush the entry we're building for multiple-mode */
+					add_job_list_entry(job_list, entry.binary, entry.subtests, entry.subtest_count);
+					memset(&entry, 0, sizeof(entry));
+					any = true;
+				}
+
+				add_subtests(job_list, settings, binary,
+					     &settings->include_regexes,
+					     &settings->exclude_regexes);
+				any = true;
+				continue;
+			}
 
 			if (!settings->multiple_mode) {
 				char **subtests = NULL;
-- 
2.41.0
