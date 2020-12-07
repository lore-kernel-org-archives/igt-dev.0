Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E8D6E7FE
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Dec 2020 11:42:12 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Mon,  7 Dec 2020 17:14:46 +0530
Message-Id: <20201207114446.268638-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t,
 v2] i915/gem_gpgpu_fill: Add test description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: zbigniew.kempczynski@intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add description for the test

v2: Modified description to be more precise

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_gpgpu_fill.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_gpgpu_fill.c b/tests/i915/gem_gpgpu_fill.c
index c605629f..fdd1e93b 100644
--- a/tests/i915/gem_gpgpu_fill.c
+++ b/tests/i915/gem_gpgpu_fill.c
@@ -47,6 +47,8 @@
 #include "igt.h"
 #include "intel_bufops.h"
 
+IGT_TEST_DESCRIPTION("Verify surface is filled correctly using GPGPU pipeline");
+
 #define WIDTH 64
 #define HEIGHT 64
 #define STRIDE (WIDTH)
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
