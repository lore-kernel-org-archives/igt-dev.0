Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5299111A2CC
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 10:18:02 +0000 (UTC)
Date: Thu, 19 May 2022 12:17:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YoYZVu1jknz31pUR@kamilkon-desk1>
References: <20220518205452.93396-1-kamil.konieczny@linux.intel.com>
 <YoXgrVu0iZMC8vkm@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YoXgrVu0iZMC8vkm@zkempczy-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_close_race: Adopt to use
 softpin
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

On 2022-05-19 at 08:16:13 +0200, Zbigniew Kempczyński wrote:
> On Wed, May 18, 2022 at 10:54:52PM +0200, Kamil Konieczny wrote:
> > For newer gens there will be no relocations, so adopt test to
> > run using soft-pinned addresses.
> > 
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> > ---
> >  tests/i915/gem_close_race.c | 31 +++++++++++++++++++++++++------
> >  1 file changed, 25 insertions(+), 6 deletions(-)
> > 
> > diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> > index ab444945..fb43afa6 100644
> > --- a/tests/i915/gem_close_race.c
> > +++ b/tests/i915/gem_close_race.c
> > @@ -53,6 +53,9 @@
> >  
> >  static uint32_t devid;
> >  static bool has_64bit_relocations;
> > +static bool has_softpin;
> > +static uint64_t exec_addr;
> > +static uint64_t data_addr;
> >  
> >  #define sigev_notify_thread_id _sigev_un._tid
> >  
> > @@ -79,9 +82,9 @@ static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
> >  	reloc[0].target_handle = handle;
> >  	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
> >  	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
> > -	*b++ = 0;
> > +	*b++ = data_addr;
> >  	if (has_64bit_relocations)
> > -		*b++ = 0;
> > +		*b++ = CANONICAL(data_addr) >> 32;
> >  
> >  	*b++ = 512 << 16;
> >  	*b++ = 4*1024;
> > @@ -90,9 +93,9 @@ static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
> >  	reloc[1].target_handle = handle;
> >  	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
> >  	reloc[1].write_domain = 0;
> > -	*b++ = 0;
> > +	*b++ = data_addr;
> >  	if (has_64bit_relocations)
> > -		*b++ = 0;
> > +		*b++ = CANONICAL(data_addr) >> 32;
> >  
> >  	*b++ = MI_BATCH_BUFFER_END;
> >  	*b++ = 0;
> > @@ -105,8 +108,17 @@ static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
> >  	create.size = 4096;
> >  	drmIoctl(fd, DRM_IOCTL_I915_GEM_CREATE, &create);
> >  	gem_exec[1].handle = create.handle;
> > -	gem_exec[1].relocation_count = 2;
> > -	gem_exec[1].relocs_ptr = to_user_pointer(reloc);
> > +	if (has_softpin) {
> > +		gem_exec[1].offset = CANONICAL(exec_addr);
> > +		gem_exec[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> > +		execbuf.flags |= I915_EXEC_NO_RELOC;
> > +		gem_exec[0].offset = CANONICAL(data_addr);
> > +		gem_exec[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
> > +				     EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> > +	} else {
> > +		gem_exec[1].relocation_count = 2;
> > +		gem_exec[1].relocs_ptr = to_user_pointer(reloc);
> > +	}
> >  
> >  	memset(&execbuf, 0, sizeof(execbuf));
> >  	execbuf.buffers_ptr = to_user_pointer(gem_exec);
> 
> During code review I realized myself we execute nothing on discrete
> because there's no PWRITE support, I mean:
> 
> 	if (drmIoctl(fd, DRM_IOCTL_I915_GEM_PWRITE, &gem_pwrite) == 0) {
> 		while (loops-- && __gem_execbuf(fd, &execbuf) == 0)
> 			;
> 	}
> 
> just exits and no execbuf() is performed.
> 
> Remove gem_pwrite stuff, replace to gem_write() wrapper. Offsets you've 
> chosen are correct.
> 
> --
> Zbigniew

I did that and hit the problem which test is exercising, that
is fd was closed so write fails with error which is not expected
in gem_write.

I will do a workaround.

--
Kamil

> > @@ -256,6 +268,13 @@ igt_main
> >  
> >  		devid = intel_get_drm_devid(fd);
> >  		has_64bit_relocations = intel_gen(devid) >= 8;
> > +		has_softpin = !gem_has_relocations(fd);
> > +		if (has_softpin) {
> > +			exec_addr = gem_detect_safe_start_offset(fd);
> > +			data_addr = gem_detect_safe_alignment(fd);
> > +			exec_addr = max_t(exec_addr, exec_addr, data_addr);
> > +			data_addr += exec_addr;
> > +		}
> >  
> >  		igt_fork_hang_detector(fd);
> >  		close(fd);
> > -- 
> > 2.34.1
> > 
