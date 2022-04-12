Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1B710FCA7
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Apr 2022 08:59:26 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 12 Apr 2022 10:59:05 +0200
Message-Id: <1abe12bd41acfc8cd18f19b72535042d791482fd.1649753814.git.mchehab@kernel.org>
In-Reply-To: <cover.1649753814.git.mchehab@kernel.org>
References: <cover.1649753814.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 06/12] scripts/code_cov_selftest.sh: test if
 IGT code coverage is working
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The runner_tests.c won't be able to test code coverage, as it
requires a kernel specially built for such purpose.

So, add a script that will validate possible steps while doing
code coverage.

Reviewed-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1649753814.git.mchehab@kernel.org/

 scripts/code_cov_selftest.sh | 47 ++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100755 scripts/code_cov_selftest.sh

diff --git a/scripts/code_cov_selftest.sh b/scripts/code_cov_selftest.sh
new file mode 100755
index 000000000000..1c4bd96a0111
--- /dev/null
+++ b/scripts/code_cov_selftest.sh
@@ -0,0 +1,47 @@
+#!/bin/bash
+
+trap 'catch $LINENO' ERR
+catch() {
+	echo "===> ERROR: Code coverage selftest failed on $0:$1" >&2
+        exit 1
+}
+
+if [ -z "$IGT_KERNEL_TREE" ] ; then
+        echo "Error! IGT_KERNEL_TREE environment var was not defined." >&2
+        exit 1
+fi
+
+TEST="igt@debugfs_test@read_all_entries"
+
+TESTLIST="my_tests.testlist"
+GATHER="scripts/code_cov_gather_on_test.py"
+LCOV_CAP="scripts/code_cov_capture.sh"
+INFO_RESULTS="info_results"
+TAR_RESULTS="tar_results"
+
+sudo rm -rf results/ $INFO_RESULTS/ $TAR_RESULTS/ || true
+
+echo "$TEST" > $TESTLIST
+
+# run-tests.sh
+echo "==> use lcov capture via run-tests.sh"
+./scripts/run-tests.sh -T $TESTLIST -k $IGT_KERNEL_TREE -c $LCOV_CAP
+echo "==> gather sysfs using run-tests.sh"
+./scripts/run-tests.sh -T $TESTLIST -k $IGT_KERNEL_TREE -P -c $GATHER
+echo "==> gather sysfs using run-tests.sh, capturing at the end"
+./scripts/run-tests.sh -T $TESTLIST -k $IGT_KERNEL_TREE -c $GATHER
+
+# igt_runner called directly
+echo "==> use lcov capture via igt_runner"
+sudo IGT_KERNEL_TREE=$IGT_KERNEL_TREE ./build/runner/igt_runner -o --test-list $TESTLIST --coverage-per-test --collect-script $LCOV_CAP  build/tests results
+echo "==> gather sysfs running igt_runner"
+sudo ./build/runner/igt_runner -o --test-list $TESTLIST --coverage-per-test --collect-script $GATHER build/tests results
+
+# html report
+echo "==> generate report from lcov info files"
+scripts/code_cov_gen_report.sh -r results/code_cov/ -k $IGT_KERNEL_TREE -o $INFO_RESULTS -i --only-i915 --ignore-unused
+echo "==> generate report from sysfs gather files"
+scripts/code_cov_gen_report.sh -r results/code_cov/ -k $IGT_KERNEL_TREE -o $TAR_RESULTS -t --only-drm --ignore-unused
+
+echo
+echo "==> All tests passed. <=="
-- 
2.35.1
