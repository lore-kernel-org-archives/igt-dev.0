Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6517F10E07C
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Apr 2022 14:29:37 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 26 Apr 2022 10:29:04 -0400
Message-ID: <20220426142906.1016713-3-dingchen.zhang@amd.com>
In-Reply-To: <20220426142906.1016713-1-dingchen.zhang@amd.com>
References: <20220426142906.1016713-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v5 2/4] tests/amdgpu/amd_psr: set visual-confirm
 default to disabled
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

[why & how]
For CI machine, by default it would directly run test case w/o any
manual confirmation. And visual confirm option is to validate the
PSR-SU feature as manual approach, which is for debugging purpose
and not for CI automated scheme.

Pre-set the "visual_confirm" to disable and only to enable the
visual confirm by manual.

changes in v2:
----------------------
- pre-set visual confirm option from enabled to disabled, and set
  it as required argument.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/amdgpu/amd_psr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index e3a2cb4a..8f47e816 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -66,7 +66,7 @@ typedef struct data {
 struct {
 	bool visual_confirm;
 } opt = {
-	.visual_confirm = true,	/* visual confirm debug option */
+	.visual_confirm = false,	/* visual confirm debug option */
 };
 
 static void draw_color_alpha(igt_fb_t *fb, int x, int y, int w, int h,
@@ -491,7 +491,7 @@ const char *help_str =
 "  --visual-confirm           PSR visual confirm debug option enable\n";
 
 struct option long_options[] = {
-	{"visual-confirm",	optional_argument, NULL, 'v'},
+	{"visual-confirm",	required_argument, NULL, 'v'},
 	{ 0, 0, 0, 0 }
 };
 
-- 
2.25.1
