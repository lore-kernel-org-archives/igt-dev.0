Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251416E18E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2020 04:47:26 +0000 (UTC)
From: ranjeet1.kumar@intel.com
Date: Thu, 22 Oct 2020 10:22:15 +0530
Message-Id: <20201022045215.15164-1-ranjeet1.kumar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_bad_reloc: Added description for
 test case
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
To: igt-dev@lists.freedesktop.org, ranjeet1.kumar@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: ranjeet kumar <ranjeet1.kumar@intel.com>

Added test description for subtest.

Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
Signed-off-by: ranjeet kumar <ranjeet1.kumar@intel.com>
---
 tests/i915/gem_bad_reloc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/i915/gem_bad_reloc.c b/tests/i915/gem_bad_reloc.c
index 6acc1724..4ea325dc 100644
--- a/tests/i915/gem_bad_reloc.c
+++ b/tests/i915/gem_bad_reloc.c
@@ -194,12 +194,19 @@ igt_main
 		gem_require_blitter(fd);
 	}
 
+	igt_describe("SNA behaviour is compressing batch buffer which leads to negative"
+		     " relocation deltas. negative self-relocation happening with"
+		     " real offset 0.\n");
 	igt_subtest("negative-reloc")
 		negative_reloc(fd, 0);
 
+	igt_describe("SNA behaviour is compressing batch buffer which leads to negative"
+		     " relocation deltas. negative self-relocation happening with flags"
+		     " for lut_based_execbuffer.\n");
 	igt_subtest("negative-reloc-lut")
 		negative_reloc(fd, USE_LUT);
 
+	igt_describe("exercising blitter operation with negative reloc.\n");
 	igt_subtest("negative-reloc-bltcopy")
 		negative_reloc_blt(fd);
 
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
