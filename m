Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E9410E05E
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 05:02:28 +0000 (UTC)
Received: from linux.intel.com (daanders-mobl1.ger.corp.intel.com
 [10.252.28.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 140BF580C63
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 22:02:27 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pjYoK-000nGM-1B
 for igt-dev@lists.freedesktop.org; Tue, 04 Apr 2023 07:02:24 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  4 Apr 2023 07:02:21 +0200
Message-Id: <20230404050221.189356-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] testplan/meson.build: only run igt_runner
 if it is compiled
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

While the runner is built by default, if jsonc is not found, it
won't be build. This will cause the documentation validation test
to cause the build to fail.

Prevent that by adding an extra check if jsonc is found, as this
is the same condition that it is used to build igt_runner.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 4c67ec42fc69..88029bee5af3 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -9,7 +9,7 @@ stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
 xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
 
 check_testlist = []
-if build_tests
+if build_tests and jsonc.found()
 	# Check if documentation matches the actual tests
 	check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
 else
-- 
2.39.2
