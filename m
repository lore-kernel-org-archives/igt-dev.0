Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99BF6E133
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2020 17:16:57 +0000 (UTC)
Date: Tue, 12 May 2020 20:16:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200512171654.GZ6112@intel.com>
References: <20200511182534.14395-1-imre.deak@intel.com>
 <20200511190853.15056-1-imre.deak@intel.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F824AA9A7@BGSMSX104.gar.corp.intel.com>
 <20200512165036.GB17567@ideak-desk.fi.intel.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F824AAAB3@BGSMSX104.gar.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E7C9878FBA1C6D42A1CA3F62AEB6945F824AAAB3@BGSMSX104.gar.corp.intel.com>
Subject: Re: [igt-dev] [PATCH v2] tests/kms_flip: Retry test in case of a
 DP/HDMI link reset
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
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 12, 2020 at 05:07:09PM +0000, Shankar, Uma wrote:
> =

> =

> > -----Original Message-----
> > From: Imre Deak <imre.deak@intel.com>
> > Sent: Tuesday, May 12, 2020 10:21 PM
> > To: Shankar, Uma <uma.shankar@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [igt-dev] [PATCH v2] tests/kms_flip: Retry test in case of=
 a DP/HDMI
> > link reset
> > =

> > On Tue, May 12, 2020 at 06:11:08PM +0300, Shankar, Uma wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > > Imre Deak
> > > > Sent: Tuesday, May 12, 2020 12:39 AM
> > > > To: igt-dev@lists.freedesktop.org
> > > > Subject: [igt-dev] [PATCH v2] tests/kms_flip: Retry test in case of
> > > > a DP/HDMI link reset
> > > >
> > > > At least an IIyama and LG monitor have a strange behaviour when
> > > > waking from a power saving state and getting enabled with an otherw=
ise
> > successful modeset:
> > > > after the modeset in ~2 sec they signal a bad link state, either due
> > > > to a lost CR/EQ in case of DP or a lost scrambling/TMDS clock setti=
ng in case
> > of HDMI link.
> > > > In response the driver resets the link with either a link-retraining
> > > > or a modeset, which in turn makes the test miss vblank/flip events =
and fail.
> > > >
> > > > Work around the above issue, by retrying the test once if the test
> > > > detects after a failure that a link reset happened during the test
> > > > and a corresponding hotplug uevent was sent by the driver.
> > > >
> > > > v2: Suspend the signal helper while waiting for a hotplug event, so=
 the
> > > >     wait will not get inerrupted/restarted in an endless loop.
> > > >
> > >
> > > Though not sure that this is behavior which should be allowed from a
> > > compliant monitor, I feel this is the right way to handle/WA this.  We
> > > may have to extend this to some other tests as well which will also
> > > get impacted due to these spurious hotplug events.
> > =

> > Yes, one more place would be the connector probing at test startup, whi=
ch
> > should be retried if a hotplug uevent is detected (waiting for both uev=
ents that a
> > long pulse can generate).
> =

> Yes, there is also a similar failure in alpha test we have seen:
> igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb - fail - Failed assertio=
n: !mismatch || igt_skip_crc_compare
> =

> This also occurred due to the spurious interrupt only. Not sure if there =
is any other test which is affected.

In theory this sort of stuff should not cause a crc mismatch.
IIRC somebody (Maarten maybe?) made the crc interface supposedly
provide consistent crcs across modeset. So if we are seeing crc
change across a pure ->off->on modeset there is potentially a
bug in the driver.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
