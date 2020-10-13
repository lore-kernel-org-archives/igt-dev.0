Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0147E6E8E8
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2020 12:56:35 +0000 (UTC)
Date: Tue, 13 Oct 2020 15:56:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20201013125630.GA6112@intel.com>
References: <20201012175654.2422295-1-imre.deak@intel.com>
 <20201013112712.GZ6112@intel.com>
 <20201013113632.GA2433002@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013113632.GA2433002@ideak-desk.fi.intel.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_dp_aux_dev: Handle AUX failures on
 disconnected MST connectors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 02:36:32PM +0300, Imre Deak wrote:
> On Tue, Oct 13, 2020 at 02:27:12PM +0300, Ville Syrj=E4l=E4 wrote:
> > On Mon, Oct 12, 2020 at 08:56:54PM +0300, Imre Deak wrote:
> > > The DPCD of an MST connector is read out with a REMOTE_DPCD_READ MST
> > > request. If the given connector is disconnected this read will result=
 in
> > > an MST NAK reply and this will be reported as an EIO error to the
> > > initiator of the AUX read.
> > > =

> > > Handle this in the test that attempts to read the DPCD of any exposed
> > > connector, whether they are connected or not.
> > =

> > MST connectors get nuked once disconnected no? So is this just to avoid
> > some race with the connector disappearing during the test?
> =

> During enumeration of the ports of an MSTB (in response to a hotplug
> when at least one port is connected) a connector is added for all
> (output) ports, even if they are not connected. If a port gets unplugged
> the connector is removed yes, but a new connector for this port is added
> back since the parent MSTB is reprobed then.

That's quite confusing. Why are we trying to base the lifetime of the
connector on two different things?

Also I don't remember seeing any extra connectors for disconnected
ports on MST devices. So a bit confused.

> =

> > =

> > > =

> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  tests/kms_dp_aux_dev.c | 16 +++++++++++++---
> > >  1 file changed, 13 insertions(+), 3 deletions(-)
> > > =

> > > diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> > > index 4f52434a..39fc2b92 100644
> > > --- a/tests/kms_dp_aux_dev.c
> > > +++ b/tests/kms_dp_aux_dev.c
> > > @@ -34,6 +34,14 @@
> > >  =

> > >  IGT_TEST_DESCRIPTION("Test that /dev/drm_dp_aux reads work");
> > >  =

> > > +static bool is_mst_connector(int drm_fd, uint32_t connector_id)
> > > +{
> > > +	return kmstest_get_property(drm_fd, connector_id,
> > > +				    DRM_MODE_OBJECT_CONNECTOR,
> > > +				    "PATH", NULL,
> > > +				    NULL, NULL);
> > > +}
> > > +
> > >  static bool test(int drm_fd, uint32_t connector_id)
> > >  {
> > >  	drmModeConnector *connector;
> > > @@ -67,10 +75,12 @@ static bool test(int drm_fd, uint32_t connector_i=
d)
> > >  		igt_assert(fd >=3D 0);
> > >  =

> > >  		ret =3D read(fd, buf, sizeof(buf));
> > > -		igt_assert(ret =3D=3D sizeof(buf) || errno =3D=3D ETIMEDOUT);
> > > -
> > >  		igt_info("%s: %s\n", path,
> > > -			 ret > 0 ? "success" : "timed out");
> > > +			 ret > 0 ? "success" : strerror(errno));
> > > +
> > > +		igt_assert(ret =3D=3D sizeof(buf) ||
> > > +			   errno =3D=3D ETIMEDOUT ||
> > > +			   (errno =3D=3D EIO && is_mst_connector(drm_fd, connector_id)));
> > >  =

> > >  		close(fd);
> > >  =

> > > -- =

> > > 2.20.1
> > > =

> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > =

> > -- =

> > Ville Syrj=E4l=E4
> > Intel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
