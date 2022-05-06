Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF60C10E530
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 09:13:25 +0000 (UTC)
Date: Fri, 6 May 2022 11:12:23 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <20220506111223.114c13d9@maurocar-mobl2>
In-Reply-To: <YnP++wDyxg1Me+jA@intel.intel>
References: <20220504095904.2145592-1-mauro.chehab@linux.intel.com>
 <20220504095904.2145592-4-mauro.chehab@linux.intel.com>
 <YnP++wDyxg1Me+jA@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/6] lib/igt_kmod: improve audio
 unbind logic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 5 May 2022 18:44:43 +0200
Andi Shyti <andi.shyti@linux.intel.com> wrote:

> Hi Mauro,
> 
> > +static struct module_ref *read_module_dependencies(unsigned int *num_mod)
> > +{
> > +	FILE *fp = fopen("/proc/modules", "r");
> > +	struct module_ref *mod = NULL;
> > +	size_t line_buf_size = 0;
> > +	char *required_by, *p;
> > +	unsigned n_mod = 0;
> > +	unsigned num_req;
> > +	char *line = NULL;
> > +	int len = 0;
> > +	int i, ret;
> > +
> > +	igt_assert(fp);
> > +
> > +	while ((len = getline(&line, &line_buf_size, fp)) > 0) {
> > +		mod = realloc(mod, (n_mod + 1) * sizeof(*mod));
> > +		igt_assert(mod);
> > +		mod[n_mod].required_by = NULL;
> > +
> > +		p = strtok(line, " ");
> > +		mod[n_mod].name = strdup(p);
> > +
> > +		p = strtok(NULL, " ");
> > +		ret = sscanf(p, "%lu", &mod[n_mod].mem);
> > +		igt_assert(ret == 1);
> > +
> > +		p = strtok(NULL, " ");
> > +		ret = sscanf(p, "%u", &mod[n_mod].ref_count);
> > +		igt_assert(ret == 1);
> > +
> > +		num_req = 0;
> > +		required_by = strtok(NULL, " ");
> > +		if (strcmp(required_by, "-")) {
> > +			p = strtok(required_by, ",");
> > +			while (p) {
> > +				for (i = 0; i < n_mod; i++) {
> > +					if (!strcmp(p, mod[i].name))
> > +						break;
> > +				}  
> 
> brackets not needed here
> 
> > +				igt_assert(i < n_mod);
> > +
> > +				mod[n_mod].required_by = realloc(mod[n_mod].required_by,
> > +								 (num_req + 1) * sizeof(unsigned int));
> > +				mod[n_mod].required_by[num_req] = i;
> > +				num_req++;
> > +				p = strtok(NULL, ",");
> > +			}
> > +		}
> > +		mod[n_mod].num_required = num_req;
> > +		n_mod++;
> > +	}
> > +	free(line);
> > +	fclose(fp);
> > +
> > +	*num_mod = n_mod;
> > +	return mod;
> > +}  
> 
> it looks correct, haven't spotted any error in this function, but
> I admit that string parsing can be complex. I trust you have
> tested it properly. I will check it again, though.

Yeah, this was tested.

Basically, /proc/modules produce:

	i2c_hid_acpi 16384 0 - Live 0x0000000000000000
	typec 65536 1 typec_ucsi, Live 0x0000000000000000
	wmi 32768 3 hp_wmi,wmi_bmof,intel_wmi_thunderbolt, Live 0x0000000000000000


So, the third parameter (module dependencies) is either "-" or a
comma-separated list mod modules, ending with a comma.

I opted to use strtok here to get the 4 parameters:

	- module name;
	- module size (unused, but need to parse it anyway);
	- refcount;
	- module dependencies.

As strtok(NULL, delimiter) continues the search, without requiring
any extra logic. 

Then, I use strtok() again with "," to handle module dependencies
at the 4th parameter, if the parameter is not equal to "-" (meaning
no dependencies).

Btw, to test it, I applied my Kernel patches and commented the
Kernel version fallback check.

> 
> [...]
> 
> > +#define LINUX_VERSION(major, minor, patch)			\
> > +		     ((major) << 16 | (minor) << 8 | (patch))  
> 
> I can't believe that the glibc is not providing anything similar.

