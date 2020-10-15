Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D047B6ECE2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2020 14:29:40 +0000 (UTC)
Date: Thu, 15 Oct 2020 17:29:35 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20201015142935.GD2530177@ideak-desk.fi.intel.com>
References: <20201012175654.2422295-1-imre.deak@intel.com>
 <20201013112712.GZ6112@intel.com>
 <20201013113632.GA2433002@ideak-desk.fi.intel.com>
 <20201013125630.GA6112@intel.com>
 <20201013131902.GC2433002@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013131902.GC2433002@ideak-desk.fi.intel.com>
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

On Tue, Oct 13, 2020 at 04:19:06PM +0300, Imre Deak wrote:
> On Tue, Oct 13, 2020 at 03:56:30PM +0300, Ville Syrj=E4l=E4 wrote:
> > On Tue, Oct 13, 2020 at 02:36:32PM +0300, Imre Deak wrote:
> > > On Tue, Oct 13, 2020 at 02:27:12PM +0300, Ville Syrj=E4l=E4 wrote:
> > > > On Mon, Oct 12, 2020 at 08:56:54PM +0300, Imre Deak wrote:
> > > > > The DPCD of an MST connector is read out with a REMOTE_DPCD_READ =
MST
> > > > > request. If the given connector is disconnected this read will re=
sult in
> > > > > an MST NAK reply and this will be reported as an EIO error to the
> > > > > initiator of the AUX read.
> > > > > =

> > > > > Handle this in the test that attempts to read the DPCD of any exp=
osed
> > > > > connector, whether they are connected or not.
> > > > =

> > > > MST connectors get nuked once disconnected no? So is this just to a=
void
> > > > some race with the connector disappearing during the test?
> > > =

> > > During enumeration of the ports of an MSTB (in response to a hotplug
> > > when at least one port is connected) a connector is added for all
> > > (output) ports, even if they are not connected. If a port gets unplug=
ged
> > > the connector is removed yes, but a new connector for this port is ad=
ded
> > > back since the parent MSTB is reprobed then.
> > =

> > That's quite confusing. Why are we trying to base the lifetime of the
> > connector on two different things?
> =

> That's how MST core currently works: if a branch device is present then
> all MST output ports on it will be also present along with the
> corresponding DRM connector for these output ports, whether or not there
> is anything plugged to these output ports.
> =

> > Also I don't remember seeing any extra connectors for disconnected
> > ports on MST devices. So a bit confused.
> =

> But that matches the code and also what I see. After a branch device (a
> TBT dock in MST mode) is plugged to the host with 1 monitor plugged to
> it (to port 2) I get:
> =

> [ 6451.971549] [drm:drm_dp_send_link_address [drm_kms_helper]] link addre=
ss reply: 4
> [ 6451.985722] [drm:drm_dp_send_link_address [drm_kms_helper]] port 0: in=
put 1, pdt: 1, pn: 0, dpcd_rev: 00, mcs: 1, ddps: 1, ldps 0, sdp 0/0
> [ 6451.985727] [drm:drm_dp_send_link_address [drm_kms_helper]] port 1: in=
put 0, pdt: 0, pn: 1, dpcd_rev: 00, mcs: 0, ddps: 0, ldps 0, sdp 0/0
> [ 6452.002362] [drm:drm_dp_send_link_address [drm_kms_helper]] port 2: in=
put 0, pdt: 3, pn: 2, dpcd_rev: 11, mcs: 0, ddps: 1, ldps 0, sdp 1/1
> [ 6452.002366] [drm:drm_dp_send_link_address [drm_kms_helper]] port 3: in=
put 0, pdt: 0, pn: 3, dpcd_rev: 00, mcs: 0, ddps: 0, ldps 0, sdp 0/0
> =

> $ ls /sys/class/drm/
> =

> card0  card0-DP-1  card0-DP-2  card0-DP-3  card0-DP-4  card0-DP-5  card0-=
DP-6  card0-DP-7  card0-HDMI-A-1  renderD128  version
> =

> card0-DP-[567] being the 3 output ports on the branch device, card0-DP-6
> in connected and the other 2 in disconnected state.

I checked now what happens when plugging an SST monitor to port 1 and an
MST monitor to port 2 on the above dock:

[ 1456.272370] [drm:drm_dp_send_link_address [drm_kms_helper]] link address=
 reply: 4
[ 1456.381696] [drm:drm_dp_send_link_address [drm_kms_helper]] port 0: inpu=
t 1, pdt: 1, pn: 0, dpcd_rev: 00, mcs: 1, ddps: 1, ldps 0, sdp 0/0
[ 1456.397902] [drm:drm_dp_send_link_address [drm_kms_helper]] port 1: inpu=
t 0, pdt: 4, pn: 1, dpcd_rev: 00, mcs: 0, ddps: 1, ldps 1, sdp 1/1
[ 1456.397906] [drm:drm_dp_send_link_address [drm_kms_helper]] port 2: inpu=
t 0, pdt: 2, pn: 2, dpcd_rev: 12, mcs: 1, ddps: 1, ldps 0, sdp 0/0
[ 1456.397910] [drm:drm_dp_send_link_address [drm_kms_helper]] port 3: inpu=
t 0, pdt: 0, pn: 3, dpcd_rev: 00, mcs: 0, ddps: 0, ldps 0, sdp 0/0
[ 1459.650637] [drm:drm_dp_send_link_address [drm_kms_helper]] link address=
 reply: 3
[ 1459.660720] [drm:drm_dp_send_link_address [drm_kms_helper]] port 0: inpu=
t 1, pdt: 2, pn: 0, dpcd_rev: 00, mcs: 1, ddps: 1, ldps 0, sdp 0/0
[ 1459.687834] [drm:drm_dp_send_link_address [drm_kms_helper]] port 1: inpu=
t 0, pdt: 3, pn: 8, dpcd_rev: 12, mcs: 0, ddps: 1, ldps 0, sdp 1/1
[ 1459.717059] [drm:drm_dp_send_link_address [drm_kms_helper]] port 2: inpu=
t 0, pdt: 0, pn: 1, dpcd_rev: 00, mcs: 0, ddps: 0, ldps 0, sdp 0/0

The driver exposes a connector for the branch device in the MST monitor
too, this connector is in disconnected state, but (as expected) we can
read out the (branch device) DPCD from it.

The MST monitor has two output ports, on port 1 (pn 8) is its internal
sink stream on port 2 (pn 1) is a daisy chain DP port. For both of
these ports the driver exposes a connector, the latter one in
disconnected state and the remote DPCD read for this will fail with a
NAK/EIO error (as in the original case).

So atm the driver exposes a connector for all output ports of branch
devices and the branch devices themselves have also a connector (both
for the "root" branch device, card0-DP-3 above, and all downstream
branch devices). All ports/connectors that have an SST sink plugged into
them also expose an I2C and AUX device. Ports/connectors that have a
branch device plugged into them only expose an AUX device.

I think this is consistent and (if so) it would make sense to document
this somewhere as well.

One inconsistency I noticed is connector numbering, it depends on the
plugging order. That's because all connectors are added first for any
downstream branch device as they are enumarated on a port, before adding
connectors on subsequent ports on the parent branch device.

So in the above case where the dock is plugged with everything else
already plugged to it DP-[569] belongs to the dock while DP-[78] belongs
to the monitor. This could be made more consistent by adding first all
the connectors on a branch device before enumerating any other branch
devices attached to it.

--Imre
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
