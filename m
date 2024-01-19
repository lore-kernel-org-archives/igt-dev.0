Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A3DC4725D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 09:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF8810E1C7;
	Fri, 19 Jan 2024 09:01:18 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB91D10E1C7
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705654844;
 bh=48UsEWFprTtLU0wOD0cEJgdOQnTNHLHZ+Nw8sMVunkc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o4/Rr6L9oWMgS+I7h5j+weFKkSvL5LMtdzYIft3TLPrfERW3t78x+f9rEJ78PXb9Y
 akkZURXjQyOlmCuA/IAUfTt13d2JA3llRLiibsXlc/zZN6iH5oXSoJQTKdO+SzuLX2
 1sAXNAUx54+Hmjy0eT4PfUT8+MD/NHDPxdoRnw5hJGCNDNAtm7VAgFzkz3SJFCVZs4
 VzSy2OKb3adkpnX6yl9ihsbl0HAv1H0k9j329OUvxpVnlrcro4iKRckfut32Ji6msZ
 jkSmNUaFOua5oC+0J0o0LGeu2guOHJzDq0MQYnFaLKVfikCW9m0tKnh1Uj0t6RVTe0
 4Vd+hVDAwODmg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DC0C43781182;
 Fri, 19 Jan 2024 09:00:43 +0000 (UTC)
