Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45226E969
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2019 09:48:09 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 Dec 2019 11:47:55 +0200
Message-Id: <20191217094800.30687-6-petri.latvala@intel.com>
In-Reply-To: <20191217094800.30687-1-petri.latvala@intel.com>
References: <20191217094800.30687-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 06/11] runner/resultgen: Add support for
 extra validation hook in find_matches()
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

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/resultgen.c | 43 +++++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index ed61b922..8cd1aa49 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -324,6 +324,12 @@ struct matches
 	size_t size;
 };
 
+struct match_needle
+{
+	const char *str;
+	bool (*validate)(const char *needle, const char *line, const char *bufend);
+};
+
 static void match_add(struct matches *matches, const char *where, const char *what)
 {
 	struct match_item newitem = { where, what };
@@ -334,19 +340,20 @@ static void match_add(struct matches *matches, const char *where, const char *wh
 }
 
 static struct matches find_matches(const char *buf, const char *bufend,
-				   const char **needles)
+				   const struct match_needle *needles)
 {
 	struct matches ret = {};
 
 	while (buf < bufend) {
-		const char **needle;
+		const struct match_needle *needle;
 
-		for (needle = needles; *needle; needle++) {
-			if (bufend - buf < strlen(*needle))
+		for (needle = needles; needle->str; needle++) {
+			if (bufend - buf < strlen(needle->str))
 				continue;
 
-			if (!memcmp(buf, *needle, strlen(*needle))) {
-				match_add(&ret, buf, *needle);
+			if (!memcmp(buf, needle->str, strlen(needle->str)) &&
+			    (!needle->validate || needle->validate(needle->str, buf, bufend))) {
+				match_add(&ret, buf, needle->str);
 				goto end_find;
 			}
 		}
@@ -596,12 +603,12 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 	char *igt_version = NULL;
 	size_t igt_version_len = 0;
 	struct json_object *current_test = NULL;
-	const char *needles[] = {
-		STARTING_SUBTEST,
-		SUBTEST_RESULT,
-		STARTING_DYNAMIC_SUBTEST,
-		DYNAMIC_SUBTEST_RESULT,
-		NULL
+	struct match_needle needles[] = {
+		{ STARTING_SUBTEST, NULL },
+		{ SUBTEST_RESULT, NULL },
+		{ STARTING_DYNAMIC_SUBTEST, NULL },
+		{ DYNAMIC_SUBTEST_RESULT, NULL },
+		{ NULL, NULL },
 	};
 	struct matches matches = {};
 	size_t i;
@@ -1117,12 +1124,12 @@ static void fill_from_journal(int fd,
 
 static bool stderr_contains_warnings(const char *beg, const char *end)
 {
-	const char *needles[] = {
-		STARTING_SUBTEST,
-		SUBTEST_RESULT,
-		STARTING_DYNAMIC_SUBTEST,
-		DYNAMIC_SUBTEST_RESULT,
-		NULL
+	struct match_needle needles[] = {
+		{ STARTING_SUBTEST, NULL },
+		{ SUBTEST_RESULT, NULL },
+		{ STARTING_DYNAMIC_SUBTEST, NULL },
+		{ DYNAMIC_SUBTEST_RESULT, NULL },
+		{ NULL, NULL },
 	};
 	struct matches matches;
 	size_t i = 0;
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
