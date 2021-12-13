Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE72D10E7F4
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Dec 2021 17:40:10 +0000 (UTC)
Date: Mon, 13 Dec 2021 18:38:36 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YbeFHFzIuoF1mjp9@zkempczy-mobl2>
References: <20211209200453.15885-1-zbigniew.kempczynski@intel.com>
 <20211209200453.15885-3-zbigniew.kempczynski@intel.com>
 <877dc8a1y3.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877dc8a1y3.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/i915/intel_memory_region: Add
 fallback for creating gem bo
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 08:45:24AM -0800, Dixit, Ashutosh wrote:
> On Thu, 09 Dec 2021 12:04:53 -0800, Zbigniew Kempczyński wrote:
> >
> > diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> > index fd29eec90..2263f1984 100644
> > --- a/lib/i915/intel_memory_region.c
> > +++ b/lib/i915/intel_memory_region.c
> > @@ -197,8 +197,23 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
> >		.num_regions = num_regions,
> >		.regions = to_user_pointer(mem_regions),
> >	};
> > +	int ret;
> >
> > -	return __gem_create_ext(fd, size, handle, &ext_regions.base);
> > +	ret = __gem_create_ext(fd, size, handle, &ext_regions.base);
> > +
> > +	/*
> > +	 * Provide fallback for stable kernels if region passed in the array
> > +	 * can be system memory. In this case we get -ENODEV but still
> > +	 * we're able to allocate gem bo in system memory using legacy call.
> > +	 */
> > +	if (ret == -ENODEV)
> > +		for (int i = 0; i < num_regions; i++)
> > +			if (mem_regions[i].memory_class == I915_MEMORY_CLASS_SYSTEM) {
> > +				ret = __gem_create(fd, size, handle);
> > +				break;
> > +			}
> 
> Shouldn't this function return success if mem_regions[] array contains only
> a single system memory region entry (that is the sime of mem_regions[]
> array is 1 and the only entry is system memory)? But here we are returning
> success if /any/ of the regions passed in are system memory? Won't this
> cause an error in the caller? I am not sure if checking for -ENODEV return
> saves us in any way but I think the code should be changed to return
> success if mem_regions[] array contains only a single system memory region.

If user want to create in one of memory region from the list 
[device memory, system memory] I think we should create gem object in system
memory as normally kernel would do if it couldn't create within local memory.
That's why I decided to iterate over request regions and create within 
system memory if it is possible.

Please take a look to conditional in stable kernels:

	if (!IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM))

So query + create_ext should be covered to avoid failures on IGT code
which works with not drm-tip code.

> 
> I think the previous patch "lib/i915/intel_memory_region: Provide system
> memory region stub" is fine and serves this purpose of returning a single
> system memory region. Do we even need this patch?

Take a look to results:
https://intel-gfx-ci.01.org/tree/linux-stable/index-alt.html?

gem_exec_basic requires properly running code:

static uint32_t batch_create(int fd, uint32_t batch_size, uint32_t region)
{
	const uint32_t bbe = MI_BATCH_BUFFER_END;
	uint32_t handle;

	handle = gem_create_in_memory_regions(fd, batch_size, region);
	gem_write(fd, handle, 0, &bbe, sizeof(bbe));

	return handle;
}

which will fail on gem_create_in_memory_regions() with -ENODEV. I just
want to cover also creating objects globally only when system memory
is available.

--
Zbigniew

> 
> 
> > +
> > +	return ret;
> >  }
> >
> >  /* gem_create_in_memory_region_list:
> > --
> > 2.26.0
> >
