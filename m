Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113D16EAF4
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 10:04:54 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed, 11 Dec 2019 11:52:54 +0200
Message-ID: <20191211095254.412681-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner/tests: Increase the timeout by 10x
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The default timeout is 30s.

Recently we see more `ninja test` invocation failing due to runner tests
timing out. This happens for slower environments, i.e. running the
cross-compiled binaries through qemu.

Freedesktop CI/CD runners are shared machines with a lot of cores and
they accept many parallel jobs coming from multiple projects. There
are no resources guarantees, which leads to the sporadic slowness.

Runner tests are taking 10x longer than the next slowest test invoked by
`ninja test` on a typical run. They also seem more prone to resource
thrashing by other processes on the machine, probably due to heavier
reliance on disk IO.

Let's just give them proportional leeway when it comes to timing out.

Cc: Petri Latvala <petri.latvala@intel.com>
Issue: https://gitlab.freedesktop.org/freedesktop/freedesktop/issues/197
Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/runner/meson.build b/runner/meson.build
index 6d8d3ab2..404b8e04 100644
--- a/runner/meson.build
+++ b/runner/meson.build
@@ -60,14 +60,14 @@ if jsonc.found()
 				 link_with : runnerlib,
 				 install : false,
 				 dependencies : igt_deps)
-	test('runner', runner_test)
+	test('runner', runner_test, timeout : 300)
 
 	runner_json_test = executable('runner_json_test', runner_json_test_sources,
 				      c_args : '-DJSON_TESTS_DIRECTORY="@0@"'.format(join_paths(meson.current_source_dir(), 'json_tests_data')),
 				      link_with : runnerlib,
 				      install : false,
 				      dependencies : [igt_deps, jsonc])
-	test('runner_json', runner_json_test)
+	test('runner_json', runner_json_test, timeout : 300)
 
 	build_info += 'Build test runner: true'
 	if liboping.found()
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
