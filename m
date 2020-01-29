Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391BD6F540
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 13:18:05 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 29 Jan 2020 15:17:52 +0200
Message-Id: <20200129131753.12460-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] runner: Support dynamic subtests in
 testlists
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

In a very rudimentary and undocumented manner, testlist files can now
have dynamic subtests specified. This feature is intended for very
special cases, and the main supported mode of operation with testlist
files is still the CI-style "run it all no matter what".

The syntax for testlist files is:

igt@binary@subtestname@dynamicsubtestname

As dynamic subtests are not easily listable, any helpers for
generating such testlists are not implemented.

If running in multiple-mode, subtests with dynamic subtests specified
will run in single-mode instead.

Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/45
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/executor.c | 20 +++++++++++++++++---
 runner/job_list.c | 28 ++++++++++++++++++++++------
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 0927d1fd..8c506dcc 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1033,7 +1033,7 @@ execute_test_process(int outfd, int errfd,
 		     struct settings *settings,
 		     struct job_list_entry *entry)
 {
-	char *argv[4] = {};
+	char *argv[6] = {};
 	size_t rootlen;
 
 	dup2(outfd, STDOUT_FILENO);
@@ -1049,17 +1049,31 @@ execute_test_process(int outfd, int errfd,
 
 	if (entry->subtest_count) {
 		size_t argsize;
+		const char *dynbegin;
 		size_t i;
 
 		argv[1] = strdup("--run-subtest");
-		argsize = strlen(entry->subtests[0]);
+
+		if ((dynbegin = strchr(entry->subtests[0], '@')) != NULL)
+			argsize = dynbegin - entry->subtests[0];
+		else
+			argsize = strlen(entry->subtests[0]);
+
 		argv[2] = malloc(argsize + 1);
-		strcpy(argv[2], entry->subtests[0]);
+		memcpy(argv[2], entry->subtests[0], argsize);
+		argv[2][argsize] = '\0';
+
+		if (dynbegin) {
+			argv[3] = strdup("--dynamic-subtest");
+			argv[4] = strdup(dynbegin + 1);
+		}
 
 		for (i = 1; i < entry->subtest_count; i++) {
 			char *sub = entry->subtests[i];
 			size_t sublen = strlen(sub);
 
+			assert(dynbegin == NULL);
+
 			argv[2] = realloc(argv[2], argsize + sublen + 2);
 			argv[2][argsize] = ',';
 			strcpy(argv[2] + argsize + 1, sub);
diff --git a/runner/job_list.c b/runner/job_list.c
index 93cede75..520a98da 100644
--- a/runner/job_list.c
+++ b/runner/job_list.c
@@ -248,8 +248,12 @@ static bool job_list_from_test_list(struct job_list *job_list,
 			 * If the currently built entry has the same
 			 * binary, add a subtest. Otherwise submit
 			 * what's already built and start a new one.
+			 *
+			 * If the new test has a dynamic subtest
+			 * specified, also start a new entry.
 			 */
-			if (entry.binary && !strcmp(entry.binary, binary)) {
+			if (entry.binary && !strcmp(entry.binary, binary) &&
+			    (delim == NULL || strchr(delim, '@') == NULL)) {
 				if (!delim) {
 					/* ... except we didn't get a subtest */
 					fprintf(stderr,
@@ -275,11 +279,23 @@ static bool job_list_from_test_list(struct job_list *job_list,
 			}
 
 			memset(&entry, 0, sizeof(entry));
-			entry.binary = strdup(binary);
-			if (delim) {
-				entry.subtests = malloc(sizeof(*entry.subtests));
-				entry.subtests[0] = strdup(delim);
-				entry.subtest_count = 1;
+
+			if (delim != NULL && strchr(delim, '@') != NULL) {
+				/* Dynamic subtest specified. Add to job list alone. */
+				char **subtests;
+
+				subtests = malloc(sizeof(char*));
+				subtests[0] = strdup(delim);
+
+				add_job_list_entry(job_list, strdup(binary), subtests, 1);
+				any = true;
+			} else {
+				entry.binary = strdup(binary);
+				if (delim) {
+					entry.subtests = malloc(sizeof(*entry.subtests));
+					entry.subtests[0] = strdup(delim);
+					entry.subtest_count = 1;
+				}
 			}
 
 			free(binary);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
