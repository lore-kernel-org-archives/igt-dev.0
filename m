Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42871CD1284
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 08:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9701911A0B9;
	Thu,  4 Apr 2024 08:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="1pkMHk58";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D5F11A0B9
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2024 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712220667;
 bh=q9cc623PK3b8MhWuhJwjM1YZmuK2KftntS9Oftis8dU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=1pkMHk581HdsKnsBZAj54iXqpsCpWK/9cyoeKOl9ciGORggWO3WyNMNZ6P4nNYvZe
 gQw9+kLLFaYMXhx17rvstW05rb1fb6bZp4naHex/ucX8J0gwKpThJxlACPX1H73F6d
 BPd+hpD0bEyMRHjDzlzYFji0Svb3W7FmHnCs1zY3CkaDcLUjsij2u7FPbYVyNelP/Y
 MX2+VmZP0VtznHAvB8s/cBLzHDQ22RyNaa8j7GgVDfrGbGWqXI1W9ZfRpcE2lzISgb
 dUMtPT/ZZb/Yl8j6qqNzTUTReSvqcJqjBHx+WAwFxVp+lor41pSlA5IeGW+hFaz0o4
 ytcija4YJyq/A==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A88C13780029;
 Thu,  4 Apr 2024 08:51:06 +0000 (UTC)
Date: Thu, 4 Apr 2024 11:51:05 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Simon Ser <contact@emersion.fr>, Jonas
 =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>, Daniel Stone
 <daniel@fooishbar.org>, Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Harry Wentland
 <harry.wentland@amd.com>
Subject: Re: [PATCH i-g-t 4/5] tests/kms_cursor_crc: Test the SIZE_HINTS
 property
Message-ID: <20240404115105.0d2a9694.pekka.paalanen@collabora.com>
In-Reply-To: <20240315191505.27620-5-ville.syrjala@linux.intel.com>
References: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
 <20240315191505.27620-5-ville.syrjala@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lqLt/LhTfrXzKt2MPx63Yxn";
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

--Sig_/lqLt/LhTfrXzKt2MPx63Yxn
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Mar 2024 21:15:04 +0200
Ville Syrjala <ville.syrjala@linux.intel.com> wrote:

> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Make sure the driver accepts all the sizes declared in the
> plane's SIZE_HINTS property.
>=20
> TODO: Actually test that each reported size works fully?

What does this mean? What does cursor_size_supported() do?

I don't know that, so it looks like you just create an FB and destroy
it, never putting it on the plane where the SIZE_HINTS were found.

>       Would need a bunch of restructuring of the test,
>       and for the moment i915 is the only driver that
>       supports SIZE_HINTS and it's already >100% covered
>       by the existing tests. So I'll leave this for the
>       next guy whose driver has different needs...

How would they know to fix this test? They just see the test pass and
are happy, right?

This is the only question I have here, everything else is

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq


