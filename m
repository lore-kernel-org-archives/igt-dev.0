Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8B510EA90
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 14:01:27 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 88D37580CD3
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 07:01:21 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1phWMZ-00AuXP-0N
 for igt-dev@lists.freedesktop.org; Wed, 29 Mar 2023 16:01:19 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Mar 2023 16:01:16 +0200
Message-Id: <e015c051fc2b5ed1c4743d9f9214615f8d3b5124.1680098476.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] runner/meson.build: fix minimal build
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

Minimal pipeline s now failing:
	https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/38824636

This doesn't seem to be related to the patches at the series from
where the issue was reported, but addressing it is simple enough:
just remove the error and change the logic to properly validate
the possible options.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 runner/meson.build | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/runner/meson.build b/runner/meson.build
index dadfc75f0ca7..c62303ce35c5 100644
--- a/runner/meson.build
+++ b/runner/meson.build
@@ -24,11 +24,7 @@ if liboping.found()
 	runner_c_args += '-DHAVE_OPING=1'
 endif
 
-if not build_tests and jsonc.found()
-	error('Building test runner requires building tests')
-endif
-
-if jsonc.found()
+if jsonc.found() and build_tests
 	subdir('testdata')
 
 	runnerlib = static_library('igt_runner', runnerlib_sources,
-- 
2.39.2
