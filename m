Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FFA10E030
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 09:27:53 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 14:58:33 +0530
Message-Id: <20231011092833.66391-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: drop planes from dynamic
 subtest name
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

Drop planes from dynamic subtest name.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 9a515559c..edaddd928 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1307,7 +1307,7 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 			continue;
 
 		igt_output_set_pipe(data->output, PIPE_NONE);
-		igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
+		igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
 			test(data, pipe);
 
 		if (is_pipe_limit_reached(++count))
-- 
2.25.1
