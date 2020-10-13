Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C22A6E8E2
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2020 13:19:08 +0000 (UTC)
Date: Tue, 13 Oct 2020 16:19:02 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20201013131902.GC2433002@ideak-desk.fi.intel.com>
References: <20201012175654.2422295-1-imre.deak@intel.com>
 <20201013112712.GZ6112@intel.com>
 <20201013113632.GA2433002@ideak-desk.fi.intel.com>
 <20201013125630.GA6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013125630.GA6112@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_dp_aux_dev: Handle AUX failures on
 disconnected MST connectors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 03:56:30PM +0300, Ville Syrj=E4l=E4 wrote:
> On Tue, Oct 13, 2020 at 02:36:32PM +0300, Imre Deak wrote:
> > On Tue, Oct 13, 2020 at 02:27:12PM +0300, Ville Syrj=E4l=E4 wrote:
> > > On Mon, Oct 12, 2020 at 08:56:54PM +0300, Imre Deak wrote:
> > > > The DPCD of an MST connector is read out with a REMOTE_DPCD_READ MST
> > > > request. If the given connector is disconnected this read will resu=
lt in
> > > > an MST NAK reply and this will be reported as an EIO error to the
> > > > initiator of the AUX read.
> > > > =

> > > > Handle this in the test that attempts to read the DPCD of any expos=
ed
> > > > connector, whether they are connected or not.
> > > =

> > > MST connectors get nuked once disconnected no? So is this just to avo=
id
> > > some race with the connector disappearing during the test?
> > =

> > During enumeration of the ports of an MSTB (in response to a hotplug
> > when at least one port is connected) a connector is added for all
> > (output) ports, even if they are not connected. If a port gets unplugged
> > the connector is removed yes, but a new connector for this port is added
> > back since the parent MSTB is reprobed then.
> =

> That's quite confusing. Why are we trying to base the lifetime of the
> connector on two different things?

That's how MST core currently works: if a branch device is present then
all MST output ports on it will be also present along with the
corresponding DRM connector for these output ports, whether or not there
is anything plugged to these output ports.

> Also I don't remember seeing any extra connectors for disconnected
> ports on MST devices. So a bit confused.

But that matches the code and also what I see. After a branch device (a
TBT dock in MST mode) is plugged to the host with 1 monitor plugged to
it (to port 2) I get:

[ 6451.971549] [drm:drm_dp_send_link_address [drm_kms_helper]] link address=
 reply: 4
[ 6451.985722] [drm:drm_dp_send_link_address [drm_kms_helper]] port 0: inpu=
t 1, pdt: 1, pn: 0, dpcd_rev: 00, mcs: 1, ddps: 1, ldps 0, sdp 0/0
[ 6451.985727] [drm:drm_dp_send_link_address [drm_kms_helper]] port 1: inpu=
t 0, pdt: 0, pn: 1, dpcd_rev: 00, mcs: 0, ddps: 0, ldps 0, sdp 0/0
[ 6452.002362] [drm:drm_dp_send_link_address [drm_kms_helper]] port 2: inpu=
t 0, pdt: 3, pn: 2, dpcd_rev: 11, mcs: 0, ddps: 1, ldps 0, sdp 1/1
[ 6452.002366] [drm:drm_dp_send_link_address [drm_kms_helper]] port 3: inpu=
t 0, pdt: 0, pn: 3, dpcd_rev: 00, mcs: 0, ddps: 0, ldps 0, sdp 0/0

$ ls /sys/class/drm/

card0  card0-DP-1  card0-DP-2  card0-DP-3  card0-DP-4  card0-DP-5  card0-DP=
-6  card0-DP-7  card0-HDMI-A-1  renderD128  version

card0-DP-[567] being the 3 output ports on the branch device, card0-DP-6
in connected and the other 2 in disconnected state.

--Imre



> > > > =

> > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > > ---
> > > >  tests/kms_dp_aux_dev.c | 16 +++++++++++++---
> > > >  1 file changed, 13 insertions(+), 3 deletions(-)
> > > > =

> > > > diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> > > > index 4f52434a..39fc2b92 100644
> > > > --- a/tests/kms_dp_aux_dev.c
> > > > +++ b/tests/kms_dp_aux_dev.c
> > > > @@ -34,6 +34,14 @@
> > > >  =

> > > >  IGT_TEST_DESCRIPTION("Test that /dev/drm_dp_aux reads work");
> > > >  =

> > > > +static bool is_mst_connector(int drm_fd, uint32_t connector_id)
> > > > +{
> > > > +	return kmstest_get_property(drm_fd, connector_id,
> > > > +				    DRM_MODE_OBJECT_CONNECTOR,
> > > > +				    "PATH", NULL,
> > > > +				    NULL, NULL);
> > > > +}
> > > > +
> > > >  static bool test(int drm_fd, uint32_t connector_id)
> > > >  {
> > > >  	drmModeConnector *connector;
> > > > @@ -67,10 +75,12 @@ static bool test(int drm_fd, uint32_t connector=
_id)
> > > >  		igt_assert(fd >=3D 0);
> > > >  =

> > > >  		ret =3D read(fd, buf, sizeof(buf));
> > > > -		igt_assert(ret =3D=3D sizeof(buf) || errno =3D=3D ETIMEDOUT);
> > > > -
> > > >  		igt_info("%s: %s\n", path,
> > > > -			 ret > 0 ? "success" : "timed out");
> > > > +			 ret > 0 ? "success" : strerror(errno));
> > > > +
> > > > +		igt_assert(ret =3D=3D sizeof(buf) ||
> > > > +			   errno =3D=3D ETIMEDOUT ||
> > > > +			   (errno =3D=3D EIO && is_mst_connector(drm_fd, connector_id))=
);
> > > >  =

> > > >  		close(fd);
> > > >  =

> > > > -- =

> > > > 2.20.1
> > > > =

> > > > _______________________________________________
> > > > igt-dev mailing list
> > > > igt-dev@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > > =

> > > -- =

> > > Ville Syrj=E4l=E4
> > > Intel
> =

> -- =

> Ville Syrj=E4l=E4
> Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
