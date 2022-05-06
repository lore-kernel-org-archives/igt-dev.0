Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A645110E599
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 11:48:36 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Fri,  6 May 2022 13:48:26 +0200
Message-Id: <20220506114829.2288273-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
References: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/6] lib/igt_kmod: improve audio unbind
 logic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The dependencies between audio and DRM drivers are not trivial.

On several CPUs, the logic inside snd-hda-intel, for instance, tries to
hook into i915 driver, via drm_audio_component logic. That also happens
when there's no runtime PM.

When the audio driver is bound into i915, removing or unbinding i915
without first removing the audio driver produce Kernel errors.

So, the audio driver(s) should be removed first, and this can only
happen after pulseaudio, pipewire-pulse, audioctl and any other
userspace program stops using it.

This is more prune to failures. So, the best is to only try to stop
the audio driver when it is known to have dependencies on the video
driver.

Before an upcoming Kernel patch, there's no way to detect if the
audio driver required a DRM one. So, the safest way is to always
remove the audio drivers that are known to cause issues.

After the new Kernel, the logic can be more selective, only removing
the audio driver if /proc/modules shows dependencies with the DRM
driver.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_kmod.c | 192 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 191 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index d282be70f102..ca74c602ce66 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -24,6 +24,7 @@
 #include <ctype.h>
 #include <signal.h>
 #include <errno.h>
+#include <sys/utsname.h>
 
 #include "igt_aux.h"
 #include "igt_core.h"
@@ -389,7 +390,7 @@ igt_i915_driver_load(const char *opts)
 	return 0;
 }
 
-int igt_audio_driver_unload(const char **who)
+static int igt_always_unload_audio_driver(const char **who)
 {
 	int ret;
 	const char *sound[] = {
@@ -414,6 +415,195 @@ int igt_audio_driver_unload(const char **who)
 	return 0;
 }
 
+struct module_ref {
+	char *name;
+	unsigned long mem;
+	unsigned int ref_count;
+	unsigned int num_required;
+	unsigned int *required_by;
+};
+
+static struct module_ref *read_module_dependencies(unsigned int *num_mod)
+{
+	FILE *fp = fopen("/proc/modules", "r");
+	struct module_ref *mod = NULL;
+	size_t line_buf_size = 0;
+	char *required_by, *p;
+	unsigned n_mod = 0;
+	unsigned num_req;
+	char *line = NULL;
+	int len = 0;
+	int i, ret;
+
+	igt_assert(fp);
+
+	while ((len = getline(&line, &line_buf_size, fp)) > 0) {
+		mod = realloc(mod, (n_mod + 1) * sizeof(*mod));
+		igt_assert(mod);
+		mod[n_mod].required_by = NULL;
+
+		p = strtok(line, " ");
+		mod[n_mod].name = strdup(p);
+
+		p = strtok(NULL, " ");
+		ret = sscanf(p, "%lu", &mod[n_mod].mem);
+		igt_assert(ret == 1);
+
+		p = strtok(NULL, " ");
+		ret = sscanf(p, "%u", &mod[n_mod].ref_count);
+		igt_assert(ret == 1);
+
+		num_req = 0;
+		required_by = strtok(NULL, " ");
+		if (strcmp(required_by, "-")) {
+			p = strtok(required_by, ",");
+			while (p) {
+				for (i = 0; i < n_mod; i++)
+					if (!strcmp(p, mod[i].name))
+						break;
+
+				igt_assert(i < n_mod);
+
+				mod[n_mod].required_by = realloc(mod[n_mod].required_by,
+								 (num_req + 1) * sizeof(unsigned int));
+				mod[n_mod].required_by[num_req] = i;
+				num_req++;
+				p = strtok(NULL, ",");
+			}
+		}
+		mod[n_mod].num_required = num_req;
+		n_mod++;
+	}
+	free(line);
+	fclose(fp);
+
+	*num_mod = n_mod;
+	return mod;
+}
+
+static void free_module_ref(struct module_ref *mod, unsigned int num_mod)
+{
+	int i;
+
+	for (i = 0; i < num_mod; i++) {
+		free(mod[i].name);
+		free(mod[i].required_by);
+	}
+	free(mod);
+}
+
+static int igt_unload_driver(struct module_ref *mod, unsigned int num_mod,
+			     unsigned int pos)
+{
+	int ret, i;
+
+	/* Recursively remove depending modules, if any */
+	for (i = 0; i < mod[pos].num_required; i++) {
+		ret = igt_unload_driver(mod, num_mod,
+					mod[num_mod].required_by[i]);
+		if (ret)
+			return ret;
+	}
+
+	return igt_kmod_unload(mod[pos].name, 0);
+}
+
+#define LINUX_VERSION(major, minor, patch)			\
+		     ((major) << 16 | (minor) << 8 | (patch))
+
+static int linux_kernel_version(void)
+{
+	struct utsname utsname;
+	int ver[3] = { 0 };
+	int i = 0;
+	int n = 0;
+	char *p;
+
+	if (uname(&utsname))
+		return 0;
+
+	p = utsname.release;
+
+	while (*p && i < 3) {
+		if (isdigit(*p)) {
+			n = n * 10 + (*p - '0');
+			p++;
+			continue;
+		}
+		if (n > 255)
+			n = 255;
+		ver[i] = n;
+		i++;
+		n = 0;
+
+		if (*p != '.')
+			break;
+		p++;
+	}
+
+	return LINUX_VERSION(ver[0], ver[1], ver[2]);
+}
+
+int igt_audio_driver_unload(const char **who)
+{
+	const char *drm_driver = "i915";
+	unsigned int num_mod, i, j;
+	struct module_ref *mod;
+	int pos = -1;
+	int ret = 0;
+
+	/*
+	 * On older Kernels, there's no way to check if the audio driver
+	 * binds into the DRM one. So, always remove audio drivers that
+	 * might be binding.
+	 */
+	if (linux_kernel_version() < LINUX_VERSION(5, 20, 0))
+		return igt_always_unload_audio_driver(who);
+
+	/*
+	 * Newer Kernels gained support for showing the dependencies between
+	 * audio and DRM drivers via /proc/modules and lsmod. Use it to
+	 * detect if removing the audio driver is needed, properly unloading
+	 * any audio processes that could be using the audio driver and
+	 * handling module dependencies. Such solution should be generic
+	 * enough to work with newer SOC/SOF drivers if ever needed.
+	 */
+
+	mod = read_module_dependencies(&num_mod);
+
+	for (i = 0; i < num_mod; i++)
+		if (!strcmp(mod[i].name, drm_driver))
+			break;
+
+	if (i == num_mod) {
+		ret = 0;
+		goto ret;
+	}
+
+	/* Recursively remove all drivers that depend on drm_driver */
+	for (j = 0; j < mod[i].num_required; j++) {
+		pos = mod[i].required_by[j];
+		if (who)
+			*who = strdup(mod[pos].name);
+		/*
+		 * If a sound driver depends on drm_driver, kill audio processes
+		 * first, in order to make it possible to unload the driver
+		 */
+		if (strstr(mod[pos].name, "snd")) {
+			if (igt_lsof_kill_audio_processes()) {
+				ret = EACCES;
+				goto ret;
+			}
+		}
+		ret = igt_unload_driver(mod, num_mod, pos);
+	}
+
+ret:
+	free_module_ref(mod, num_mod);
+
+	return ret;
+}
+
 int __igt_i915_driver_unload(const char **who)
 {
 	int ret;
-- 
2.35.1
