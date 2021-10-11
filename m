Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88D76E431
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Oct 2021 07:21:59 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Mon, 11 Oct 2021 12:43:32 +0530
Message-Id: <20211011071332.18492-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_bad_reloc: Added check for
 verifying aperture support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Added check for verifying aperture support.
"negative_reloc" subtest  uses gtt address spaze size
and "negative_reloc_blt" uses fences, which needs aperture support.

This would avoid test failure for platfom that doesnt support this.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_bad_reloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_bad_reloc.c b/tests/i915/gem_bad_reloc.c
index 3ca0f345..d0902e6c 100644
--- a/tests/i915/gem_bad_reloc.c
+++ b/tests/i915/gem_bad_reloc.c
@@ -195,6 +195,7 @@ igt_main
 		/* Check if relocations supported by platform */
 		igt_require(gem_has_relocations(fd));
 		gem_require_blitter(fd);
+		gem_require_mappable_ggtt(fd);
 	}
 
 	igt_subtest("negative-reloc")
-- 
2.25.1
