Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 18 Jun 2020 11:47:46 +0100
Message-Id: <20200618104747.24005-10-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
References: <20200618104747.24005-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 10/11] gem_wsim: Fix calibration handling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Intended use case was that run without arguments prints out the
calibrations which can be simply copied and pasted to the -n argument and
things should just work.

Two problems we need to solve: If the print out loops shows zero
calibrations (engine not present) they are later rejected and also if some
calibration is not given it is only an error if it needs to be used
(engine present).

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 benchmarks/gem_wsim.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 59ddc798a3ea..811a4b1b7161 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -296,8 +296,8 @@ print_engine_calibrations(void)
 
 	printf("Nop calibration for %uus delay is: ", nop_calibration_us);
 	for (int i = 0; i < NUM_ENGINES; i++) {
-		/* skip DEFAULT and VCS engines */
-		if (i != DEFAULT && i != VCS) {
+		/* skip engines not present and DEFAULT and VCS */
+		if (i != DEFAULT && i != VCS && engine_calib_map[i]) {
 			if (first_entry) {
 				printf("%s=%lu", ring_str_map[i], engine_calib_map[i]);
 				first_entry = false;
@@ -2862,22 +2862,6 @@ int main(int argc, char **argv)
 		if (verbose)
 			print_engine_calibrations();
 		goto out;
-	} else {
-		bool missing = false;
-
-		for (i = 0; i < NUM_ENGINES; i++) {
-			if (i == VCS)
-				continue;
-
-			if (!engine_calib_map[i]) {
-				wsim_err("Missing calibration for '%s'!\n",
-					 ring_str_map[i]);
-				missing = true;
-			}
-		}
-
-		if (missing)
-			goto err;
 	}
 
 	if (!nr_w_args) {
-- 
2.20.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
