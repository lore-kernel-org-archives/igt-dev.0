Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FC46E33C
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2020 13:52:14 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon,  6 Apr 2020 16:51:50 +0300
Message-Id: <20200406135150.29697-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Add --version to igt_runner
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
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

To help verify correct deployment, add a --version flag to igt_runner
that just prints the IGT-version text, the same tests would print.

Note that only igt_runner gained the --version flag. igt_resume and
igt_results don't do fancy flag handling, they only accept the
directory to operate as their single arg.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/settings.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/runner/settings.c b/runner/settings.c
index 32840307..d18e55d1 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1,4 +1,5 @@
 #include "settings.h"
+#include "version.h"
 
 #include <ctype.h>
 #include <errno.h>
@@ -11,6 +12,7 @@
 #include <string.h>
 #include <sys/types.h>
 #include <sys/stat.h>
+#include <sys/utsname.h>
 #include <unistd.h>
 
 enum {
@@ -21,6 +23,7 @@ enum {
 	OPT_DMESG_WARN_LEVEL,
 	OPT_OVERALL_TIMEOUT,
 	OPT_PER_TEST_TIMEOUT,
+	OPT_VERSION,
 	OPT_HELP = 'h',
 	OPT_NAME = 'n',
 	OPT_DRY_RUN = 'd',
@@ -292,6 +295,17 @@ static bool readable_file(char *filename)
 	return !access(filename, R_OK);
 }
 
+static void print_version(void)
+{
+	struct utsname uts;
+
+	uname(&uts);
+
+	printf("IGT-Version: %s-%s (%s) (%s: %s %s)\n", PACKAGE_VERSION,
+	       IGT_GIT_SHA1, TARGET_CPU_PLATFORM,
+	       uts.sysname, uts.release, uts.machine);
+}
+
 void init_settings(struct settings *settings)
 {
 	memset(settings, 0, sizeof(*settings));
@@ -317,6 +331,7 @@ bool parse_options(int argc, char **argv,
 	char *env_test_root;
 
 	static struct option long_options[] = {
+		{"version", no_argument, NULL, OPT_VERSION},
 		{"help", no_argument, NULL, OPT_HELP},
 		{"name", required_argument, NULL, OPT_NAME},
 		{"dry-run", no_argument, NULL, OPT_DRY_RUN},
@@ -349,6 +364,9 @@ bool parse_options(int argc, char **argv,
 	while ((c = getopt_long(argc, argv, "hn:dt:x:sl:omb:L",
 				long_options, NULL)) != -1) {
 		switch (c) {
+		case OPT_VERSION:
+			print_version();
+			goto error;
 		case OPT_HELP:
 			usage(NULL, stdout);
 			goto error;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
