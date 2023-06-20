Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141C510E28B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 08:07:34 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.7.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B853A580C3B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 01:07:33 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qBWOh-00GhsA-0H
 for igt-dev@lists.freedesktop.org; Tue, 20 Jun 2023 10:07:31 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Jun 2023 10:07:28 +0200
Message-Id: <20230620080729.3981834-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230620080729.3981834-1-mauro.chehab@linux.intel.com>
References: <20230620080729.3981834-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] xe_test_config.json: add an order for
 run type
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

When generating test lists based on run type for the Xe driver,
order them in a way that the first test will be the one called
after booting the machine (e. g. module load), then normal tests
and finally KUnit ones.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_test_config.json | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/xe/xe_test_config.json b/tests/xe/xe_test_config.json
index 334d372d1330..e89f998bc66b 100644
--- a/tests/xe/xe_test_config.json
+++ b/tests/xe/xe_test_config.json
@@ -22,7 +22,12 @@
                     },
                     "Run type": {
                         "_properties_": {
-                            "description": "Defines what category of testlist it belongs"
+                            "description": "Defines what category of testlist it belongs",
+                            "order": [
+                                "boot",
+                                "__all__",
+                                "kunit"
+                            ]
                         }
                     }
                 }
-- 
2.40.1
