Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697F810E649
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 17:16:07 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jul 2023 19:12:31 +0200
Message-Id: <20230712171231.290555-22-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
References: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 21/21] tests/gem_ccs: Avoid writing png
 twice
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

As Karolina noticed we write source png twice what's just takes
time as source surface is not touched. Drop one png write.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 tests/i915/gem_ccs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index 1a5f3674a0..f5d4ab3598 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -362,7 +362,6 @@ static void block_copy(int i915,
 	if (mid->compression)
 		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
 
-	WRITE_PNG(i915, run_id, "src", &blt.src, width, height);
 	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height);
 
 	if (config->surfcopy && pext) {
-- 
2.34.1
