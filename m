Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB8410E83D
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 09:05:59 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.20.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 22C3E580D94
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 02:05:41 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q26uh-00BiIA-0N
 for igt-dev@lists.freedesktop.org; Thu, 25 May 2023 11:05:39 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 25 May 2023 11:05:35 +0200
Message-Id: <20230525090535.2791739-12-mauro.chehab@linux.intel.com>
In-Reply-To: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 11/11] testplan/meson.build: make it
 check for missing i915 documentation
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

Now that i915 is fully documented, check it at build time.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 docs/testplan/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
index 6cd44be5ccd3..bf73dd32a15f 100644
--- a/docs/testplan/meson.build
+++ b/docs/testplan/meson.build
@@ -30,13 +30,13 @@ xe_test_dict = {
 
 if build_xe
 	test_dict = {
-		'i915_tests': { 'input': i915_test_config, 'extra_args': [] },
+		'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
 		'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
 		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
 	    }
 else
 	test_dict = {
-	      'i915_tests': { 'input': i915_test_config, 'extra_args': [] },
+	      'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
 	      'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
 	    }
 endif
-- 
2.40.1
