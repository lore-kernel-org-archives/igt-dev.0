Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE9ECF6D3C
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 16:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722E710E0E7;
	Wed,  2 Oct 2024 16:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvTy0Ktw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD80010E0E7
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 16:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727886570; x=1759422570;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=/jphVTUm6iubgnA3MopTPXTVHMWAn0SrtifkX14FCPc=;
 b=fvTy0KtwChbENjS5IZfEaEYXmATt9p3bUkzvyygNY1YW4wIi1dQwPC7z
 2FvP7xA+69OCaZIMYLjNZQBcbKnRXvduFn4HzGqmJdrhf2+HmOkmD4J6j
 bUJ3nX8Bsg/AYa05bS734Yiji7hAmoTMymG1ZlIA+h2iq7AF7JNC1mMeX
 jF4OYznv6QFmTcuaaNC3Rcta34YDt+MgLXfZ1CHsP7+2FnT7azDnfIc4A
 xuUujXpOTktnKKLSRqtmlrqQg46WV9A63W/a1sz+hKgelqvYm+ytcAOXF
 UlHhdKrrtmAmZjRf3kdjE5A/D13DzFtTQ7n9v+0WhpbFc7iU6xYQFsYSS Q==;
X-CSE-ConnectionGUID: +BtpvYkySviVuMHSQ8dDJw==
X-CSE-MsgGUID: JDGmhac/QSWDSOWP0C1nTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27232537"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="27232537"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 09:26:38 -0700
X-CSE-ConnectionGUID: JtX3rV/FTwmK9yZemT/nMg==
X-CSE-MsgGUID: 00tlEC4WQnq20Wf4MDmq6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; d="scan'208";a="74171362"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Oct 2024 09:26:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Oct 2024 19:26:35 +0300
Date: Wed, 2 Oct 2024 19:26:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/3] igt: Fix printf formats on x86-32
Message-ID: <Zv10Oy1bXkQ17o6I@intel.com>
References: <20240927163307.10159-1-ville.syrjala@linux.intel.com>
 <20241002160130.rzp5jswo5262rcst@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002160130.rzp5jswo5262rcst@kamilkon-DESK.igk.intel.com>
X-Patchwork-Hint: comment
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Oct 02, 2024 at 06:01:30PM +0200, Kamil Konieczny wrote:
> Hi Ville,
> On 2024-09-27 at 19:33:05 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Use the hideous %"PRI.64" printf() stuff to silence
> > compiler warnings on x86-32.
> > 
> > Thank you whoever chose the wrong type for uint64_t
> > on x86-64...
> 
> Is there a "proper" type for all? Just curious.

In kernel land u64 is always ull, which is more convenient
when it comes to printk().

