Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Fri, 27 Jan 2023 11:12:40 +0000
Message-Id: <20230127111241.3624629-6-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230127111241.3624629-1-tvrtko.ursulin@linux.intel.com>
References: <20230127111241.3624629-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/6] intel_gpu_top: Fix cleanup on old
 kernels / unsupported GPU
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Avoid trying to dereference null engines on exit when there are either
none which are supported, or kernel does not have i915 PMU support.

Also fix a memory leak on the same failure path just so Valgrind runs are
quite.

v2:
 * Fix a memory leak in the same failure mode too.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com> # v1
---
 tools/intel_gpu_top.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 7aa233570463..0a1de41b3374 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -340,7 +340,7 @@ static struct engines *discover_engines(char *device)
 
 	d = opendir(sysfs_root);
 	if (!d)
-		return NULL;
+		goto err;
 
 	while ((dent = readdir(d)) != NULL) {
 		const char *endswith = "-busy";
@@ -423,10 +423,8 @@ static struct engines *discover_engines(char *device)
 	}
 
 	if (ret) {
-		free(engines);
 		errno = ret;
-
-		return NULL;
+		goto err;
 	}
 
 	qsort(engine_ptr(engines, 0), engines->num_engines,
@@ -435,6 +433,11 @@ static struct engines *discover_engines(char *device)
 	engines->root = d;
 
 	return engines;
+
+err:
+	free(engines);
+
+	return NULL;
 }
 
 static void free_engines(struct engines *engines)
@@ -448,6 +451,9 @@ static void free_engines(struct engines *engines)
 	};
 	unsigned int i;
 
+	if (!engines)
+		return;
+
 	for (pmu = &free_list[0]; *pmu; pmu++) {
 		if ((*pmu)->present)
 			free((char *)(*pmu)->units);
@@ -2568,7 +2574,7 @@ int main(int argc, char **argv)
 			"Failed to detect engines! (%s)\n(Kernel 4.16 or newer is required for i915 PMU support.)\n",
 			strerror(errno));
 		ret = EXIT_FAILURE;
-		goto err;
+		goto err_engines;
 	}
 
 	ret = pmu_init(engines);
@@ -2585,7 +2591,7 @@ int main(int argc, char **argv)
 "More information can be found at 'Perf events and tool security' document:\n"
 "https://www.kernel.org/doc/html/latest/admin-guide/perf-security.html\n");
 		ret = EXIT_FAILURE;
-		goto err;
+		goto err_pmu;
 	}
 
 	ret = EXIT_SUCCESS;
@@ -2699,8 +2705,9 @@ int main(int argc, char **argv)
 		free_clients(clients);
 
 	free(codename);
-err:
+err_pmu:
 	free_engines(engines);
+err_engines:
 	free(pmu_device);
 exit:
 	igt_devices_free();
-- 
2.34.1
