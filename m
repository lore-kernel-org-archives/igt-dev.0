Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B11089BAB
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Sep 2021 09:12:32 +0000 (UTC)
Date: Tue, 28 Sep 2021 12:15:54 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YVLdSqQs7ok5+PIX@platvala-desk.ger.corp.intel.com>
References: <20210927160700.1570885-1-aurabindo.pillai@amd.com>
 <CAJUqKUpwJfdU+=jO5=atomxwu4d-KXRSN0gEppQhWdK9CqtNaQ@mail.gmail.com>
 <DM4PR12MB5295DB9A15801BDE6F78D3AB8BA79@DM4PR12MB5295.namprd12.prod.outlook.com>
 <CAJUqKUoXc4g8QCKUBJAi5opMD31KW7ei2o2mA9ozHF0UV9qSFg@mail.gmail.com>
 <DM4PR12MB529578D5A447184B322867638BA79@DM4PR12MB5295.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR12MB529578D5A447184B322867638BA79@DM4PR12MB5295.namprd12.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest bo-too-big
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
Cc: Mark Yacoub <markyacoub@chromium.org>, Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Mark Yacoub <markyacoub@google.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 27, 2021 at 07:10:45PM +0000, Pillai, Aurabindo wrote:
> Skipping using the continue statement has the side effect of this
> subtest being absent from the list of subtests, when running the
> test executable with paramter --list-subtest. Is that okay ?

It's not okay btw. When you're not in an igt_fixture or an
igt_subtest, you cannot use anything that touches the hardware or the
running system in any way.


-- 
Petri Latvala




> 
> --
> 
> Regards,
> Jay
> ________________________________
> From: Mark Yacoub <markyacoub@chromium.org>
> Sent: Monday, September 27, 2021 1:34 PM
> To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>
> Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>; Mark Yacoub <markyacoub@google.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
> Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest bo-too-big
> 
> so for the sake of consistency, I'm wondering if we can skip the test
> the same way we skip other tests such as
> ```
> if (tests[i].flags & TEST_NO_2X_OUTPUT)
> continue;
> ```
> because we're not failing a certain condition but a whole test, it
> might be better not to run the test in the first place unless it's
> intel.
> So in both main loops that call run_test we can do if
> if (tests[i].flags & TEST_BO_TOOBIG && !intel)
>     continue;
> this way we're not too worried where the flag would be used across the
> test and not skip halfway through a test.
> 
> On Mon, Sep 27, 2021 at 1:28 PM Pillai, Aurabindo
> <Aurabindo.Pillai@amd.com> wrote:
> >
> > [AMD Official Use Only]
> >
> >
> > Hi Mark,
> >
> >
> > Both bo-too-big and bo-too-big-interruptible shall be skipped with this patch. The other location where TEST_BO_TOOBIG is mentioned is in the same function.
> >
> > --
> >
> > Regards,
> > Jay
> > ________________________________
> > From: Mark Yacoub <markyacoub@chromium.org>
> > Sent: Monday, September 27, 2021 1:21 PM
> > To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>
> > Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>; Mark Yacoub <markyacoub@google.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>
> > Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip : skip subtest bo-too-big
> >
> > On Mon, Sep 27, 2021 at 12:07 PM Aurabindo Pillai
> > <aurabindo.pillai@amd.com> wrote:
> > >
> > > [Why]
> > > The rationale of the test does not hold true for AMD hardware. The
> > > aperture size calculation has an upper bound check which is done through
> > > i915 specific IOCTL. Hence this part of subtest must be moved
> > > out of the platform agnostic tests. Moreover, AMD hardware
> > > supports buffers larger than aperture size.
> > >
> > > [How]
> > > Skip the bo-too-big subtest unless its run on i915 as the test fails on
> > > AMD, VKMS and VC4
> > >
> > > Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> > > ---
> > >  tests/kms_flip.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> > > index 54137871..20112de1 100755
> > > --- a/tests/kms_flip.c
> > > +++ b/tests/kms_flip.c
> > > @@ -1290,6 +1290,7 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
> > >         /* 256 MB is usually the maximum mappable aperture,
> > >          * (make it 4x times that to ensure failure) */
> > >         if (o->flags & TEST_BO_TOOBIG) {
> > There is also another place where TEST_BO_TOOBIG is used, should we
> > skip this one as well or it's only this part?
> > > +               igt_skip_on(!is_i915_device(drm_fd));
> > >                 bo_size = 4*gem_mappable_aperture_size(drm_fd);
> > >                 igt_require(bo_size < gem_global_aperture_size(drm_fd));
> > >         }
> > > --
> > > 2.30.2
> > >
