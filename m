Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8F5112B3A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 06:55:50 +0000 (UTC)
Date: Mon, 16 May 2022 08:55:45 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20220516085545.598a766d@maurocar-mobl2>
In-Reply-To: <20220511170913.rdw7pxl7mze7ylu2@ldmartin-desk2>
References: <20220506114829.2288273-1-mauro.chehab@linux.intel.com>
 <20220506114829.2288273-4-mauro.chehab@linux.intel.com>
 <20220511170913.rdw7pxl7mze7ylu2@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/6] lib/igt_kmod: improve audio
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

On Wed, 11 May 2022 10:09:13 -0700
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> On Fri, May 06, 2022 at 01:48:26PM +0200, Mauro Carvalho Chehab wrote:
> >+int igt_audio_driver_unload(const char **who)
> >+{
> >+	const char *drm_driver = "i915";
> >+	unsigned int num_mod, i, j;
> >+	struct module_ref *mod;
> >+	int pos = -1;
> >+	int ret = 0;
> >+
> >+	/*
> >+	 * On older Kernels, there's no way to check if the audio driver
> >+	 * binds into the DRM one. So, always remove audio drivers that
> >+	 * might be binding.
> >+	 */
> >+	if (linux_kernel_version() < LINUX_VERSION(5, 20, 0))  
> 
> comparing specific kernel version is not very good practice as features
> are moved from one kernel to the other, backported, etc.

Yes, but, in this very specific case, I don't see much troubles, as the
logic doesn't rely on it, using the information as only a hint if lsmod
dependencies are reliable or not.

See, the Kernel patches I'm proposing actually fix a long-standing
Kernel bug, where lsmod and /proc/modules doesn't properly show 
dependencies when module refcount is incremented on non-trivial ways.

The approach I took on IGT is that, assuming that this gets merged on
5.20.0, we can trust that, on all newer kernels, lsmod will properly
show the dependencies.

Ok, older Kernels may have this backported or not, but, as there's no
reliable way to know for sure, IGT will fall back to a logic that
will always try to unload snd-hda-intel, even when this is not needed[1].

> if at all, we should test if something is present in the kernel. 

I can't see any way to verify if the fixes for such bug are present
or not on a given kernel. Ok, we might artificially increment i915 version
to indicate that, but there's not a single change on i915 driver, as the
real fix happens inside kernel/modules. 

[1] On machines where snd-hda-intel doesn't bind into i915, as
    trying to unload it could fail, this could cause issues at the
    IGT test - and even on future tests, in case of OOPSes during
    removal.

> If we
> can't, then we either add support for that if we can enough.
> For IGT we can probably simply take the approach of landing this only
> when the corresponding kernel support is merged.
> 
> What we could merge today is: always unload audio drivers.

I would prefer to have the full code there, as there are a fundamental
difference between the two cases.

See:

Case 1) snd-hda-intel doesn't bind into i915

On such case if IGT can be sure about that (e. g. after the Kernel fixes), 
IGT will simply not touch snd-hda-intel. So, if something bad happens 
during i915 unbind/unload, the IGT test should fail.

Case 2) snd-hda-intel binds into i915

In this case, if snd-hda-intel unload fails, the IGT test should be
skipped, as trying to unload/unbind/rebind i915 will fail, but not 
be due to i915 troubles. So, it won't make sense to report an IGT
error on such case.

On other words:

a) if lsmod is reliable:

   - for case 1, don't touch snd-hda-intel;
   - for case 2, failures to remove snd-hda-intel will call igt_skip();
   - failures on i915 unbind/rebind (or unload/reload) will call
     igt_error().

b) if lsmod is not reliable (buggy kernels, like current upstream),
   as IGT doesn't know if it is case 1 or 2, it will:

   - always try to unload snd-hda-intel. If it fails, just print some
     messages that will help debugging troubles;
   - always try to unload or unbind i915. Failures on i915 unbind/rebind 
     (or unload/reload) will call igt_error().

I would prefer to merge the above logic altogether in order to have the
full solution in IGT - even if we place, instead, something like:


	int igt_audio_driver_unload(const char **who)
	{
...
	/*
	 * FIXME: update this once the Kernel fixes for lsmod gets merged
	 */
	const bool is_lsmod_reliable = false;
...
	/*
	 * On older Kernels, there's no way to check if the audio driver
	 * binds into the DRM one. So, always remove audio drivers that
	 * might be binding.
	 */
	if (!is_lsmod_reliable)
		return igt_always_unload_audio_driver(who);

And then, once this gets merged upstream, replace the static var
with:

	const bool is_lsmod_reliable = linux_kernel_version() >= LINUX_VERSION(5, 20, 0)

(or something similar)

Regards,
Mauro
