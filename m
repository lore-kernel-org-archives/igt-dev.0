Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C676E389
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2019 22:09:39 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 15 Mar 2019 22:09:37 +0000
Message-ID: <b4394042d73de0e726f8a87c0df336c4642690d1.camel@intel.com>
References: <20190313005945.19039-1-jose.souza@intel.com>
 <20190314165936.GC9133@ideak-desk.fi.intel.com>
 <79b72864c4a338312b8c425a24ac86a6975642c0.camel@intel.com>
 <20190314195748.GD9133@ideak-desk.fi.intel.com>
 <287aa9c3e52d6fb0b1c2344d5a011728c524b9ec.camel@intel.com>
 <20190315012708.GE9133@ideak-desk.fi.intel.com>
 <20190315024621.GG9133@ideak-desk.fi.intel.com>
In-Reply-To: <20190315024621.GG9133@ideak-desk.fi.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/chamelium: Add test for hotplug
 workaround
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1224890583=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Deak, Imre" <imre.deak@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1224890583==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-mmOECyr2VvQ0i4Kz19/S"

--=-mmOECyr2VvQ0i4Kz19/S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-03-15 at 04:46 +0200, Imre Deak wrote:
> On Fri, Mar 15, 2019 at 03:27:08AM +0200, Imre Deak wrote:
> > On Fri, Mar 15, 2019 at 02:00:41AM +0200, Souza, Jose wrote:
> > [...]
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * Give some time to kernel try to process hotplug but
> > > > > > > it
> > > > > > > should fail
> > > > > > > +	 */
> > > > > > > +	igt_hotplug_detected(mon, FAST_HOTPLUG_SEC_TIMEOUT);
> > > > > > > +	status =3D connector_status_get(data, port);
> > > > > > > +	igt_assert(status =3D=3D DRM_MODE_DISCONNECTED);
> > > > > >=20
> > > > > > Hm, how does a second disconnect event get signaled here?
> > > > > > After
> > > > > > the
> > > > > > previous hotplug event above where the state was
> > > > > > disconnected
> > > > > > already
> > > > > > there
> > > > > > shouldn't have been any change to the state, hence there
> > > > > > shouldn't be
> > > > > > any event sent by the driver.
> > > > >=20
> > > > > It is not signaled, that I why there is not igt_assert() on
> > > > > this
> > > > > igt_hotplug_detected() but call it will poll/sleep for the
> > > > > time we
> > > > > want.
> > > >=20
> > > > But then I don't see how it will work. The sequence is:
> > > >=20
> > > > <connector is in disconnected state, corresponding event
> > > > delivered>
> > > > 1. disable DDC
> > > > 2. generate a plug event
> > > > 3. wait for the plug event delivery with 1 sec timeout
> > > > 4. re-enable DDC
> > > > 5. wait for the plug event delivery (that should be triggered
> > > > by the
> > > > new
> > > >    retry logic in the driver)
> > > >=20
> > > > Since after 2. DDC is disabled the driver hotplug handler will
> > > > conclude
> > > > that the connector is still disconnected and hence doesn't
> > > > generate
> > > > any
> > > > hotplug event. B/c of this 3. will time out after 1 sec.
> > > >=20
> > > > So in 4. we'll re-enable DDC only after 1 sec after the plug
> > > > event
> > > > (interrupt) generated in 2. Since the retry in the driver
> > > > happens
> > > > after
> > > > 1 sec from the plug interrupt as well the retry processing
> > > > could
> > > > easily
> > > > race with the DDC re-enabling in 4. and thus the detection
> > > > could
> > > > fail.
> > >=20
> > > You are not taking in the account the time that kernel will take
> > > to
> > > process that, I measured just the time spend in the hotplug()
> > > hook on
> > > my ICL.
> > >=20
> > > [185950.212037] [drm:intel_encoder_hotplug [i915]]
> > > [CONNECTOR:196:DP-1]=20
> > > status updated from connected to disconnected
> > > [185950.212109] [drm:i915_hotplug_work_func [i915]]     hotplug()
> > > took=3D673123725 nsec(673 msec) ret=3D1
> > >=20
> > > [185950.956536] [drm:intel_encoder_hotplug [i915]]
> > > [CONNECTOR:196:DP-1]=20
> > > status updated from disconnected to connected
> > > [185950.957068] [drm:i915_hotplug_work_func [i915]]     hotplug()
> > > took=3D60222955 nsec(60 msec) ret=3D1
> > >=20
> > >=20
> > > [185953.480877] [drm:drm_dp_dpcd_access] Too many retries, giving
> > > up.
> > > First error: -110
> > > [185953.480969] [drm:intel_encoder_hotplug [i915]]
> > > [CONNECTOR:196:DP-1]=20
> > > status updated from connected to disconnected
> > > [185953.481038] [drm:i915_hotplug_work_func [i915]]     hotplug()
> > > took=3D672309486 nsec(672 msec) ret=3D1
> > > =09
> > > More than half of a second retrying until it gives up and
> > > change/keep
> > > the status to disconnected.
> >=20
> > 670msec for detection to fail sounds strange, where is that coming
> > from?
> > AUX reads should time out much earlier even with all the retries.
>=20
> Ah, could be the 4msec (max) AUX HW timeout on ICL. That with retries
> adds up to 5*32*4ms =3D 640msec about what you have measured.
>=20
> But up to SKL the AUX HW timeout is only 1.6msec giving a 256msec
> delay,
> so the hotplug retry could happen as soon as ~1.3sec after the plug
> event.
>=20
> So I guess a 1 sec delay/poll at step 3. is ok along with some
> explanation about the duration like the above calculation. I think it
> could still be possible for this 1 sec delay/poll to last longer than
> 1.3sec (due to scheduling) in which case the detection would fail on
> some platforms. So I'd still add the time measurement between step 2.
> and 4. as described below and rerun the test if it was > 1.2sec and
> detection failed.

