Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Fri,  6 Mar 2020 14:38:49 +0000
Message-Id: <20200306143850.673-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] gem_wsim: Fix calibration for special
 VCS engine name
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

VCS is a special (non-physical) engine id/name which means load-balancing
in legacy workloads. As such when i915 balancing is not enabled it needs
to have a calibration as well.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 benchmarks/gem_wsim.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index a1bbcef031bb..c196b25317ce 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -3353,6 +3353,8 @@ int main(int argc, char **argv)
 						engine_calib_map[eng] = calib_val;
 						if (eng == RCS)
 							engine_calib_map[DEFAULT] = calib_val;
+						else if (eng == VCS1 || eng == VCS2)
+							engine_calib_map[VCS] = calib_val;
 						has_nop_calibration = true;
 					}
 				} else {
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
