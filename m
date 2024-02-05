Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E77DC48291
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 10:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DE51124B4;
	Mon,  5 Feb 2024 10:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OfD+WdjP";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64DA1124B4
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2024 10:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707129325;
 bh=5TawAyJ89K+q2Xc56xM7IVlmJqfjKR+j2JHoJJ3Wj6U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OfD+WdjPTicPFRDqgeEzRp4Qh/FWpQ06LtH3AEGaH2nna+VtygEJAKQAshAGPCFY7
 MC+06N36WHV/SUg0EA+k3CJ1pnTg++aeMp8LqkbL9kMW0A1lBMhOOOnQV6baWbNiyf
 G0jJdDZ/Ai4JWO63C9hfT3WwJ9XI1dP9CruPK/0gXDJ36rk/DrittFUHbQZZAg7iiX
 ifiYXhqz71pjIrAM9ibhcGpO5ljWVzm3Ibm3Caaqp3nwuiMGpOn0z3J1s5nKeCfCAq
 bJI/+7Ep+gIbTSeQXwHEIZcp1RZRC2pgNy8hepdbLSC/nb7oBF2Gl7Ly67J3O1aVJN
 VVF1H5JzO4FNw==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C1C2E3781FEF;
 Mon,  5 Feb 2024 10:35:24 +0000 (UTC)
Date: Mon, 5 Feb 2024 12:35:23 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>,
 Simon Ser <contact@emersion.fr>, <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t v2 5/6] tests/kms_atomic: Add solid fill plane
 subtest
Message-ID: <20240205123523.24bfd139.pekka.paalanen@collabora.com>
In-Reply-To: <700ec113-b897-428c-926a-dc2cfd3525f1@quicinc.com>
References: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
 <20240123-solid-fill-v2-5-4ecd2cf767fe@quicinc.com>
 <20240124111325.179896e7.pekka.paalanen@collabora.com>
 <700ec113-b897-428c-926a-dc2cfd3525f1@quicinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/91r9Y6qCb4M1MgbUfduX/s7";
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

--Sig_/91r9Y6qCb4M1MgbUfduX/s7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 2 Feb 2024 10:14:18 -0800
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> On 1/24/2024 1:13 AM, Pekka Paalanen wrote:
> > On Tue, 23 Jan 2024 15:28:58 -0800
> > Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >  =20
> >> Add a basic test for solid fill planes.
> >>
> >> This test will first commit a single-color framebuffer plane then
> >> a solid fill plane with the same contents. It then validates the solid
> >> fill plane by comparing the resulting CRC with the CRC of the reference
> >> framebuffer commit.
> >>
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   tests/kms_atomic.c | 179 +++++++++++++++++++++++++++++++++++++++++++=
++++------
> >>   1 file changed, 161 insertions(+), 18 deletions(-)

...

> >> +static void test_solid_fill_plane(data_t *data, igt_output_t *output,=
 igt_plane_t *plane)
