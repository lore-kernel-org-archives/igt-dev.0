Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49651B7855
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Aug 2022 12:01:48 +0000 (UTC)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1oOeDU-00CIfk-4Y
 for igt-dev@lists.freedesktop.org; Thu, 18 Aug 2022 14:01:40 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 18 Aug 2022 14:01:19 +0200
Message-Id: <1184abbd6314891d4d8996157270b3edc3aafbf9.1660824078.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] lib/igt_kmod: remove the conditional audio
 removal code
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

It was expected that kernel/modules would contain a fix for
lsmod to properly report bind dependencies between snd_hda_intel
and i915, but, unfortunately:

- This didn't happen yet;
- Kernel 5.20 won't exist.

This is now causing issues, as drm-tip is now based on 6.0-rc1.

As IGT is working fine without that, let's remove the code.
This patch can be reverted once upstream gets fixed.

Reported-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_kmod.c | 196 ++-----------------------------------------------
 1 file changed, 6 insertions(+), 190 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index dfdcfcc546b0..bcf7dfeb5073 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -453,200 +453,16 @@ struct module_ref {
 	unsigned int *required_by;
 };
 
-static struct module_ref *read_module_dependencies(unsigned int *num_mod)
-{
-	FILE *fp = fopen("/proc/modules", "r");
-	struct module_ref *mod = NULL;
-	size_t line_buf_size = 0;
-	char *required_by, *p;
-	unsigned n_mod = 0;
-	unsigned num_req;
-	char *line = NULL;
-	int len = 0;
-	int i, ret;
-
-	igt_assert(fp);
-
-	while ((len = getline(&line, &line_buf_size, fp)) > 0) {
-		mod = realloc(mod, (n_mod + 1) * sizeof(*mod));
-		igt_assert(mod);
-		mod[n_mod].required_by = NULL;
-
-		p = strtok(line, " ");
-		mod[n_mod].name = strdup(p);
-
-		p = strtok(NULL, " ");
-		ret = sscanf(p, "%lu", &mod[n_mod].mem);
-		igt_assert(ret == 1);
-
-		p = strtok(NULL, " ");
-		ret = sscanf(p, "%u", &mod[n_mod].ref_count);
-		igt_assert(ret == 1);
-
-		num_req = 0;
-		required_by = strtok(NULL, " ");
-		if (strcmp(required_by, "-")) {
-			p = strtok(required_by, ",");
-			while (p) {
-				for (i = 0; i < n_mod; i++)
-					if (!strcmp(p, mod[i].name))
-						break;
-
-				igt_assert(i < n_mod);
-
-				mod[n_mod].required_by = realloc(mod[n_mod].required_by,
-								 (num_req + 1) * sizeof(unsigned int));
-				mod[n_mod].required_by[num_req] = i;
-				num_req++;
-				p = strtok(NULL, ",");
-			}
-		}
-		mod[n_mod].num_required = num_req;
-		n_mod++;
-	}
-	free(line);
-	fclose(fp);
-
-	*num_mod = n_mod;
-	return mod;
-}
-
-static void free_module_ref(struct module_ref *mod, unsigned int num_mod)
-{
-	int i;
-
-	for (i = 0; i < num_mod; i++) {
-		free(mod[i].name);
-		free(mod[i].required_by);
-	}
-	free(mod);
-}
-
-static int igt_unload_driver(struct module_ref *mod, unsigned int num_mod,
-			     unsigned int pos)
-{
-	int ret, i;
-
-	/* Recursively remove depending modules, if any */
-	for (i = 0; i < mod[pos].num_required; i++) {
-		ret = igt_unload_driver(mod, num_mod,
-					mod[num_mod].required_by[i]);
-		if (ret)
-			return ret;
-	}
-
-	return igt_kmod_unload(mod[pos].name, 0);
-}
-
-#define LINUX_VERSION(major, minor, patch)			\
-		     ((major) << 16 | (minor) << 8 | (patch))
-
-static int linux_kernel_version(void)
-{
-	struct utsname utsname;
-	int ver[3] = { 0 };
-	int i = 0;
-	int n = 0;
-	char *p;
-
-	if (uname(&utsname))
-		return 0;
-
-	p = utsname.release;
-
-	while (*p && i < 3) {
-		if (isdigit(*p)) {
-			n = n * 10 + (*p - '0');
-			p++;
-			continue;
-		}
-		if (n > 255)
-			n = 255;
-		ver[i] = n;
-		i++;
-		n = 0;
-
-		if (*p != '.')
-			break;
-		p++;
-	}
-
-	return LINUX_VERSION(ver[0], ver[1], ver[2]);
-}
-
 int igt_audio_driver_unload(char **who)
 {
-	const char *drm_driver = "i915";
-	unsigned int num_mod, i, j;
-	struct module_ref *mod;
-	int pos = -1;
-	int ret = 0;
-
 	/*
-	 * On older Kernels, there's no way to check if the audio driver
-	 * binds into the DRM one. So, always remove audio drivers that
-	 * might be binding.
+	 * Currently, there's no way to check if the audio driver binds into the
+	 * DRM one. So, always remove audio drivers that  might be binding.
+	 * This may change in future, once kernel/module gets fixed. So, let's
+	 * keep this boilerplace, in order to make easier to add the new code,
+	 * once upstream is fixed.
 	 */
-	if (linux_kernel_version() < LINUX_VERSION(5, 20, 0))
-		return igt_always_unload_audio_driver(who);
-
-	/*
-	 * Newer Kernels gained support for showing the dependencies between
-	 * audio and DRM drivers via /proc/modules and lsmod. Use it to
-	 * detect if removing the audio driver is needed, properly unloading
-	 * any audio processes that could be using the audio driver and
-	 * handling module dependencies. Such solution should be generic
-	 * enough to work with newer SOC/SOF drivers if ever needed.
-	 */
-
-	mod = read_module_dependencies(&num_mod);
-
-	for (i = 0; i < num_mod; i++)
-		if (!strcmp(mod[i].name, drm_driver))
-			break;
-
-	if (i == num_mod) {
-		ret = 0;
-		goto ret;
-	}
-
-	/* Recursively remove all drivers that depend on drm_driver */
-	for (j = 0; j < mod[i].num_required; j++) {
-		pos = mod[i].required_by[j];
-		if (who)
-			*who = strdup_realloc(*who, mod[pos].name);
-
-		/*
-		 * If a sound driver depends on drm_driver, kill audio processes
-		 * first, in order to make it possible to unload the driver
-		 */
-		if (strstr(mod[pos].name, "snd")) {
-			if (igt_lsof_kill_audio_processes()) {
-				ret = EACCES;
-				goto ret;
-			}
-		}
-
-		ret = pipewire_pulse_start_reserve();
-		if (ret)
-			igt_warn("Failed to notify pipewire_pulse\n");
-		ret = igt_unload_driver(mod, num_mod, pos);
-		pipewire_pulse_stop_reserve();
-		if (ret)
-			break;
-	}
-
-ret:
-	if (ret) {
-		igt_warn("Couldn't unload %s, which is using the %s driver\n",
-			 mod[pos].name, drm_driver);
-		igt_kmod_list_loaded();
-		igt_lsof("/dev/snd");
-	}
-
-	free_module_ref(mod, num_mod);
-
-	return ret;
+	return igt_always_unload_audio_driver(who);
 }
 
 int __igt_i915_driver_unload(char **who)
-- 
2.37.2
