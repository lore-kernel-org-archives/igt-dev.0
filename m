Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79AD6E2F8
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2019 17:59:36 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 14 Mar 2019 17:59:34 +0000
Message-ID: <79b72864c4a338312b8c425a24ac86a6975642c0.camel@intel.com>
References: <20190313005945.19039-1-jose.souza@intel.com>
 <20190314165936.GC9133@ideak-desk.fi.intel.com>
In-Reply-To: <20190314165936.GC9133@ideak-desk.fi.intel.com>
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
Content-Type: multipart/mixed; boundary="===============2020896829=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Deak, Imre" <imre.deak@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2020896829==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-M72KXjRIUK37kvlk4/gw"

--=-M72KXjRIUK37kvlk4/gw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-03-14 at 18:59 +0200, Imre Deak wrote:
> Hi Jose,
>=20
> On Tue, Mar 12, 2019 at 05:59:45PM -0700, Jos=C3=A9 Roberto de Souza
> wrote:
> > It is know that some unpowered type-c dongles can take some time to
> > boot and be responsible in the DDC/aux transaction lines so a
> > workaround was implemented in kernel(drm/i915: Enable hotplug
> > retry)
> > to fix it but is possible that this could happen to other DP sinks.
> >=20
> > So this test will try to simulate the sceneario described above, it
> > will disable the DDC lines and plug the connector, the hotplug
> > should
> > fail and then enabling the DDC lines kernel should report the
> > connector as connected.
> >=20
> > The workaround will reprobe connector after 1 second after kernel
> > gives up on the first try to probe the connector, so that is why a
> > smaller timeout to detect hotplug was needed.
> >=20
> > Cc: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  tests/kms_chamelium.c | 70
> > +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> >=20
> > diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> > index c2090037..50a553f2 100644
> > --- a/tests/kms_chamelium.c
> > +++ b/tests/kms_chamelium.c
> > @@ -45,6 +45,8 @@ typedef struct {
> > =20
> >  #define HOTPLUG_TIMEOUT 20 /* seconds */
> > =20
> > +#define FAST_HOTPLUG_SEC_TIMEOUT (1)
> > +
> >  #define HPD_STORM_PULSE_INTERVAL_DP 100 /* ms */
> >  #define HPD_STORM_PULSE_INTERVAL_HDMI 200 /* ms */
> > =20
> > @@ -107,6 +109,21 @@ reprobe_connector(data_t *data, struct
> > chamelium_port *port)
> >  	return status;
> >  }
> > =20
> > +static drmModeConnection
> > +connector_status_get(data_t *data, struct chamelium_port *port)
> > +{
> > +	drmModeConnector *connector;
> > +	drmModeConnection status;
> > +
> > +	igt_debug("Getting connector state %s...\n",
> > chamelium_port_get_name(port));
> > +	connector =3D chamelium_port_get_connector(data->chamelium, port,
> > false);
> > +	igt_assert(connector);
> > +	status =3D connector->connection;
> > +
> > +	drmModeFreeConnector(connector);
> > +	return status;
> > +}
> > +
> >  static void
> >  wait_for_connector(data_t *data, struct chamelium_port *port,
> >  		   drmModeConnection status)
> > @@ -253,6 +270,56 @@ test_basic_hotplug(data_t *data, struct
> > chamelium_port *port, int toggle_count)
> >  	igt_hpd_storm_reset(data->drm_fd);
> >  }
> > =20
> > +/*
> > + * Test kernel workaround for sinks that takes some time to have
> > the DDC/aux
> > + * channel responsive after the hotplug
> > + */
> > +static void
> > +test_late_aux_wa(data_t *data, struct chamelium_port *port)
> > +{
> > +	struct udev_monitor *mon =3D igt_watch_hotplug();
> > +	drmModeConnection status;
> > +
> > +	/* Reset will unplug all connectors */
> > +	reset_state(data, NULL);
> > +
> > +	/* Check if it device can act on hotplugs fast enough for this
> > test */
> > +	igt_flush_hotplugs(mon);
> > +	chamelium_plug(data->chamelium, port);
> > +	igt_assert(igt_hotplug_detected(mon,
> > FAST_HOTPLUG_SEC_TIMEOUT));
> > +	status =3D connector_status_get(data, port);
> > +	igt_require(status =3D=3D DRM_MODE_CONNECTED);
> > +
> > +	igt_flush_hotplugs(mon);
> > +	chamelium_unplug(data->chamelium, port);
> > +	igt_assert(igt_hotplug_detected(mon,
> > FAST_HOTPLUG_SEC_TIMEOUT));
> > +	status =3D connector_status_get(data, port);
> > +	igt_require(status =3D=3D DRM_MODE_DISCONNECTED);
>=20
> Do you know on which platforms the hotplug processing is that slow
> and
> what could be the reason?

I have tested on ICL and WHL and both don't need more than 1 second,
the 20s timeout was set by the first patch(c99f8b7a3) adding Chamelium
tests but there is not other information about why 20s(in the first
versions of the patch it was 30s).

I can send another patch reducing this value to 1s and hopefully if it
do not causes regressions we merge it.

>=20
> > +
> > +	/* It is fast enough, lets disable the DDC lines and plug again
> > */
> > +	igt_flush_hotplugs(mon);
> > +	chamelium_port_set_ddc_state(data->chamelium, port, false);
> > +	chamelium_plug(data->chamelium, port);
> > +	igt_assert(!chamelium_port_get_ddc_state(data->chamelium,
> > port));
> > +
> > +	/*
> > +	 * Give some time to kernel try to process hotplug but it
> > should fail
> > +	 */
> > +	igt_hotplug_detected(mon, FAST_HOTPLUG_SEC_TIMEOUT);
> > +	status =3D connector_status_get(data, port);
> > +	igt_assert(status =3D=3D DRM_MODE_DISCONNECTED);
>=20
> Hm, how does a second disconnect event get signaled here? After the
> previous hotplug event above where the state was disconnected already
> there
> shouldn't have been any change to the state, hence there shouldn't be
> any event sent by the driver.

It is not signaled, that I why there is not igt_assert() on this
igt_hotplug_detected() but call it will poll/sleep for the time we
want.


>=20
> > +
> > +	/*
> > +	 * Enable the DDC line and the kernel workaround should reprobe
> > and
> > +	 * report as connected
> > +	 */
> > +	chamelium_port_set_ddc_state(data->chamelium, port, true);
> > +	igt_assert(chamelium_port_get_ddc_state(data->chamelium,
> > port));
> > +	igt_assert(igt_hotplug_detected(mon,
> > FAST_HOTPLUG_SEC_TIMEOUT));
> > +	status =3D connector_status_get(data, port);
> > +	igt_assert(status =3D=3D DRM_MODE_CONNECTED);
> > +}
> > +
> >  static void
> >  test_edid_read(data_t *data, struct chamelium_port *port,
> >  	       int edid_id, const unsigned char *edid)
> > @@ -1308,6 +1375,9 @@ igt_main
> > =20
> >  		connector_subtest("dp-frame-dump", DisplayPort)
> >  			test_display_frame_dump(&data, port);
> > +
> > +		connector_subtest("dp-late-aux-wa", DisplayPort)
> > +			test_late_aux_wa(&data, port);
> >  	}
> > =20
> >  	igt_subtest_group {
> > --=20
> > 2.21.0
> >=20

--=-M72KXjRIUK37kvlk4/gw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyKloQACgkQVenbO/mO
Wkle4Qf/W3721JI0Bw3k83rKXulBbRrNNyR2QQgGHZHRWDCsedPISIJ98pjIqZ+x
xILaqCBsTsy6/8Tz6dx9YvlQfn6bCQMLTiLhS7Fh9xL+cyCVkLESDBcPJVGSCVoJ
JXKmshC8FOvYsKbMHKHW5Y4onCdLK6Umn6g+tKvxvjou1qFSpnG9pvqmoXbvhpXg
lrfpXSdkRpqXSjvv/8C6pbgAm5LFWvnoK0NWuAXmbI452/wuhXLeADv+fbqDZZ4S
wNXS8P2McEWCMsLOQzvMafF4z+ZsZt9TFTtpZTABCE3+rPDQ9fHsqNKLI4MxwX+Z
yS6Mv5ULXpiAD5n9sfnbaCFldG7PsA==
=W6rt
-----END PGP SIGNATURE-----

--=-M72KXjRIUK37kvlk4/gw--

--===============2020896829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============2020896829==--
