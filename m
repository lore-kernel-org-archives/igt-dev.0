Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDF210E03C
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 10:34:41 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.17.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1A5D1580D29
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 03:34:41 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pryxS-000pV0-2R
 for igt-dev@lists.freedesktop.org; Thu, 27 Apr 2023 12:34:38 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 27 Apr 2023 12:34:35 +0200
Message-Id: <20230427103435.197950-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] testplan/meson.build: don't generate
 testlist on cross-compilation
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

When doing cross-compilation, the binaries won't likely run at
the builder machine. So, it is not possible to verify if there are
documentation gaps.

On such cases, skip checking it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/meson.build | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 3347f61876ef..cc37917bc804 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -11,8 +11,13 @@ xe_test_config = join_paths(source_root, 'tests', 'xe', 'xe_test_config.json')
 check_testlist = []
 if build_tests
 	doc_dependencies = test_executables
-	# Check if documentation matches the actual tests
-	check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
+	# Check if documentation matches the actual tests and IGT runner can run
+	if not meson.is_cross_build()
+		build_info += 'Will Check if documentation is in sync with testlist'
+		check_testlist = [ '--check-testlist', '--igt-build-path', build_root ]
+	else
+		warning('WARNING: Will not check if documentation is in sync with testlist')
+	endif
 else
 	doc_dependencies = []
 endif
-- 
2.40.0
