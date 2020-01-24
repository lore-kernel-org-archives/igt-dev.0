Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C758E72BC6
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 21:22:26 +0000 (UTC)
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date: Fri, 24 Jan 2020 13:18:19 -0800
Message-Id: <20200124211819.1796-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH-i-g-t] tests/i915/gem_mmap_wc: Skip gtt test if
 aperture is missing
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
List-ID: <igt-dev@lists.freedesktop.org>

Skip subtest on platforms that do not have mappable aperture.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_mmap_wc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
index 375a9b50..d1f023d3 100644
--- a/tests/i915/gem_mmap_wc.c
+++ b/tests/i915/gem_mmap_wc.c
@@ -599,8 +599,10 @@ igt_main
 		test_write_cpu_read_wc(fd, 1);
 	igt_subtest("write-cpu-read-wc-unflushed")
 		test_write_cpu_read_wc(fd, 0);
-	igt_subtest("write-gtt-read-wc")
+	igt_subtest("write-gtt-read-wc") {
+		gem_require_mappable_ggtt(fd);
 		test_write_gtt_read_wc(fd);
+	}
 	igt_subtest("pf-nonblock")
 		test_pf_nonblock(fd);
 	igt_subtest("set-cache-level")
-- 
2.22.0.245.g4d8ec15c66

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
