Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941246E301
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Apr 2020 12:25:14 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 11 Apr 2020 13:24:53 +0100
Message-Id: <20200411122453.2749918-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200411111427.2749626-1-chris@chris-wilson.co.uk>
References: <20200411111427.2749626-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] igt: Allow ':' in subtest names
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/igt_core.c     | 8 +++++---
 runner/resultgen.c | 5 ++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 778624984..ca3e26c64 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1179,10 +1179,12 @@ static bool valid_name_for_subtest(const char *subtest_name)
 {
 	int i;
 
-	/* check the subtest name only contains a-z, A-Z, 0-9, '-' and '_' */
+	/* check the subtest name only contains a-z, A-Z, 0-9, [-_:] */
 	for (i = 0; subtest_name[i] != '\0'; i++)
-		if (subtest_name[i] != '_' && subtest_name[i] != '-'
-		    && !isalnum(subtest_name[i]))
+		if (subtest_name[i] != '_' &&
+		    subtest_name[i] != '-' &&
+		    subtest_name[i] != ':' &&
+		    !isalnum(subtest_name[i]))
 			return false;
 
 	return true;
diff --git a/runner/resultgen.c b/runner/resultgen.c
index fe59aafeb..3a05917b3 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -369,7 +369,7 @@ static struct matches find_matches(const char *buf, const char *bufend,
 
 static bool valid_char_for_subtest_name(char x)
 {
-	return x == '-' || x == '_' || isalnum(x);
+	return x == '-' || x == '_' || x == ':' ||  isalnum(x);
 }
 
 static bool is_subtest_result_line(const char *needle, const char *line, const char *bufend)
@@ -391,6 +391,9 @@ static bool is_subtest_result_line(const char *needle, const char *line, const c
 	while (line < bufend && valid_char_for_subtest_name(*line))
 		line++;
 
+	if (line[-1] == ':')
+		line--;
+
 	if (line >= bufend || *line++ != ':')
 		return false;
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