>=20
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_cursor_crc.c | 63 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>=20
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 38b354972afd..6543e09d3ebb 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -55,6 +55,10 @@
>   * Description: Check random placement of a cursor with suspend.
>   * Functionality: cursor, suspend
>   *
> + * SUBTEST: cursor-size-hints
> + * Description: Check that sizes declared in SIZE_HINTS are accepted.
> + * Functionality: cursor
> + *
>   * SUBTEST: cursor-%s
>   * Description: %arg[1]
>   *
> @@ -817,6 +821,46 @@ static bool execution_constraint(enum pipe pipe)
>  	return false;
>  }
> =20
> +static void test_size_hints(data_t *data)
> +{
> +	const struct drm_plane_size_hint *hints;
> +	drmModePropertyBlobPtr blob;
> +	uint64_t blob_id;
> +	int count;
> +
> +	igt_require(igt_plane_has_prop(data->cursor, IGT_PLANE_SIZE_HINTS));
> +
> +	blob_id =3D igt_plane_get_prop(data->cursor, IGT_PLANE_SIZE_HINTS);
> +	/*
> +	 * blob_id=3D=3D0 is reserved for potential future use, but the
> +	 * meaning has not yet been defined for fail outright if we see it.
> +	 */
> +	igt_assert(blob_id);
> +
> +	blob =3D drmModeGetPropertyBlob(data->drm_fd, blob_id);
> +	igt_assert(blob);
> +
> +	hints =3D blob->data;
> +	count =3D blob->length / sizeof(hints[0]);
> +	igt_assert_lt(0, count);
> +
> +	for (int i =3D 0; i < count; i++) {
> +		int w =3D hints[i].width;
> +		int h =3D hints[i].height;
> +
> +		igt_create_fb(data->drm_fd, w, h,
> +			      DRM_FORMAT_ARGB8888,
> +			      DRM_FORMAT_MOD_LINEAR,
> +			      &data->fb);
> +
> +		igt_assert(cursor_size_supported(data, w, h));
> +
> +		igt_remove_fb(data->drm_fd, &data->fb);
> +	}
> +
> +	drmModeFreePropertyBlob(blob);
> +}
> +
>  static void run_size_tests(data_t *data, int w, int h)
>  {
>  	enum pipe pipe;
> @@ -1011,6 +1055,25 @@ static void run_tests_on_pipe(data_t *data)
>  	igt_fixture
>  		igt_remove_fb(data->drm_fd, &data->fb);
> =20
> +	igt_describe("Check that sizes declared in SIZE_HINTS are accepted.");
> +	igt_subtest_with_dynamic("cursor-size-hints") {
> +		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> +			if (execution_constraint(pipe))
> +				continue;
> +
> +			data->pipe =3D pipe;
> +
> +			if (!valid_pipe_output_combo(data))
> +				continue;
> +
> +			igt_dynamic_f("pipe-%s-%s",
> +				      kmstest_pipe_name(pipe),
> +				      data->output->name)
> +				run_test(data, test_size_hints,
> +					 data->cursor_max_w, data->cursor_max_h);
> +		}
> +	}
> +
>  	for (cursor_size =3D 32; cursor_size <=3D 512; cursor_size *=3D 2) {
>  		int w =3D cursor_size;
>  		int h =3D cursor_size;


--Sig_/lqLt/LhTfrXzKt2MPx63Yxn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYOafkACgkQI1/ltBGq
qqeczw//aIq0TY9BnzbsdzYoVwSbEBCnjy2zasZKN9e0RgL/cef/pompc7aWiBvw
qyY9YRr1sZuOu2YtI1f8ED4MYJbb/zSctx03nTemOdgA3Oa4/OwvvL7b9s/42oEC
dXv/iHXji6X1eS5GOuKpZxXVuqF+mI6p6UwRRU2M+j3mbw1ye2bbnq2xHMjXll58
CJ4Ufec4lEP4YdiqDyRjP1rWXa+hmxsV4AWIus/WO+DdU3Hoc15fPMZn0Gdzkx0P
lSHjFQHjiS6GOLOzKrNWoPCNj8bzyB6eboW3D1cKp5UHzVqzd8sJgu3VAp7dz4Je
dKEGtWsH0SKFOgqEiY/1JG2uzRgWgJ7w5deMJIhee7s/itJ8fzw7rpD7KsQVj1lJ
7IR2fE9JqKJZcaS728+CIMTn/L+lLfd0IHSQwEzEuLotc6Pqd9fStkxhSYUCxDsc
+CRQMnP6GdWfxcvOoPBQyGeM9oh2I6qgndKlY0ve4eaRE9xgXZB6V5ZZWClTBZlD
q2amNBa/Tph6ARp+0YZxfcs8EKtwOHm9kA4vtTMlH0EBO3QtGYk+0beGK7mFdkgz
DvE0y/FB7A0P0a/YtUYHVDBUvCJPcgCId4PLqWYv2WI/pIj91L88SFvkWiJ5ou0a
eTrqzqJSCCPpxopG2lRIHvRd4BY+pxHG8qa6RI1r97ZEmVB/di0=
=sNb4
-----END PGP SIGNATURE-----

--Sig_/lqLt/LhTfrXzKt2MPx63Yxn--
