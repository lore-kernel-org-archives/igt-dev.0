Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA676E420
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 08:30:22 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Mon, 20 Sep 2021 08:29:44 +0000
Message-ID: <BY5PR11MB4372B0490EBD823137D4F57589A09@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <20210916141827.17720-1-vidya.srinivas@intel.com>
 <CAJUqKUqpus_Sui-O5LrViFYB1wxbMEg-Hz4Ak06XS06yxKy=QA@mail.gmail.com>
 <20210917150349.la6orrmaxyrp5sdc@outlook.office365.com>
In-Reply-To: <20210917150349.la6orrmaxyrp5sdc@outlook.office365.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Mark Yacoub <markyacoub@chromium.org>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, Mark Yacoub <markyacoub@google.com>, Nicholas Choi <nicholas.choi@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Sent: Friday, September 17, 2021 8:34 PM
> To: Mark Yacoub <markyacoub@chromium.org>
> Cc: Development mailing list for IGT GPU Tools <igt-
> dev@lists.freedesktop.org>; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>; Mark Yacoub
> <markyacoub@google.com>; Srinivas, Vidya <vidya.srinivas@intel.com>;
> Nicholas Choi <nicholas.choi@amd.com>
> Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Fix regression=
 in
> test_resolution_with_output
>=20
> Hi Mark,
>=20
> Yes, this patch cause a regression in AMD.
>=20
> I applied the original patch after the CI reported a complete pass. I als=
o
> tested it in a VC4 and VKMS; just for curiosity, why did we not get this
> regression in the CI?

Hello Mark/Siqueira,
I am not very sure. One possible reason could be the CI does not run all
the subtests sequentially? With this line, it triggers the condition
[ 7577.454215] [drm:drm_atomic_check_only] atomic driver check for 00000000=
bcb190f7 failed: -22
I observed the same message even with upstream kernel.

I have resubmitted the patch with is amd
https://patchwork.freedesktop.org/patch/454571/?series=3D94762&rev=3D2
Kindly have a check. Thank you.

Regards
Vidya
>=20
> Thanks
>=20
> On 09/16, Mark Yacoub wrote:
> > @Siquiera, I remember this also caused a regression on Qualcomm
> > devices as well.
> > Will removing this regress AMD? Any work around?
> >
> > On Thu, Sep 16, 2021 at 10:30 AM Vidya Srinivas
> > <vidya.srinivas@intel.com> wrote:
> > >
> > > Staring commit fea0e38e690c30c6 "Making the test more generic"
> > > test_resolution_with_output introduced setting igt_output_set_pipe
> > > to PIPE_NONE. This is triggering atomic check failure resulting in
> > > "enabled/connectors mismatch" under
> drm_atomic_helper_check_modeset.
> > > Patch fixes this issue.
> > >
> > > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > > ---
> > >  tests/kms_concurrent.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c index
> > > 25c67eb469d1..40096ea1c457 100644
> > > --- a/tests/kms_concurrent.c
> > > +++ b/tests/kms_concurrent.c
> > > @@ -268,7 +268,6 @@ test_resolution_with_output(data_t *data, enum
> > > pipe pipe, int max_planes, igt_ou
> > >
> > >                 /* switch to lower resolution */
> > >                 igt_output_override_mode(output, mode_lo);
> > > -               igt_output_set_pipe(output, PIPE_NONE);
> > >                 igt_display_commit2(&data->display, COMMIT_ATOMIC);
> > >
> > >                 /* switch back to higher resolution */
> > > --
> > > 2.33.0
> > >
>=20
> --
> Rodrigo Siqueira
> https://siqueira.tech
