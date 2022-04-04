Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3665410F682
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Apr 2022 06:26:51 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Mon,  4 Apr 2022 08:26:34 +0200
Message-Id: <20220404062642.378928-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20220404062642.378928-1-mauro.chehab@linux.intel.com>
References: <20220404062642.378928-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 04/12] runner: execute code coverage script also
 from PATH
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

In order to prepare to execute the code coverage scripts from the
PATH, change the logic at settings in order for it to seek for
the script in the PATH, if it doesn't contain any directories
on its filename.

Note: file search routines were moved (unchanged) on this path,
in order to avoid forward prototype declarations.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 runner/settings.c | 109 +++++++++++++++++++++++++++++-----------------
 1 file changed, 68 insertions(+), 41 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index a7a12f506a05..4571e3af9d54 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -363,6 +363,73 @@ static bool executable_file(const char *filename)
 	return !access(filename, X_OK);
 }
 
+static char *_dirname(const char *path)
+{
+	char *tmppath = strdup(path);
+	char *tmpname = dirname(tmppath);
+	tmpname = strdup(tmpname);
+	free(tmppath);
+	return tmpname;
+}
+
+static char *_basename(const char *path)
+{
+	char *tmppath = strdup(path);
+	char *tmpname = basename(tmppath);
+	tmpname = strdup(tmpname);
+	free(tmppath);
+	return tmpname;
+}
+
+char *absolute_path(char *path)
+{
+	char *result = NULL;
+	char *base, *dir;
+	char *ret;
+
+	result = realpath(path, NULL);
+	if (result != NULL)
+		return result;
+
+	dir = _dirname(path);
+	ret = absolute_path(dir);
+	free(dir);
+
+	base = _basename(path);
+	asprintf(&result, "%s/%s", ret, base);
+	free(base);
+	free(ret);
+
+	return result;
+}
+
+static char *bin_path(char *fname)
+{
+	char *path, *p;
+	char file[PATH_MAX];
+
+	if (strchr(fname, '/'))
+		return absolute_path(fname);
+
+	path = strdup(getenv("PATH"));
+	p = strtok(path, ":");
+	do {
+		if (*p) {
+			strcpy(file, p);
+			strcat(file, "/");
+			strcat(file, fname);
+			if (executable_file(file)) {
+				free(path);
+				return strdup(file);
+			}
+		}
+		p = strtok(NULL, ":");
+	} while (p);
+
+	free(path);
+	return strdup(fname);
+}
+
 static void print_version(void)
 {
 	struct utsname uts;
@@ -495,7 +562,7 @@ bool parse_options(int argc, char **argv,
 			settings->cov_results_per_test = true;
 			break;
 		case OPT_CODE_COV_SCRIPT:
-			settings->code_coverage_script = absolute_path(optarg);
+			settings->code_coverage_script = bin_path(optarg);
 			break;
 
 		case OPT_MULTIPLE:
@@ -656,46 +723,6 @@ bool validate_settings(struct settings *settings)
 	return true;
 }
 
-static char *_dirname(const char *path)
-{
-	char *tmppath = strdup(path);
-	char *tmpname = dirname(tmppath);
-	tmpname = strdup(tmpname);
-	free(tmppath);
-	return tmpname;
-}
-
-static char *_basename(const char *path)
-{
-	char *tmppath = strdup(path);
-	char *tmpname = basename(tmppath);
-	tmpname = strdup(tmpname);
-	free(tmppath);
-	return tmpname;
-}
-
-char *absolute_path(char *path)
-{
-	char *result = NULL;
-	char *base, *dir;
-	char *ret;
-
-	result = realpath(path, NULL);
-	if (result != NULL)
-		return result;
-
-	dir = _dirname(path);
-	ret = absolute_path(dir);
-	free(dir);
-
-	base = _basename(path);
-	asprintf(&result, "%s/%s", ret, base);
-	free(base);
-	free(ret);
-
-	return result;
-}
-
 static char settings_filename[] = "metadata.txt";
 bool serialize_settings(struct settings *settings)
 {
-- 
2.35.1
