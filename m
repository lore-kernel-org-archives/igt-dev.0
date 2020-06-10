Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E0E89EA3
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2020 16:04:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7ECD107ACCD
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2020 16:04:26 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 10 Jun 2020 12:04:17 -0400
Message-Id: <20200610160417.3402896-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Fix handling of metadata values
 containing spaces
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

Noticed while running some tests that adding any kind of spaces into the
name of a test run would stop igt_resume from working for said test run.
Turns out that when we parse test metadata, we accidentally use the
'%ms' specifier with fscanf() which finishes parsing strings when any
kind of whitespace is encountered.

So, fix this by using the proper %m[^\n] specifier, which dynamically
allocates it's result and doesn't stop reading the string until a
newline is encountered. Additionally, add a test for this.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 runner/runner_tests.c | 12 ++++++++++++
 runner/settings.c     |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 60e00960..48b02107 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -1351,6 +1351,18 @@ igt_main
 
 			fclose(f);
 		}
+
+		igt_subtest("metadata-read-spaces") {
+			char metadata[] = "name : foo bar\n";
+			FILE *f = fmemopen(metadata, strlen(metadata), "r");
+			igt_assert(f);
+
+			igt_assert(read_settings_from_file(settings, f));
+
+			igt_assert_eqstr(settings->name, "foo bar");
+
+			fclose(f);
+		}
 	}
 
 	igt_subtest_group {
diff --git a/runner/settings.c b/runner/settings.c
index d18e55d1..25f248ef 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -679,7 +679,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 
 	settings->dmesg_warn_level = -1;
 
-	while (fscanf(f, "%ms : %ms", &name, &val) == 2) {
+	while (fscanf(f, "%ms : %m[^\n]", &name, &val) == 2) {
 		int numval = atoi(val);
 		PARSE_LINE(settings, name, val, abort_mask, numval);
 		PARSE_LINE(settings, name, val, test_list, val ? strdup(val) : NULL);
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
