Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu, 17 Dec 2020 10:38:12 +0000
Message-Id: <20201217103812.1174024-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20201217103812.1174024-1-tvrtko.ursulin@linux.intel.com>
References: <20201217103812.1174024-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 3/3] intel_gpu_top: Fix interactive mode
 on serial console
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

TIOCGWINSZ returns zero columns and rows on serial so lets assume 80x24.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tools/intel_gpu_top.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index d1149eb8e14d..72ad7cbe9a8c 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1640,6 +1640,11 @@ int main(int argc, char **argv)
 		} else if (ioctl(0, TIOCGWINSZ, &ws) != -1) {
 			con_w = ws.ws_col;
 			con_h = ws.ws_row;
+			if (con_w == 0 && con_h == 0) {
+				/* Serial console. */
+				con_w = 80;
+				con_h = 24;
+			}
 		}
 
 		pmu_sample(engines);
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
