Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6560910EEFE
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 09:47:52 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com
Date: Fri, 29 Apr 2022 15:16:48 +0530
Message-Id: <20220429094649.17996-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20220429094649.17996-1-sai.gowtham.ch@intel.com>
References: <20220429094649.17996-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_bad_reloc: Added description
 for test case
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Added test description for subtest that are available.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_bad_reloc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/i915/gem_bad_reloc.c b/tests/i915/gem_bad_reloc.c
index 3ca0f345..478e78a6 100644
--- a/tests/i915/gem_bad_reloc.c
+++ b/tests/i915/gem_bad_reloc.c
@@ -197,12 +197,17 @@ igt_main
 		gem_require_blitter(fd);
 	}
 
+	igt_describe("SNA behaviour is compressing batch buffer which leads to negative"
+		     " relocation deltas. Negative self-relocation happening with"
+		     " real offset 0.\n");
 	igt_subtest("negative-reloc")
 		negative_reloc(fd, 0);
 
+	igt_describe("Similar to previous test with flags for lut_based_execbuffer.");
 	igt_subtest("negative-reloc-lut")
 		negative_reloc(fd, USE_LUT);
 
+	igt_describe("Exercising blitter operation with negative reloc.\n");
 	igt_subtest("negative-reloc-bltcopy")
 		negative_reloc_blt(fd);
 
-- 
2.35.1
