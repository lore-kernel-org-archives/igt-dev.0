Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CD510EB98
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 16:44:50 +0000 (UTC)
Date: Thu, 5 May 2022 18:44:43 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <YnP++wDyxg1Me+jA@intel.intel>
References: <20220504095904.2145592-1-mauro.chehab@linux.intel.com>
 <20220504095904.2145592-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504095904.2145592-4-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/6] lib/igt_kmod: improve audio
 unbind logic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>, Petri Latvala <petri.latvala@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

> +static struct module_ref *read_module_dependencies(unsigned int *num_mod)
> +{
> +	FILE *fp = fopen("/proc/modules", "r");
> +	struct module_ref *mod = NULL;
> +	size_t line_buf_size = 0;
> +	char *required_by, *p;
> +	unsigned n_mod = 0;
> +	unsigned num_req;
> +	char *line = NULL;
> +	int len = 0;
> +	int i, ret;
> +
> +	igt_assert(fp);
> +
> +	while ((len = getline(&line, &line_buf_size, fp)) > 0) {
> +		mod = realloc(mod, (n_mod + 1) * sizeof(*mod));
> +		igt_assert(mod);
> +		mod[n_mod].required_by = NULL;
> +
> +		p = strtok(line, " ");
> +		mod[n_mod].name = strdup(p);
> +
> +		p = strtok(NULL, " ");
> +		ret = sscanf(p, "%lu", &mod[n_mod].mem);
> +		igt_assert(ret == 1);
> +
> +		p = strtok(NULL, " ");
> +		ret = sscanf(p, "%u", &mod[n_mod].ref_count);
> +		igt_assert(ret == 1);
> +
> +		num_req = 0;
> +		required_by = strtok(NULL, " ");
> +		if (strcmp(required_by, "-")) {
> +			p = strtok(required_by, ",");
> +			while (p) {
> +				for (i = 0; i < n_mod; i++) {
> +					if (!strcmp(p, mod[i].name))
> +						break;
> +				}

brackets not needed here

> +				igt_assert(i < n_mod);
> +
> +				mod[n_mod].required_by = realloc(mod[n_mod].required_by,
> +								 (num_req + 1) * sizeof(unsigned int));
> +				mod[n_mod].required_by[num_req] = i;
> +				num_req++;
> +				p = strtok(NULL, ",");
> +			}
> +		}
> +		mod[n_mod].num_required = num_req;
> +		n_mod++;
> +	}
> +	free(line);
> +	fclose(fp);
> +
> +	*num_mod = n_mod;
> +	return mod;
> +}

it looks correct, haven't spotted any error in this function, but
I admit that string parsing can be complex. I trust you have
tested it properly. I will check it again, though.

[...]

> +#define LINUX_VERSION(major, minor, patch)			\
> +		     ((major) << 16 | (minor) << 8 | (patch))

I can't believe that the glibc is not providing anything similar.

> +
> +

you have an extra line here

> +static int linux_kernel_version(void)
> +{
> +	struct utsname utsname;
> +	int ver[3] = { 0 };

[...]

> +
> +int igt_audio_driver_unload(const char **who)

ha! this confused me because I start reading from the bottom and
I didn't notice the above

  -int igt_audio_driver_unload(const char **who)
  +static int igt_always_unload_audio_driver(const char **who)

> +{
> +	unsigned int num_mod, i, j;
> +	struct module_ref *mod;
> +	int pos = -1;
> +	int ret = 0;
> +
> +	/*
> +	 * On older Kernels, there's no way to check if the audio driver
> +	 * binds into the DRM one. So, always remove audio drivers that
> +	 * might be binding.
> +	 */
> +	if (linux_kernel_version() < LINUX_VERSION(5, 20, 0))
> +		return igt_always_unload_audio_driver(who);

... so that this one becomes what you did in patch 1.

> +
> +	/*
> +	 * Newer Kernels gained support for showing the dependencies between
> +	 * audio and DRM drivers via /proc/modules and lsmod. Use it to
> +	 * detect if removing the audio driver is needed, properly unloading
> +	 * any audio processes that could be using the audio driver and
> +	 * handling module dependencies. Such solution should be generic
> +	 * enough to work with newer SOC/SOF drivers if ever needed.
> +	 */
> +
> +	mod = read_module_dependencies(&num_mod);
> +
> +	for (i = 0; i < num_mod; i++) {
> +		if (!strcmp(mod[i].name, "i915")) {
> +			break;
> +		}
> +	}

no need for brackets here.

> +
> +	if (i == num_mod)
> +		return 0;
> +
> +	/* Recursively remove all drivers that depend on i915 */
> +	for (j = 0; j < mod[i].num_required; j++) {
> +		pos = mod[i].required_by[j];
> +		if (who)
> +			*who = strdup(mod[pos].name);
> +		/*
> +		 * If a sound driver depends on i915, kill audio processes
> +		 * first, in order to make it possible to unload the driver
> +		 */
> +		if (strstr(mod[pos].name, "snd")) {
> +			if (igt_lsof_kill_audio_processes()) {
> +				ret = 1;

is this a boolean function? Shall we choose some proper errnos?

> +				goto ret;

do we need to free who here...

> +			}
> +		}
> +		ret = igt_unload_driver(mod, num_mod, pos);

... and here?

And here... do we need to handle the error?

> +	}
> +
> +ret:
> +	free_module_ref(mod, num_mod);
> +
> +	return ret;
> +}

Thanks,
Andi
