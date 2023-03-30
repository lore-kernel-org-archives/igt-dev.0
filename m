Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A5210EE1E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 13:06:08 +0000 (UTC)
Received: from linux.intel.com (pludynia-mobl.ger.corp.intel.com [10.252.3.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 70E06580DA5
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 06:05:24 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1phrxy-00BSb8-1Y
 for igt-dev@lists.freedesktop.org; Thu, 30 Mar 2023 15:05:22 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Mar 2023 15:05:18 +0200
Message-Id: <20230330130518.2731441-13-mauro.chehab@linux.intel.com>
In-Reply-To: <20230330130518.2731441-1-mauro.chehab@linux.intel.com>
References: <20230330130518.2731441-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 12/12] runner/meson.build: fix minimal
 build
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
