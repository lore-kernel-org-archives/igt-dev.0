Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D4E10E917
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 06:28:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	karthik.b.s@intel.com
Date: Thu,  9 Feb 2023 11:53:21 +0530
Message-Id: <20230209062322.1562797-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/2] tests/kms_atomic_transition: Reduce the
 execution time on simulation
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

Due to the more number of iterations, "modest-transition" tests are
getting timed out on pre-si CI. Reducing the number of iterations to
half can save a lot of execution time.

V2: - Separate patch for cleanup

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_atomic_transition.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 6d2ebbbff..e1b74ac2c 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -858,6 +858,9 @@ retry:
 
 	iter_max = 1 << j;
 
+	if (igt_run_in_simulation() && iter_max > 1)
+		iter_max = iter_max >> 1;
+
 	if (igt_display_try_commit_atomic(&data->display,
 				DRM_MODE_ATOMIC_TEST_ONLY |
 				DRM_MODE_ATOMIC_ALLOW_MODESET,
-- 
2.39.0
