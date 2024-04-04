Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EDECD1292
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 12:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748E410E05E;
	Thu,  4 Apr 2024 12:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l7mMJNGD";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5E810E669
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2024 12:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712235172;
 bh=LlbiB6W0rNt3YJ5uQeklI2ANw2LpDFXOun01t/MxZ5A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l7mMJNGDlJ2jzYb1HtNrjCYkYbYFD6B5Bs5YnO6TEvxIxapduPgtnA+BIRzzmn9qE
 EPmIv/o9c8QPHY5orgqt+aMbwWC7+U2Y4wpui4mEF8H756HUq1h4IytdSCvzS6Y98n
 OvAeFTyPwPaOVL/SPGf/3Qu21eb2t2LLd3I3R/8JPKbfHyJp6mVpXSt+qmYxKLvSAd
 eA/yrE05LmasXSaReOGCuTnhZP6IBo2RLZ9q8/lFv2pQKBXbdGTCWkps3lNAOPzPTb
 vpwasC2zR4VHHvZlpsxNmDtCxQOjOejaH1uIQBr5Ts2TebPuJma9rLHUvvWcrBo6/5
 Jvi1D9SBi+o8g==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 23D9C37813DC;
 Thu,  4 Apr 2024 12:52:52 +0000 (UTC)
Date: Thu, 4 Apr 2024 15:52:50 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Simon Ser <contact@emersion.fr>, Jonas
 =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>, Daniel Stone
 <daniel@fooishbar.org>, Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Harry Wentland
 <harry.wentland@amd.com>
Subject: Re: [PATCH i-g-t 4/5] tests/kms_cursor_crc: Test the SIZE_HINTS
 property
Message-ID: <20240404155250.7fb245d2.pekka.paalanen@collabora.com>
In-Reply-To: <Zg6HQgfK4JZtH2tB@intel.com>
References: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
 <20240315191505.27620-5-ville.syrjala@linux.intel.com>
 <20240404115105.0d2a9694.pekka.paalanen@collabora.com>
 <Zg6HQgfK4JZtH2tB@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QSnvo50_mhkx9ioL+61H9s2";
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

--Sig_/QSnvo50_mhkx9ioL+61H9s2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Apr 2024 13:56:02 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Thu, Apr 04, 2024 at 11:51:05AM +0300, Pekka Paalanen wrote:
> > On Fri, 15 Mar 2024 21:15:04 +0200
> > Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> >  =20
> > > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > >=20
> > > Make sure the driver accepts all the sizes declared in the
> > > plane's SIZE_HINTS property.
> > >=20
> > > TODO: Actually test that each reported size works fully? =20
> >=20
> > What does this mean? What does cursor_size_supported() do? =20
>=20
> It does a TEST_ONLY commit using data->fb and the specified size.
> So just confirms that the kernel accepts it, not that it actually
> looks correct on screen.

Good, that's better than my first impression.

> > I don't know that, so it looks like you just create an FB and destroy
> > it, never putting it on the plane where the SIZE_HINTS were found.
> >  =20
> > >       Would need a bunch of restructuring of the test,
> > >       and for the moment i915 is the only driver that
> > >       supports SIZE_HINTS and it's already >100% covered
> > >       by the existing tests. So I'll leave this for the
> > >       next guy whose driver has different needs... =20
> >=20
> > How would they know to fix this test? They just see the test pass and
> > are happy, right? =20
>=20
> I would expect them to actually care about testing their driver
> properly. But perhaps my expectations are a bit high.

Yeah, a screenshot or CRC test would be best.

> >=20
> > This is the only question I have here, everything else is
> >=20
> > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com> =20
>=20
> Ta.

This seems just enough, so please have my acked-by for this patch as
is, too.


Thanks,
pq

