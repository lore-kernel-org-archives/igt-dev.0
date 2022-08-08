Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306DB10E3B0
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Aug 2022 16:20:17 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Mon,  8 Aug 2022 18:18:23 +0200
Message-Id: <20220808161825.1942387-5-ryszard.knop@intel.com>
In-Reply-To: <20220808161825.1942387-1-ryszard.knop@intel.com>
References: <20220628094435.854519-1-ryszard.knop@intel.com>
 <20220808161825.1942387-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/7] runner: Serialize the provided
 environment flags
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

Settings serialization now creates a separate file, environment.txt,
which contains KEY=VALUE pairs of environment variables to use for test
process spawning. Only vars created with --environment are serialized.
Also add misc warning fixes.

v2:
- Simplify env var reading from files (Mauro)
- Don't align settings loading block (Mauro)
- Make filenames static const (Mauro)

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 runner/settings.c | 183 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 152 insertions(+), 31 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index d0f642a4..b57ab080 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -79,6 +79,9 @@ static struct {
 	{ 0, 0 },
 };
 
+static const char settings_filename[] = "metadata.txt";
+static const char env_filename[] = "environment.txt";
+
 static bool set_log_level(struct settings* settings, const char *level)
 {
 	typeof(*log_levels) *it;
@@ -504,6 +507,11 @@ static void free_env_vars(struct igt_list_head *env_vars) {
 	}
 }
 
+static bool file_exists_at(int dirfd, const char *filename)
+{
+	return faccessat(dirfd, filename, F_OK, 0) == 0;
+}
+
 static bool readable_file(const char *filename)
 {
 	return !access(filename, R_OK);
@@ -893,14 +901,78 @@ bool validate_settings(struct settings *settings)
 	return true;
 }
 
-static char settings_filename[] = "metadata.txt";
+/**
+ * fopenat() - wrapper for fdopen(openat(dirfd, filename))
+ * @dirfd: directory fd to pass to openat
+ * @filename: file name to open with openat
+ * @flags: flags to pass to openat
+ * @openat_mode: (octal) mode to pass to openat
+ * @fdopen_mode: (text) mode to pass to fdopen
+ */
+static FILE *fopenat(int dirfd, const char *filename, int flags, mode_t openat_mode, const char *fdopen_mode)
+{
+	int fd;
+	FILE *f;
+
+	if ((fd = openat(dirfd, filename, flags, openat_mode)) < 0) {
+		usage(stderr, "fopenat(%s, %d) failed: %s",
+		      filename, flags, strerror(errno));
+		return NULL;
+	}
+
+	f = fdopen(fd, fdopen_mode);
+	if (!f) {
+		close(fd);
+		return NULL;
+	}
+
+	return f;
+}
+
+static FILE *fopenat_read(int dirfd, const char *filename)
+{
+	return fopenat(dirfd, filename, O_RDONLY, 0000, "r");
+}
+
+static FILE *fopenat_create(int dirfd, const char *filename, bool overwrite)
+{
+	mode_t mode_if_exists = overwrite ? O_TRUNC : O_EXCL;
+	return fopenat(dirfd, filename, O_CREAT | O_RDWR | mode_if_exists, 0666, "w");
+}
+
+static bool serialize_environment(struct settings *settings, int dirfd)
+{
+	struct environment_variable *iter;
+	FILE *f;
+
+	if (file_exists_at(dirfd, env_filename) && !settings->overwrite) {
+		usage(stderr, "%s already exists, not overwriting", env_filename);
+		return false;
+	}
+
+	if ((f = fopenat_create(dirfd, env_filename, settings->overwrite)) == NULL)
+		return false;
+
+	igt_list_for_each_entry(iter, &settings->env_vars, link) {
+		fprintf(f, "%s=%s\n", iter->key, iter->value);
+	}
+
+	if (settings->sync) {
+		fflush(f);
+		fsync(fileno(f));
+	}
+
+	fclose(f);
+	return true;
+}
+
 bool serialize_settings(struct settings *settings)
 {
 #define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\n", #name, s->name)
 
-	int dirfd, covfd, fd;
-	char path[PATH_MAX];
 	FILE *f;
+	int dirfd, covfd;
+	char path[PATH_MAX];
 
 	if (!settings->results_path) {
 		usage(stderr, "No results-path set; this shouldn't happen");
@@ -928,28 +1000,13 @@ bool serialize_settings(struct settings *settings)
 		}
 	}
 
