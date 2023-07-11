Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB31210E389
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jul 2023 11:21:16 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Jul 2023 13:20:09 +0200
Message-Id: <20230711112009.122482-18-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230711112009.122482-1-zbigniew.kempczynski@intel.com>
References: <20230711112009.122482-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 17/17] tests/gem_ccs: Avoid writing png
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
---
 tests/i915/gem_ccs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index d9d785ed9b..a1302e0a4d 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -421,7 +421,6 @@ static void block_copy(int i915,
 	if (mid->compression)
 		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
 
-	WRITE_PNG(i915, run_id, "src", &blt.src, width, height);
 	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height);
 
 	if (config->surfcopy && pext) {
-- 
2.34.1
