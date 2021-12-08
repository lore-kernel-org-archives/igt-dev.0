Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E426E0EF
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 19:17:05 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id z6so2182510plk.6
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Dec 2021 11:17:05 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
Date: Wed,  8 Dec 2021 11:22:16 -0800
Message-Id: <20211208192216.743364-3-robdclark@gmail.com>
In-Reply-To: <20211208192216.743364-1-robdclark@gmail.com>
References: <20211208192216.743364-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 2/2] tools/msm_dp_compliance: Add arg to
 specify connector name
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

To support multiple DP connectors, the debugfs files will be moving into
a per-connector subdirectory in debugfs.  So add an arg to specify the
appropriate connector name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tools/msm_dp_compliance.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
index a15a8dd9..bc79a061 100644
--- a/tools/msm_dp_compliance.c
+++ b/tools/msm_dp_compliance.c
@@ -205,10 +205,15 @@ static FILE *fopenat(int dir, const char *name, const char *mode)
 	return fdopen(fd, mode);
 }
 
-static void setup_debugfs_files(void)
+static void setup_debugfs_files(const char *connector_name)
 {
 	int dir = igt_debugfs_dir(drm_fd);
 
+	if (connector_name) {
+		dir = openat(dir, connector_name, O_RDONLY);
+		igt_require(dir >= 0);
+	}
+
 	test_type_fp = fopenat(dir, MSM_DP_TEST_TYPE_FILE, "r");
 	igt_require(test_type_fp);
 
@@ -624,11 +629,12 @@ int update_display(int mode, bool is_compliance_test)
 	return ret;
 }
 
-static const char optstr[] = "hi";
+static const char optstr[] = "c:hi";
 
 static void __attribute__((noreturn)) usage(char *name, char opt)
 {
-	igt_info("usage: %s [-hi]\n", name);
+	igt_info("usage: %s [-hi] [-c NAME]\n", name);
+	igt_info("\t-c, --connector=NAME - specify connector name");
 	igt_info("\t-h, --help           - print this usage message");
 	igt_info("\t--help-description   - print test description");
 	igt_info("\t-i, --info           - dump info\n");
@@ -708,7 +714,9 @@ int main(int argc, char **argv)
 	GIOChannel *stdinchannel, *testactive_channel;
 	GMainLoop *mainloop;
 	bool opt_dump_info = false;
+	char *opt_connector_name = NULL;
 	struct option long_opts[] = {
+		{"connector", 1, 0, 'c'},
 		{"help-description", 0, 0, HELP_DESCRIPTION},
 		{"help", 0, 0, 'h'},
 		{"info", 0, 0, 'i'},
@@ -718,6 +726,9 @@ int main(int argc, char **argv)
 
 	while ((c = getopt_long(argc, argv, optstr, long_opts, NULL)) != -1) {
 		switch (c) {
+		case 'c':
+			opt_connector_name = optarg;
+			break;
 		case 'i':
 			opt_dump_info = true;
 			break;
@@ -739,7 +750,7 @@ int main(int argc, char **argv)
 	drm_fd = drm_open_driver(DRIVER_ANY);
 
 	kmstest_set_vt_graphics_mode();
-	setup_debugfs_files();
+	setup_debugfs_files(opt_connector_name);
 	cleanup_test();
 	if (opt_dump_info) {
 		dump_info();
-- 
2.33.1


