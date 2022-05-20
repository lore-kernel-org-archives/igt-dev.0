Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E4110E1A3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 May 2022 10:02:46 +0000 (UTC)
Date: Fri, 20 May 2022 13:00:24 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Coelho, Luciano" <luciano.coelho@intel.com>
Message-ID: <YodmuMiYjgOT/pJO@platvala-desk.ger.corp.intel.com>
References: <20220519141745.118599-1-zbigniew.kempczynski@intel.com>
 <YoctjVGJEqJf+d+Y@platvala-desk.ger.corp.intel.com>
 <Yoc/FpEt0u7qU9vf@zkempczy-mobl2>
 <YodWYddLAUcHAW4+@platvala-desk.ger.corp.intel.com>
 <ef7d4cde934ac646550916e02a71d584a847f7ed.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef7d4cde934ac646550916e02a71d584a847f7ed.camel@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: For i915 devices
 run allocator in multiprocess mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 20, 2022 at 12:45:46PM +0300, Coelho, Luciano wrote:
> On Fri, 2022-05-20 at 11:50 +0300, Petri Latvala wrote:
> > On Fri, May 20, 2022 at 09:11:18AM +0200, Zbigniew Kempczyński wrote:
> > > On Fri, May 20, 2022 at 08:56:29AM +0300, Petri Latvala wrote:
> > > > On Thu, May 19, 2022 at 04:17:45PM +0200, Zbigniew Kempczyński wrote:
> > > > > Test calls igt_fork() so for i915 requires offset allocation arbitration
> > > > > (allocator in multiprocess mode) especially when same drm fd is used
> > > > > in children. Dedicated thread (intel_allocator_multiprocess_start())
> > > > > is required to be started on the very beginning to handle offset
> > > > > allocations as well as stopping it (intel_allocator_multiprocess_stop())
> > > > > before test exits.
> > > > >
> > > > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > > Cc: Luciano Coelho <luciano.coelho@intel.com>
> > > > > Cc: Swati Sharma <swati2.sharma@intel.com>
> > > >
> > > > Acked-by: Petri Latvala <petri.latvala@intel.com>
> > > >
> > > > Now, having said that:
> > > >
> > > > The test itself doesn't touch the allocator at all, it's done by
> > > > igt_fb.c's blitcopy() under the hood. Did you check if there's any
> > > > other tests that could have this problem? Suggesting a common way to
> > > > have tests communicate their intention to fork is overkill at this
> > > > point, unless the problem is widespread.
> > >
> > > Take a look to kms_busy.c function flip_to_fb.c. There's igt_fork()
> > > but we don't need to run additional allocator thread.
> > >
> > > I think we can try:
> > > 1. run multiprocess allocator thread on all igt run but this is imo
> > >    overkill, especially if test works on separate vm's it can "detach"
> > >    and become standalone allocator,
> > > 2. add some debug information instead of segfaulting that multiprocess
> > >    allocator is likely required in the test. IGT already got similar
> > >    code (like internal_assert in igt_describe_f()).
> >
> > Debug information sounds really good. It's easy to detect the crashing
> > case in the allocator code after all, from what I remember about the
> > backtrace.
> 
> I'm not familiar with any of this, but it seems that checking for a
> NULL-pointer in msgqueue_send_req() and returning an error would be
> super-simple, since it already igt_warn()s on errors.  That should
> obviously be done in other places where needed, but seems to be pretty
> straight-forward to me.
> 
> This would obviously not fix the problem of not initializing this in
> certain tests, but it would at least make it pretty clear what is going
> on at first glance.

Yeah, exactly. Print "multiprocess_start should have been called, this
is a test bug" in there and let bug reports speak for themselves.


-- 
Petri Latvala
