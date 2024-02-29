Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED409C54E41
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 13:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8116310E08F;
	Thu, 29 Feb 2024 13:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CQ+Sn3YW";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2383610E0A9
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 13:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709212463;
 bh=L3fuzLvWSuwt4IH1hjPK3FJtBI7eqi8eLyibpICBBg8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CQ+Sn3YWmea+Oa3bPbSVe1Xqkf8raJUL+q0UIx+iJVhwpk40ZgpnarBbrC0/3sdoV
 i4q7FCh5PFUxE/6DZyaWkpAKzg9nsE/+7V79WrfmLyy6gKrWtdoRK2SiCd5U86QnD3
 S03dgEIHjxt3r/cZOI40hUf7A+Ef6ESLgjRG3G27XlfZSScN+CyC/wdvqtTY6LfrUu
 KUWu2g05RBIph4eqdaUoQPNELtPpft45gqhwBnz0jUqq9Gq91TiTRrqHe5s6WHecJi
 rK5vqqwPF28BaxyF/dtCfUBVy8STvTYAKvvrsyHuKA44ADXDyZyLfOX+ggFOPMowMU
 Kh1DNIjvkqGpQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 739C337820E4;
 Thu, 29 Feb 2024 13:14:22 +0000 (UTC)
Date: Thu, 29 Feb 2024 15:14:21 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>,
 Simon Ser <contact@emersion.fr>, <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t v2 5/6] tests/kms_atomic: Add solid fill plane
 subtest
