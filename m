Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7859F6E158
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 15:29:06 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id b20so10677852lfv.3
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 08:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210916141827.17720-1-vidya.srinivas@intel.com>
 <CAJUqKUqpus_Sui-O5LrViFYB1wxbMEg-Hz4Ak06XS06yxKy=QA@mail.gmail.com>
 <20210917150349.la6orrmaxyrp5sdc@outlook.office365.com>
 <BY5PR11MB4372B0490EBD823137D4F57589A09@BY5PR11MB4372.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB4372B0490EBD823137D4F57589A09@BY5PR11MB4372.namprd11.prod.outlook.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon, 20 Sep 2021 11:27:17 -0400
Message-ID: <CAJUqKUr_6DjfU4aZPNxyt-86C+L0cS-Z2jQjiZLVpunzHowssw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Fix regression in
 test_resolution_with_output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, Mark Yacoub <markyacoub@google.com>, Nicholas Choi <nicholas.choi@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 20, 2021 at 4:30 AM Srinivas, Vidya
<vidya.srinivas@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Sent: Friday, September 17, 2021 8:34 PM
> > To: Mark Yacoub <markyacoub@chromium.org>
> > Cc: Development mailing list for IGT GPU Tools <igt-
> > dev@lists.freedesktop.org>; Modem, Bhanuprakash
> > <bhanuprakash.modem@intel.com>; Mark Yacoub
> > <markyacoub@google.com>; Srinivas, Vidya <vidya.srinivas@intel.com>;
> > Nicholas Choi <nicholas.choi@amd.com>
> > Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Fix regression in
> > test_resolution_with_output
> >
> > Hi Mark,
> >
> > Yes, this patch cause a regression in AMD.
> >
> > I applied the original patch after the CI reported a complete pass. I also
> > tested it in a VC4 and VKMS; just for curiosity, why did we not get this
> > regression in the CI?
>
> Hello Mark/Siqueira,
> I am not very sure. One possible reason could be the CI does not run all
> the subtests sequentially? With this line, it triggers the condition
> [ 7577.454215] [drm:drm_atomic_check_only] atomic driver check for 00000000bcb190f7 failed: -22
Do we know why is this the case? I'm curious to know which check is
failing and why it is failing. Is it failing at the following atomic
commit? Cause it could be a kernel bug maybe?
> I observed the same message even with upstream kernel.
>
> I have resubmitted the patch with is amd
> https://patchwork.freedesktop.org/patch/454571/?series=94762&rev=2
> Kindly have a check. Thank you.
>
> Regards
> Vidya
> >
> > Thanks
> >
> > On 09/16, Mark Yacoub wrote:
> > > @Siquiera, I remember this also caused a regression on Qualcomm
> > > devices as well.
> > > Will removing this regress AMD? Any work around?
> > >
> > > On Thu, Sep 16, 2021 at 10:30 AM Vidya Srinivas
> > > <vidya.srinivas@intel.com> wrote:
> > > >
> > > > Staring commit fea0e38e690c30c6 "Making the test more generic"
> > > > test_resolution_with_output introduced setting igt_output_set_pipe
> > > > to PIPE_NONE. This is triggering atomic check failure resulting in
> > > > "enabled/connectors mismatch" under
> > drm_atomic_helper_check_modeset.
> > > > Patch fixes this issue.
> > > >
> > > > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > > > ---
> > > >  tests/kms_concurrent.c | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c index
> > > > 25c67eb469d1..40096ea1c457 100644
> > > > --- a/tests/kms_concurrent.c
> > > > +++ b/tests/kms_concurrent.c
> > > > @@ -268,7 +268,6 @@ test_resolution_with_output(data_t *data, enum
> > > > pipe pipe, int max_planes, igt_ou
> > > >
> > > >                 /* switch to lower resolution */
> > > >                 igt_output_override_mode(output, mode_lo);
> > > > -               igt_output_set_pipe(output, PIPE_NONE);
> > > >                 igt_display_commit2(&data->display, COMMIT_ATOMIC);
> > > >
> > > >                 /* switch back to higher resolution */
> > > > --
> > > > 2.33.0
> > > >
> >
> > --
> > Rodrigo Siqueira
> > https://siqueira.tech
