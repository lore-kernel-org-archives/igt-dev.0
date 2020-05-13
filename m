Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32A56E127
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2020 10:23:28 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Wed, 13 May 2020 10:23:23 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F824AB692@BGSMSX104.gar.corp.intel.com>
References: <20200511182534.14395-1-imre.deak@intel.com>
 <20200511190853.15056-1-imre.deak@intel.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F824AA9A7@BGSMSX104.gar.corp.intel.com>
 <20200512165036.GB17567@ideak-desk.fi.intel.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F824AAAB3@BGSMSX104.gar.corp.intel.com>
 <20200512171654.GZ6112@intel.com>
In-Reply-To: <20200512171654.GZ6112@intel.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Tuesday, May 12, 2020 10:47 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: Deak, Imre <imre.deak@intel.com>; igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH v2] tests/kms_flip: Retry test in case of a=
 DP/HDMI
> link reset
> =

> On Tue, May 12, 2020 at 05:07:09PM +0000, Shankar, Uma wrote:
> >
> >
> > > -----Original Message-----
> > > From: Imre Deak <imre.deak@intel.com>
> > > Sent: Tuesday, May 12, 2020 10:21 PM
> > > To: Shankar, Uma <uma.shankar@intel.com>
> > > Cc: igt-dev@lists.freedesktop.org
> > > Subject: Re: [igt-dev] [PATCH v2] tests/kms_flip: Retry test in case
> > > of a DP/HDMI link reset
> > >
> > > On Tue, May 12, 2020 at 06:11:08PM +0300, Shankar, Uma wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf
> > > > > Of Imre Deak
> > > > > Sent: Tuesday, May 12, 2020 12:39 AM
> > > > > To: igt-dev@lists.freedesktop.org
> > > > > Subject: [igt-dev] [PATCH v2] tests/kms_flip: Retry test in case
> > > > > of a DP/HDMI link reset
> > > > >
> > > > > At least an IIyama and LG monitor have a strange behaviour when
> > > > > waking from a power saving state and getting enabled with an
> > > > > otherwise
> > > successful modeset:
> > > > > after the modeset in ~2 sec they signal a bad link state, either
> > > > > due to a lost CR/EQ in case of DP or a lost scrambling/TMDS
> > > > > clock setting in case
> > > of HDMI link.
> > > > > In response the driver resets the link with either a
> > > > > link-retraining or a modeset, which in turn makes the test miss v=
blank/flip
> events and fail.
> > > > >
> > > > > Work around the above issue, by retrying the test once if the
> > > > > test detects after a failure that a link reset happened during
> > > > > the test and a corresponding hotplug uevent was sent by the drive=
r.
> > > > >
> > > > > v2: Suspend the signal helper while waiting for a hotplug event, =
so the
> > > > >     wait will not get inerrupted/restarted in an endless loop.
> > > > >
> > > >
> > > > Though not sure that this is behavior which should be allowed from
> > > > a compliant monitor, I feel this is the right way to handle/WA
> > > > this.  We may have to extend this to some other tests as well
> > > > which will also get impacted due to these spurious hotplug events.
> > >
> > > Yes, one more place would be the connector probing at test startup,
> > > which should be retried if a hotplug uevent is detected (waiting for
> > > both uevents that a long pulse can generate).
> >
> > Yes, there is also a similar failure in alpha test we have seen:
> > igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb - fail - Failed
> > assertion: !mismatch || igt_skip_crc_compare
> >
> > This also occurred due to the spurious interrupt only. Not sure if ther=
e is any
> other test which is affected.
> =

> In theory this sort of stuff should not cause a crc mismatch.
> IIRC somebody (Maarten maybe?) made the crc interface supposedly provide
> consistent crcs across modeset. So if we are seeing crc change across a p=
ure ->off-
> >on modeset there is potentially a bug in the driver.

Oh ok, based on the CI logs this happens very sporadically and every time i=
t has reproduced, its
happening when this spurious interrupt is received. Will try to investigate=
 the driver flows related
to alpha handling. =


One another thing in common I got was that when this happened, we also get :
<7> [926.239189] [drm:intel_crtc_set_crc_source [i915]] Trying to capture C=
RC while pipe is off
<7> [926.254878] i915 0000:03:00.0: [drm:drm_fb_helper_hotplug_event.part.1=
5]

Regards,
Uma Shankar

> --
> Ville Syrj=E4l=E4
> Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
