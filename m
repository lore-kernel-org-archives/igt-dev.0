Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C246E134
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 17:42:55 +0000 (UTC)
Date: Tue, 7 Apr 2020 20:42:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200407174250.GK6112@intel.com>
References: <20200407110904.13008-1-juhapekka.heikkila@gmail.com>
 <20200407153602.GD6112@intel.com>
 <7889c8d7-7aed-9ebb-7103-9fa798b4097c@gmail.com>
 <20200407160830.GE6112@intel.com>
 <ea5604be-51ca-31a5-5330-281125c79156@gmail.com>
 <0db0f75f-ea12-f04a-7bcc-254c98c9d4ad@gmail.com>
 <20200407171051.GI6112@intel.com>
 <3e40352e-dabf-2e61-4da1-66b026f87db2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e40352e-dabf-2e61-4da1-66b026f87db2@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: survive cdclk caused
 modeset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 08:24:01PM +0300, Juha-Pekka Heikkila wrote:
> On 7.4.2020 20.10, Ville Syrj=E4l=E4 wrote:
> > On Tue, Apr 07, 2020 at 08:07:16PM +0300, Juha-Pekka Heikkila wrote:
> >> On 7.4.2020 19.22, Juha-Pekka Heikkila wrote:
> >>> On 7.4.2020 19.08, Ville Syrj=E4l=E4 wrote:
> >>>> On Tue, Apr 07, 2020 at 06:54:09PM +0300, Juha-Pekka Heikkila wrote:
> >>>>> On 7.4.2020 18.36, Ville Syrj=E4l=E4 wrote:
> >>>>>> On Tue, Apr 07, 2020 at 02:09:04PM +0300, Juha-Pekka Heikkila wrot=
e:
> >>>>>>> This change will slow this test down a bit. In mid test starting
> >>>>>>> to use higher bpp pixel format (say 64bpp) can cause modeset.
> >>>>>>> Use blocking commit so there's wait for modeset to happen.
> >>>>>>
> >>>>>> We already wait for the event the next time around. So this
> >>>>>> doesn't make sense to me.
> >>>>>
> >>>>> There's those logs like this
> >>>>> https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_470/fi-icl-guc/igt@=
kms_plane@pixel-format-pipe-c-planes-source-clamping.html
> >>>>>
> >>>>>
> >>>>> where going to 64bpp pixel format will cause modeset and fail runni=
ng
> >>>>> test.
> >>>>
> >>>> Hmm. Seems we don't have drm.debug=3D0x10 enabled so we don't see the
> >>>> actual debug message :( Anyways, the real bug seems to be the lack of
> >>>> ALLOW_MODESET.
> >>>
> >>> I'll try that and see how it changes situation. I originally had idea
> >>> modeset will block the flip and making this commit blocking would alw=
ays
> >>> force things always into correct order as current test didn't fail ev=
ery
> >>> time for me.
> >>
> >> Having that commit saying
> >>
> >> igt_display_commit_atomic(&data->display,
> >> 	DRM_MODE_ATOMIC_ALLOW_MODESET |
> >> 	DRM_MODE_ATOMIC_NONBLOCK |
> >> 	DRM_MODE_PAGE_FLIP_EVENT, NULL);
> >>
> >> I see test failing as before so it will not alone fix this issue. On my
> >> ICL box the test fail maybe 1/5 times, with the patch on list it never
> >> failed so far.
> > =

> > Why does it fail?
> =

> =

> This is failure with ALLOW_MODESET
> ---
> (kms_plane:31238) igt_kms-DEBUG: display: }
> (kms_plane:31238) igt_kms-CRITICAL: Test assertion failure function =

> igt_display_commit_atomic, file ../lib/igt_kms.c:3508:
> (kms_plane:31238) igt_kms-CRITICAL: Failed assertion: ret =3D=3D 0
> (kms_plane:31238) igt_kms-CRITICAL: Last errno: 16, Device or resource bu=
sy
> (kms_plane:31238) igt_kms-CRITICAL: error: -16 !=3D 0
> (kms_plane:31238) igt_core-INFO: Stack trace:
> (kms_plane:31238) igt_core-INFO:   #0 ../lib/igt_core.c:1676 =

> __igt_fail_assert()
> (kms_plane:31238) igt_core-INFO:   #1 [igt_display_commit_atomic+0x44]
> (kms_plane:31238) igt_core-INFO:   #2 ../tests/kms_plane.c:599 =

