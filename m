Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956396E0A6
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 19:17:03 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id p18so2156069plf.13
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Dec 2021 11:17:03 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
Date: Wed,  8 Dec 2021 11:22:15 -0800
Message-Id: <20211208192216.743364-2-robdclark@gmail.com>
In-Reply-To: <20211208192216.743364-1-robdclark@gmail.com>
References: <20211208192216.743364-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 1/2] tools/msm_dp_compliance: Small arg
 parsing cleanup
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tools/msm_dp_compliance.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
index 5e491c89..a15a8dd9 100644
--- a/tools/msm_dp_compliance.c
+++ b/tools/msm_dp_compliance.c
@@ -629,7 +629,9 @@ static const char optstr[] = "hi";
 static void __attribute__((noreturn)) usage(char *name, char opt)
 {
 	igt_info("usage: %s [-hi]\n", name);
-	igt_info("\t-i\tdump info\n");
+	igt_info("\t-h, --help           - print this usage message");
+	igt_info("\t--help-description   - print test description");
+	igt_info("\t-i, --info           - dump info\n");
 	igt_info("\tDefault is to respond to Qd980 tests\n");
 	exit((opt != 'h') ? -1 : 0);
 }
@@ -709,6 +711,7 @@ int main(int argc, char **argv)
 	struct option long_opts[] = {
 		{"help-description", 0, 0, HELP_DESCRIPTION},
 		{"help", 0, 0, 'h'},
+		{"info", 0, 0, 'i'},
 	};
 
 	enter_exec_path(argv);
-- 
2.33.1


