Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553466EBAC
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:43:13 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:41:37 +0200
Message-Id: <20210806134145.24634-49-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 48/56] tests/i915_pm_rps: Alter to use
 no-reloc
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
---
 tests/i915/i915_pm_rps.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index f51a47479..ada06aa94 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -250,6 +250,10 @@ static void load_helper_run(enum load load)
 		igt_spin_t *spin[2] = {};
 		bool prev_load;
 		uint32_t handle;
+		uint64_t ahnd;
+
+		intel_allocator_init();
+		ahnd = get_reloc_ahnd(drm_fd, 0);
 
 		signal(SIGTERM, load_helper_signal_handler);
 		signal(SIGUSR2, load_helper_signal_handler);
@@ -257,9 +261,9 @@ static void load_helper_run(enum load load)
 		igt_debug("Applying %s load...\n", lh.load ? "high" : "low");
 
 		prev_load = lh.load == HIGH;
-		spin[0] = __igt_spin_new(drm_fd);
+		spin[0] = __igt_spin_new(drm_fd, .ahnd = ahnd);
 		if (prev_load)
-			spin[1] = __igt_spin_new(drm_fd);
+			spin[1] = __igt_spin_new(drm_fd, .ahnd = ahnd);
 		prev_load = !prev_load; /* send the initial signal */
 		while (!lh.exit) {
 			bool high_load;
@@ -279,7 +283,7 @@ static void load_helper_run(enum load load)
 			} else {
 				spin[0] = spin[1];
 			}
-			spin[high_load] = __igt_spin_new(drm_fd);
+			spin[high_load] = __igt_spin_new(drm_fd, .ahnd = ahnd);
 
 			if (lh.signal && high_load != prev_load) {
 				write(lh.link, &lh.signal, sizeof(lh.signal));
@@ -310,6 +314,7 @@ static void load_helper_run(enum load load)
 
 		igt_spin_free(drm_fd, spin[1]);
 		igt_spin_free(drm_fd, spin[0]);
+		put_ahnd(ahnd);
 	}
 
 	close(lh.link);
@@ -542,11 +547,14 @@ static void boost_freq(int fd, int *boost_freqs)
 {
 	int64_t timeout = 1;
 	igt_spin_t *load;
+	/* We need to keep dependency spin offset for load->handle */
+	uint64_t ahnd = get_simple_l2h_ahnd(fd, 0);
 
-	load = igt_spin_new(fd);
+	//get_offset(ahnd, 1000, 0x1000000, 0);
+	load = igt_spin_new(fd, .ahnd = ahnd);
 
 	/* Strip off extra fences from the object, and keep it from starting */
-	igt_spin_free(fd, igt_spin_new(fd, .dependency = load->handle));
+	igt_spin_free(fd, igt_spin_new(fd, .ahnd = ahnd, .dependency = load->handle));
 
 	/* Waiting will grant us a boost to maximum */
 	gem_wait(fd, load->handle, &timeout);
@@ -558,6 +566,7 @@ static void boost_freq(int fd, int *boost_freqs)
 	igt_spin_end(load);
 	gem_sync(fd, load->handle);
 	igt_spin_free(fd, load);
+	put_ahnd(ahnd);
 }
 
 static void waitboost(int fd, bool reset)
-- 
2.26.0
