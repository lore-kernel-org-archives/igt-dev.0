Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BE810E476
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 15:06:47 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D1A0A580DBB
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jul 2023 08:06:45 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qHQZ9-002SA7-1Z
 for igt-dev@lists.freedesktop.org; Thu, 06 Jul 2023 17:06:43 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:06:35 +0200
Message-Id: <20230706150638.581415-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230706150638.581415-1-mauro.chehab@linux.intel.com>
References: <20230706150638.581415-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/5] lib/igt_core: use the macro when
 checking for list_subtests
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

We're implementing a new argument to display all tests. Before
doing that, make the check for it more generic to prepare for
the changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 3ee3a01c3668..9a0029d294a8 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -870,7 +870,7 @@ static void print_version(void)
 {
 	struct utsname uts;
 
-	if (list_subtests)
+	if (igt_only_list_subtests())
 		return;
 
 	uname(&uts);
@@ -1198,12 +1198,12 @@ static int common_init(int *argc, char **argv,
 			break;
 		case OPT_RUN_SUBTEST:
 			assert(optarg);
-			if (!list_subtests)
+			if (!igt_only_list_subtests())
 				run_single_subtest = strdup(optarg);
 			break;
 		case OPT_RUN_DYNAMIC_SUBTEST:
 			assert(optarg);
-			if (!list_subtests)
+			if (!igt_only_list_subtests())
 				run_single_dynamic_subtest = strdup(optarg);
 			break;
 		case OPT_DESCRIPTION:
@@ -1265,7 +1265,7 @@ out:
 		/* exit with no error for -h/--help */
 		exit(ret == -1 ? 0 : IGT_EXIT_INVALID);
 
-	if (!list_subtests) {
+	if (!igt_only_list_subtests()) {
 		bind_fbcon(false);
 		igt_kmsg(KMSG_INFO "%s: executing\n", command_str);
 		print_version();
@@ -3098,7 +3098,7 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
 	if (!thread_id)
 		return;
 
-	if (list_subtests && level <= IGT_LOG_WARN)
+	if (igt_only_list_subtests() && level <= IGT_LOG_WARN)
 		return;
 
 	if (vasprintf(&line, format, args) == -1)
-- 
2.40.1
