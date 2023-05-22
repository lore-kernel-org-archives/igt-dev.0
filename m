Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB2A10E340
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 14:22:11 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.143.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2DA63580919
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 07:22:08 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q16QH-00Abd5-1V
 for igt-dev@lists.freedesktop.org; Mon, 22 May 2023 16:22:05 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 May 2023 16:21:58 +0200
Message-Id: <20230522142201.2527800-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
References: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/6] i915_test_config.json: add a driver name
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

Instead of inferring the name automatically, place it at the file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/i915/i915_test_config.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/i915_test_config.json b/tests/i915/i915_test_config.json
index 812cb73b9f52..cc632f0d7cd5 100644
--- a/tests/i915/i915_test_config.json
+++ b/tests/i915/i915_test_config.json
@@ -1,5 +1,6 @@
 {
     "description": "JSON file to be used to parse i915 documentation",
+    "name": "Tests for i915 Driver",
     "files": [ "*.c", "../core_auth.c", "../core_getclient.c",
                "../core_getstats.c", "../core_getversion.c",
                "../core_hotunplug.c", "../core_setmaster.c",
-- 
2.40.1