Yeah sound good measure time between 2 and 4 and retry, I will also the
comments that you requested.

Thanks for the reviews :D

>=20
> > > So in my rough estimation:
> > > t 0s =3D IGT disables DDC and do the hotplug(1 and 2 from your
> > > sequence)
> > > t 0.7s =3D kernel gives up and keep connector as disconnected
> > > t 1s =3D IGT read connector as disconnected and enables DCC(3 and 4
> > > from
> > > your sequence)
> > > t 1.7 =3D kernel try to probe again
> > > t 1.8 =3D kernel probe and mark connector as connected
> > > t 2s =3D IGT read connector as connected(5 from your sequence)
> > >=20
> > > Maybe to avoid test failures the second timeout should be bigger
> > >=20
> > > > Since I don't see a good way to ensure that we re-enable DDC
> > > > after
> > > > the
> > > > first detection cycle ran (but not too late missing the retry
> > > > cycle)
> > > > I
> > > > would rather suggest a simple wait at 3., let's say 500msec.
> > > > With
> > > > that
> > > > things should always work. We may not always exercise the
> > > > driver's
> > > > retry
> > > > path if there was a long scheduling delay, but that's unlikely.
> > > >=20
> > > > However a scheduling delay after 2. and before 4. could cause a
> > > > detection failure. To avoid that I'd also check the elapsed
> > > > time
> > > > starting from right before 2. until right after 4. and run the
> > > > sequence
> > > > again if the elapsed time was too close to 1sec (and hence
> > > > detection
> > > > possibly failed because of the race described above).
> > > >=20
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * Enable the DDC line and the kernel workaround should
> > > > > > > reprobe
> > > > > > > and
> > > > > > > +	 * report as connected
> > > > > > > +	 */
> > > > > > > +	chamelium_port_set_ddc_state(data->chamelium, port,
> > > > > > > true);
> > > > > > > +	igt_assert(chamelium_port_get_ddc_state(data-
> > > > > > > > chamelium,
> > > > > > > port));
> > > > > > > +	igt_assert(igt_hotplug_detected(mon,
> > > > > > > FAST_HOTPLUG_SEC_TIMEOUT));
> > > > > > > +	status =3D connector_status_get(data, port);
> > > > > > > +	igt_assert(status =3D=3D DRM_MODE_CONNECTED);
> > > > > > > +}
> > > > > > > +
> > > > > > >  static void
> > > > > > >  test_edid_read(data_t *data, struct chamelium_port
> > > > > > > *port,
> > > > > > >  	       int edid_id, const unsigned char *edid)
> > > > > > > @@ -1308,6 +1375,9 @@ igt_main
> > > > > > > =20
> > > > > > >  		connector_subtest("dp-frame-dump", DisplayPort)
> > > > > > >  			test_display_frame_dump(&data, port);
> > > > > > > +
> > > > > > > +		connector_subtest("dp-late-aux-wa",
> > > > > > > DisplayPort)
> > > > > > > +			test_late_aux_wa(&data, port);
> > > >=20
> > > > This also needs the retry logic to be added for DP ports on old
> > > > platforms (intel_dp_hotplug() in the driver).
> > > >=20
> > > > > > >  	}
> > > > > > > =20
> > > > > > >  	igt_subtest_group {
> > > > > > > --=20
> > > > > > > 2.21.0
> > > > > > >=20

--=-mmOECyr2VvQ0i4Kz19/S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyMIqAACgkQVenbO/mO
WklqhQf/cuQo4Gf5+ie0hr9vml/NhD1dePiScwjOwP7PDfKlpy0j4RGp6BkVjnUM
xGraDWRtVQnlLYcw/qwHzadIbknBYS+M6y+nKw7PTUKBq1qKRHvQaH25n486P0Y9
QejcQbVimtnX0Hzvc6jQGoGc4m79jO+DXSfjQti3fyoOZgsN1ODVkcLdRljHVTOf
6i5TYhXl7zaHNj0Y7dgX9KUrlQnFZAELnqXTYgkaM0Vpq0Md1d42fxmIJhj7YnMg
mVNUlwvn3zo5pdAYpIbnzui8oO/erLYLGpLq8AZraW40rTN9PdNajLugjP8YAA+J
/9LRfBtLTZeRxrUd/68pywN9B4yQnw==
=FVoK
-----END PGP SIGNATURE-----

--=-mmOECyr2VvQ0i4Kz19/S--

--===============1224890583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1224890583==--