Message-ID: <20240229151421.438e2d19.pekka.paalanen@collabora.com>
In-Reply-To: <f739f337-1bc9-4ce9-9b94-2c5f3f81322c@quicinc.com>
References: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
 <20240123-solid-fill-v2-5-4ecd2cf767fe@quicinc.com>
 <20240124111325.179896e7.pekka.paalanen@collabora.com>
 <700ec113-b897-428c-926a-dc2cfd3525f1@quicinc.com>
 <20240205123523.24bfd139.pekka.paalanen@collabora.com>
 <f739f337-1bc9-4ce9-9b94-2c5f3f81322c@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//zXj_atn4sKc3rPzC3g.9MV";
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--Sig_//zXj_atn4sKc3rPzC3g.9MV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Feb 2024 10:28:22 -0800
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> On 2/5/2024 2:35 AM, Pekka Paalanen wrote:
> > On Fri, 2 Feb 2024 10:14:18 -0800
> > Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >  =20
> >> On 1/24/2024 1:13 AM, Pekka Paalanen wrote: =20
> >>> On Tue, 23 Jan 2024 15:28:58 -0800
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
> >>>>    tests/kms_atomic.c | 179 ++++++++++++++++++++++++++++++++++++++++=
+++++++------
> >>>>    1 file changed, 161 insertions(+), 18 deletions(-) =20
> >=20
> > ...
> >  =20
> >>>> +static void test_solid_fill_plane(data_t *data, igt_output_t *outpu=
t, igt_plane_t *plane)
> >>>> +{
> >>>> +	drmModeModeInfo *mode =3D igt_output_get_mode(output);
> >>>> +	struct drm_mode_rect rect =3D { 0 };
> >>>> +	struct igt_fb ref_fb;
> >>>> +	igt_pipe_crc_t *pipe_crc;
> >>>> +	igt_crc_t ref_crc, new_crc;
> >>>> +	enum pipe pipe =3D data->pipe->pipe;
> >>>> +	int height, width, i;
> >>>> +	int ret;
> >>>> +
> >>>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_SOLID_FILL));
> >>>> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_PIXEL_SOURCE));
> >>>> +
> >>>> +	rect.x1 =3D 0;
> >>>> +	rect.x2 =3D mode->hdisplay;
> >>>> +	rect.y1 =3D 0;
> >>>> +	rect.y2 =3D mode->vdisplay;
> >>>> +
> >>>> +	width =3D rect_width(&rect);
> >>>> +	height =3D rect_height(&rect);
> >>>> +
> >>>> +	igt_plane_set_position(plane, rect.x1, rect.y1);
> >>>> +	pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> >>>> +			    IGT_PIPE_CRC_SOURCE_AUTO);
> >>>> +
> >>>> +
> >>>> +	for (i =3D 0; i < ARRAY_SIZE(colors); i++) {
> >>>> +		uint32_t r =3D colors[i].r;
> >>>> +		uint32_t g =3D colors[i].g;
> >>>> +		uint32_t b =3D colors[i].b;
> >>>> +
> >>>> +		struct drm_mode_create_blob c;
> >>>> +		struct drm_mode_destroy_blob d;
> >>>> +		struct drm_mode_solid_fill blob_data =3D {
> >>>> +			.r =3D r,
> >>>> +			.g =3D g,
> >>>> +			.b =3D b,
> >>>> +			.pad =3D 0x0,
> >>>> +		};
> >>>> +
> >>>> +		c.data =3D (uintptr_t) &blob_data;
> >>>> +		c.length =3D sizeof(blob_data);
> >>>> +
> >>>> +		igt_debug("Testing color r: 0x%x (%f), g: 0x%x (%f), b: 0x%x (%f)=
\n",
> >>>> +				r, unorm_to_float(r),
> >>>> +				g, unorm_to_float(g),
> >>>> +				b, unorm_to_float(b));
> >>>> +
> >>>> +		/* get reference CRC */
> >>>> +		igt_create_color_fb(data->drm_fd, width, height,
> >>>> +				    DRM_FORMAT_ABGR8888, DRM_FORMAT_MOD_LINEAR,
> >>>> +				    unorm_to_float(r),
> >>>> +				    unorm_to_float(g),
> >>>> +				    unorm_to_float(b), =20
> >>>
> >>> I'm slightly wary of trusting a third party library (Cairo? Pixman?)
> >>> with the float->u8 conversion. If both Cairo and the kernel do the sa=
me
> >>> mistake in conversion, the test would pass. Therefore, this is actual=
ly
> >>> testing that the kernel follows Cairo's conversion, and not the UAPI
> >>> definition, should the unthinkable happen that they disagreed.
> >>>
> >>> Would it at least be possible to verify the FB value against what we
> >>> expect here? =20
> >>
> >> Hi Pekka,
> >>
> >> Unfortunately, I don't think there's a way that will let us to do that
> >> without writeback. =20
> >=20
> > I would be surprised if IGT used anything other than Cairo's image
> > backend. Can't you simply read bytes back from where Cairo wrote them?
> > Checking just one pixel would suffice. =20
>=20
> Ack. I do see that we can use cairo_image_surface_get_data(), though it=20
> returns an ARGB8888 (specifically CAIRO_FORMAT_ARGB32) color.
>=20
> I can add a to_argb() helper (like what we did for=20
> _dpu_plane_get_abgr_fill_color() in the MSM driver) to convert the=20
> RGB323232 color to ARGB8888 (and setting alpha to 0xFF) then comparing=20
> the resulting value to what we get from *_get_data().
>=20
> What do you think?

Sure, why not.

You should be very aware of the format Cairo is using on the FB anyway,
because that's what the kernel gets.


Thanks,
pq

--Sig_//zXj_atn4sKc3rPzC3g.9MV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXggy0ACgkQI1/ltBGq
qqdzNxAAlghxWysU/VI8bTYxH5DPNxVStmy5W1NzzQJ3RJzNAMtsTJ03utfT079A
iVrQVU8FCQN4N8HxwY79nYYvwddxILewGG8k9KV3ucrofbwYcat87Jr160Y9QZYv
4B/eJUIfvaCOYYhO1QPEyfiXKZqTouvDHnheWXvH0OSuFuAF4erntjbrkxLlBAHI
XswEEf7bG8WhDcQbQoFCU2KwnsGkJ1U+pvS0QGXueESJwgYigeXZ1TRWCz+z5iWX
AbdduzlCixXXug6Dt7MW+LgCwhniFHTKYxaFAjYcA8l7Mv7RXDeIcHgwKxTqT3gc
7Y7HqxRrsz/Gpuj/NgDxJ6zjZdQqIGIt3vE6CgdXw3Qv3hyWv59R0ri3hXqY5OHE
sJFcP/naZ4kns9fqeVXJar7XodG+gmdOKs3ut8WufRQ9JRmV+mmRfHAJiaNcaKKh
gWOLwPKSNoFoMsw7PDVzW9Yvgv/WSmTNw+8hdw5D9o0qQqB/DNym8kO1vyTzqOWz
76pDZWxCNsQCffQr4TOBaibPvZs/D1haKLe0PDucUVi8iV7KGHqjQVG/oVxfGj5N
Pk+Vgc7xBMSfSYchx5uCkaFgVyhuvbRFMBF7Lmr3EaLyRdTSc1iYgJ++H49lA5pU
zamdmKJRkg/Ro6dUM73ntacn5Dn8oeyL66qIxhT1vrFL0pDcEwI=
=ZG5w
-----END PGP SIGNATURE-----

--Sig_//zXj_atn4sKc3rPzC3g.9MV--
