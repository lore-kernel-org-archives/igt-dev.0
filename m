Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8457E8982C
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Mar 2021 09:29:55 +0000 (UTC)
Date: Tue, 9 Mar 2021 11:30:22 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YEdALisb3IFntM8O@platvala-desk.ger.corp.intel.com>
References: <20210301170957.23216-1-bhanuprakash.modem@intel.com>
 <20210301170957.23216-2-bhanuprakash.modem@intel.com>
 <20210301234025.GB7960@labuser-Z97X-UD5H>
 <SN6PR11MB33278F84B5826A1A2E9EEFD68D999@SN6PR11MB3327.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN6PR11MB33278F84B5826A1A2E9EEFD68D999@SN6PR11MB3327.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_vrr: Extend to cover full
 VRR range
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
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 02, 2021 at 07:06:15AM +0200, Modem, Bhanuprakash wrote:
> > -----Original Message-----
> > From: Navare, Manasi <manasi.d.navare@intel.com>
> > Sent: Tuesday, March 2, 2021 5:10 AM
> > To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Ville Syrj=E4l=E4
> > <ville.syrjala@linux.intel.com>; Nicholas Kazlauskas
> > <nicholas.kazlauskas@amd.com>; Latvala, Petri <petri.latvala@intel.com>
> > Subject: Re: [PATCH i-g-t 2/2] tests/kms_vrr: Extend to cover full VRR
> > range
> >
> > Looks good to me.
> > While at it, lets also remove the test for refresh rates less than vmin
> > since
> > in that case the frame repetition is expected and we wont get the expec=
ted
> > target rate
> To validate the flipline mode:
> * Generate the Push before the decision boundary (vmin by default), means=
 we
>   need to request flips with the refresh rate < vmin. Expected refresh ra=
te
>   would be vmin because vblank termination starts at decision boundary.
> * Generate the Push before the decision boundary, means we need to request
>   flips with any refresh rate b/w vmin & vmax. Expected refresh rate shou=
ld
>   match with the requested rate because vblank termination starts immedia=
tely
> =

> If we remove the test for refresh rates less than vmin, subtest "flipline"
> is not required anymore. Subtest "flip-basic" is already covering the vrr
> range (running test with midpoint of vrr range)
> =

> Please suggest to proceed further.

For the record, this has been discussed offline and the verdict is
that the patch as-is is fine and future work can happen
separately. Thus, merged now, thanks.


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
