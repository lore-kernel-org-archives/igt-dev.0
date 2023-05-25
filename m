Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27D710E034
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 19:34:26 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 25 May 2023 21:34:11 +0200
Message-Id: <20230525193411.174802-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230525193411.174802-1-zbigniew.kempczynski@intel.com>
References: <20230525193411.174802-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/xe_intel_bb: Skip on platforms
 without render engine
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

Running render test on platforms without 3d engine doesn't make sense.
Use added check and skip on such platforms to avoid the noise.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/xe/xe_intel_bb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
index 35d61608e1..4cdc04345a 100644
--- a/tests/xe/xe_intel_bb.c
+++ b/tests/xe/xe_intel_bb.c
@@ -1168,6 +1168,8 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 		full_batch(bops);
 
 	igt_subtest_with_dynamic("render") {
+		igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
+
 		for (i = 0; i < ARRAY_SIZE(tests); i++) {
 			const struct test *t = &tests[i];
 
-- 
2.34.1
