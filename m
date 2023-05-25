Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A4E10E83C
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 09:05:59 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.20.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 20FEE580DBB
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 02:05:41 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q26uh-00BiI7-0K
 for igt-dev@lists.freedesktop.org; Thu, 25 May 2023 11:05:39 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 25 May 2023 11:05:34 +0200
Message-Id: <20230525090535.2791739-11-mauro.chehab@linux.intel.com>
In-Reply-To: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
References: <20230525090535.2791739-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 10/11] i915_test_config.json: exclude
 gem_concurrent_blit.c
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

This is actually a subset of gem_concurrent_all.c, which can't
be described, as it containd 400k+ tests on it. It also has an
insane number of tests:

	$ ./build/tests/gem_concurrent_all --list |wc -l
	428400
	$ ./build/tests/gem_concurrent_blit --list |wc -l
	57120

It makes no sense to document all of them. So, exclude it as
well, as otherwise adding a logic to check for missing documentation
on i915 will complain with:

	...
	Warning: Missing documentation for igt@gem_concurrent_blit@4KiB-tiny-wc-blt-read-read-bcs-forked
	Warning: Missing documentation for igt@gem_concurrent_blit@4KiB-tiny-wc-blt-read-read-bcs-interruptible
	Warning: Missing documentation for igt@gem_concurrent_blit@4KiB-tiny-wc-blt-read-read-rcs
	...

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/i915_test_config.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/i915_test_config.json b/tests/i915/i915_test_config.json
index 812cb73b9f52..ae8317b6aefe 100644
--- a/tests/i915/i915_test_config.json
+++ b/tests/i915/i915_test_config.json
@@ -11,7 +11,7 @@
                "../prime_vgem.c", "../sw_sync.c", "../syncobj_basic.c",
                "../syncobj_timeline.c", "../syncobj_wait.c",
                "../vgem_basic.c", "../vgem_slow.c" ],
-    "exclude_files": [ "kms_*", "gem_concurrent_all.c" ],
+    "exclude_files": [ "kms_*", "gem_concurrent_all.c", "gem_concurrent_blit.c" ],
     "fields": {
 	"Mega feature": {
                 "_properties_": {
-- 
2.40.1
