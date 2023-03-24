Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7F310E15F
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 09:29:23 +0000 (UTC)
Date: Fri, 24 Mar 2023 10:29:18 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230324092918.lkyolfxfht4whyen@zkempczy-mobl2>
References: <20230324050253.2560-1-niranjana.vishwanathapura@intel.com>
 <ZB1JAJ7LgS/5/l7a@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZB1JAJ7LgS/5/l7a@DUT025-TGLU.fm.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe/xe_query: Extern
 xe_supports_faults()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 24, 2023 at 06:53:52AM +0000, Matthew Brost wrote:
> On Thu, Mar 23, 2023 at 10:02:53PM -0700, Niranjana Vishwanathapura wrote:
> > Do not check for supports_faults in xe_device_get() as
> > it creates a VM in fault mode which prohibits creation
> > of any other VM in non-fault mode until this fault mode
> > VM is closed. This leads to test failures in multi threaded
> > cases.
> > 
> > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> Just a general comment, we probably should report if the device supports
> faults via the device query IOCTL. Let me look into that (and a few
> other query issues) and post a RFC.
> 
> For now this fix LGTM. With that:
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 

I'm sorry but I would like to get more about this before we merge.

Does it mean that if one thread will create fault-mode VM until it is
closed another thread is not able to create non-fault-mode?
This imo breaks vm separation and even if query ioctl for this exists
still doesn't fix the real issue in the driver.

--
Zbigniew

> > ---
> >  lib/xe/xe_query.c | 51 ++++++++++++++++++++++-------------------------
> >  lib/xe/xe_query.h |  3 ---
> >  2 files changed, 24 insertions(+), 30 deletions(-)
> > 
> > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > index 183523280..dc91d59bc 100644
> > --- a/lib/xe/xe_query.c
> > +++ b/lib/xe/xe_query.c
> > @@ -160,23 +160,6 @@ static uint32_t __mem_default_alignment(struct drm_xe_query_mem_usage *mem_usage
> >  	return alignment;
> >  }
> >  
> > -static bool xe_check_supports_faults(int fd)
> > -{
> > -	bool supports_faults;
> > -
> > -	struct drm_xe_vm_create create = {
> > -		.flags = DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> > -			 DRM_XE_VM_CREATE_FAULT_MODE,
> > -	};
> > -
> > -	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> > -
> > -	if (supports_faults)
> > -		xe_vm_destroy(fd, create.vm_id);
> > -
> > -	return supports_faults;
> > -}
> > -
> >  /**
> >   * xe_engine_class_string:
> >   * @engine_class: engine class
> > @@ -258,7 +241,6 @@ struct xe_device *xe_device_get(int fd)
> >  						     xe_dev->gts, gt);
> >  	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_usage);
> >  	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_usage);
> > -	xe_dev->supports_faults = xe_check_supports_faults(fd);
> >  
> >  	igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
> >  
> > @@ -294,6 +276,30 @@ void xe_device_put(int fd)
> >  	pthread_mutex_unlock(&cache.cache_mutex);
> >  }
> >  
> > +/**
> > + * xe_supports_faults:
> > + * @fd: xe device fd
> > + *
> > + * Returns true if xe device @fd allows creating vm in fault mode otherwise
> > + * false.
> > + */
> > +bool xe_supports_faults(int fd)
> > +{
> > +	bool supports_faults;
> > +
> > +	struct drm_xe_vm_create create = {
> > +		.flags = DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> > +			 DRM_XE_VM_CREATE_FAULT_MODE,
> > +	};
> > +
> > +	supports_faults = !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> > +
> > +	if (supports_faults)
> > +		xe_vm_destroy(fd, create.vm_id);
> > +
> > +	return supports_faults;
> > +}
> > +
> >  static void xe_device_destroy_cache(void)
> >  {
> >  	pthread_mutex_lock(&cache.cache_mutex);
> > @@ -449,15 +455,6 @@ uint64_t xe_vram_size(int fd, int gt)
> >   */
> >  xe_dev_FN(xe_get_default_alignment, default_alignment, uint32_t);
> >  
> > -/**
> > - * xe_supports_faults:
> > - * @fd: xe device fd
> > - *
> > - * Returns true if xe device @fd allows creating vm in fault mode otherwise
> > - * false.
> > - */
> > -xe_dev_FN(xe_supports_faults, supports_faults, bool);
> > -
> >  /**
> >   * xe_va_bits:
> >   * @fd: xe device fd
> > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> > index 70de183cc..3a00ecd1c 100644
> > --- a/lib/xe/xe_query.h
> > +++ b/lib/xe/xe_query.h
> > @@ -53,9 +53,6 @@ struct xe_device {
> >  	/** @has_vram: true if gpu has vram, false if system memory only */
> >  	bool has_vram;
> >  
> > -	/** @supports_faults: true if gpu supports faults, otherwise false */
> > -	bool supports_faults;
> > -
> >  	/** @va_bits: va length in bits */
> >  	uint32_t va_bits;
> >  
> > -- 
> > 2.21.0.rc0.32.g243a4c7e27
> > 