>=20
> >=20
> >=20
> > Thanks,
> > pq
> >=20
> >  =20
> > >=20
> > > Cc: Simon Ser <contact@emersion.fr>
> > > Cc: Jonas =C3=85dahl <jadahl@redhat.com>
> > > Cc: Daniel Stone <daniel@fooishbar.org>
> > > Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
> > > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > ---
> > >  tests/kms_cursor_crc.c | 63 ++++++++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 63 insertions(+)
> > >=20
> > > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > > index 38b354972afd..6543e09d3ebb 100644
> > > --- a/tests/kms_cursor_crc.c
> > > +++ b/tests/kms_cursor_crc.c
> > > @@ -55,6 +55,10 @@
> > >   * Description: Check random placement of a cursor with suspend.
> > >   * Functionality: cursor, suspend
> > >   *
> > > + * SUBTEST: cursor-size-hints
> > > + * Description: Check that sizes declared in SIZE_HINTS are accepted.
> > > + * Functionality: cursor
> > > + *
> > >   * SUBTEST: cursor-%s
> > >   * Description: %arg[1]
> > >   *
> > > @@ -817,6 +821,46 @@ static bool execution_constraint(enum pipe pipe)
> > >  	return false;
> > >  }
> > > =20
> > > +static void test_size_hints(data_t *data)
> > > +{
> > > +	const struct drm_plane_size_hint *hints;
> > > +	drmModePropertyBlobPtr blob;
> > > +	uint64_t blob_id;
> > > +	int count;
> > > +
> > > +	igt_require(igt_plane_has_prop(data->cursor, IGT_PLANE_SIZE_HINTS));
> > > +
> > > +	blob_id =3D igt_plane_get_prop(data->cursor, IGT_PLANE_SIZE_HINTS);
> > > +	/*
> > > +	 * blob_id=3D=3D0 is reserved for potential future use, but the
> > > +	 * meaning has not yet been defined for fail outright if we see it.
> > > +	 */
> > > +	igt_assert(blob_id);
> > > +
> > > +	blob =3D drmModeGetPropertyBlob(data->drm_fd, blob_id);
> > > +	igt_assert(blob);
> > > +
> > > +	hints =3D blob->data;
> > > +	count =3D blob->length / sizeof(hints[0]);
> > > +	igt_assert_lt(0, count);
> > > +
> > > +	for (int i =3D 0; i < count; i++) {
> > > +		int w =3D hints[i].width;
> > > +		int h =3D hints[i].height;
> > > +
> > > +		igt_create_fb(data->drm_fd, w, h,
> > > +			      DRM_FORMAT_ARGB8888,
> > > +			      DRM_FORMAT_MOD_LINEAR,
> > > +			      &data->fb);
> > > +
> > > +		igt_assert(cursor_size_supported(data, w, h));
> > > +
> > > +		igt_remove_fb(data->drm_fd, &data->fb);
> > > +	}
> > > +
> > > +	drmModeFreePropertyBlob(blob);
> > > +}
> > > +
> > >  static void run_size_tests(data_t *data, int w, int h)
> > >  {
> > >  	enum pipe pipe;
> > > @@ -1011,6 +1055,25 @@ static void run_tests_on_pipe(data_t *data)
> > >  	igt_fixture
> > >  		igt_remove_fb(data->drm_fd, &data->fb);
> > > =20
> > > +	igt_describe("Check that sizes declared in SIZE_HINTS are accepted.=
");
> > > +	igt_subtest_with_dynamic("cursor-size-hints") {
> > > +		for_each_pipe_with_single_output(&data->display, pipe, data->outpu=
t) {
> > > +			if (execution_constraint(pipe))
> > > +				continue;
> > > +
> > > +			data->pipe =3D pipe;
> > > +
> > > +			if (!valid_pipe_output_combo(data))
> > > +				continue;
> > > +
> > > +			igt_dynamic_f("pipe-%s-%s",
> > > +				      kmstest_pipe_name(pipe),
> > > +				      data->output->name)
> > > +				run_test(data, test_size_hints,
> > > +					 data->cursor_max_w, data->cursor_max_h);
> > > +		}
> > > +	}
> > > +
> > >  	for (cursor_size =3D 32; cursor_size <=3D 512; cursor_size *=3D 2) {
> > >  		int w =3D cursor_size;
> > >  		int h =3D cursor_size; =20
> >  =20
>=20
>=20
>=20


--Sig_/QSnvo50_mhkx9ioL+61H9s2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYOoqIACgkQI1/ltBGq
qqevyQ/+IxIgLVZxrJWjDNqn+Jmarzx1omzbXLLScG5n8CCNmfiESrsHpEjS0sKq
vILiF3WA26is6jDw7uTtYPGDMzv2HTjdITIypRrGOQOQKT3bhK2Qp7ZvwTC9zQfI
DHkuX6mGeHugV39JeUYmnrAl3tD4igEZz4iiYIp/uZM7OKZJ+nihdQWf7Gnj3iGN
RLWsBWroHh3ypG3VVKc6ge9iJOoKKJGhDytZxBadQeEfrtJXgqIcd8vLv0UOfoDz
Iz/u2QBIol/5FU7rUYGMrch617CEaluzkOPouPe2ntnS0PpWBhPs5kuUS74D7B4g
UJVS/itKVl7LHrFUjKnXD24s0PTAU5jg77d2DbptQ4XsMLOMyEPwhuvOczUsr2UV
vZH0MnvtZXPvJCJTSFAZDzDYwEi3UpnDf8y1IZRFEvIsqPFpyBOAtQlK44UV1XfE
QugcruZOdq/0nx+8BL5/6KgSnShoJRyBleyYYOmXP79Yt90ZTQ3RIpL6QJhAOMdO
dYwUpvDenU7VQ5aIMsUA8biBond+8Nh9sfvYkCdEN8fi2m060TNzGU04sauKZcux
P03TIYKiYCOCOSZ8fPwh9rAprpipKHMQIFSLJ2KzN5mAZicecLWWxZSE2ugb7owg
4yycHE6sIAtLhZksfBwDfnhLgcjIKSrrNnY07AQwuUysaJb0JPc=
=1qbh
-----END PGP SIGNATURE-----

--Sig_/QSnvo50_mhkx9ioL+61H9s2--