> >> +{
> >> +	drmModeModeInfo *mode =3D igt_output_get_mode(output);
> >> +	struct drm_mode_rect rect =3D { 0 };
> >> +	struct igt_fb ref_fb;
> >> +	igt_pipe_crc_t *pipe_crc;
> >> +	igt_crc_t ref_crc, new_crc;
> >> +	enum pipe pipe =3D data->pipe->pipe;
> >> +	int height, width, i;
> >> +	int ret;
> >> +
> >> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_SOLID_FILL));
> >> +	igt_require(igt_plane_has_prop(plane, IGT_PLANE_PIXEL_SOURCE));
> >> +
> >> +	rect.x1 =3D 0;
> >> +	rect.x2 =3D mode->hdisplay;
> >> +	rect.y1 =3D 0;
> >> +	rect.y2 =3D mode->vdisplay;
> >> +
> >> +	width =3D rect_width(&rect);
> >> +	height =3D rect_height(&rect);
> >> +
> >> +	igt_plane_set_position(plane, rect.x1, rect.y1);
> >> +	pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> >> +			    IGT_PIPE_CRC_SOURCE_AUTO);
> >> +
> >> +
> >> +	for (i =3D 0; i < ARRAY_SIZE(colors); i++) {
> >> +		uint32_t r =3D colors[i].r;
> >> +		uint32_t g =3D colors[i].g;
> >> +		uint32_t b =3D colors[i].b;
> >> +
> >> +		struct drm_mode_create_blob c;
> >> +		struct drm_mode_destroy_blob d;
> >> +		struct drm_mode_solid_fill blob_data =3D {
> >> +			.r =3D r,
> >> +			.g =3D g,
> >> +			.b =3D b,
> >> +			.pad =3D 0x0,
> >> +		};
> >> +
> >> +		c.data =3D (uintptr_t) &blob_data;
> >> +		c.length =3D sizeof(blob_data);
> >> +
> >> +		igt_debug("Testing color r: 0x%x (%f), g: 0x%x (%f), b: 0x%x (%f)\n=
",
> >> +				r, unorm_to_float(r),
> >> +				g, unorm_to_float(g),
> >> +				b, unorm_to_float(b));
> >> +
> >> +		/* get reference CRC */
> >> +		igt_create_color_fb(data->drm_fd, width, height,
> >> +				    DRM_FORMAT_ABGR8888, DRM_FORMAT_MOD_LINEAR,
> >> +				    unorm_to_float(r),
> >> +				    unorm_to_float(g),
> >> +				    unorm_to_float(b), =20
> >=20
> > I'm slightly wary of trusting a third party library (Cairo? Pixman?)
> > with the float->u8 conversion. If both Cairo and the kernel do the same
> > mistake in conversion, the test would pass. Therefore, this is actually
> > testing that the kernel follows Cairo's conversion, and not the UAPI
> > definition, should the unthinkable happen that they disagreed.
> >=20
> > Would it at least be possible to verify the FB value against what we
> > expect here? =20
>=20
> Hi Pekka,
>=20
> Unfortunately, I don't think there's a way that will let us to do that=20
> without writeback.

I would be surprised if IGT used anything other than Cairo's image
backend. Can't you simply read bytes back from where Cairo wrote them?
Checking just one pixel would suffice.


Thanks,
pq

--Sig_/91r9Y6qCb4M1MgbUfduX/s7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXAuesACgkQI1/ltBGq
qqcC/Q//cNZ1FF65CayKALQydiws9OcslZRY3y2V2nAH7PfyyaglurM+VxKvCJz1
JtITj5Kp8l71wAklDTQM91hOmkN+MKKgB6i/YVwzUzwg4Cq4a3SH4lWe5xa6NIgh
U0KRxdO+8CBf4loxBM8rS9mEbgmF+2J+Mul+JK6ZfaGV0tp9oyoHLjhxlTHPOIG0
Am+Yiw5QDqZvwOkH7UYN3G01AqY/inihvMw5dWWtiQ6qjaSfap9P5LM0fqg28ZtU
3EEAfv1+A74RX7MlInH4zaFfCsD47dmSM9BaFyRpfrVgDhvY5/0cXc34rqZhNy1H
bkHC8kJOWFUWXHrLr5lpDqLI430K/wZzwcPiGq0N1YXKgAwzvbC7DBDtr8r1FiZr
+AUftUaqZbYo3X2jJsyw7KzU0mixrC43ifdHEvQZd95tysDMipPHQ7niUT01w2Mu
1iGePulY1uBa1iluTONdhcRQ9U4bKi79MW3xsbr2YMPPEpgofMYEtfv5iusDtL7f
iYr6i5ByOR08gjtPx4g3mxd2V64vzTIfM6E6D56g8j8oCrFrFUYn9jS814dJytHa
vmGxpbHiy55td8499cvWCNZ4EXAc0wXaHIXCuUen4Sn8hPiUOo0N4fOCYZvxlCV9
KYwkaHh6goncBiDiW+2PLU5TToS+wgLt2Dvu1VYihAtx2htfcPc=
=Zd0i
-----END PGP SIGNATURE-----

--Sig_/91r9Y6qCb4M1MgbUfduX/s7--
