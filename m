Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45784C4725D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 07:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CEF10EAC3;
	Mon, 22 Jan 2024 07:56:56 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0478D10EACF
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jan 2024 07:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705910210;
 bh=wcDsxHZBVedrFDf0AoE3fk7CyK/a1R3oEw4tQfKXCOg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=00oQXcqHrYkGvDnFU6Ci7kzRDfMbJxuCppBIc/Czw0EHiVXcPGBZBiXxEws6CHmEX
 Q0L9snADztzp7klctyZpyJ3S+TMO7cc+t8AD/12YVANuqc+I1WhVKT8HYM94IEMMmw
 9PwYhmcohR7HdxNJWxLdfK6zDjwvROJaDl2hSHQi7o986pHRqRDb+o0s4tRNsYWTea
 E8V+ZrebnviBG6sPTjD90KQbZBtdUm0Rz9CdRwLhqWozNrfcvqB1wi+BvVfZM2/pVB
 kMjQfz50nyb/L7h1WYHhJo0sLn2UJIb1PH4u3wN3KJotOgaWXeGV4zSFyUHJ+Q8WD4
 CqwIQ9bkyzt3Q==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 118F33780C21;
 Mon, 22 Jan 2024 07:56:50 +0000 (UTC)
Date: Mon, 22 Jan 2024 09:56:41 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH i-g-t 3/4] tests/kms_atomic: Add solid fill plane subtest
Message-ID: <20240122095641.690857ca.pekka.paalanen@collabora.com>
In-Reply-To: <65b91019-2aed-a06d-5a98-e146dd866e6a@quicinc.com>
References: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
 <20231215-solid-fill-v1-3-12932f9f452d@quicinc.com>
 <20231218121247.454bc00a.pekka.paalanen@collabora.com>
 <6c910eb7-5f4b-4b03-ae3c-ca0498f0c667@quicinc.com>
 <20240111112028.36736525.pekka.paalanen@collabora.com>
 <f9054b1a-d020-4e1f-a010-fcff8bd651e2@quicinc.com>
 <20240119110042.3114f54c.pekka.paalanen@collabora.com>
 <65b91019-2aed-a06d-5a98-e146dd866e6a@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eOIr8Y1dLExVi/v4sYURZ.N";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>, igt-dev@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--Sig_/eOIr8Y1dLExVi/v4sYURZ.N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Jan 2024 09:40:52 -0800
Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:

