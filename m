Return-path: <SRS0=aXFB=TA=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD4110E89B
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 11:45:37 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id l9so4463143plg.0
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 03:45:37 -0800 (PST)
From: "K. Eugene Carlson" <kvngncrlsn@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Feb 2022 20:43:42 +0900
Message-Id: <20220217114341.29345-2-kvngncrlsn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tools/intel_gpu_top: restore original
 terminal attributes upon quit or SIGINT.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kvngncrlsn@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: K. Eugene Carlson <kvngncrlsn@gmail.com>
---
 tools/intel_gpu_top.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 1b2a82b9..36a2787d 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1503,10 +1503,7 @@ print_engines(struct engines *engines, double t, int lines, int w, int h)
 
 static void restore_term(void)
 {
-	int ret;
-
-	ret = tcsetattr(STDIN_FILENO, TCSANOW, &termios_orig);
-	assert(ret == 0);
+	tcsetattr(STDIN_FILENO, TCSANOW, &termios_orig);
 	printf("\n");
 }
 
-- 
2.35.1
