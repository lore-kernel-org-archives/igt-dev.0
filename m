Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC1810E39D
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 14:50:45 +0000 (UTC)
Date: Fri, 25 Feb 2022 15:50:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YhjswUQevoz76Bo2@kamilkon-DESK1>
References: <20220225110626.82776-1-zbigniew.kempczynski@intel.com>
 <20220225110626.82776-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220225110626.82776-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] i915/gem_engine_topology: Only use
 the main copy engines for XY_BLOCK_COPY
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

Hi Zbigniew,

can you change patch subject ? The patch itself adds two general
helper functions to lib, and one helper for checking copy
capability. It do not uses it by itself. Maybe change it to
something like : Add capability helpers.

Dnia 2022-02-25 at 12:06:24 +0100, Zbigniew Kempczyński napisał(a):
> From: Chris Wilson <chris.p.wilson@intel.com>
> 

Below is description about why change is needed, it's ok.

> XY_BLOCK_COPY blt command is used to transfer the ccs data.

Imho it would be helpfull here to put full description of ccs,
"ccs compressed data". There is also compute engine and it has
the same shorthand ccs.

> So, we can only run the tests on those engines which have

s/So, We/We/

> support for the "block_copy" capability.

What is missing here is description about what was changed in lib.

> 
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  lib/i915/gem_engine_topology.c | 38 ++++++++++++++++++++++++++++++++++
>  lib/i915/gem_engine_topology.h |  5 +++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
> index bd12d0bc9..18fc00ab0 100644
> --- a/lib/i915/gem_engine_topology.c
> +++ b/lib/i915/gem_engine_topology.c
> @@ -534,6 +534,44 @@ void gem_engine_properties_restore(int fd, const struct gem_engine_properties *s
>  	}
>  }
>  
> +static bool
> +__gem_engine_has_capability(int i915, const char *engine,
> +			    const char *attr, const char *cap)
> +{
> +	char buf[4096] = {};
> +	FILE *file;
> +
> +	file = __open_attr(igt_sysfs_open(i915), "r",
> +			   "engine", engine, attr, NULL);
> +	if (file) {
> +		fread(buf, 1, sizeof(buf) - 1, file);
> +		fclose(file);
> +	}

What happens when file==NULL ? Should'nt we return NULL immediatly ?
Maybe re-arrange it like:
	if(!file)
		return NULL;

What about buffer end ? Or when number of readed bytes will be zero ?
I think we should add null string terminator at end of readed buf.

> +
> +	return strstr(buf, cap);
> +}

One problem with this function is it do not differentiate between
when it was zero read (so it do not helped us) and when i915
driver fills it and we can actually check capabilities here.

> +
> +bool gem_engine_has_capability(int i915, const char *engine, const char *cap)
> +{
> +	return __gem_engine_has_capability(i915, engine, "capabilities", cap);
> +}
> +
> +bool gem_engine_has_known_capability(int i915, const char *engine, const char *cap)
> +{
> +	return __gem_engine_has_capability(i915, engine, "known_capabilities", cap);
> +}
> +
> +bool gem_engine_can_block_copy(int i915, const struct intel_execution_engine2 *engine)
> +{
> +	if (engine->class != I915_ENGINE_CLASS_COPY)
> +		return false;
> +
> +	if (!gem_engine_has_known_capability(i915, engine->name, "block_copy"))
> +		return intel_gen(intel_get_drm_devid(i915)) >= 12;

This looks like guessing but maybe it is ok.

> +
> +	return gem_engine_has_capability(i915, engine->name, "block_copy");
> +}
> +
>  uint32_t gem_engine_mmio_base(int i915, const char *engine)
>  {
>  	unsigned int mmio = 0;
> diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
> index b413aa8ab..987f2bf94 100644
> --- a/lib/i915/gem_engine_topology.h
> +++ b/lib/i915/gem_engine_topology.h
> @@ -133,6 +133,11 @@ int gem_engine_property_printf(int i915, const char *engine, const char *attr,
>  
>  uint32_t gem_engine_mmio_base(int i915, const char *engine);
>  
> +bool gem_engine_has_capability(int i915, const char *engine, const char *cap);
> +bool gem_engine_has_known_capability(int i915, const char *engine, const char *cap);
> +
> +bool gem_engine_can_block_copy(int i915, const struct intel_execution_engine2 *engine);
> +
>  void dyn_sysfs_engines(int i915, int engines, const char *file,
>  		       void (*test)(int i915, int engine));
>  
> -- 
> 2.32.0
> 
Regards,
Kamil Konieczny
