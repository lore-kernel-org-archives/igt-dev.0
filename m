Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C2811B84F
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 23:20:50 +0000 (UTC)
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 28 Jul 2022 16:20:32 -0700
Message-ID: <20220728232033.589-3-quic_rohiiyer@quicinc.com>
In-Reply-To: <20220728232033.589-1-quic_rohiiyer@quicinc.com>
References: <20220728232033.589-1-quic_rohiiyer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v4 2/3] tests/testdisplay: Use
 igt_parse_mode_string for command line arguments
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Use igt_parse_mode_string instead of sscanf to parse mode string from command line.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
---
 tests/testdisplay.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index e9fbd260..4db182b4 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -625,8 +625,6 @@ static const char *help_str =
 
 static int opt_handler(int opt, int opt_index, void *data)
 {
-	float force_clock;
-
 	switch (opt) {
 	case '3':
 		test_stereo_modes = 1;
@@ -642,12 +640,8 @@ static int opt_handler(int opt, int opt_index, void *data)
 		break;
 	case 'f':
 		force_mode = 1;
-		if (sscanf(optarg,"%f,%hu,%hu,%hu,%hu,%hu,%hu,%hu,%hu",
-			   &force_clock,&force_timing.hdisplay, &force_timing.hsync_start,&force_timing.hsync_end,&force_timing.htotal,
-			   &force_timing.vdisplay, &force_timing.vsync_start, &force_timing.vsync_end, &force_timing.vtotal)!= 9)
+		if (!igt_parse_mode_string(optarg, &force_timing))
 			return IGT_OPT_HANDLER_ERROR;
-		force_timing.clock = force_clock*1000;
-
 		break;
 	case 's':
 		sleep_between_modes = atoi(optarg);
-- 
2.31.0
