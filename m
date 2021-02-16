Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615F16E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Feb 2021 09:35:11 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Tue, 16 Feb 2021 14:54:53 +0530
Message-Id: <20210216092453.8620-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] test/i915/gem_exec_reloc: set max practical
 relocation limit
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
Cc: hariom.pandey@intel.com, maarten.lankhorst@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

practically lets assume we will have < 512 relocations per page and
multiple object relocations will continue to work. Its highly unlike
to get as many relocations which basic-many-active test is testing
thus setting max limit to 2048 should suffice reloactions test.

Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/i915/gem_exec_reloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index cc9b8cd6..69c8b4f7 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -405,7 +405,7 @@ static void __many_active(int i915, unsigned engine, unsigned long count)
 
 static void many_active(int i915, unsigned engine)
 {
-	const uint64_t max = gem_aperture_size(i915) / 2;
+	const uint64_t max = 2048;
 	unsigned long count = 256;
 
 	igt_until_timeout(2) {
@@ -419,7 +419,7 @@ static void many_active(int i915, unsigned engine)
 		__many_active(i915, engine, count);
 
 		count <<= 1;
-		if (count * 8 >= max)
+		if (count >= max)
 			break;
 	}
 }
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
