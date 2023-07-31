Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>
Date: Mon, 31 Jul 2023 07:45:54 +0200
Message-ID: <20230731054552.2145292-6-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230731054552.2145292-5-janusz.krzysztofik@linux.intel.com>
References: <20230731054552.2145292-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 1/3] kunit: Report the count of test suites in
 a module
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, igt-dev@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, intel-xe@lists.freedesktop.org,
 kunit-dev@googlegroups.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

According to KTAP specification[1], results should always start from a
header that provides a TAP protocol version, followed by a test plan with
a count of items to be executed.  That pattern should be followed at each
nesting level.  In the current implementation of the top-most, i.e., test
suite level, those rules apply only for test suites built into the kernel,
executed and reported on boot.  Results submitted to dmesg from kunit test
modules loaded later are missing those top-level headers.

As a consequence, if a kunit test module provides more than one test suite
then, without the top level test plan, external tools that are parsing
dmesg for kunit test output are not able to tell how many test suites
should be expected and whether to continue parsing after complete output
from the first test suite is collected.

Submit the top-level headers also from the kunit test module notifier
initialization callback.

[1] https://docs.kernel.org/dev-tools/ktap.html#

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/kunit/test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 84e4666555c94..a29ca1acc4d81 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -729,6 +729,11 @@ EXPORT_SYMBOL_GPL(__kunit_test_suites_exit);
 #ifdef CONFIG_MODULES
 static void kunit_module_init(struct module *mod)
 {
+	if (mod->num_kunit_suites > 0) {
+		pr_info("KTAP version 1\n");
+		pr_info("1..%d\n", mod->num_kunit_suites);
+	}
+
 	__kunit_test_suites_init(mod->kunit_suites, mod->num_kunit_suites);
 }
 
-- 
2.41.0
