Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CF010E16F
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 04:59:01 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Mar 2023 21:58:55 -0700
Message-Id: <20230329045855.11263-3-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230329045855.11263-1-niranjana.vishwanathapura@intel.com>
References: <20230329045855.11263-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/xe/xe_guc_pc: Skip RC6 tests for
 PVC
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

The Pontevecchio (PVC) platform doesn't have rc6 support yet.
Skip rc6_on_idle and rc0_on_exec subtests for PVC.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/xe/xe_guc_pc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 60c93288b..5d0a6dc96 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -467,12 +467,14 @@ igt_main
 	}
 
 	igt_subtest("rc6_on_idle") {
+		igt_require(IS_PONTEVECCHIO(xe_dev_id(fd)));
 		xe_for_each_gt(fd, gt) {
 			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
 		}
 	}
 
 	igt_subtest("rc0_on_exec") {
+		igt_require(IS_PONTEVECCHIO(xe_dev_id(fd)));
 		xe_for_each_gt(fd, gt) {
 			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
 			xe_for_each_hw_engine(fd, hwe)
-- 
2.21.0.rc0.32.g243a4c7e27
