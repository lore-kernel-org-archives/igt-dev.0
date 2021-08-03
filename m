Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6D589FDB
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Aug 2021 09:29:15 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id x90so28116350ede.8
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Aug 2021 02:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210728045544.1046657-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <2ce3082b-9823-8625-920e-7dcb8da0efbc@intel.com>
 <62dfe8ca-34a3-cd2c-6cf1-4181a0acb36a@gmail.com>
 <cd2e65f9-b5de-3ac7-3f56-ec004cecacfa@intel.com>
 <SN6PR11MB34210D1C5FF9B12A07947902DFEF9@SN6PR11MB3421.namprd11.prod.outlook.com>
 <CAJ=qYWSdy+n-rNFhHgghkRRO6F0Eo-txwkVwqDSrbFNRhBU=eA@mail.gmail.com>
 <SN6PR11MB34210F089547C6A1737C5FEEDFF09@SN6PR11MB3421.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB34210F089547C6A1737C5FEEDFF09@SN6PR11MB3421.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 3 Aug 2021 12:29:02 +0300
Message-ID: <CAJ=qYWTNo9MXbsvL-7vWCtam7mm6UpwAwEf-OKe9x7puL2CT2g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [i-g-t] tests/kms_plane_alpha_blend: Align width to
 256B
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
Cc: "Sharma, Swati2" <swati2.sharma@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 3, 2021 at 7:55 AM Surendrakumar Upadhyay, TejaskumarX
<tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
>
> Use 1366x768 panel and you should be able to reproduce. I don=E2=80=99t h=
ave that panel with me right now. I will check once I get it.

Setting fb size to 1366x768 does not reproduce this issue on my icl. I
don't have such panel nor could I swap such into my lenovo in any
case.

For testing purpose you could try take out your change from
kms_plane_alpha_blend and change all used modifiers to something
different than linear, ie. x or y tile. With different tiling
everything will be different on both sw and hw level while still
testing same hw alpha blending feature.

/Juha-Pekka

>
> Thanks,
> Tejas
>
> > -----Original Message-----
> > From: Juha-Pekka Heikkil=C3=A4 <juhapekka.heikkila@gmail.com>
> > Sent: 03 August 2021 00:49
> > To: Surendrakumar Upadhyay, TejaskumarX
> > <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > Cc: Sharma, Swati2 <swati2.sharma@intel.com>; igt-
> > dev@lists.freedesktop.org
> > Subject: Re: [igt-dev] [i-g-t] tests/kms_plane_alpha_blend: Align width=
 to
> > 256B
> >
> > On Mon, Aug 2, 2021 at 5:16 PM Surendrakumar Upadhyay, TejaskumarX
> > <tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
> > >
> > > Hi JP,
> > >
> > > You are right i915 driver is giving 64B aligned buffer but test uses =
raw width
> > and thus it requires width to be aligned.
> >
> > Can you try this on the device which is failing:
> > https://patchwork.freedesktop.org/series/93317/
> >
> > It will put on pixel blend and alpha and try different width linear fbs=
 and
