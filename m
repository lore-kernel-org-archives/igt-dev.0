Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 27 May 2022 11:50:42 +0100
Message-Id: <20220527105042.2233128-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220527105042.2233128-1-tvrtko.ursulin@linux.intel.com>
References: <20220527105042.2233128-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] intel_gpu_top: Free all memory on exit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Be nice and explicitly free all memory on exit.

Also fix a Valgrind reported unitilised conditional jump.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tools/intel_gpu_top.c | 51 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 26986a822bb7..997aff582ff7 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -437,6 +437,36 @@ static struct engines *discover_engines(char *device)
 	return engines;
 }
 
+static void free_engines(struct engines *engines)
+{
+	struct pmu_counter **pmu, *free_list[] = {
+		&engines->r_gpu,
+		&engines->r_pkg,
+		&engines->imc_reads,
+		&engines->imc_writes,
+		NULL
+	};
+	unsigned int i;
+
+	for (pmu = &free_list[0]; *pmu; pmu++) {
+		if ((*pmu)->present)
+			free((char *)(*pmu)->units);
+	}
+
+	for (i = 0; i < engines->num_engines; i++) {
+		struct engine *engine = engine_ptr(engines, i);
+
+		free((char *)engine->name);
+		free((char *)engine->short_name);
+		free((char *)engine->display_name);
+	}
+
+	closedir(engines->root);
+
+	free(engines->class);
+	free(engines);
+}
+
 #define _open_pmu(type, cnt, pmu, fd) \
 ({ \
 	int fd__; \
@@ -1073,7 +1103,7 @@ static size_t freadat2buf(char *buf, const size_t sz, DIR *at, const char *name)
 	return count;
 }
 
-static struct clients *scan_clients(struct clients *clients)
+static struct clients *scan_clients(struct clients *clients, bool display)
 {
 	struct dirent *proc_dent;
 	struct client *c;
@@ -1181,7 +1211,7 @@ next:
 			break;
 	}
 
-	return display_clients(clients);
+	return display ? display_clients(clients) : clients;
 }
 
 static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
@@ -2391,7 +2421,7 @@ static void process_stdin(unsigned int timeout_us)
 
 static bool has_drm_fdinfo(const struct igt_device_card *card)
 {
-	struct drm_client_fdinfo info;
+	struct drm_client_fdinfo info = { };
 	unsigned int cnt;
 	int fd;
 
@@ -2572,7 +2602,7 @@ int main(int argc, char **argv)
 	}
 
 	pmu_sample(engines);
-	scan_clients(clients);
+	scan_clients(clients, false);
 	codename = igt_device_get_pretty_name(&card, false);
 
 	while (!stop_top) {
@@ -2599,7 +2629,7 @@ int main(int argc, char **argv)
 		pmu_sample(engines);
 		t = (double)(engines->ts.cur - engines->ts.prev) / 1e9;
 
-		disp_clients = scan_clients(clients);
+		disp_clients = scan_clients(clients, true);
 
 		if (stop_top)
 			break;
@@ -2649,21 +2679,24 @@ int main(int argc, char **argv)
 			pops->close_struct();
 		}
 
-		if (stop_top)
-			break;
-
 		if (disp_clients != clients)
 			free_clients(disp_clients);
 
+		if (stop_top)
+			break;
+
 		if (output_mode == INTERACTIVE)
 			process_stdin(period_us);
 		else
 			usleep(period_us);
 	}
 
+	if (clients)
+		free_clients(clients);
+
 	free(codename);
 err:
-	free(engines);
+	free_engines(engines);
 	free(pmu_device);
 exit:
 	igt_devices_free();
-- 
2.32.0
