Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF9610E303
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 08:56:01 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 00:58:47 -0800
Message-Id: <20221206085849.271505-10-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
References: <20221206085849.271505-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 09/11] tools/intel_guc_logger: By default
 don't change GuC log verbosity
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

By default, don't change the verbosity if the user hasn't explicitly
requested to change it. Also, don't allow users to set the GuC log
verbosity to level of 0 (i.e. disabled) else the logger will not
receive any data.

Also, fix a bug where we set the verbosity at the end of logging
to zero. Instead, save the original GuC log verbosity when we start
the logger and then restore that value.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tools/intel_guc_logger.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/tools/intel_guc_logger.c b/tools/intel_guc_logger.c
index be09190c..7243ad43 100644
--- a/tools/intel_guc_logger.c
+++ b/tools/intel_guc_logger.c
@@ -56,7 +56,7 @@
 #define GLR_CHANNEL_NAME             "guc_log_relay_chan0"
 
 #define DEFAULT_OUTPUT_FILE_NAME     "guc_log_dump" /*.dat suffic added later*/
-#define DEFAULT_GUCLOG_VERBOSITY     3 /* by default capture logs at max verbosity */
+#define DEFAULT_GUCLOG_VERBOSITY     0 /* by default don't change GuC verbosity */
 #define DEFAULT_SUBBUF_COUNT         (4 * 8)
 					/* default to kernel built-in:   *
 					 *   4 x 8 subbuf regions        *
@@ -96,6 +96,7 @@ struct guc_t {
 	bool stop_logging;
 	bool capturing_stopped;
 	uint32_t fw_overflows;
+	uint64_t ori_loglevel;
 };
 
 struct global_t {
@@ -167,17 +168,18 @@ static void guc_log_verbosity(struct thread_t *tdata, bool enable)
 	char *str;
 	int loglevelfd;
 	uint64_t val;
+	char outstr[128];
 	int ret;
 
 	igt_assert_neq(asprintf(&str, "%s/%s", tdata->guc->fspath, GLR_LOGLEVEL_NAME), -1);
 	igt_info("Opening log level -> %s\n", str);
-	loglevelfd = igt_debugfs_open(tdata->global->drmfd, str, O_WRONLY);
+	loglevelfd = igt_debugfs_open(tdata->global->drmfd, str, O_RDWR);
 	free(str);
 	igt_assert_f(loglevelfd >= 0, "couldn't open the GuC log level file\n");
 
 	/*
 	 * i915 expects GuC log level to be specified as:
-	 * 0: disabled
+	 * 0: [dont modify verbosity]
 	 * 1: enabled (non-verbose mode)
 	 * 2: GuC verbosity level 0
 	 * 3: GuC verbosity level 1
@@ -185,13 +187,24 @@ static void guc_log_verbosity(struct thread_t *tdata, bool enable)
 	 * 5: GuC verbosity level 3
 	 * intel_guc_logger takes input range of 0..3 that maps to 2..5 above.
 	 */
-	val = enable ? tdata->global->verbosity + 2 : 0;
-	ret = asprintf(&str, "0x%" PRIx64, val);
-	igt_assert_neq(ret, -1);
-	ret = write(loglevelfd, str, ret);
-	free(str);
-	igt_assert_f(ret > 0, "couldn't write verbosity to log level file\n");
-	igt_info("Set GuC log level = %d\n", (int)val);
+	if (enable) {
+		ret = read(loglevelfd, outstr, sizeof(outstr) - 1);
+		igt_assert(ret > 0);
+		outstr[ret] = '\0';
+		tdata->guc->ori_loglevel = atoll(outstr);
+		igt_info("Current GuC log level = %d\n",
+			 (int)tdata->guc->ori_loglevel);
+	}
+	/* Treat the lowest verbosity level as no change to verbosity  */
+	if (tdata->global->verbosity) {
+		val = enable ? tdata->global->verbosity + 2 : tdata->guc->ori_loglevel;
+		ret = asprintf(&str, "0x%" PRIx64, val);
+		igt_assert_neq(ret, -1);
+		ret = write(loglevelfd, str, ret);
+		free(str);
+		igt_assert_f(ret > 0, "couldn't write verbosity to log level file\n");
+		igt_info("Setting GuC log level = %d\n", (int)val);
+	}
 
 	close(loglevelfd);
 }
-- 
2.34.1
