Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F102710E4F8
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 11:39:00 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b9c0391749so12939971fa.0
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 04:39:00 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Aug 2023 14:38:17 +0300
Message-Id: <20230818113817.155989-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] Revert "testplan/kms: Make documentation is
 mandatory for all kms subtests"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: marcin.bernatowicz@intel.com, kamil.konieczny@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This change broke igt build when building without chamelium

This reverts commit 00bc4cf384382018ebe6f333e4d53849c883445b.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 docs/testplan/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 433464dc8..e838f2eb1 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -31,13 +31,13 @@ xe_test_dict = {
 if build_xe
 	test_dict = {
 		'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
-		'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist },
+		'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
 		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
 	    }
 else
 	test_dict = {
 	      'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
-	      'kms_tests': { 'input': kms_test_config, 'extra_args': check_testlist }
+	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
 	    }
 endif
 
-- 
2.34.1
