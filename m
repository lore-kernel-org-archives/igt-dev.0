Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E34310E0B7
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Nov 2022 05:30:06 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  1 Nov 2022 22:29:56 -0700
Message-Id: <20221102052956.27662-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_shrink: Fix alloc_size unit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: matthew.auld@intel.com, chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

alloc_size is in MBs, but functions are expecting bytes.
Convert alloc_size to bytes before using it.

TODO: Needs some testing

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/gem_shrink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
index 49df35c29..e3e20dfc9 100644
--- a/tests/i915/gem_shrink.c
+++ b/tests/i915/gem_shrink.c
@@ -455,6 +455,7 @@ igt_main
 		igt_info("Using %d processes and %'"PRIu64"MiB per process\n",
 			 num_processes, alloc_size);
 
+		alloc_size <<= 20;
 		igt_require_memory(num_processes, alloc_size,
 				   CHECK_SWAP | CHECK_RAM);
 
-- 
2.21.0.rc0.32.g243a4c7e27
