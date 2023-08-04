Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>
Date: Sat,  5 Aug 2023 00:52:21 +0200
Message-ID: <20230804225220.8005-5-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 0/3] kunit: Expose some built-in features to
 modules
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, Rae Moar <rmoar@google.com>,
 igt-dev@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 intel-xe@lists.freedesktop.org, kunit-dev@googlegroups.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Submit the top-level headers also from the kunit test module notifier
initialization callback, so external tools that are parsing dmesg for
kunit test output are able to tell how many test suites should be expected
and whether to continue parsing after complete output from the first test
suite is collected.

Extend kunit module notifier initialization callback with a processing
path for only listing the tests provided by a module if the kunit action
parameter is set to "list", so external tools can obtain a list of test
cases to be executed in advance and can make a better job on assigning
kernel messages interleaved with kunit output to specific tests. 

Use test filtering functions in kunit module notifier callback functions,
so external tools are able to execute individual test cases from kunit
test modules in order to still better isolate their potential impact on
kernel messages that appear interleaved with output from other tests.
    
v4: Use kunit_exec_run_tests() (Mauro, Rae), but prevent it from
    emitting the headers when called on load of non-test modules, 
  - don't use a different list format, use kunit_exec_list_tests() (Rae),
  - refresh on top of newly introduced attributes patches, handle newly
    introduced kunit.action=list_attr case (Rae).
v3: Fix CONFIG_GLOB, required by filtering functions, not selected when
    building as a module.
v2: Fix new name of a structure moved to kunit namespace not updated
    across all uses.

Janusz Krzysztofik (3):
  kunit: Report the count of test suites in a module
  kunit: Make 'list' action available to kunit test modules
  kunit: Allow kunit test modules to use test filtering

 include/kunit/test.h |  21 ++++++++
 lib/kunit/Kconfig    |   2 +-
 lib/kunit/executor.c | 115 +++++++++++++++++++++++++------------------
 lib/kunit/test.c     |  40 ++++++++++++++-
 4 files changed, 128 insertions(+), 50 deletions(-)


base-commit: 5a175d369c702ce08c9feb630125c9fc7a9e1370
-- 
2.41.0
