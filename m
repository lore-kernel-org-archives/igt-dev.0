Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9483789CC4
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Apr 2021 03:20:19 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Wed,  7 Apr 2021 08:39:52 +0530
Message-Id: <20210407030952.44288-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] test/i915/basic-wide-active: set max relocation
 limit
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
To: igt-dev@lists.freedesktop.org
Cc: hariom.pandey@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

practically its highly unlike to get as many relocations which
basic-wide-active test is testing thus setting and adjusting
max limit and count to avoid failures on legacy platforms like KBL.

Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/i915/gem_exec_reloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index 397c335e..a6088959 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -477,8 +477,8 @@ static void __wide_active(int i915, unsigned engine, unsigned long count)
 
 static void wide_active(int i915, unsigned engine)
 {
-	const uint64_t max = gem_aperture_size(i915) / 4096 / 2;
-	unsigned long count = 256;
+	const uint64_t max = 128;
+	unsigned long count = 32;
 
 	igt_until_timeout(2) {
 		uint64_t required, total;
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
