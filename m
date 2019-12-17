Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEC16E96B
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2019 09:48:09 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 Dec 2019 11:47:56 +0200
Message-Id: <20191217094800.30687-7-petri.latvala@intel.com>
In-Reply-To: <20191217094800.30687-1-petri.latvala@intel.com>
References: <20191217094800.30687-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 07/11] runner/resultgen: Make subtest result
 line finding more robust
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

On an assertion failure, the string "Subtest xyz failed" is
printed. Make sure we don't match that for SUBTEST_RESULT, or the
equivalent for dynamic subtests.

Parsing the results already explicitly searched for the proper result
line, the difference is when we delimit output up to "the next line of
interest".

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/resultgen.c | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 8cd1aa49..f93a673c 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -367,6 +367,39 @@ static struct matches find_matches(const char *buf, const char *bufend,
 	return ret;
 }
 
+static bool valid_char_for_subtest_name(char x)
+{
+	return x == '-' || x == '_' || isalnum(x);
+}
+
+static bool is_subtest_result_line(const char *needle, const char *line, const char *bufend)
+{
+	line += strlen(needle);
+
+	/*
+	 * At this point of the string we're expecting:
+	 * - The subtest name (one or more of a-z, A-Z, 0-9, '-' and '_')
+	 * - The characters ':' and ' '
+	 *
+	 * If we find all those, allow parsing this line as [dynamic]
+	 * subtest result.
+	 */
+
+	if (!valid_char_for_subtest_name(*line))
+		return false;
+
+	while (line < bufend && valid_char_for_subtest_name(*line))
+		line++;
+
+	if (line >= bufend || *line++ != ':')
+		return false;
+
+	if (line >= bufend || *line++ != ' ')
+		return false;
+
+	return true;
+}
+
 static void free_matches(struct matches *matches)
 {
 	free(matches->items);
@@ -605,9 +638,9 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 	struct json_object *current_test = NULL;
 	struct match_needle needles[] = {
 		{ STARTING_SUBTEST, NULL },
-		{ SUBTEST_RESULT, NULL },
+		{ SUBTEST_RESULT, is_subtest_result_line },
 		{ STARTING_DYNAMIC_SUBTEST, NULL },
-		{ DYNAMIC_SUBTEST_RESULT, NULL },
+		{ DYNAMIC_SUBTEST_RESULT, is_subtest_result_line },
 		{ NULL, NULL },
 	};
 	struct matches matches = {};
@@ -1126,9 +1159,9 @@ static bool stderr_contains_warnings(const char *beg, const char *end)
 {
 	struct match_needle needles[] = {
 		{ STARTING_SUBTEST, NULL },
-		{ SUBTEST_RESULT, NULL },
+		{ SUBTEST_RESULT, is_subtest_result_line },
 		{ STARTING_DYNAMIC_SUBTEST, NULL },
-		{ DYNAMIC_SUBTEST_RESULT, NULL },
+		{ DYNAMIC_SUBTEST_RESULT, is_subtest_result_line },
 		{ NULL, NULL },
 	};
 	struct matches matches;
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
