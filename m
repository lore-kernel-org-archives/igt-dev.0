Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438866E17F
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2019 00:00:45 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 15 Mar 2019 00:00:41 +0000
Message-ID: <287aa9c3e52d6fb0b1c2344d5a011728c524b9ec.camel@intel.com>
References: <20190313005945.19039-1-jose.souza@intel.com>
 <20190314165936.GC9133@ideak-desk.fi.intel.com>
 <79b72864c4a338312b8c425a24ac86a6975642c0.camel@intel.com>
 <20190314195748.GD9133@ideak-desk.fi.intel.com>
In-Reply-To: <20190314195748.GD9133@ideak-desk.fi.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0786789145=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Deak, Imre" <imre.deak@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0786789145==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-9r6uLb8BvyFGDkt9aBag"

--=-9r6uLb8BvyFGDkt9aBag
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-03-14 at 21:57 +0200, Imre Deak wrote:
> On Thu, Mar 14, 2019 at 07:59:34PM +0200, Souza, Jose wrote:
> > On Thu, 2019-03-14 at 18:59 +0200, Imre Deak wrote:
> > > Hi Jose,
> > >=20
> > > On Tue, Mar 12, 2019 at 05:59:45PM -0700, Jos=C3=A9 Roberto de Souza
> > > wrote:
> > > > It is know that some unpowered type-c dongles can take some
> > > > time to
> > > > boot and be responsible in the DDC/aux transaction lines so a
> > > > workaround was implemented in kernel(drm/i915: Enable hotplug
> > > > retry)
> > > > to fix it but is possible that this could happen to other DP
> > > > sinks.
> > > >=20
> > > > So this test will try to simulate the sceneario described
> > > > above, it
> > > > will disable the DDC lines and plug the connector, the hotplug
> > > > should
> > > > fail and then enabling the DDC lines kernel should report the
> > > > connector as connected.
> > > >=20
> > > > The workaround will reprobe connector after 1 second after
> > > > kernel
> > > > gives up on the first try to probe the connector, so that is
> > > > why a
> > > > smaller timeout to detect hotplug was needed.
> > > >=20
> > > > Cc: Imre Deak <imre.deak@intel.com>
> > > > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > > > ---
> > > >  tests/kms_chamelium.c | 70
> > > > +++++++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 70 insertions(+)
> > > >=20
> > > > diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> > > > index c2090037..50a553f2 100644
> > > > --- a/tests/kms_chamelium.c
> > > > +++ b/tests/kms_chamelium.c
> > > > @@ -45,6 +45,8 @@ typedef struct {
> > > > =20
> > > >  #define HOTPLUG_TIMEOUT 20 /* seconds */
> > > > =20
> > > > +#define FAST_HOTPLUG_SEC_TIMEOUT (1)
> > > > +
> > > >  #define HPD_STORM_PULSE_INTERVAL_DP 100 /* ms */
> > > >  #define HPD_STORM_PULSE_INTERVAL_HDMI 200 /* ms */
> > > > =20
> > > > @@ -107,6 +109,21 @@ reprobe_connector(data_t *data, struct
> > > > chamelium_port *port)
> > > >  	return status;
> > > >  }
> > > > =20
> > > > +static drmModeConnection
> > > > +connector_status_get(data_t *data, struct chamelium_port
> > > > *port)
> > > > +{
> > > > +	drmModeConnector *connector;
> > > > +	drmModeConnection status;
> > > > +
> > > > +	igt_debug("Getting connector state %s...\n",
> > > > chamelium_port_get_name(port));
> > > > +	connector =3D chamelium_port_get_connector(data-
> > > > >chamelium, port, false);
> > > > +	igt_assert(connector);
> > > > +	status =3D connector->connection;
> > > > +
> > > > +	drmModeFreeConnector(connector);
> > > > +	return status;
> > > > +}
> > > > +
> > > >  static void
> > > >  wait_for_connector(data_t *data, struct chamelium_port *port,
> > > >  		   drmModeConnection status)
> > > > @@ -253,6 +270,56 @@ test_basic_hotplug(data_t *data, struct
> > > > chamelium_port *port, int toggle_count)
> > > >  	igt_hpd_storm_reset(data->drm_fd);
> > > >  }
> > > > =20
> > > > +/*
> > > > + * Test kernel workaround for sinks that takes some time to
> > > > have the DDC/aux
> > > > + * channel responsive after the hotplug
> > > > + */
> > > > +static void
> > > > +test_late_aux_wa(data_t *data, struct chamelium_port *port)
> > > > +{
> > > > +	struct udev_monitor *mon =3D igt_watch_hotplug();
> > > > +	drmModeConnection status;
> > > > +
> > > > +	/* Reset will unplug all connectors */
> > > > +	reset_state(data, NULL);
> > > > +
> > > > +	/* Check if it device can act on hotplugs fast enough
> > > > for this test */
> > > > +	igt_flush_hotplugs(mon);
> > > > +	chamelium_plug(data->chamelium, port);
> > > > +	igt_assert(igt_hotplug_detected(mon,
> > > > FAST_HOTPLUG_SEC_TIMEOUT));
> > > > +	status =3D connector_status_get(data, port);
> > > > +	igt_require(status =3D=3D DRM_MODE_CONNECTED);
> > > > +
> > > > +	igt_flush_hotplugs(mon);
> > > > +	chamelium_unplug(data->chamelium, port);
> > > > +	igt_assert(igt_hotplug_detected(mon,
> > > > FAST_HOTPLUG_SEC_TIMEOUT));
> > > > +	status =3D connector_status_get(data, port);
> > > > +	igt_require(status =3D=3D DRM_MODE_DISCONNECTED);
> > >=20
> > > Do you know on which platforms the hotplug processing is that
> > > slow
> > > and what could be the reason?
> >=20
> > I have tested on ICL and WHL and both don't need more than 1
> > second,
> > the 20s timeout was set by the first patch(c99f8b7a3) adding
> > Chamelium
> > tests but there is not other information about why 20s(in the first
> > versions of the patch it was 30s).
>=20
> Ok, sounds to me that HOTPLUG_TIMEOUT was added only to check if
> hotplug
> detection works at all (all relevant places using it have an
> igt_assert() on it).
>=20
> Still not sure if we need the above two checks, since I think the
> assumptions/checks later in the function should hold anyway.  Yes, we
> may not exercise the hotplug retry path in the driver, but I don't
> think
> there is a good way to ensure that anyway as I wrote below.

Yeah we should remove the igt_assert() from igt_hotplug_detected() in
those two above.

>=20
> > I can send another patch reducing this value to 1s and hopefully if
> > it
> > do not causes regressions we merge it.
> > > > +
> > > > +	/* It is fast enough, lets disable the DDC lines and
> > > > plug again
> > > > */
> > > > +	igt_flush_hotplugs(mon);
> > > > +	chamelium_port_set_ddc_state(data->chamelium, port,
> > > > false);
> > > > +	chamelium_plug(data->chamelium, port);
> > > > +	igt_assert(!chamelium_port_get_ddc_state(data-
> > > > >chamelium,
> > > > port));
> > > > +
> > > > +	/*
> > > > +	 * Give some time to kernel try to process hotplug but
> > > > it
> > > > should fail
> > > > +	 */
> > > > +	igt_hotplug_detected(mon, FAST_HOTPLUG_SEC_TIMEOUT);
> > > > +	status =3D connector_status_get(data, port);
> > > > +	igt_assert(status =3D=3D DRM_MODE_DISCONNECTED);
> > >=20
> > > Hm, how does a second disconnect event get signaled here? After
> > > the
> > > previous hotplug event above where the state was disconnected
> > > already
> > > there
> > > shouldn't have been any change to the state, hence there
> > > shouldn't be
> > > any event sent by the driver.
> >=20
> > It is not signaled, that I why there is not igt_assert() on this
> > igt_hotplug_detected() but call it will poll/sleep for the time we
> > want.
>=20
> But then I don't see how it will work. The sequence is:
>=20
> <connector is in disconnected state, corresponding event delivered>
> 1. disable DDC
> 2. generate a plug event
> 3. wait for the plug event delivery with 1 sec timeout
> 4. re-enable DDC
> 5. wait for the plug event delivery (that should be triggered by the
> new
>    retry logic in the driver)
>=20
> Since after 2. DDC is disabled the driver hotplug handler will
> conclude
> that the connector is still disconnected and hence doesn't generate
> any
> hotplug event. B/c of this 3. will time out after 1 sec.
>=20
> So in 4. we'll re-enable DDC only after 1 sec after the plug event
> (interrupt) generated in 2. Since the retry in the driver happens
> after
> 1 sec from the plug interrupt as well the retry processing could
> easily
> race with the DDC re-enabling in 4. and thus the detection could
> fail.

You are not taking in the account the time that kernel will take to
process that, I measured just the time spend in the hotplug() hook on
my ICL.

[185950.212037] [drm:intel_encoder_hotplug [i915]] [CONNECTOR:196:DP-1]=20
status updated from connected to disconnected
[185950.212109] [drm:i915_hotplug_work_func [i915]]     hotplug()
took=3D673123725 nsec(673 msec) ret=3D1

[185950.956536] [drm:intel_encoder_hotplug [i915]] [CONNECTOR:196:DP-1]=20
status updated from disconnected to connected
[185950.957068] [drm:i915_hotplug_work_func [i915]]     hotplug()
took=3D60222955 nsec(60 msec) ret=3D1


[185953.480877] [drm:drm_dp_dpcd_access] Too many retries, giving up.
First error: -110
[185953.480969] [drm:intel_encoder_hotplug [i915]] [CONNECTOR:196:DP-1]=20
status updated from connected to disconnected
[185953.481038] [drm:i915_hotplug_work_func [i915]]     hotplug()
took=3D672309486 nsec(672 msec) ret=3D1
=09
More than half of a second retrying until it gives up and change/keep
the status to disconnected.

So in my rough estimation:
t 0s =3D IGT disables DDC and do the hotplug(1 and 2 from your sequence)
t 0.7s =3D kernel gives up and keep connector as disconnected
t 1s =3D IGT read connector as disconnected and enables DCC(3 and 4 from
your sequence)
t 1.7 =3D kernel try to probe again
t 1.8 =3D kernel probe and mark connector as connected
t 2s =3D IGT read connector as connected(5 from your sequence)

Maybe to avoid test failures the second timeout should be bigger

>=20
> Since I don't see a good way to ensure that we re-enable DDC after
> the
> first detection cycle ran (but not too late missing the retry cycle)
> I
> would rather suggest a simple wait at 3., let's say 500msec. With
> that
> things should always work. We may not always exercise the driver's
> retry
> path if there was a long scheduling delay, but that's unlikely.
>=20
> However a scheduling delay after 2. and before 4. could cause a
> detection failure. To avoid that I'd also check the elapsed time
> starting from right before 2. until right after 4. and run the
> sequence
> again if the elapsed time was too close to 1sec (and hence detection
> possibly failed because of the race described above).
>=20
> > > > +
> > > > +	/*
> > > > +	 * Enable the DDC line and the kernel workaround should
> > > > reprobe
> > > > and
> > > > +	 * report as connected
> > > > +	 */
> > > > +	chamelium_port_set_ddc_state(data->chamelium, port,
> > > > true);
> > > > +	igt_assert(chamelium_port_get_ddc_state(data-
> > > > >chamelium,
> > > > port));
> > > > +	igt_assert(igt_hotplug_detected(mon,
> > > > FAST_HOTPLUG_SEC_TIMEOUT));
> > > > +	status =3D connector_status_get(data, port);
> > > > +	igt_assert(status =3D=3D DRM_MODE_CONNECTED);
> > > > +}
> > > > +
> > > >  static void
> > > >  test_edid_read(data_t *data, struct chamelium_port *port,
> > > >  	       int edid_id, const unsigned char *edid)
> > > > @@ -1308,6 +1375,9 @@ igt_main
> > > > =20
> > > >  		connector_subtest("dp-frame-dump", DisplayPort)
> > > >  			test_display_frame_dump(&data, port);
> > > > +
> > > > +		connector_subtest("dp-late-aux-wa",
> > > > DisplayPort)
> > > > +			test_late_aux_wa(&data, port);
>=20
> This also needs the retry logic to be added for DP ports on old
> platforms (intel_dp_hotplug() in the driver).
>=20
> > > >  	}
> > > > =20
> > > >  	igt_subtest_group {
> > > > --=20
> > > > 2.21.0
> > > >=20
>=20
>=20

--=-9r6uLb8BvyFGDkt9aBag
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyK6yYACgkQVenbO/mO
WknZ2QgAkzXmBj/tPi/LfnthyvD+szXtJcl/EfSK78ZQNOoanwAU2c16xcKFK1uJ
oChD/B1aEhw4ki9AuMfFMqOj9f835S4CqS8fql2h+0Nu0D6hrRyTXT63p9HTrkHV
Z2TDmOwopdgplzeaWh3lGCsS3nkYJ+1zYFKXA9nAtV1bZRZOjaSwOQYUD8P3DHqY
nhiz4Yq/gNeq1SUFLSN+wG16hslOlZoqIkjg15sn7LbZyVXzR+KbQRgsJEGHa9Cq
U66E9glJkoverqAaPCSr8EI3HvnGLDByQikR9vimzm+VxxK5EwFJRLeP6u2UrW0+
k6PR5wOS0BPIFCnKZCIMXUA8xBp93w==
=6dUr
-----END PGP SIGNATURE-----

--=-9r6uLb8BvyFGDkt9aBag--

--===============0786789145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0786789145==--
