Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDF110E48A
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 04:30:22 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Fri, 22 Apr 2022 04:30:20 +0000
Message-ID: <aa63487f99e04f25973ed04d242e91cc@intel.com>
References: <20220421170245.11898-1-anshuman.gupta@intel.com>
 <20220421170245.11898-3-anshuman.gupta@intel.com>
 <87bkwudnhf.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87bkwudnhf.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] test: i915_pm_rpm: conditional
 initialization of igt_display_t
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: Friday, April 22, 2022 5:00 AM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Nilawar, Badal <badal.nilawar@intel.co=
m>
> Subject: Re: [PATCH i-g-t 2/3] test: i915_pm_rpm: conditional initializat=
ion of
> igt_display_t
>=20
> On Thu, 21 Apr 2022 10:02:44 -0700, Anshuman Gupta wrote:
> >
> > Initialize igt_display_t display only in case of there are valid drm
> > kms resources.
> >
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  tests/i915/i915_pm_rpm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c index
> > 2cc89eef2..7a0176b2f 100644
> > --- a/tests/i915/i915_pm_rpm.c
> > +++ b/tests/i915/i915_pm_rpm.c
> > @@ -406,9 +406,9 @@ static void init_mode_set_data(struct mode_set_data
> *data)
> >		}
> >
> >		kmstest_set_vt_graphics_mode();
> > +		igt_display_require(&data->display, drm_fd);
> >	}
> >
> > -	igt_display_require(&data->display, drm_fd);
>=20
> Is this needed? Isn't display_disabled set to false in setup_environment(=
) for
> headless? Or is this the right thing to do? Maybe somebody from display c=
an
> review? Thanks.
I think we can remove the display_disabled flag.
I will fix this in next revision.
Thanks,
Anshuman Gupta.
