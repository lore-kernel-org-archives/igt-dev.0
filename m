Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFF810E1A4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 22:23:36 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Mar 2023 15:23:31 -0700
Message-Id: <20230329222331.32734-3-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230329222331.32734-1-niranjana.vishwanathapura@intel.com>
References: <20230329222331.32734-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/xe/xe_guc_pc: Skip RC6 tests
 for PVC
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

v2: Assert for !IS_PONTEVECCHIO()

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/xe/xe_guc_pc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 60c93288b..39a755d76 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -467,12 +467,14 @@ igt_main
 	}
 
 	igt_subtest("rc6_on_idle") {
+		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
 		xe_for_each_gt(fd, gt) {
 			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
 		}
 	}
 
 	igt_subtest("rc0_on_exec") {
+		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
 		xe_for_each_gt(fd, gt) {
 			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
 			xe_for_each_hw_engine(fd, hwe)
-- 
2.21.0.rc0.32.g243a4c7e27
