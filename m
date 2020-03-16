Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23036E46B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 16:18:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88F367346F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2020 16:05:06 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Mon, 16 Mar 2020 12:04:52 -0400
Message-Id: <20200316160452.29636-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/tests/igt_describe: Use __FILE__ in
 JUST_C_OUTPUT and DESCRIBE_ALL_OUTPUT
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

We currently manually specify the name of the source file by-hand here,
however this causes problems if the user tries to build with compile
flags like -fdebug-prefix-map since the source file names will then
differ from what's hardcoded here - causing tests to fail.

So, fix that by using __FILE__ instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 lib/tests/igt_describe.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/tests/igt_describe.c b/lib/tests/igt_describe.c
index 6f3a4319..94d42fbe 100644
--- a/lib/tests/igt_describe.c
+++ b/lib/tests/igt_describe.c
@@ -101,33 +101,33 @@ static void fake_main(int argc, char **argv) {
 static const char DESCRIBE_ALL_OUTPUT[] = \
 	"the top level description\n"
 	"\n"
-	"SUB A ../lib/tests/igt_describe.c:36:\n"
+	"SUB A " __FILE__ ":36:\n"
 	"  Basic A\n"
 	"\n"
-	"SUB B ../lib/tests/igt_describe.c:45:\n"
+	"SUB B " __FILE__ ":45:\n"
 	"  Group with B, C & D\n"
 	"\n"
 	"  Basic B\n"
 	"\n"
-	"SUB C ../lib/tests/igt_describe.c:54:\n"
+	"SUB C " __FILE__ ":54:\n"
 	"  Group with B, C & D\n"
 	"\n"
 	"  Group with C & D\n"
 	"\n"
 	"  Basic C\n"
 	"\n"
-	"SUB D ../lib/tests/igt_describe.c:58:\n"
+	"SUB D " __FILE__ ":58:\n"
 	"  Group with B, C & D\n"
 	"\n"
 	"  Group with C & D\n"
 	"\n"
-	"SUB E ../lib/tests/igt_describe.c:66:\n"
+	"SUB E " __FILE__ ":66:\n"
 	"  NO DOCUMENTATION!\n"
 	"\n"
-	"SUB F ../lib/tests/igt_describe.c:71:\n"
+	"SUB F " __FILE__ ":71:\n"
 	"  NO DOCUMENTATION!\n"
 	"\n"
-	"SUB G ../lib/tests/igt_describe.c:80:\n"
+	"SUB G " __FILE__ ":80:\n"
 	"  this description should be so long that it wraps itself nicely in the terminal this\n"
 	"  description should be so long that it wraps itself nicely in the terminal this description\n"
 	"  should be so long that it wraps itself nicely in the terminal this description should be so\n"
@@ -135,17 +135,17 @@ static const char DESCRIBE_ALL_OUTPUT[] = \
 	"  wraps itself nicely in the terminal this description should be so long that it wraps itself\n"
 	"  nicely in the terminal\n"
 	"\n"
-	"SUB F ../lib/tests/igt_describe.c:87:\n"
+	"SUB F " __FILE__ ":87:\n"
 	"  verylongwordthatshoudlbeprintedeventhoughitspastthewrppinglimitverylongwordthatshoudlbeprintedeventhoughitspastthewrappinglimit\n"
 	"  verylongwordthatshoudlbeprintedeventhoughitspastthewrappinglimitverylongwordthatshoudlbeprintedeventhoughitspastthewrappinglimit\n"
 	"\n"
-	"SUB G ../lib/tests/igt_describe.c:91:\n"
+	"SUB G " __FILE__ ":91:\n"
 	"  Subtest with dynamic subsubtests\n\n";
 
 static const char JUST_C_OUTPUT[] = \
 	"the top level description\n"
 	"\n"
-	"SUB C ../lib/tests/igt_describe.c:54:\n"
+	"SUB C " __FILE__ ":54:\n"
 	"  Group with B, C & D\n"
 	"\n"
 	"  Group with C & D\n"
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
