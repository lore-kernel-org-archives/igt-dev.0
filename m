Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080806E3E4
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2019 23:23:51 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 22 Mar 2019 23:23:49 +0000
Message-ID: <8c05ee6504d6af38c70ca53747e74b8d55d2d736.camel@intel.com>
References: <20190318234424.14487-1-jose.souza@intel.com>
 <20190322223224.GA20683@ideak-desk.fi.intel.com>
In-Reply-To: <20190322223224.GA20683@ideak-desk.fi.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 i-g-t] tests/chamelium: Add test for
 hotplug workaround
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0823663388=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Deak, Imre" <imre.deak@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0823663388==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-jy6EpflF8f417j7OGyOM"

--=-jy6EpflF8f417j7OGyOM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-03-23 at 00:32 +0200, Imre Deak wrote:
> On Mon, Mar 18, 2019 at 04:44:24PM -0700, Jos=C3=A9 Roberto de Souza
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
> > v2:
> > - Removing igt_assert() from the igt_hotplug_detected() when
> > checking
> > if device can act on hotplug fast enough
> > - Checking time spend between hotplug and the enabling of DDC lines
> > (Imre)
> >=20
> > Cc: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  tests/kms_chamelium.c | 110
> > ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 110 insertions(+)
> >=20
> > diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> > index c2090037..c79516ef 100644
> > --- a/tests/kms_chamelium.c
> > +++ b/tests/kms_chamelium.c
> > @@ -45,6 +45,8 @@ typedef struct {
> > =20
> >  #define HOTPLUG_TIMEOUT 20 /* seconds */
> > =20
> > +#define FAST_HOTPLUG_TIMEOUT (1) /* second */
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
> > @@ -253,6 +270,96 @@ test_basic_hotplug(data_t *data, struct
> > chamelium_port *port, int toggle_count)
> >  	igt_hpd_storm_reset(data->drm_fd);
> >  }
> > =20
> > +static void
> > +test_fast_hotplug_handling(data_t *data, struct chamelium_port
> > *port,
> > +			   struct udev_monitor *mon)
> > +{
> > +	drmModeConnection status;
> > +
> > +	igt_flush_hotplugs(mon);
> > +	chamelium_plug(data->chamelium, port);
> > +	igt_hotplug_detected(mon, FAST_HOTPLUG_TIMEOUT);
> > +	status =3D connector_status_get(data, port);
> > +	igt_require(status =3D=3D DRM_MODE_CONNECTED);
> > +
> > +	igt_flush_hotplugs(mon);
> > +	chamelium_unplug(data->chamelium, port);
> > +	igt_hotplug_detected(mon, FAST_HOTPLUG_TIMEOUT);
> > +	status =3D connector_status_get(data, port);
> > +	igt_require(status =3D=3D DRM_MODE_DISCONNECTED);
> > +}
> > +
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
> > +	struct timespec begin;
> > +	uint64_t delta_nsec;
> > +	uint8_t retries =3D 0;
> > +
> > +	/* Reset will unplug all connectors */
> > +	reset_state(data, NULL);
> > +
> > +	/* Check if it device can act on hotplugs fast enough for this
> > test */
> > +	test_fast_hotplug_handling(data, port, mon);
> > +
> > +retry:
> > +	/* It is fast enough, lets disable the DDC lines and plug again
> > */
> > +	igt_flush_hotplugs(mon);
> > +	chamelium_port_set_ddc_state(data->chamelium, port, false);
> > +	chamelium_plug(data->chamelium, port);
> > +	igt_gettime(&begin);
>=20
> Should start measuring already before chamelium_plug(), otherwise we
> could miss time that elapsed since the beginning of HPD
> interrupt->hotplug processing in the kernel.

Okay

