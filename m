Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8B910E5CA
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jun 2023 16:20:30 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  2 Jun 2023 18:20:10 +0200
Message-Id: <20230602162011.90097-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230602162011.90097-1-zbigniew.kempczynski@intel.com>
References: <20230602162011.90097-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/4] tests/xe_waitfence: Rename vague
 subtest name "test" to reltime
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

Wait user fence supports two techniques of passing timeout - relative
and absolute. Rename current subtest name "test" to reltime to prepare
the ground for adding new abstime subtest.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 +-
 tests/xe/xe_waitfence.c                  | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 69e70118ed..1552b6ea19 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -214,7 +214,7 @@ igt@xe_vm@munmap-style-unbind-userptr-end
 igt@xe_vm@munmap-style-unbind-userptr-front
 igt@xe_vm@munmap-style-unbind-userptr-inval-end
 igt@xe_vm@munmap-style-unbind-userptr-inval-front
-igt@xe_waitfence@test
+igt@xe_waitfence@reltime
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
 igt@kms_addfb_basic@bad-pitch-0
diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c
index cdfcacdb47..390d9b3221 100644
--- a/tests/xe/xe_waitfence.c
+++ b/tests/xe/xe_waitfence.c
@@ -38,11 +38,11 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 }
 
 /**
- * SUBTEST: test
+ * SUBTEST: reltime
  * Description: Check basic waitfences functionality
  */
 static void
-test(int fd)
+waitfence(int fd)
 {
 	uint32_t bo_1;
 	uint32_t bo_2;
@@ -93,8 +93,8 @@ igt_main
 		xe_device_get(fd);
 	}
 
-	igt_subtest("test")
-		test(fd);
+	igt_subtest("reltime")
+		waitfence(fd);
 
 	igt_fixture {
 		xe_device_put(fd);
-- 
2.34.1
