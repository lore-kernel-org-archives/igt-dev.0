Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EA189B68
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Aug 2021 11:36:56 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id p2so24275729oif.1
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Aug 2021 04:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210824090943.1158940-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <CAKMK7uEwswaCyEOtEk7rhbXFtSE95+8bUjB+=hjttyStHiMWBQ@mail.gmail.com>
 <SN6PR11MB3421B6569584930A1F603834DFCC9@SN6PR11MB3421.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB3421B6569584930A1F603834DFCC9@SN6PR11MB3421.namprd11.prod.outlook.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 31 Aug 2021 13:36:44 +0200
Message-ID: <CAKMK7uHCtZoS=bEHh_Xnr6YLua180JBNZawLY7+Ripid=_fNew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [i-g-t] tests/gem_userptr_blits: Remove vma-merge
 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>, "Lankhorst, Maarten" <maarten.lankhorst@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 31, 2021 at 7:47 AM Surendrakumar Upadhyay, TejaskumarX
<tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Sent: 30 August 2021 21:31
> > To: Surendrakumar Upadhyay, TejaskumarX
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > Cc: IGT development <igt-dev@lists.freedesktop.org>; Lankhorst, Maarten
> > <maarten.lankhorst@intel.com>; Ursulin, Tvrtko <tvrtko.ursulin@intel.com>
> > Subject: Re: [igt-dev] [i-g-t] tests/gem_userptr_blits: Remove vma-merge
> > subtest
> >
> > On Tue, Aug 24, 2021 at 11:17 AM Tejas Upadhyay
> > <tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
> > >
> > > mmap requests for huge page size in vma-merge subtest are cancelled
> > > from kernel using i915_request_cancel(rq, -EINTR), otherwise it
> > > results in system hang. It is known/expected failure thus it is
> > > decided to remove the subtest.
> > >
> > > Signed-off-by: Tejas Upadhyay
> > > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> >
> > Bugfixes need to link to the gitlab issue, otherwise it's not really a bugfix for a
> > CI issue.
>
> Tejas : Ok.
>
> >
> > Furthermore this is wrong:
> > - In DII this might happen. If this is a patch upstream then please mark up the
> > DII patch as NOT_UPSTREAM. Dropping it is blocked on backporting
> > hangcheck. Your manager should be aware of the Jira that tracks hangcheck
> > backporting.
>
> Tejas : This is only for upstream.
>
> > - In upstream hangcheck should get us out of this situation. If not, then this is
> > a kernel bug.
>
>
> Tejas : Hangcheck watchdog is implemented in kernel by Tvrtko. Hence now test does not hang, it fails.

Ok, but then pls fix the invalid assumption from the testcase, not
just delete it. With explanation for why that assumption is invalid,
and what should be done instead.
-Daniel

>
> >
> > Cheers, Daniel
> > > ---
> > >  tests/i915/gem_userptr_blits.c | 40
> > > ----------------------------------
> > >  1 file changed, 40 deletions(-)
> > >
> > > diff --git a/tests/i915/gem_userptr_blits.c
> > > b/tests/i915/gem_userptr_blits.c index 756bd6e4..11bce6d7 100644
> > > --- a/tests/i915/gem_userptr_blits.c
> > > +++ b/tests/i915/gem_userptr_blits.c
> > > @@ -702,43 +702,6 @@ static size_t hugepagesize(void)  #undef LINE  }
> > >
> > > -static void test_vma_merge(int i915)
> > > -{
> > > -       const size_t sz = 2 * hugepagesize();
> > > -       igt_spin_t *spin;
> > > -       uint32_t handle;
> > > -       void *addr;
> > > -       uint64_t ahnd = get_reloc_ahnd(i915, 0);
> > > -
> > > -       addr = mmap(NULL, sz, PROT_READ | PROT_WRITE,
> > > -                   MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> > > -
> > > -       gem_userptr(i915, addr + sz / 2, 4096, 0, userptr_flags, &handle);
> > > -
> > > -       spin = igt_spin_new(i915, .ahnd = ahnd, .dependency = handle,
> > > -                           .flags = IGT_SPIN_FENCE_OUT);
> > > -       igt_assert(gem_bo_busy(i915, handle));
> > > -
> > > -       for (size_t x = 0; x < sz; x += 4096) {
> > > -               if (x == sz / 2)
> > > -                       continue;
> > > -
> > > -               igt_assert(mmap(addr + x, 4096, PROT_READ | PROT_WRITE,
> > > -                               MAP_FIXED | MAP_SHARED | MAP_ANON, -1, 0) !=
> > > -                          MAP_FAILED);
> > > -       }
> > > -
> > > -       igt_spin_end(spin);
> > > -       gem_close(i915, handle);
> > > -
> > > -       munmap(addr, sz);
> > > -
> > > -       gem_sync(i915, spin->handle);
> > > -       igt_assert_eq(sync_fence_status(spin->out_fence), 1);
> > > -       igt_spin_free(i915, spin);
> > > -       put_ahnd(ahnd);
> > > -}
> > > -
> > >  static void test_huge_split(int i915)  {
> > >         const size_t sz = 2 * hugepagesize(); @@ -2614,9 +2577,6 @@
> > > igt_main_args("c:", NULL, help_str, opt_handler, NULL)
> > >                 igt_subtest("nohangcheck")
> > >                         test_nohangcheck_hostile(fd);
> > >
> > > -               igt_subtest("vma-merge")
> > > -                       test_vma_merge(fd);
> > > -
> > >                 igt_subtest("huge-split")
> > >                         test_huge_split(fd);
> > >         }
> > > --
> > > 2.31.1
> > >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
