Return-path: <SRS0=aXFB=TA=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C8B10E956
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 10:53:42 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 h14-20020a17090a130e00b001b88991a305so9059504pja.3
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 02:53:42 -0800 (PST)
From: "K. Eugene Carlson" <kvngncrlsn@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Feb 2022 19:49:23 +0900
Message-Id: <20220217104923.23135-2-kvngncrlsn@gmail.com>
In-Reply-To: <20220217104923.23135-1-kvngncrlsn@gmail.com>
References: <20220217104923.23135-1-kvngncrlsn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tools/intel_gpu_top: Restore terminal
 attributes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: kvngncrlsn@gmail.com
Cc: "K. Eugene Carlson" <kvngncrlsn@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

---
 tools/intel_gpu_top.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 0404a588..1b2a82b9 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -119,6 +119,8 @@ struct engines {
 
 };
 
+static struct termios termios_orig = { };
+
 __attribute__((format(scanf,3,4)))
 static int igt_sysfs_scanf(int dir, const char *attr, const char *fmt, ...)
 {
@@ -1499,6 +1501,15 @@ print_engines(struct engines *engines, double t, int lines, int w, int h)
 	return lines;
 }
 
+static void restore_term(void)
+{
+	int ret;
+
+	ret = tcsetattr(STDIN_FILENO, TCSANOW, &termios_orig);
+	assert(ret == 0);
+	printf("\n");
+}
+
 static bool stop_top;
 
 static void sigint_handler(int  sig)
@@ -1538,14 +1549,17 @@ static void interactive_stdin(void)
 	struct termios termios = { };
 	int ret;
 
+	ret = tcgetattr(0, &termios);
+	assert(ret == 0);
+
+	memcpy(&termios_orig, &termios, sizeof(struct termios));
+	atexit(restore_term);
+
 	ret = fcntl(0, F_GETFL, NULL);
 	ret |= O_NONBLOCK;
 	ret = fcntl(0, F_SETFL, ret);
 	assert(ret == 0);
 
-	ret = tcgetattr(0, &termios);
-	assert(ret == 0);
-
 	termios.c_lflag &= ~ICANON;
 	termios.c_cc[VMIN] = 1;
 	termios.c_cc[VTIME] = 0; /* Deciseconds only - we'll use poll. */
@@ -1689,12 +1703,8 @@ int main(int argc, char **argv)
 		out = stdout;
 	}
 
-	if (output_mode != INTERACTIVE) {
-		sighandler_t sig = signal(SIGINT, sigint_handler);
-
-		if (sig == SIG_ERR)
-			fprintf(stderr, "Failed to install signal handler!\n");
-	}
+	if (signal(SIGINT, sigint_handler) == SIG_ERR)
+		fprintf(stderr, "Failed to install signal handler!\n");
 
 	switch (output_mode) {
 	case INTERACTIVE:
-- 
2.35.1