Date: Fri, 19 Jan 2024 11:00:42 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH i-g-t 3/4] tests/kms_atomic: Add solid fill plane subtest
Message-ID: <20240119110042.3114f54c.pekka.paalanen@collabora.com>
In-Reply-To: <f9054b1a-d020-4e1f-a010-fcff8bd651e2@quicinc.com>
References: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
 <20231215-solid-fill-v1-3-12932f9f452d@quicinc.com>
 <20231218121247.454bc00a.pekka.paalanen@collabora.com>
 <6c910eb7-5f4b-4b03-ae3c-ca0498f0c667@quicinc.com>
 <20240111112028.36736525.pekka.paalanen@collabora.com>
 <f9054b1a-d020-4e1f-a010-fcff8bd651e2@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iNPsaSXuk_D0lfU..Yj+GN9";
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
 Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--Sig_/iNPsaSXuk_D0lfU..Yj+GN9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Jan 2024 15:35:10 -0800
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> On 1/11/2024 1:20 AM, Pekka Paalanen wrote:
> > On Thu, 21 Dec 2023 15:57:51 -0800
> > Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >  =20
> >> On 12/18/2023 2:12 AM, Pekka Paalanen wrote: =20
> >>> On Fri, 15 Dec 2023 16:40:23 -0800
> >>> Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >>>     =20
> >>>> Add a basic test for solid fill planes.
> >>>>
> >>>> This test will first commit a single-color framebuffer plane then
> >>>> a solid fill plane with the same contents. It then validates the sol=
id
> >>>> fill plane by comparing the resulting CRC with the CRC of the refere=
nce
> >>>> framebuffer commit.
> >>>>
> >>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>> ---
> >>>>    tests/kms_atomic.c | 94 +++++++++++++++++++++++++++++++++++++++++=
+++++++++++++
> >>>>    1 file changed, 94 insertions(+)
> >>>>
> >>>> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> >>>> old mode 100644
> >>>> new mode 100755
> >>>> index 2b6e9a8f0383..8f81e65ad84f
> >>>> --- a/tests/kms_atomic.c
> >>>> +++ b/tests/kms_atomic.c
> >>>> @@ -128,6 +128,13 @@ enum kms_atomic_check_relax {
> >>>>    	PLANE_RELAX_FB =3D (1 << 1)
> >>>>    };
> >>>>   =20
> >>>> +struct solid_fill_blob {
> >>>> +	uint32_t r;
> >>>> +	uint32_t g;
> >>>> +	uint32_t b;
> >>>> +	uint32_t pad;
> >>>> +};
> >>>> +
> >>>>    static inline int damage_rect_width(struct drm_mode_rect *r)
> >>>>    {
> >>>>    	return r->x2 - r->x1;
> >>>> @@ -1322,6 +1329,79 @@ static void atomic_plane_damage(data_t *data)
> >>>>    	igt_remove_fb(data->drm_fd, &fb_2);
> >>>>    }
> >>>>   =20
> >>>> +static void test_solid_fill_plane(data_t *data, igt_output_t *outpu=
t,  igt_plane_t *plane)
> >>>> +{
> >>>> +	struct drm_mode_create_blob c;
> >>>> +	struct drm_mode_destroy_blob d;
> >>>> +	drmModeModeInfo *mode =3D igt_output_get_mode(output);
> >>>> +	struct drm_mode_rect rect =3D { 0 };
> >>>> +	struct igt_fb ref_fb;
> >>>> +	igt_pipe_crc_t *pipe_crc;
> >>>> +	igt_crc_t ref_crc, new_crc;
> >>>> +	enum pipe pipe =3D data->pipe->pipe;
> >>>> +	int height, width;
> >>>> +	int ret;
> >>>> +
> >>>> +	struct solid_fill_blob blob_data =3D {
> >>>> +		.r =3D 0x00000000,
> >>>> +		.g =3D 0x00000000,
> >>>> +		.b =3D 0xff000000,
> >>>> +		.pad =3D 0x0,
> >>>> +	}; =20
> >>>
> >>> Hi Jessica!
> >>>
> >>> This is the blob sent to KMS as the solid fill color...
> >>>
> >>> ...
> >>>     =20
> >>>> +	igt_create_color_fb(data->drm_fd, width, height,
> >>>> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> >>>> +			    0.0, 0.0, 1.0, &ref_fb); =20
> >>>
> >>> ..and this (0.0, 0.0, 1.0) is the corresponding color in normalized
> >>> values, I presume.
> >>>
> >>> So you say that 0xff000000 =3D 1.0.
> >>>
> >>> However, the patch for the kernel UAPI header says this:
> >>>
> >>> +/**
> >>> + * struct drm_mode_solid_fill - User info for solid fill planes
> >>> + *
> >>> + * This is the userspace API solid fill information structure.
> >>> + *
> >>> + * Userspace can enable solid fill planes by assigning the plane "so=
lid_fill"
> >>> + * property to a blob containing a single drm_mode_solid_fill struct=
 populated with an RGB323232
> >>> + * color and setting the pixel source to "SOLID_FILL".
> >>> + *
> >>> + * For information on the plane property, see drm_plane_create_solid=
_fill_property()
> >>> + *
> >>> + * @r: Red color value of single pixel
> >>> + * @g: Green color value of single pixel
> >>> + * @b: Blue color value of single pixel
> >>> + * @pad: padding, must be zero
> >>> + */
> >>> +struct drm_mode_solid_fill {
> >>> +	__u32 r;
> >>> +	__u32 g;
> >>> +	__u32 b;
> >>> +	__u32 pad;
> >>> +};
> >>>
> >>> I assume that RGB323232 means unsigned 32-bit UNORM (Vulkan term)
> >>> format. That means 1.0 is 0xffffffff, not 0xff000000. This looks like=
 a
> >>> bug in the test. =20
> >>
> >> Hey Pekka,
> >>
> >> Ah, thanks for catching this -- I'll change the blob value to 0xffffff=
ff
> >> so it matches the 1.0.
> >>
> >> While we're talking about the UAPI struct, I'll also add the actual
> >> drm_mode_solid_fill struct to the IGT drm-uapi instead of the current
> >> workaround.
> >> =20
> >>>
> >>> It would be good to test more than one color:
> >>> - 0.0, 0.0, 0.0
> >>> - 1.0, 0.0, 0.0
> >>> - 0.0, 1.0, 0.0
> >>> - 0.0, 0.0, 1.0
> >>> - 1.0, 1.0, 1.0 =20
> >>
> >> Sounds good, will change the test to validate these combinations.
> >> =20
> >>>
> >>> for example. That would get at least the so often used black explicit=
ly
> >>> tested, and verify each channel gets mapped correctly rather than only
> >>> blue.
> >>>
> >>> It would also be really good to test dim and mid grays, but I assume =
it
> >>> might be difficult to get CRC to match over various hardware. You'd
> >>> need to use writeback with an error tolerance. (For watching photos f=
or
> >>> example, the background is not usually black but dim gray I believe.)=
 =20
> >>
> >> Got it, we can add this to the list of colors to test.
> >>
> >> FWIW, I think as long as we keep the test structure as grabbing a
> >> reference CRC from an FB commit then comparing that to a CRC from a
> >> solid fill commit, I'm not expecting a difference in CRC values. =20
> >=20
> > The worry I had here, is that different hardware may have different
> > precision for the solid fill. Maybe that can be worked around by
> > computing the solid fill blob values from the raw FB pixel values? Then
> > even if something gets rounded/truncated somewhere in the hardware, the
> > end result should be the same between FB and solid fill, right? =20
>=20
> Hi Pekka,
>=20
> Got it -- I see what you mean.
>=20
> In that case, can we stick to just testing the basic RGB + black/white=20
> colors? I want to avoid adding writeback as a dependency for the solid=20
> fill test since it's not a dependency for the solid fill feature itself.

Up to you. My worries here are hypothetical, I don't know about
hardware. It's also possible to adjust tests later if people find false
positives or false negatives.

Personally, I'd start with optimistically strict tests. False negatives
will be found by driver developers easily, while false negatives would
need an actual user reporting a bug.


Thanks,
pq

> >=20
> > Unless, the hardware precision on solid fill values is less than FB
> > pixel precision, and the CRC input precision is high enough to show
> > that difference.
> >=20
> >=20
> > Thanks,
> > pq =20


--Sig_/iNPsaSXuk_D0lfU..Yj+GN9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWqOjoACgkQI1/ltBGq
qqcwqQ//ZFddbW/btxcEvO0OFUUI/8nhTDIckTsSow2comxAPdYFaVHkeA4HUWOP
2Ryme1bJ9nc1KBP5Luw2h6L4xs9V2QTXG9eLKmNiHYOwJ5fCpp8wngwBYZVuDOhd
YdO14ErXirpMMQhG7ejZrUwMB+mCpTXSoKfMytusHKumtpq3gM317GMsa2XIAkWY
2geeS2IRcOXlHFAtwlh1yvmMQ3KIugmf0njV77YPeFJt3UQNbPdYNhOUnSS0vuNP
TyOrRkNKGGVuhXSBBKSGoELhdG87NhysztrZ4ZQENTvfiCAU9IAexG7UpVVGJ+MS
WNNottzeamyxxY2i87yXI7hIHHkUT8QzGLDfigJThmDLFaRBdnj0oVK2Sgdn3Ec0
jyxfqVWEzURmZm7VdtrgEnJy63v9+AgaClffrE3P5yC9IeGZ2va5FGc8fo1Pk0HX
1ZgXUHu91fc5SLi1JgfiZUMBvVbxA8tza7F8H4t5TGnD0zt3E9KxSTn1GFhpsGMu
d1WAx1IbAndl1Y6R1Jufm/uNpy+aTlEwnyQC/oaRL5TkI1edN6rP9+KgkyL2Wchi
DuiDzjAizk8XycXDUk4KaDWM6ChlmGCZ1azUIcwMotGAzOkENBxJuCekRPAbqQUh
zVjF4umAYL16/7uNdoLy5gEJu/0lnyB1sRiDWRklEJwhefR6org=
=yPrF
-----END PGP SIGNATURE-----

--Sig_/iNPsaSXuk_D0lfU..Yj+GN9--
