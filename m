Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E788510E099
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 09:20:51 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 14:51:32 +0530
Message-Id: <20231011092132.66219-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_sequence: use pipe_name followed
 by output_name
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

Use pipe_name followed by output_name.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_sequence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index c6d6dea00..6716d3860 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -320,7 +320,7 @@ igt_main
 					if (!i915_pipe_output_combo_valid(&data.display))
 						continue;
 
-					igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(p)) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), igt_output_name(output)) {
 						data.pipe = p;
 						data.output = output;
 						data.flags = m->flags;
-- 
2.25.1