> capture_format_crcs.constprop.14()
> (kms_plane:31238) igt_core-INFO:   #3 ../tests/kms_plane.c:652 =

> test_format_plane_colors.constprop.13()
> (kms_plane:31238) igt_core-INFO:   #4 ../tests/kms_plane.c:728 =

> test_pixel_formats.constprop.9()
> (kms_plane:31238) igt_core-INFO:   #5 ../tests/kms_plane.c:950 =

> run_tests_for_pipe_plane.constprop.8()
> (kms_plane:31238) igt_core-INFO:   #6 ../tests/kms_plane.c:1019 =

> __real_main1006()
> (kms_plane:31238) igt_core-INFO:   #7 ../tests/kms_plane.c:1006 main()
> (kms_plane:31238) igt_core-INFO:   #8 ../csu/libc-start.c:344 =

> __libc_start_main()
> (kms_plane:31238) igt_core-INFO:   #9 [_start+0x2a]
> ****  END  ****
> Stack trace:
>    #0 ../lib/igt_core.c:1676 __igt_fail_assert()
>    #1 [igt_display_commit_atomic+0x44]
>    #2 ../tests/kms_plane.c:599 capture_format_crcs.constprop.14()
>    #3 ../tests/kms_plane.c:652 test_format_plane_colors.constprop.13()
>    #4 ../tests/kms_plane.c:728 test_pixel_formats.constprop.9()
>    #5 ../tests/kms_plane.c:950 run_tests_for_pipe_plane.constprop.8()
>    #6 ../tests/kms_plane.c:1019 __real_main1006()
>    #7 ../tests/kms_plane.c:1006 main()
>    #8 ../csu/libc-start.c:344 __libc_start_main()
>    #9 [_start+0x2a]
> Subtest pixel-format-pipe-A-planes-source-clamping: FAIL (22.543s)

That doesn't tell anyone anything useful. Only kernel logs can help
diagnose the problem.


> --
> =

> Failure is ebusy. It seems round where it kick me out is not always the =

> same.

Hmm. Sounds like we have a race between sending the event vs. submitting
a new commit :(

Hmm. What wasn't there a patch from Daniel to convert modeset commits to
blocking to "fix" a race just like this? Ah, yeah it was EBUSY due to
multiple pipes and noblocking modesets. Do you have multiple pipes
enablad when it fails? That could certainly explain the race.

> =

> > =

> >>
> >>>
> >>>>
> >>>>> I was testing this on ICL and see errors randomly, on ci those
> >>>>> seem to be less random. Making this one commit blocking will cause
> >>>>> modeset to settle without interrupting test, at least on my ICL.
> >>>>>
> >>>>> If there's a way to sort those pixel formats according to bpp and s=
tart
> >>>>> with highest there's no need for this.
> >>>>>
> >>>>>>
> >>>>>>>
> >>>>>>> Fixes: https://gitlab.freedesktop.org/drm/intel/issues/1214
> >>>>>>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> >>>>>>> ---
> >>>>>>>  =A0=A0 tests/kms_plane.c | 6 ++----
> >>>>>>>  =A0=A0 1 file changed, 2 insertions(+), 4 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> >>>>>>> index 805795cd..2324fb6e 100644
> >>>>>>> --- a/tests/kms_plane.c
> >>>>>>> +++ b/tests/kms_plane.c
> >>>>>>> @@ -569,12 +569,10 @@ static void capture_format_crcs(data_t *dat=
a,
> >>>>>>> enum pipe pipe,
> >>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (data->display.is_atomic) {
> >>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*
> >>>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * Use non-blocking commits =
to allow the next fb
> >>>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * to be prepared in paralle=
l while the current fb
> >>>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * awaits to be latched.
> >>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * Use blocking commit becau=
se there maybe
> >>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * modeset when going to hig=
her bpp pixel format.
> >>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> >>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_display_commit_at=
omic(&data->display,
> >>>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 DRM_MODE_ATOMIC_NONBLOCK |
> >>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 DRM_MODE_PAGE_FLIP_EVENT, NULL);
> >>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 } else {
> >>>>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*
> >>>>>>> -- =

> >>>>>>> 2.17.1
> >>>>>>>
> >>>>>>> _______________________________________________
> >>>>>>> igt-dev mailing list
> >>>>>>> igt-dev@lists.freedesktop.org
> >>>>>>> https://lists.freedesktop.org/mailman/listinfo/igt-dev
> >>>>>>
> >>>>
> >>>
> > =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
