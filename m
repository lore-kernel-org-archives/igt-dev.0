Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9B110E28C
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Sep 2022 22:40:40 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id u131so12615164oie.5
 for <igt-dev@lists.freedesktop.org>; Sun, 18 Sep 2022 15:40:40 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org
Date: Sun, 18 Sep 2022 17:39:55 -0500
Message-Id: <20220918223955.3283220-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] Replaced get_current_dir_name() with
 getcwd() for BSD compatibility
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Jake Freeland <jfree@freebsd.org>
---
 tests/tools_test.c                  | 6 +++---
 tools/i915-perf/i915_perf_control.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/tools_test.c b/tests/tools_test.c
index 89a19d11..d0684d57 100644
--- a/tests/tools_test.c
+++ b/tests/tools_test.c
@@ -69,7 +69,7 @@ static bool chdir_to_tools_dir(void)
 	char path[PATH_MAX];
 	char *cwd;
 
-	cwd = get_current_dir_name();
+	cwd = getcwd(NULL, 0);
 	igt_info("Current working directory: %s\n", cwd);
 	free(cwd);
 
@@ -87,7 +87,7 @@ static bool chdir_to_tools_dir(void)
 		chdir(dirname(path));
 	}
 
-	cwd = get_current_dir_name();
+	cwd = getcwd(NULL, 0);
 	igt_info("Current working directory: %s\n", cwd);
 	free(cwd);
 
@@ -103,7 +103,7 @@ igt_main
 
 		igt_require_f(chdir_to_tools_dir(),
 			      "Unable to determine the tools directory, expecting them in $cwd/" TOOLS " or $path/" TOOLS "\n");
-		path = get_current_dir_name();
+		path = getcwd(NULL, 0);
 		igt_info("Using tools from %s\n", path);
 		free(path);
 	}
diff --git a/tools/i915-perf/i915_perf_control.c b/tools/i915-perf/i915_perf_control.c
index be5996c0..f7db2f5c 100644
--- a/tools/i915-perf/i915_perf_control.c
+++ b/tools/i915-perf/i915_perf_control.c
@@ -102,7 +102,7 @@ main(int argc, char *argv[])
 
 			fwrite(data, total_len, 1, command_fifo_file);
 		} else {
-			char *cwd = get_current_dir_name();
+			char *cwd = getcwd(NULL, 0);
 			uint32_t path_len = strlen(cwd) + 1 + strlen(dump_file) + 1;
 			uint32_t total_len = sizeof(struct recorder_command_base) + path_len;
 			struct {
-- 
2.37.3
