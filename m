Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F528969E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Aug 2021 11:56:41 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 16 Aug 2021 13:56:23 +0200
Message-Id: <20210816115626.22759-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210816115626.22759-1-zbigniew.kempczynski@intel.com>
References: <20210816115626.22759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] tests/gem_exec_big: Move check of
 pressumed offset out of no-reloc scope
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

Missed during addressing last review - we don't want to process checking
of pressumed offset on no-reloc path. Move this out of no-reloc scope.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_big.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
index 90230fc33..2f47de398 100644
--- a/tests/i915/gem_exec_big.c
+++ b/tests/i915/gem_exec_big.c
@@ -98,12 +98,13 @@ static void exec1(int fd, uint32_t handle, uint64_t reloc_ofs, unsigned flags, c
 
 	gem_execbuf(fd, &execbuf);
 
-	igt_warn_on(gem_reloc[0].presumed_offset == -1);
 	gem_set_domain(fd, gem_exec[0].handle, I915_GEM_DOMAIN_WC, 0);
 
 	if (!has_relocs)
 		return;
 
+	igt_warn_on(gem_reloc[0].presumed_offset == -1);
+
 	if (use_64bit_relocs) {
 		uint64_t tmp;
 		if (ptr)
-- 
2.26.0