Fedora has a macro like that (KERNEL_VERSION) under:
	/usr/include/linux/version.h

but I'm not 100% sure if this would exist on all distros. The
Fedora one has things like:

	#define RHEL_MAJOR 9
	#define RHEL_MINOR 99

So, IMO the best is to just define it.

> 
> > +
> > +  
> 
> you have an extra line here

Ok, will drop.

> 
> > +static int linux_kernel_version(void)
> > +{
> > +	struct utsname utsname;
> > +	int ver[3] = { 0 };  
> 
> [...]
> 
> > +
> > +int igt_audio_driver_unload(const char **who)  
> 
> ha! this confused me because I start reading from the bottom and
> I didn't notice the above
> 
>   -int igt_audio_driver_unload(const char **who)
>   +static int igt_always_unload_audio_driver(const char **who)
> 
> > +{
> > +	unsigned int num_mod, i, j;
> > +	struct module_ref *mod;
> > +	int pos = -1;
> > +	int ret = 0;
> > +
> > +	/*
> > +	 * On older Kernels, there's no way to check if the audio driver
> > +	 * binds into the DRM one. So, always remove audio drivers that
> > +	 * might be binding.
> > +	 */
> > +	if (linux_kernel_version() < LINUX_VERSION(5, 20, 0))
> > +		return igt_always_unload_audio_driver(who);  
> 
> ... so that this one becomes what you did in patch 1.

Yes. On current Kernels, there's no way to know if snd_hda_intel
is using i915. So, it will use a somewhat hacky logic there,
that will always unload snd_hda_intel, even if not needed, and
will even ignore recursive dependencies (if any).

This should hopefully work fine with current hardware tested
on our CI.

Once the Kernel patches reach upstream, IGT will use the newer
way, which is independent on the audio module names and will
handle more complex cases where the removal of a `snd_driver_foo`
driver would require some other Kernel drivers first.

This should work fine with the newer approach where SOF/SOC are
being used for newer CPUs, and could require more complex unload
logic.

> > +	/*
> > +	 * Newer Kernels gained support for showing the dependencies between
> > +	 * audio and DRM drivers via /proc/modules and lsmod. Use it to
> > +	 * detect if removing the audio driver is needed, properly unloading
> > +	 * any audio processes that could be using the audio driver and
> > +	 * handling module dependencies. Such solution should be generic
> > +	 * enough to work with newer SOC/SOF drivers if ever needed.
> > +	 */
> > +
> > +	mod = read_module_dependencies(&num_mod);
> > +
> > +	for (i = 0; i < num_mod; i++) {
> > +		if (!strcmp(mod[i].name, "i915")) {
> > +			break;
> > +		}
> > +	}  
> 
> no need for brackets here.

I'll drop.

> 
> > +
> > +	if (i == num_mod)
> > +		return 0;
> > +
> > +	/* Recursively remove all drivers that depend on i915 */
> > +	for (j = 0; j < mod[i].num_required; j++) {
> > +		pos = mod[i].required_by[j];
> > +		if (who)
> > +			*who = strdup(mod[pos].name);
> > +		/*
> > +		 * If a sound driver depends on i915, kill audio processes
> > +		 * first, in order to make it possible to unload the driver
> > +		 */
> > +		if (strstr(mod[pos].name, "snd")) {
> > +			if (igt_lsof_kill_audio_processes()) {
> > +				ret = 1;  
> 
> is this a boolean function? Shall we choose some proper errnos?
> 
> > +				goto ret;  
> 
> do we need to free who here...

The structs that handle the module references should be freed.

> 
> > +			}
> > +		}
> > +		ret = igt_unload_driver(mod, num_mod, pos);  
> 
> ... and here?
> 
> And here... do we need to handle the error?

yeah, a goto is missing here - and also at the trivial case where there's no
DRM driver that might have snd holders are loaded.

> 
> > +	}
> > +
> > +ret:
> > +	free_module_ref(mod, num_mod);
> > +
> > +	return ret;
> > +}  
> 
> Thanks,
> Andi
