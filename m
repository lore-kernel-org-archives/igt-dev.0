Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8242210EA96
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Oct 2022 08:06:29 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 14 Oct 2022 13:31:08 +0530
Message-Id: <20221014080108.18956-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_display_modes: Clean up
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

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index eff30cbb..9a2199d3 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -162,7 +162,7 @@ igt_main
 	igt_subtest_with_dynamic("extended-mode-basic") {
 		for (i = 0; i < data.n_pipes - 1; i++) {
 			igt_dynamic_f("pipe-%s%s", kmstest_pipe_name(pipe[i]),
-					kmstest_pipe_name(pipe[i+1]));
+					kmstest_pipe_name(pipe[i+1]))
 			run_extendedmode_basic(&data, pipe[i], pipe[i+1]);
 		}
 	}
-- 
2.36.0