> > compare results with crc. This should tell if alignments somehow can af=
fect
> > the crc on your test machine. On my ICL everything work as expected.
> >
> > /Juha-Pekka
> >
> > >
> > > Thanks,
> > > Tejas
> > >
> > > > -----Original Message-----
> > > > From: Sharma, Swati2 <swati2.sharma@intel.com>
> > > > Sent: 02 August 2021 18:35
> > > > To: juhapekka.heikkila@gmail.com; Surendrakumar Upadhyay,
> > > > TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>; igt-
> > > > dev@lists.freedesktop.org
> > > > Subject: Re: [igt-dev] [i-g-t] tests/kms_plane_alpha_blend: Align
> > > > width to 256B
> > > >
> > > > Hi JP,
> > > >
> > > > Tejas reapplied the same fix as in
> > > > https://patchwork.freedesktop.org/patch/445010/?series=3D92751&rev=
=3D2
> > > > which was reviewed by Daniel.
> > > >
> > > > On 02-Aug-21 5:42 PM, Juha-Pekka Heikkila wrote:
> > > > > Hi Tejas, Swati,
> > > > >
> > > > > I was confused when I read this patch, mind you tell what happen =
here?
> > > > > To me it look like nothing matches with each other with the patch=
.
> > > > >
> > > > > Even subject is telling other things than what this patch actuall=
y does.
> > > > >
> > > > > On 30.7.2021 8.50, Sharma, Swati2 wrote:
> > > > >> Reviewed-by:
> > > > >> Swati Sharma <swati2.sharma@intel.com>
> > > > >>
> > > > >> On 28-Jul-21 10:25 AM, Tejas Upadhyay wrote:
> > > > >>> some display resolutions like 1366x768 6bpc which does not have
> > > > >>> 64B aligned width are creating crc mismatch in
> > > > >>> kms_plane_alpha_blend test on Intel platforms.
> > > > >
> > > > > hm. You are saying none of Intel hw is able to show 1366 wide
> > > > > framebuffers correctly? And it is fixed by hiding it from being t=
ested?
> > > > >
> > > > > Memory given from kernel will have 64B alignment. You can easily
> > > > > see by yourself.
> > > > >
> > > > >>>
> > > > >>> Also having different alignment requirement by different
> > > > >>> drivers, 256B aligned width should work for all drm drivers.
> > > > >
> > > > > You are saying you are fixing some problem with Intel hw, what
> > > > > does all this other stuff have to do with it? None of those other
> > > > > drivers are able to show 1366 pixels wide framebuffers either?
> > > > >
> > > > >>>
> > > > >>> amdgpu and radeon, amdgpu_align_pitch: 256B armada,
> > armada_pitch:
> > > > >>> 128B
> > > > >>> exynos_drm_gem_dumb_create: No alignment required
> > > > >>> drm_gem_shmem_dumb_create: 8B
> > > > >>> drm_gem_vram_fill_create_dumb: 8B
> > > > >>>
> > > > >>> Thus 256B covers everything we see in the kernel drm drivers.
> > > > >>> Signed-off-by: Tejas Upadhyay
> > > > >>> <tejaskumarx.surendrakumar.upadhyay@intel.com>
> > > > >>> ---
> > > > >>>   tests/kms_plane_alpha_blend.c | 1 +
> > > > >>>   1 file changed, 1 insertion(+)
> > > > >>>
> > > > >>> diff --git a/tests/kms_plane_alpha_blend.c
> > > > >>> b/tests/kms_plane_alpha_blend.c index d649a09f..864e83f9 100644
> > > > >>> --- a/tests/kms_plane_alpha_blend.c
> > > > >>> +++ b/tests/kms_plane_alpha_blend.c
> > > > >>> @@ -168,6 +168,7 @@ static void prepare_crtc(data_t *data,
> > > > >>> igt_output_t *output, enum pipe pipe)
> > > > >>>       w =3D mode->hdisplay;
> > > > >>>       h =3D mode->vdisplay;
> > > > >>> +    w =3D ALIGN(w, 256);
> > > > >
> > > > > This doesn't cause anything to align with 256 bytes. This makes f=
b
> > > > > width in pixels divisible by 256. For anything to do with fb
> > > > > alignments..this has very little to do. Kernel will do viewport
> > > > > clipping hence for actual intended test this does nothing. FB
> > > > > alignments are handled otherwise as in this case with with linear
> > > > > fb will
> > > > have 64 bytes per stride.
> > > > >
> > > > >>>       /* recreate all fbs if incompatible */
> > > > >>>       if (data->xrgb_fb.width !=3D w || data->xrgb_fb.height !=
=3D h) {
> > > > >>>           cairo_t *cr;
> > > > >>>
> > > > >>
> > > > >
> > > > > If this patch actually fixed anything you'll need to create hw wa
> > > > > and this need to be fixed in kernel. Not testing is not fixing.
> > > > > Imo there should be no problem for Intel hw to show varying fb
> > > > > sizes, including
> > > > > 1366 wide.
> > > > >
> > > > > /Juha-Pekka
> > > >
> > > > --
> > > > ~Swati Sharma
