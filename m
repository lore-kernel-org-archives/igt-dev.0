Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77133899D6
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 13:08:47 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  9 Aug 2021 15:04:41 +0200
Message-Id: <20210809130533.27759-14-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 13/65] tests/gem_ctx_freq: Adopt to use
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_ctx_freq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
index a34472de5..a29fe68b7 100644
--- a/tests/i915/gem_ctx_freq.c
+++ b/tests/i915/gem_ctx_freq.c
@@ -124,6 +124,7 @@ static void sysfs_range(int i915)
 	igt_spin_t *spin;
 	double measured;
 	int pmu;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 	/*
 	 * The sysfs interface sets the global limits and overrides the
@@ -145,7 +146,7 @@ static void sysfs_range(int i915)
 		uint32_t cur, discard;
 
 		gem_quiescent_gpu(i915);
-		spin = igt_spin_new(i915);
+		spin = igt_spin_new(i915, .ahnd = ahnd);
 		usleep(10000);
 
 		set_sysfs_freq(sys_freq, sys_freq);
@@ -164,6 +165,7 @@ static void sysfs_range(int i915)
 	gem_quiescent_gpu(i915);
 
 	close(pmu);
+	put_ahnd(ahnd);
 
 #undef N_STEPS
 }
-- 
2.26.0
