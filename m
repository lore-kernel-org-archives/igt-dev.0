Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC43F6E055
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Apr 2020 11:14:54 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 11 Apr 2020 12:14:26 +0100
Message-Id: <20200411111427.2749626-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] igt: Allow ':' in subtest names
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
 lib/igt_core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

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
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
