Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B2810E29E
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Apr 2022 21:58:54 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 20 Apr 2022 17:58:32 -0400
Message-ID: <20220420215834.30467-3-dingchen.zhang@amd.com>
In-Reply-To: <20220420215834.30467-1-dingchen.zhang@amd.com>
References: <20220420215834.30467-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v3 2/4] tests/amdgpu/amd_psr: set visual-confirm
 option required argument
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
previously set to optional argument, and the command line argument
set for visual confirm debug option would cause NULL optarg string
and thus hit system segmentation fault.

set the "visual-confirm" from optional to required argument.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 tests/amdgpu/amd_psr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index e3a2cb4a..834fefcc 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -491,7 +491,7 @@ const char *help_str =
 "  --visual-confirm           PSR visual confirm debug option enable\n";
 
 struct option long_options[] = {
-	{"visual-confirm",	optional_argument, NULL, 'v'},
+	{"visual-confirm",	required_argument, NULL, 'v'},
 	{ 0, 0, 0, 0 }
 };
 
-- 
2.25.1
