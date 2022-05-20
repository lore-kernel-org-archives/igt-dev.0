Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E8F11ADF0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 May 2022 07:11:31 +0000 (UTC)
Date: Fri, 20 May 2022 09:11:18 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <Yoc/FpEt0u7qU9vf@zkempczy-mobl2>
References: <20220519141745.118599-1-zbigniew.kempczynski@intel.com>
 <YoctjVGJEqJf+d+Y@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YoctjVGJEqJf+d+Y@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: For i915 devices
 run allocator in multiprocess mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Luciano Coelho <luciano.coelho@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 20, 2022 at 08:56:29AM +0300, Petri Latvala wrote:
> On Thu, May 19, 2022 at 04:17:45PM +0200, Zbigniew Kempczyński wrote:
> > Test calls igt_fork() so for i915 requires offset allocation arbitration
> > (allocator in multiprocess mode) especially when same drm fd is used
> > in children. Dedicated thread (intel_allocator_multiprocess_start())
> > is required to be started on the very beginning to handle offset
> > allocations as well as stopping it (intel_allocator_multiprocess_stop())
> > before test exits.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Luciano Coelho <luciano.coelho@intel.com>
> > Cc: Swati Sharma <swati2.sharma@intel.com>
> 
> Acked-by: Petri Latvala <petri.latvala@intel.com>
> 
> Now, having said that:
> 
> The test itself doesn't touch the allocator at all, it's done by
> igt_fb.c's blitcopy() under the hood. Did you check if there's any
> other tests that could have this problem? Suggesting a common way to
> have tests communicate their intention to fork is overkill at this
> point, unless the problem is widespread.

Take a look to kms_busy.c function flip_to_fb.c. There's igt_fork()
but we don't need to run additional allocator thread. 

I think we can try:
1. run multiprocess allocator thread on all igt run but this is imo
   overkill, especially if test works on separate vm's it can "detach"
   and become standalone allocator,
2. add some debug information instead of segfaulting that multiprocess
   allocator is likely required in the test. IGT already got similar
   code (like internal_assert in igt_describe_f()).

blitcopy() doesn't need to be run in multiprocess environment so question
is - do we really need to run allocator thread? There're tests which
don't need to use this coordination, they can just became standalone 
allocators in children processes - see intel_allocator_init() call in
for example gem_ctx_persistence.c. IGTs provide many use scanarios and
I'm not sure universal solution exists. Especially that IGTs are used
also by other vendors. Even allocator initialization + reinitialization
in igt_core which is more lightweight also affect other vendors.

Regarding your question - I've quickly go over kms_*.c tests, I observe
some kernel issues on kms_cursor_legacy@.*forked.*.

--
Zbigniew 

> 
> 
> -- 
> Petri Latvala
> 
> 
> 
> > ---
> >  tests/kms_concurrent.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> > index 82b2021e72..c334194b9a 100644
> > --- a/tests/kms_concurrent.c
> > +++ b/tests/kms_concurrent.c
> > @@ -378,6 +378,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
> >  		kmstest_set_vt_graphics_mode();
> >  		igt_display_require(&data.display, data.drm_fd);
> >  		igt_require(data.display.is_atomic);
> > +		if (is_i915_device(data.drm_fd))
> > +			intel_allocator_multiprocess_start();
> >  	}
> >  
> >  	for_each_pipe_static(pipe) {
> > @@ -386,6 +388,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
> >  	}
> >  
> >  	igt_fixture {
> > +		if (is_i915_device(data.drm_fd))
> > +			intel_allocator_multiprocess_stop();
> >  		igt_display_fini(&data.display);
> >  		close(data.drm_fd);
> >  	}
> > -- 
> > 2.32.0
> > 
