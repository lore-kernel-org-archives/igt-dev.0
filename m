Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14AA10E09C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 05:58:31 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 11:28:14 +0530
Message-Id: <20230619055814.32202-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_big_joiner: Check if sequential
 pipe is enabled
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

As big joiner is only possible on sequential pipe combinations,
check that the required pipe is enabled before attempting
a big joiner modeset.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/kms_big_joiner.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
index b9dda58f..47c1f5aa 100644
--- a/tests/i915/kms_big_joiner.c
+++ b/tests/i915/kms_big_joiner.c
@@ -225,8 +225,11 @@ igt_main
 	igt_subtest_with_dynamic("basic") {
 		for (i = 0; i < data.n_pipes - 1; i++) {
 			data.pipe1 = pipe_seq[i];
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
-				test_basic_modeset(&data);
+			/* Check if the consecutive pipe is enabled*/
+			if (pipe_seq[i + 1] == data.pipe1 + 1) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
+					test_basic_modeset(&data);
+			}
 		}
 	}
 
-- 
2.39.1