>=20
> > +	igt_assert(!chamelium_port_get_ddc_state(data->chamelium,
> > port));
> > +
> > +	/*
> > +	 * Give some time to kernel try to process hotplug but it
> > should fail
> > +	 */
> > +	igt_hotplug_detected(mon, FAST_HOTPLUG_TIMEOUT);
> > +	status =3D connector_status_get(data, port);
> > +	igt_assert(status =3D=3D DRM_MODE_DISCONNECTED);
> > +
> > +	/*
> > +	 * Enable the DDC line and the kernel workaround should reprobe
> > and
> > +	 * report as connected
> > +	 */
> > +	chamelium_port_set_ddc_state(data->chamelium, port, true);
> > +
> > +	/*
> > +	 * i915 uses the maximum timeout that each platform support to
> > do aux
> > +	 * transactions, this timeout can vary from 1.6msec to 4msec
> > and i915
> > +	 * driver tries the same aux transaction up to 5 times before
> > return a
> > +	 * error and additionally drm helpers will ask driver to do the
> > same aux
> > +	 * transaction up to 32 times, so it will take at least
> > 256msec~640msec
> > +	 * to kernel give up on a sink detection.
> > +	 *
> > +	 * The workaround will be schedule to run 1 second after the
> > driver
> > +	 * failed to probe the connector that signaled a hotplug, so if
> > this
> > +	 * test is preempt it could fail because the workaround is
> > already
> > +	 * running with the DDC lines still off, so lets try again
> > until the
> > +	 * time requirement is meet.
> > +	 */
> > +	delta_nsec =3D igt_nsec_elapsed(&begin);
> > +	if (delta_nsec > (NSEC_PER_SEC * 1.3f)) {
>=20
> 1.3 sec is too late for the 256msec+1sec scenario.. Should be 1.2.

Okay

>=20
> I guess you're still working on the HDMI test? Please also add it to
> the
> meson and automake sources. I guess we can merge it before the kernel
> patches
> letting it fail until that.

The HDMI test is ready but it requires a change in chameleon side, got
the changed merged upstream[1] this week but it will take some time to
chromiumos to release a over-the-air chameleond update, it is okay send
the test but it will skip while the new method is not
available(checking the return of the chameleond server)?

[1]=20
https://chromium.googlesource.com/chromiumos/platform/chameleon/+/231016d02=
369d33ba1c3b3322e4bc88d881bf520

>=20
> > +		igt_assert_f(retries !=3D 5, "Test preempted too many
> > times");
> > +		retries++;
> > +
> > +		/* Wait for 1 more sec to make sure the workaround
> > finished */
> > +		chamelium_unplug(data->chamelium, port);
> > +		igt_hotplug_detected(mon, FAST_HOTPLUG_TIMEOUT);
> > +		goto retry;
> > +	}
> > +
> > +	igt_assert(chamelium_port_get_ddc_state(data->chamelium,
> > port));
> > +	igt_assert(igt_hotplug_detected(mon, FAST_HOTPLUG_TIMEOUT));
> > +	status =3D connector_status_get(data, port);
> > +	igt_assert(status =3D=3D DRM_MODE_CONNECTED);
> > +}
> > +
> >  static void
> >  test_edid_read(data_t *data, struct chamelium_port *port,
> >  	       int edid_id, const unsigned char *edid)
> > @@ -1308,6 +1415,9 @@ igt_main
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

--=-jy6EpflF8f417j7OGyOM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyVboQACgkQVenbO/mO
WklXGgf+KmVEbrhapI8tKhqM977LbRnCBbhCoTraw8OLV1+nmUbs47s/okx90MIX
P+9e2cYR6WRDlX765O7wyuiXFjW5eGATB6Mx+6KoxKq+pp8vYH5OgVtensc9XGS9
O0IZ5pKDV49W3b/RzDITweZaCJADTJCGnLNLMd3p1uDgdmUf110ewuAr3x99VSA8
3HQiZOGhO+VoraOElYRORxCQwtfzErjrgmzvlMK8LyY02++5Po9uqXgYwr129KtR
UV704iB/h5h7i+azA1VdWgyBva6eg++XAu/BRxfv+42XmfYo6EYPjVN8YpqzVvYr
kkP7CDwUU5elTmZAmjcXz3Ne+EkZSg==
=Jc5F
-----END PGP SIGNATURE-----

--=-jy6EpflF8f417j7OGyOM--

--===============0823663388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0823663388==--
