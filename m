Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECB16EE0B
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Sep 2021 12:00:42 +0000 (UTC)
Date: Fri, 24 Sep 2021 15:04:00 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YU2+sIATq/wPzRPw@platvala-desk.ger.corp.intel.com>
References: <20210921040330.909964-1-priyanka.dandamudi@intel.com>
 <CAM0jSHNKL7wnTVxLZkwg=npr0PAkJhYMwYm8h2j=L7mm87epMQ@mail.gmail.com>
 <CAM0jSHPvQ6nLJPFiy_A+MZn5BC+F_nzQJ6UXKDXU_UnEZk3+LQ@mail.gmail.com>
 <YU2zt9UWDEIuuGKa@platvala-desk.ger.corp.intel.com>
 <CAM0jSHPOqKUrO-19jooDKOhH8K7SVWR66m7g-ZWOLh-bRRGuZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM0jSHPOqKUrO-19jooDKOhH8K7SVWR66m7g-ZWOLh-bRRGuZQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915: use device_coherent mmap
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, Matthew Auld <matthew.auld@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 24, 2021 at 12:24:02PM +0100, Matthew Auld wrote:
> On Fri, 24 Sept 2021 at 12:13, Petri Latvala <petri.latvala@intel.com> wrote:
> >
> > On Fri, Sep 24, 2021 at 12:06:06PM +0100, Matthew Auld wrote:
> > > On Tue, 21 Sept 2021 at 16:50, Matthew Auld
> > > <matthew.william.auld@gmail.com> wrote:
> > > >
> > > > On Tue, 21 Sept 2021 at 05:10, <priyanka.dandamudi@intel.com> wrote:
> > > > >
> > > > > From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > > > >
> > > > > Update mmap__wc with mmap__device_coherent, as it works
> > > > > on discrete platforms, while still using an explicit WC mmap on
> > > > > integrated platforms.
> > > > > Below are the updated tests:
> > > > > gem_exec_capture
> > > > > gem_exec_nop
> > > > > perf_pmu
> > > > > prime_busy
> > > > >
> > > > > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > >
> > > Could you please re-send this for CI(or hit the test-again button in
> > > pw)? Plus the other related series? DG1 BAT looks to be in better
> > > shape now.
> >
> > Re-test for this queued.
> 
> Thanks a bunch. Could you please also use your superpowers to re-test:
> https://patchwork.freedesktop.org/series/94726/
> 
> ?

Done.


-- 
Petri Latvala
