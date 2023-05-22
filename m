Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E5410E33E
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 14:22:11 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.143.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2A548580D77
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 07:22:08 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q16QH-00Abd2-1S
 for igt-dev@lists.freedesktop.org; Mon, 22 May 2023 16:22:05 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 May 2023 16:21:57 +0200
Message-Id: <20230522142201.2527800-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
References: <20230522142201.2527800-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] kms_test_config.json: add a name for
 the KMS Intel testset
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

Instead of inferring the name automatically, which is broken on this
case, as it would use "Tests" place it at the file.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/kms_test_config.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_test_config.json b/tests/kms_test_config.json
index d2d6357d1bc7..5fbe40bdc487 100644
--- a/tests/kms_test_config.json
+++ b/tests/kms_test_config.json
@@ -1,5 +1,6 @@
 {
     "description": "JSON file to be used to parse KMS documentation",
+    "name": "Display and KMS Tests for Intel i915 and Xe Drivers",
     "files": [ "chamelium/kms_*.c", "i915/kms_*.c", "kms_*.c" ],
     "fields": {
         "Category": {
-- 
2.40.1
