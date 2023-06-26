Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28C210E239
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 16:11:58 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 26 Jun 2023 21:31:06 +0530
Message-Id: <20230626160106.2632928-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626160106.2632928-1-bhanuprakash.modem@intel.com>
References: <20230626160106.2632928-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 i-g-t 4/4] testplan/kms: Move kms testplan to intel
 dir
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com
List-ID: <igt-dev@lists.freedesktop.org>

As this testplan is specific to the Intel hardware, the correct
place for it is inside the tests/intel/.

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 docs/testplan/meson.build              | 2 +-
 tests/{ => intel}/kms_test_config.json | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tests/{ => intel}/kms_test_config.json (100%)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index fb933a780..1167edc28 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -7,7 +7,7 @@ rst2pdf = find_program('rst2pdf', required: false)
 stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
 
 xe_test_config = join_paths(source_root, 'tests', 'intel', 'xe_test_config.json')
-kms_test_config = join_paths(source_root, 'tests', 'kms_test_config.json')
+kms_test_config = join_paths(source_root, 'tests', 'intel', 'kms_test_config.json')
 i915_test_config = join_paths(source_root, 'tests', 'intel', 'i915_test_config.json')
 
 check_testlist = []
diff --git a/tests/kms_test_config.json b/tests/intel/kms_test_config.json
similarity index 100%
rename from tests/kms_test_config.json
rename to tests/intel/kms_test_config.json
-- 
2.40.0


