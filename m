Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1726589DF7
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:28:22 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:26:45 +0200
Message-Id: <20210810052711.7866-40-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 39/65] tests/gem_wait: Adopt to use
 allocator
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
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_wait.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
index d56707eda..0d1fea996 100644
--- a/tests/i915/gem_wait.c
+++ b/tests/i915/gem_wait.c
@@ -78,11 +78,13 @@ static void invalid_buf(int fd)
 static void basic(int fd, const intel_ctx_t *ctx, unsigned engine,
 		  unsigned flags)
 {
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 	IGT_CORK_HANDLE(cork);
 	uint32_t plug =
 		flags & (WRITE | AWAIT) ? igt_cork_plug(&cork, fd) : 0;
 	igt_spin_t *spin =
 		igt_spin_new(fd,
+			     .ahnd = ahnd,
 			     .ctx = ctx,
 			     .engine = engine,
 			     .dependency = plug,
@@ -147,6 +149,7 @@ static void basic(int fd, const intel_ctx_t *ctx, unsigned engine,
 	if (plug)
 		gem_close(fd, plug);
 	igt_spin_free(fd, spin);
+	put_ahnd(ahnd);
 }
 
 static void test_all_engines(const char *name, int i915, const intel_ctx_t *ctx,
-- 
2.26.0
