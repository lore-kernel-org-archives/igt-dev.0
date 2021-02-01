Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  1 Feb 2021 09:31:23 +0000
Message-Id: <20210201093123.3481855-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210201085358.3408367-1-chris@chris-wilson.co.uk>
References: <20210201085358.3408367-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t v2] intel_gpu_top: Hide unused clients
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Hide inactive clients by pressing 'i' (toggle in interactive mode).

v2: Fix location of filter_idle.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 tools/intel_gpu_top.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 60ff62d28..d88b6cc61 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1595,6 +1595,7 @@ print_imc(struct engines *engines, double t, int lines, int con_w, int con_h)
 }
 
 static bool class_view;
+static bool filter_idle;
 
 static int
 print_engines_header(struct engines *engines, double t,
@@ -2115,6 +2116,9 @@ static void process_stdin(unsigned int timeout_us)
 		case 'q':
 			stop_top = true;
 			break;
+		case 'i':
+			filter_idle ^= true;
+			break;
 		case '1':
 			class_view ^= true;
 			break;
@@ -2323,9 +2327,14 @@ int main(int argc, char **argv)
 
 				for_each_client(clients, c, j) {
 					assert(c->status != PROBE);
+
 					if (c->status != ALIVE)
 						break; /* Active clients are first in the array. */
 
+					/* Active clients before idle */
+					if (filter_idle && !c->total_runtime)
+						break;
+
 					if (lines >= con_h)
 						break;
 
-- 
2.30.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