-	if (!settings->overwrite &&
-	    faccessat(dirfd, settings_filename, F_OK, 0) == 0) {
-		usage(stderr, "Settings metadata already exists and not overwriting");
-		return false;
-	}
-
-	if (settings->overwrite &&
-	    unlinkat(dirfd, settings_filename, 0) != 0 &&
-	    errno != ENOENT) {
-		usage(stderr, "Error removing old settings metadata");
-		return false;
-	}
-
-	if ((fd = openat(dirfd, settings_filename, O_CREAT | O_EXCL | O_WRONLY, 0666)) < 0) {
-		usage(stderr, "Creating settings serialization file failed: %s", strerror(errno));
+	if (file_exists_at(dirfd, settings_filename) && !settings->overwrite) {
+		usage(stderr, "%s already exists, not overwriting", settings_filename);
 		close(dirfd);
 		return false;
 	}
 
-	f = fdopen(fd, "w");
-	if (!f) {
-		close(fd);
+	if ((f = fopenat_create(dirfd, settings_filename, settings->overwrite)) == NULL) {
 		close(dirfd);
 		return false;
 	}
@@ -980,11 +1037,22 @@ bool serialize_settings(struct settings *settings)
 	SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
 
 	if (settings->sync) {
-		fsync(fd);
-		fsync(dirfd);
+		fflush(f);
+		fsync(fileno(f));
 	}
 
 	fclose(f);
+
+	if (!igt_list_empty(&settings->env_vars)) {
+		if (!serialize_environment(settings, dirfd)) {
+			close(dirfd);
+			return false;
+		}
+	}
+
+	if (settings->sync)
+		fsync(dirfd);
+
 	close(dirfd);
 	return true;
 
@@ -1053,22 +1121,62 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
 #undef PARSE_LINE
 }
 
+/**
+ * read_env_vars_from_file() - load env vars from a file
+ * @env_vars: list head to add env var entries to
+ * @f: opened file stream to read
+ *
+ * Loads the environment.txt file and adds each line-separated KEY=VALUE pair
+ * into the provided env_vars list. Lines not containing the '=' K-V separator,
+ * starting with a '#' (comments) or '=' (missing keys) are ignored.
+ *
+ * The function returns true if the env vars were read successfully, or there
+ * was nothing to be read.
+ */
+static bool read_env_vars_from_file(struct igt_list_head *env_vars, FILE *f)
+{
+	char *line = NULL;
+	ssize_t line_length;
+	size_t line_buffer_length = 0;
+
+	while ((line_length = getline(&line, &line_buffer_length, f)) != -1) {
+		char *line_ptr = line;
+
+		while (isspace(line_ptr)) {
+			line_length--;
+			line_ptr++;
+		}
+
+		if (*line_ptr == '\0' || *line_ptr == '#' || *line_ptr == '=')
+			continue; /* Empty, whitespace, comment or missing key */
+
+		if (strchr(line_ptr, '=') == NULL)
+			continue; /* Missing value */
+
+		/* Strip the line feed, but keep trailing whitespace */
+		if (line_length > 0 && line[line_length - 1] == '\n')
+			line[line_length - 1] = '\0';
+
+		add_env_var(env_vars, line);
+	}
+
+	/* input file can be empty */
+	if (line != NULL)
+		free(line);
+
+	return true;
+}
+
 bool read_settings_from_dir(struct settings *settings, int dirfd)
 {
-	int fd;
 	FILE *f;
 
 	clear_settings(settings);
 
-	if ((fd = openat(dirfd, settings_filename, O_RDONLY)) < 0)
+	/* settings are always there */
+	if ((f = fopenat_read(dirfd, settings_filename)) == NULL)
 		return false;
 
-	f = fdopen(fd, "r");
-	if (!f) {
-		close(fd);
-		return false;
-	}
-
 	if (!read_settings_from_file(settings, f)) {
 		fclose(f);
 		return false;
@@ -1076,5 +1184,18 @@ bool read_settings_from_dir(struct settings *settings, int dirfd)
 
 	fclose(f);
 
+	/* env file may not exist if no --environment was set */
+	if (file_exists_at(dirfd, env_filename)) {
+		if ((f = fopenat_read(dirfd, env_filename)) == NULL)
+			return false;
+
+		if (!read_env_vars_from_file(&settings->env_vars, f)) {
+			fclose(f);
+			return false;
+		}
+
+		fclose(f);
+	}
+
 	return true;
 }
-- 
2.37.1