> On 1/19/2024 1:00 AM, Pekka Paalanen wrote:
> > On Thu, 18 Jan 2024 15:35:10 -0800
> > Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >  =20
> >> On 1/11/2024 1:20 AM, Pekka Paalanen wrote: =20
> >>> On Thu, 21 Dec 2023 15:57:51 -0800
> >>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >>>     =20
> >>>> On 12/18/2023 2:12 AM, Pekka Paalanen wrote: =20
> >>>>> On Fri, 15 Dec 2023 16:40:23 -0800
> >>>>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >>>>>        =20
> >>>>>> Add a basic test for solid fill planes.
> >>>>>>
> >>>>>> This test will first commit a single-color framebuffer plane then
> >>>>>> a solid fill plane with the same contents. It then validates the s=
olid
> >>>>>> fill plane by comparing the resulting CRC with the CRC of the refe=
rence
> >>>>>> framebuffer commit.
> >>>>>>
> >>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>>>> ---
> >>>>>>     tests/kms_atomic.c | 94 ++++++++++++++++++++++++++++++++++++++=
++++++++++++++++
> >>>>>>     1 file changed, 94 insertions(+)
> >>>>>>
> >>>>>> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> >>>>>> old mode 100644
> >>>>>> new mode 100755
> >>>>>> index 2b6e9a8f0383..8f81e65ad84f
> >>>>>> --- a/tests/kms_atomic.c
> >>>>>> +++ b/tests/kms_atomic.c
> >>>>>> @@ -128,6 +128,13 @@ enum kms_atomic_check_relax {
> >>>>>>     	PLANE_RELAX_FB =3D (1 << 1)
> >>>>>>     };
> >>>>>>    =20
> >>>>>> +struct solid_fill_blob {
> >>>>>> +	uint32_t r;
> >>>>>> +	uint32_t g;
> >>>>>> +	uint32_t b;
> >>>>>> +	uint32_t pad;
> >>>>>> +};
> >>>>>> +
> >>>>>>     static inline int damage_rect_width(struct drm_mode_rect *r)
> >>>>>>     {
> >>>>>>     	return r->x2 - r->x1;
> >>>>>> @@ -1322,6 +1329,79 @@ static void atomic_plane_damage(data_t *dat=
a)
> >>>>>>     	igt_remove_fb(data->drm_fd, &fb_2);
> >>>>>>     }
> >>>>>>    =20
> >>>>>> +static void test_solid_fill_plane(data_t *data, igt_output_t *out=
put,  igt_plane_t *plane)
> >>>>>> +{
> >>>>>> +	struct drm_mode_create_blob c;
> >>>>>> +	struct drm_mode_destroy_blob d;
> >>>>>> +	drmModeModeInfo *mode =3D igt_output_get_mode(output);
> >>>>>> +	struct drm_mode_rect rect =3D { 0 };
> >>>>>> +	struct igt_fb ref_fb;
> >>>>>> +	igt_pipe_crc_t *pipe_crc;
> >>>>>> +	igt_crc_t ref_crc, new_crc;
> >>>>>> +	enum pipe pipe =3D data->pipe->pipe;
> >>>>>> +	int height, width;
> >>>>>> +	int ret;
> >>>>>> +
> >>>>>> +	struct solid_fill_blob blob_data =3D {
> >>>>>> +		.r =3D 0x00000000,
> >>>>>> +		.g =3D 0x00000000,
> >>>>>> +		.b =3D 0xff000000,
> >>>>>> +		.pad =3D 0x0,
> >>>>>> +	}; =20
> >>>>>
> >>>>> Hi Jessica!
> >>>>>
> >>>>> This is the blob sent to KMS as the solid fill color...
> >>>>>
> >>>>> ...
> >>>>>        =20
> >>>>>> +	igt_create_color_fb(data->drm_fd, width, height,
> >>>>>> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> >>>>>> +			    0.0, 0.0, 1.0, &ref_fb); =20
> >>>>>
> >>>>> ..and this (0.0, 0.0, 1.0) is the corresponding color in normalized
> >>>>> values, I presume.
> >>>>>
> >>>>> So you say that 0xff000000 =3D 1.0.
> >>>>>
> >>>>> However, the patch for the kernel UAPI header says this:
> >>>>>
> >>>>> +/**
> >>>>> + * struct drm_mode_solid_fill - User info for solid fill planes
> >>>>> + *
> >>>>> + * This is the userspace API solid fill information structure.
> >>>>> + *
> >>>>> + * Userspace can enable solid fill planes by assigning the plane "=
solid_fill"
> >>>>> + * property to a blob containing a single drm_mode_solid_fill stru=
ct populated with an RGB323232
> >>>>> + * color and setting the pixel source to "SOLID_FILL".
> >>>>> + *
> >>>>> + * For information on the plane property, see drm_plane_create_sol=
id_fill_property()
> >>>>> + *
> >>>>> + * @r: Red color value of single pixel
> >>>>> + * @g: Green color value of single pixel
> >>>>> + * @b: Blue color value of single pixel
> >>>>> + * @pad: padding, must be zero
> >>>>> + */
> >>>>> +struct drm_mode_solid_fill {
> >>>>> +	__u32 r;
> >>>>> +	__u32 g;
> >>>>> +	__u32 b;
> >>>>> +	__u32 pad;
> >>>>> +};
> >>>>>
> >>>>> I assume that RGB323232 means unsigned 32-bit UNORM (Vulkan term)
> >>>>> format. That means 1.0 is 0xffffffff, not 0xff000000. This looks li=
ke a
> >>>>> bug in the test. =20
> >>>>
> >>>> Hey Pekka,
> >>>>
> >>>> Ah, thanks for catching this -- I'll change the blob value to 0xffff=
ffff
> >>>> so it matches the 1.0.
> >>>>
> >>>> While we're talking about the UAPI struct, I'll also add the actual
> >>>> drm_mode_solid_fill struct to the IGT drm-uapi instead of the current
> >>>> workaround.
> >>>>    =20
> >>>>>
> >>>>> It would be good to test more than one color:
> >>>>> - 0.0, 0.0, 0.0
> >>>>> - 1.0, 0.0, 0.0
> >>>>> - 0.0, 1.0, 0.0
> >>>>> - 0.0, 0.0, 1.0
> >>>>> - 1.0, 1.0, 1.0 =20
> >>>>
> >>>> Sounds good, will change the test to validate these combinations.
> >>>>    =20
> >>>>>
> >>>>> for example. That would get at least the so often used black explic=
itly
> >>>>> tested, and verify each channel gets mapped correctly rather than o=
nly
> >>>>> blue.
> >>>>>
> >>>>> It would also be really good to test dim and mid grays, but I assum=
e it
> >>>>> might be difficult to get CRC to match over various hardware. You'd
> >>>>> need to use writeback with an error tolerance. (For watching photos=
 for
> >>>>> example, the background is not usually black but dim gray I believe=
.) =20
> >>>>
> >>>> Got it, we can add this to the list of colors to test.
> >>>>
> >>>> FWIW, I think as long as we keep the test structure as grabbing a
> >>>> reference CRC from an FB commit then comparing that to a CRC from a
> >>>> solid fill commit, I'm not expecting a difference in CRC values. =20
> >>>
> >>> The worry I had here, is that different hardware may have different
> >>> precision for the solid fill. Maybe that can be worked around by
> >>> computing the solid fill blob values from the raw FB pixel values? Th=
en
> >>> even if something gets rounded/truncated somewhere in the hardware, t=
he
> >>> end result should be the same between FB and solid fill, right? =20
> >>
> >> Hi Pekka,
> >>
> >> Got it -- I see what you mean.
> >>
> >> In that case, can we stick to just testing the basic RGB + black/white
> >> colors? I want to avoid adding writeback as a dependency for the solid
> >> fill test since it's not a dependency for the solid fill feature itsel=
f. =20
> >=20
> > Up to you. My worries here are hypothetical, I don't know about
> > hardware. It's also possible to adjust tests later if people find false
> > positives or false negatives.
> >=20
> > Personally, I'd start with optimistically strict tests. False negatives
> > will be found by driver developers easily, while false negatives would
> > need an actual user reporting a bug.
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
>=20
> I agree with Jessica here. We can start with the basic RGB + black/white.
>=20
> We dont want to put an extra writeback dependency on this test as there=20
> is no hardware dependency of solid fill planes with writeback connector.

Yes, but you can still test mid-gray pixel values with CRC. Craft the
test values to carefully match the FB pixel values, and see if any
driver has a problem with it. Maybe it just works.


Thanks,
pq

> If others would like to extend this later on based on the writeback=20
> client cap to add another sub-test that would be a separate effort.
>=20
> >>>
> >>> Unless, the hardware precision on solid fill values is less than FB
> >>> pixel precision, and the CRC input precision is high enough to show
> >>> that difference.
> >>>
> >>>
> >>> Thanks,
> >>> pq =20
> >  =20


--Sig_/eOIr8Y1dLExVi/v4sYURZ.N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWuH7kACgkQI1/ltBGq
qqe7/Q//SdtrnCgLzsoaVhUzJXISR93+jMDcGgmj6U3ASZ63IVayIfTK1hEC/HZu
H3yG3ASj2wd++7jqaRaH3PrQRJ66tvmx9+Hr9O15u8BuBR3bzzLJ54igQZmS/61Q
dwgb6sG1WU239t/HzibQ2sBgJDEi7wmbfMaAFAIGrKrVRircdSS/i1mh86QfMvWZ
gEl+3fKveswuifwhB6ftd0lhA1b2s35DCVDjkbi2VsbT5eJX4nWS6sOmjGaMVBAJ
cS5hzOOFEDaC4qTYIlFmw7DCK24xe85DdkqRSGTS51gTJuebK6+ntD84Ex1PGHZ6
ahumt67KUueQ9lJEb17t7BOTF9lpT5ZPtkt2Wsmy7gtUMGq6yHT6nI9HuPbUJu/g
wE056quiAEMYLxoJUGdDupRyWwqW2Cz71WuhIilpKPngWs7HQX5Q4uizqrKSG5jr
DEyfXcAFywfIcnaA2XG87NbYeeeY7O6fIN1cpLENB+dtkzJy/1qvVDrXecBDe5PX
1Yp6Za3TMib+FtXM4fID794R9TsWXZM2FyTeDMGjO+IZH+/L0W5YsP5SHkU9/qoU
0pON5Db6wq4hkEP8aY0OW7bP/usVweGSKqeIrBst79F2/YfgZ/Xy7TTvbYUIWIkf
tGGBWAkpkKGhCahaqZpJba8tVTnxvGOWj9CIRQHB0VhUpc3EKJU=
=+xH4
-----END PGP SIGNATURE-----

--Sig_/eOIr8Y1dLExVi/v4sYURZ.N--
