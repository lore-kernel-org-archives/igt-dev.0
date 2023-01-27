Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Fri, 27 Jan 2023 11:12:37 +0000
Message-Id: <20230127111241.3624629-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230127111241.3624629-1-tvrtko.ursulin@linux.intel.com>
References: <20230127111241.3624629-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] intel_gpu_top: Automatically enclose
 JSON output into brackets
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Eero Tamminen <eero.t.tamminen@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Parsers need the whole output enclosed into square brackets so every
period sample becomes an array element.

So far we have been suggesting this in the man page but we can trivially
make the tool output that itself.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Eero Tamminen <eero.t.tamminen@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 man/intel_gpu_top.rst | 2 +-
 tools/intel_gpu_top.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
index 4417bcff0d5b..caf0a9f9432c 100644
--- a/man/intel_gpu_top.rst
+++ b/man/intel_gpu_top.rst
@@ -79,7 +79,7 @@ pci          | ``pci:[vendor=%04x/name][,device=%04x][,card=%d]``  Select using
 JSON OUTPUT
 ===========
 
-To parse the JSON as output by the tool the consumer should wrap its entirety into square brackets ([ ]). This will make each sample point a JSON array element and will avoid "Multiple root elements" JSON validation error.
+JSON output will be correctly terminated when the tool cleanly exits, otherwise one square bracket needs to be added before parsing.
 
 LIMITATIONS
 ===========
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 6de8a164fcff..c4d98de4fe31 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -2597,6 +2597,9 @@ int main(int argc, char **argv)
 	scan_clients(clients, false);
 	codename = igt_device_get_pretty_name(&card, false);
 
+	if (output_mode == JSON)
+		printf("[\n");
+
 	while (!stop_top) {
 		struct clients *disp_clients;
 		bool consumed = false;
@@ -2683,6 +2686,9 @@ int main(int argc, char **argv)
 			usleep(period_us);
 	}
 
+	if (output_mode == JSON)
+		printf("]\n");
+
 	if (clients)
 		free_clients(clients);
 
-- 
2.34.1
