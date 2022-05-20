Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F73E11A92D
 for <igt-dev@lists.freedesktop.org>; Fri, 20 May 2022 08:53:04 +0000 (UTC)
Date: Fri, 20 May 2022 11:50:41 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YodWYddLAUcHAW4+@platvala-desk.ger.corp.intel.com>
References: <20220519141745.118599-1-zbigniew.kempczynski@intel.com>
 <YoctjVGJEqJf+d+Y@platvala-desk.ger.corp.intel.com>
 <Yoc/FpEt0u7qU9vf@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yoc/FpEt0u7qU9vf@zkempczy-mobl2>
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

On Fri, May 20, 2022 at 09:11:18AM +0200, Zbigniew Kempczyński wrote:
> On Fri, May 20, 2022 at 08:56:29AM +0300, Petri Latvala wrote:
> > On Thu, May 19, 2022 at 04:17:45PM +0200, Zbigniew Kempczyński wrote:
> > > Test calls igt_fork() so for i915 requires offset allocation arbitration
> > > (allocator in multiprocess mode) especially when same drm fd is used
> > > in children. Dedicated thread (intel_allocator_multiprocess_start())
> > > is required to be started on the very beginning to handle offset
> > > allocations as well as stopping it (intel_allocator_multiprocess_stop())
> > > before test exits.
> > > 
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Luciano Coelho <luciano.coelho@intel.com>
> > > Cc: Swati Sharma <swati2.sharma@intel.com>
> > 
> > Acked-by: Petri Latvala <petri.latvala@intel.com>
> > 
> > Now, having said that:
> > 
> > The test itself doesn't touch the allocator at all, it's done by
> > igt_fb.c's blitcopy() under the hood. Did you check if there's any
> > other tests that could have this problem? Suggesting a common way to
> > have tests communicate their intention to fork is overkill at this
> > point, unless the problem is widespread.
> 
> Take a look to kms_busy.c function flip_to_fb.c. There's igt_fork()
> but we don't need to run additional allocator thread. 
> 
> I think we can try:
> 1. run multiprocess allocator thread on all igt run but this is imo
>    overkill, especially if test works on separate vm's it can "detach"
>    and become standalone allocator,
> 2. add some debug information instead of segfaulting that multiprocess
>    allocator is likely required in the test. IGT already got similar
>    code (like internal_assert in igt_describe_f()).

Debug information sounds really good. It's easy to detect the crashing
case in the allocator code after all, from what I remember about the
backtrace.


-- 
Petri Latvala
