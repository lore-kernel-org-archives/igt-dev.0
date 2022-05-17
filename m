Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DD111322A
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 15:40:50 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 May 2022 17:40:39 +0200
Message-Id: <20220517154044.226733-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20220517154044.226733-1-mauro.chehab@linux.intel.com>
References: <20220517154044.226733-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 4/9] lib/igt_kmod: don't leak who from
 module unload routines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Add code to free allocated strings at the module unload routines
from igt_kmod.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_kmod.c        | 31 +++++++++++++++++++++++--------
 lib/igt_kmod.h        |  4 ++--
 tests/i915/perf_pmu.c |  3 ++-
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index ca74c602ce66..9bb2fc705eb8 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -363,6 +363,15 @@ igt_kmod_list_loaded(void)
 	kmod_module_unref_list(list);
 }
 
+static void *strdup_realloc(char *origptr, const char *strdata)
+{
+	size_t nbytes = strlen(strdata) + 1;
+	char *newptr = realloc(origptr, nbytes);
+
+	memcpy(newptr, strdata, nbytes);
+	return newptr;
+}
+
 /**
  * igt_i915_driver_load:
  * @opts: options to pass to i915 driver
@@ -390,7 +399,7 @@ igt_i915_driver_load(const char *opts)
 	return 0;
 }
 
-static int igt_always_unload_audio_driver(const char **who)
+static int igt_always_unload_audio_driver(char **who)
 {
 	int ret;
 	const char *sound[] = {
@@ -402,7 +411,8 @@ static int igt_always_unload_audio_driver(const char **who)
 	for (const char **m = sound; *m; m++) {
 		if (igt_kmod_is_loaded(*m)) {
 			if (who)
-				*who = *m;
+				*who = strdup_realloc(*who, *m);
+
 			if (igt_lsof_kill_audio_processes())
 				return EACCES;
 
@@ -544,7 +554,7 @@ static int linux_kernel_version(void)
 	return LINUX_VERSION(ver[0], ver[1], ver[2]);
 }
 
-int igt_audio_driver_unload(const char **who)
+int igt_audio_driver_unload(char **who)
 {
 	const char *drm_driver = "i915";
 	unsigned int num_mod, i, j;
@@ -584,7 +594,8 @@ int igt_audio_driver_unload(const char **who)
 	for (j = 0; j < mod[i].num_required; j++) {
 		pos = mod[i].required_by[j];
 		if (who)
-			*who = strdup(mod[pos].name);
+			*who = strdup_realloc(*who, mod[pos].name);
+
 		/*
 		 * If a sound driver depends on drm_driver, kill audio processes
 		 * first, in order to make it possible to unload the driver
@@ -604,7 +615,7 @@ ret:
 	return ret;
 }
 
-int __igt_i915_driver_unload(const char **who)
+int __igt_i915_driver_unload(char **who)
 {
 	int ret;
 
@@ -632,7 +643,8 @@ int __igt_i915_driver_unload(const char **who)
 		ret = igt_kmod_unload(*m, 0);
 		if (ret) {
 			if (who)
-				*who = *m;
+				*who = strdup_realloc(*who, *m);
+
 			return ret;
 		}
 	}
@@ -641,7 +653,8 @@ int __igt_i915_driver_unload(const char **who)
 		ret = igt_kmod_unload("i915", 0);
 		if (ret) {
 			if (who)
-				*who = "i915";
+				*who = strdup_realloc(*who, "i915");
+
 			return ret;
 		}
 	}
@@ -658,7 +671,7 @@ int __igt_i915_driver_unload(const char **who)
 int
 igt_i915_driver_unload(void)
 {
-	const char *who;
+	char *who = NULL;
 	int ret;
 
 	ret = __igt_i915_driver_unload(&who);
@@ -667,8 +680,10 @@ igt_i915_driver_unload(void)
 		igt_kmod_list_loaded();
 		igt_lsof("/dev/dri");
 		igt_lsof("/dev/snd");
+		free(who);
 		return ret;
 	}
+	free(who);
 
 	if (igt_kmod_is_loaded("intel-gtt"))
 		igt_kmod_unload("intel-gtt", 0);
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index 15f0be31e8e4..f98dd29fb175 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -36,11 +36,11 @@ bool igt_kmod_has_param(const char *mod_name, const char *param);
 int igt_kmod_load(const char *mod_name, const char *opts);
 int igt_kmod_unload(const char *mod_name, unsigned int flags);
 
-int igt_audio_driver_unload(const char **whom);
+int igt_audio_driver_unload(char **whom);
 
 int igt_i915_driver_load(const char *opts);
 int igt_i915_driver_unload(void);
-int __igt_i915_driver_unload(const char **whom);
+int __igt_i915_driver_unload(char **whom);
 
 int igt_amdgpu_driver_load(const char *opts);
 int igt_amdgpu_driver_unload(void);
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index c48cc07df0d2..1e385bebc77d 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -2047,7 +2047,7 @@ static void test_unload(unsigned int num_engines)
 		int fd[4 + num_engines * 3], i;
 		uint64_t *buf;
 		int count = 0, ret;
-		const char *who;
+		char *who = NULL;
 		int i915;
 
 		i915 = __drm_open_driver(DRIVER_INTEL);
@@ -2104,6 +2104,7 @@ static void test_unload(unsigned int num_engines)
 		pmu_read_multi(fd[0], count, buf);
 		ret = __igt_i915_driver_unload(&who);
 		igt_assert(ret != 0 && !strcmp(who, "i915"));
+		free(who);
 		pmu_read_multi(fd[0], count, buf);
 
 		igt_debug("Close perf\n");
-- 
2.36.1
