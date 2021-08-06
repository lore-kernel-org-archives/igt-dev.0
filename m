Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAB76EB9B
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:42:31 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:41:10 +0200
Message-Id: <20210806134145.24634-22-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 21/56] tests/gem_exec_fair: Add softpin
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Use softpin on gens where relocations are not allowed.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_fair.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index 4b5531cc2..ef5a450f6 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -379,6 +379,7 @@ read_ctx_timestamp(int i915, const intel_ctx_t *ctx,
 	const uint32_t runtime = base + (use_64b ? 0x3a8 : 0x358);
 	uint32_t *map, *cs;
 	uint32_t ts;
+	bool has_relocs = gem_has_relocations(i915);
 
 	cs = map = gem_mmap__device_coherent(i915, obj.handle,
 					     0, 4096, PROT_WRITE);
@@ -396,6 +397,11 @@ read_ctx_timestamp(int i915, const intel_ctx_t *ctx,
 
 	*cs++ = MI_BATCH_BUFFER_END;
 
+	if (!has_relocs) {
+		obj.relocation_count = 0;
+		obj.flags |= EXEC_OBJECT_PINNED;
+	}
+
 	gem_execbuf(i915, &execbuf);
 	gem_sync(i915, obj.handle);
 	ts = map[1000];
-- 
2.26.0