> Few nits below.
> 
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  lib/igt_pm.c                           |  4 +--
> >  lib/igt_sysfs.c                        |  4 +--
> >  lib/intel_compute.c                    | 46 +++++++++++++-------------
> >  tests/intel/gem_lmem_swapping.c        |  6 ++--
> >  tests/intel/perf.c                     |  2 +-
> >  tests/intel/xe_copy_basic.c            |  4 +--
> >  tests/intel/xe_create.c                |  2 +-
> >  tests/intel/xe_drm_fdinfo.c            | 10 +++---
> >  tests/intel/xe_evict.c                 |  2 +-
> >  tests/intel/xe_evict_ccs.c             |  6 ++--
> >  tests/intel/xe_oa.c                    |  4 +--
> >  tests/intel/xe_pm.c                    |  4 +--
> >  tests/intel/xe_query.c                 |  4 +--
> >  tests/intel/xe_sysfs_preempt_timeout.c |  2 +-
> >  tests/intel/xe_waitfence.c             |  2 +-
> >  15 files changed, 51 insertions(+), 51 deletions(-)
> > 
> > diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> > index cfa628324a2e..1a5d9c42b26c 100644
> > --- a/lib/igt_pm.c
> > +++ b/lib/igt_pm.c
> > @@ -1400,7 +1400,7 @@ uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev)
> >  
> >  	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_suspended_time");
> >  	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
> > -		igt_assert(sscanf(time_str, "%ld", &time) > 0);
> > +		igt_assert(sscanf(time_str, "%"PRId64"", &time) > 0);
> >  
> >  		igt_debug("runtime suspended time for PCI '%04x:%02x:%02x.%01x' = %" PRIu64 "\n",
> >  			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
> > @@ -1425,7 +1425,7 @@ uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev)
> >  
> >  	time_fd = igt_pm_get_power_attr_fd_rdonly(pci_dev, "runtime_active_time");
> >  	if (igt_pm_read_power_attr(time_fd, time_str, 64, false)) {
> > -		igt_assert(sscanf(time_str, "%ld", &time) > 0);
> > +		igt_assert(sscanf(time_str, "%"PRId64"", &time) > 0);
> >  
> >  		igt_debug("runtime active time for PCI '%04x:%02x:%02x.%01x' = %" PRIu64 "\n",
> >  			  pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func, time);
> > diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> > index aec0bb53d7dd..e6904393e8b6 100644
> > --- a/lib/igt_sysfs.c
> > +++ b/lib/igt_sysfs.c
> > @@ -1152,7 +1152,7 @@ static int rw_attr_sweep(igt_sysfs_rw_attr_t *rw)
> >  	while (set < UINT64_MAX / 2) {
> >  		ret = __igt_sysfs_set_u64(rw->dir, rw->attr, set);
> >  		__igt_sysfs_get_u64(rw->dir, rw->attr, &get);
> > -		igt_debug("'%s': ret %d set %lu get %lu\n", rw->attr, ret, set, get);
> > +		igt_debug("'%s': ret %d set %"PRIu64" get %"PRIu64"\n", rw->attr, ret, set, get);
> >  		if (ret && rw_attr_equal_within_epsilon(get, set, rw->tol)) {
> >  			igt_debug("'%s': matches\n", rw->attr);
> >  			num_points++;
> > @@ -1196,7 +1196,7 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw)
> >  	igt_assert(rw->start);	/* cannot be 0 */
> >  
> >  	__igt_sysfs_get_u64(rw->dir, rw->attr, &prev);
> > -	igt_debug("'%s': prev %lu\n", rw->attr, prev);
> > +	igt_debug("'%s': prev %"PRIu64"\n", rw->attr, prev);
> >  
> >  	ret = rw_attr_sweep(rw);
> >  
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index 6458f539c6c5..1cc39f645c2e 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -774,13 +774,13 @@ static void xehp_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  {
> >  	int b = 0;
> >  
> > -	igt_debug("general   state base: %lx\n", addr_general_state_base);
> > -	igt_debug("surface   state base: %lx\n", addr_surface_state_base);
> > -	igt_debug("dynamic   state base: %lx\n", addr_dynamic_state_base);
> > -	igt_debug("instruct   base addr: %lx\n", addr_instruction_state_base);
> > -	igt_debug("bindless   base addr: %lx\n", addr_surface_state_base);
> > -	igt_debug("offset indirect addr: %lx\n", offset_indirect_data_start);
> > -	igt_debug("kernel start pointer: %lx\n", kernel_start_pointer);
> > +	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
> > +	igt_debug("surface   state base: %"PRIx64"\n", addr_surface_state_base);
> > +	igt_debug("dynamic   state base: %"PRIx64"\n", addr_dynamic_state_base);
> > +	igt_debug("instruct   base addr: %"PRIx64"\n", addr_instruction_state_base);
> > +	igt_debug("bindless   base addr: %"PRIx64"\n", addr_surface_state_base);
> > +	igt_debug("offset indirect addr: %"PRIx64"\n", offset_indirect_data_start);
> > +	igt_debug("kernel start pointer: %"PRIx64"\n", kernel_start_pointer);
> >  
> >  	addr_bo_buffer_batch[b++] = GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
> >  				    PIPELINE_SELECT_GPGPU;
> > @@ -991,13 +991,13 @@ static void xehpc_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  {
> >  	int b = 0;
> >  
> > -	igt_debug("general   state base: %lx\n", addr_general_state_base);
> > -	igt_debug("surface   state base: %lx\n", addr_surface_state_base);
> > -	igt_debug("dynamic   state base: %lx\n", addr_dynamic_state_base);
> > -	igt_debug("instruct   base addr: %lx\n", addr_instruction_state_base);
> > -	igt_debug("bindless   base addr: %lx\n", addr_surface_state_base);
> > -	igt_debug("offset indirect addr: %lx\n", offset_indirect_data_start);
> > -	igt_debug("kernel start pointer: %lx\n", kernel_start_pointer);
> > +	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
> > +	igt_debug("surface   state base: %"PRIx64"\n", addr_surface_state_base);
> > +	igt_debug("dynamic   state base: %"PRIx64"\n", addr_dynamic_state_base);
> > +	igt_debug("instruct   base addr: %"PRIx64"\n", addr_instruction_state_base);
> > +	igt_debug("bindless   base addr: %"PRIx64"\n", addr_surface_state_base);
> > +	igt_debug("offset indirect addr: %"PRIx64"\n", offset_indirect_data_start);
> > +	igt_debug("kernel start pointer: %"PRIx64"\n", kernel_start_pointer);
> >  
> >  	addr_bo_buffer_batch[b++] = GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
> >  				    PIPELINE_SELECT_GPGPU;
> > @@ -1174,15 +1174,15 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
> >  {
> >  	int b = 0;
> >  
> > -	igt_debug("general   state base: %lx\n", addr_general_state_base);
> > -	igt_debug("surface   state base: %lx\n", addr_surface_state_base);
> > -	igt_debug("dynamic   state base: %lx\n", addr_dynamic_state_base);
> > -	igt_debug("instruct   base addr: %lx\n", addr_instruction_state_base);
> > -	igt_debug("bindless   base addr: %lx\n", addr_surface_state_base);
> > -	igt_debug("state context data base addr: %lx\n", addr_state_contect_data_base);
> > -	igt_debug("offset indirect addr: %lx\n", offset_indirect_data_start);
> > -	igt_debug("kernel start pointer: %lx\n", kernel_start_pointer);
> > -	igt_debug("sip start pointer: %lx\n", sip_start_pointer);
> > +	igt_debug("general   state base: %"PRIx64"\n", addr_general_state_base);
> > +	igt_debug("surface   state base: %"PRIx64"\n", addr_surface_state_base);
> > +	igt_debug("dynamic   state base: %"PRIx64"\n", addr_dynamic_state_base);
> > +	igt_debug("instruct   base addr: %"PRIx64"\n", addr_instruction_state_base);
> > +	igt_debug("bindless   base addr: %"PRIx64"\n", addr_surface_state_base);
> > +	igt_debug("state context data base addr: %"PRIx64"\n", addr_state_contect_data_base);
> > +	igt_debug("offset indirect addr: %"PRIx64"\n", offset_indirect_data_start);
> > +	igt_debug("kernel start pointer: %"PRIx64"\n", kernel_start_pointer);
> > +	igt_debug("sip start pointer: %"PRIx64"\n", sip_start_pointer);
> >  
> >  	addr_bo_buffer_batch[b++] = GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
> >  				    PIPELINE_SELECT_GPGPU;
> > diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
> > index b125261519ff..8e0dac42d80d 100644
> > --- a/tests/intel/gem_lmem_swapping.c
> > +++ b/tests/intel/gem_lmem_swapping.c
> > @@ -244,7 +244,7 @@ verify_object(int i915, const struct object *obj,  unsigned int flags)
> >  		uint32_t val = obj->seed + x;
> >  
> >  		igt_assert_f(buf[x] == val,
> > -			     "Object mismatch at offset %zu - found %08x, expected %08x; difference:%08x!\n",
> > +			     "Object mismatch at offset %lu - found %08x, expected %08x; difference:%08x!\n",
> 
> Is this correct? %zu -> %lu ? 

size_t seems to be unsigned int on x86-32 so here we get
promoted to unsigned long because that's what 'x' is. And
despite all of them being the same size the compiler doesn't
like when we use the wrong conversion for the printf().
On x86-64 size_t is unsigned long, so no type mismatch there
either way.

-- 
Ville Syrjälä
Intel
