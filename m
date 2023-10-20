Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA7E10E0E8
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 13:34:19 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.0.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9F10B580D4F
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 06:34:17 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qtpdn-000ZFa-1M
 for igt-dev@lists.freedesktop.org; Fri, 20 Oct 2023 15:34:15 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 15:30:11 +0200
Message-ID: <20231020133413.135395-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20231020133413.135395-1-mauro.chehab@linux.intel.com>
References: <20231020133413.135395-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] igt_runner: job_list: expand subtests
 also when --test-list is used
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Runner has two separate functions to handle job lists:

- job_list_from_test_list()
- filtered_job_list()

Currently, only the first one expand subtests. The second one
will ignore it. So, if one adds something like:

	$ echo "igt@xe_huc_copy" >my.list
	$ echo "igt@xe_huc_copy@huc_copy" >huc_copy.list
	$ sudo ./build/runner/igt_runner -o build/tests result --test-list my.list -b huc_copy.list

It will end adding the blocklisted job to job_list.

Fix it by ensuring that add_subtests() will always be called
if blocklist regex array contains one or more entries.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 runner/job_list.c | 56 ++++++++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/runner/job_list.c b/runner/job_list.c
index e6ea836310fd..ba6426602c0e 100644
--- a/runner/job_list.c
+++ b/runner/job_list.c
@@ -26,7 +26,7 @@ static bool matches_any(const char *str, struct regex_list *list)
 	return false;
 }
 
-static void add_job_list_entry(struct job_list *job_list,
+static void insert_job_entry(struct job_list *job_list,
 			       char *binary,
 			       char **subtests,
 			       size_t subtest_count)
@@ -96,7 +96,7 @@ static void add_subtests(struct job_list *job_list, struct settings *settings,
 		} else {
 			subtests = malloc(sizeof(*subtests));
 			*subtests = strdup(subtestname);
-			add_job_list_entry(job_list, strdup(binary), subtests, 1);
+			insert_job_entry(job_list, strdup(binary), subtests, 1);
 			subtests = NULL;
 		}
 
@@ -104,7 +104,7 @@ static void add_subtests(struct job_list *job_list, struct settings *settings,
 	}
 
 	if (num_subtests)
-		add_job_list_entry(job_list, strdup(binary), subtests, num_subtests);
+		insert_job_entry(job_list, strdup(binary), subtests, num_subtests);
 
 	s = pclose(p);
 	if (s == 0) {
@@ -124,7 +124,7 @@ static void add_subtests(struct job_list *job_list, struct settings *settings,
 			}
 			if (!include || !include->size ||
 			    matches_any(piglitname, include)) {
-				add_job_list_entry(job_list, strdup(binary), NULL, 0);
+				insert_job_entry(job_list, strdup(binary), NULL, 0);
 				return;
 			}
 		}
@@ -134,6 +134,23 @@ static void add_subtests(struct job_list *job_list, struct settings *settings,
 	}
 }
 
+static void add_job_list_entry(struct settings *settings,
+			       struct job_list *job_list,
+			       char *binary,
+			       char **subtests,
+			       size_t subtest_count)
+{
+	if (settings->multiple_mode && !settings->exclude_regexes.size)
+		/*
+		 * Optimization; we know that all subtests will be included,
+		 * so we get to omit executing --list-subtests.
+		 */
+		insert_job_entry(job_list, binary, subtests, subtest_count);
+	else
+		add_subtests(job_list, settings, binary,
+			     NULL, &settings->exclude_regexes);
+}
+
 static bool filtered_job_list(struct job_list *job_list,
 			      struct settings *settings,
 			      int fd)
@@ -165,17 +182,7 @@ static bool filtered_job_list(struct job_list *job_list,
 		 * all subtests except those matching exclude filters are added.
 		 */
 		if (!settings->include_regexes.size || matches_any(buf, &settings->include_regexes)) {
-			if (settings->multiple_mode && !settings->exclude_regexes.size)
-				/*
-				 * Optimization; we know that all
-				 * subtests will be included, so we
-				 * get to omit executing
-				 * --list-subtests.
-				 */
-				add_job_list_entry(job_list, strdup(buf), NULL, 0);
-			else
-				add_subtests(job_list, settings, buf,
-					     NULL, &settings->exclude_regexes);
+			add_job_list_entry(settings, job_list, strdup(buf), NULL, 0);
 			continue;
 		}
 
@@ -239,8 +246,9 @@ static bool job_list_from_test_list(struct job_list *job_list,
 					subtests = malloc(sizeof(char*));
 					subtests[0] = strdup(delim);
 				}
-				add_job_list_entry(job_list, strdup(binary),
-						   subtests, (size_t)(subtests != NULL));
+				add_job_list_entry(settings, job_list,
+						   strdup(binary), subtests,
+						   (size_t)(subtests != NULL));
 				any = true;
 				free(binary);
 				binary = NULL;
@@ -277,7 +285,9 @@ static bool job_list_from_test_list(struct job_list *job_list,
 			}
 
 			if (entry.binary) {
-				add_job_list_entry(job_list, entry.binary, entry.subtests, entry.subtest_count);
+				add_job_list_entry(settings, job_list,
+						   entry.binary, entry.subtests,
+						   entry.subtest_count);
 				any = true;
 			}
 
@@ -290,7 +300,8 @@ static bool job_list_from_test_list(struct job_list *job_list,
 				subtests = malloc(sizeof(char*));
 				subtests[0] = strdup(delim);
 
-				add_job_list_entry(job_list, strdup(binary), subtests, 1);
+				add_job_list_entry(settings, job_list,
+						   strdup(binary), subtests, 1);
 				any = true;
 			} else {
 				entry.binary = strdup(binary);
@@ -307,7 +318,8 @@ static bool job_list_from_test_list(struct job_list *job_list,
 	}
 
 	if (entry.binary) {
-		add_job_list_entry(job_list, entry.binary, entry.subtests, entry.subtest_count);
+		add_job_list_entry(settings, job_list, entry.binary,
+				   entry.subtests, entry.subtest_count);
 		any = true;
 	}
 
@@ -565,7 +577,7 @@ bool read_job_list(struct job_list *job_list, int dirfd)
 
 		sublist = strchr(line, ' ');
 		if (!sublist) {
-			add_job_list_entry(job_list, strdup(line), NULL, 0);
+			insert_job_entry(job_list, strdup(line), NULL, 0);
 			continue;
 		}
 
@@ -584,7 +596,7 @@ bool read_job_list(struct job_list *job_list, int dirfd)
 			sublist = comma;
 		} while (comma != NULL);
 
-		add_job_list_entry(job_list, binary, subtests, num_subtests);
+		insert_job_entry(job_list, binary, subtests, num_subtests);
 	}
 
 	free(line);
-- 
2.41.0
