Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EC6109B469
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 13:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09E610E902;
	Tue, 31 Mar 2026 13:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOZvsiOc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DA210E902
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 13:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774964918; x=1806500918;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZC3l+bv5bIAFsMNY9ZopXzIqsyJKG0+tzEmb4XF7nxg=;
 b=AOZvsiOconLSVY+8M/lSukzEyDIZo0Y3ksmclysLucOHnJzm05YaYZ8O
 FxUPxYWJNwGkucPS/MNZQaUa+tZoqi+GaQlZPHi6yjkxAuS51BA3qSitu
 Wh4fPuk4VRiVqqMxmaG45fGfPppHm1TbgYzhhQmpR6F7JXrV3jgZ2dHH8
 EajjkIFIhoR5A44AjtyDWQDktsURCG/CahYZAmE24zdefh3YNmo4YCR4+
 fGYenw3oOkTvseorL6tdpRLlEgchewKHvrPNHeJC/E338DkL5LfWcLBaC
 5a+HMkyJGge08St/NbxlrloYtbefSFc8ZHNCkHO5+rDxRxXr9zF/BoBhy w==;
X-CSE-ConnectionGUID: lk2GbyHLRxCYZFiq6/IN7w==
X-CSE-MsgGUID: 3D8Dk7YoQueEU4QhnsX+Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75863208"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75863208"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 06:48:37 -0700
X-CSE-ConnectionGUID: svCA9XfgSz6eEKmhPZLQKQ==
X-CSE-MsgGUID: 3H4n8MikSEG9fR8z7QK4Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="225369148"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.73])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 06:48:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_setmode: Add HDMI 2.0 clock limit
 for mode selection
In-Reply-To: <DM4PR11MB6312922FD2D9B65F985EDE579053A@DM4PR11MB6312.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260331104100.614718-1-jeevan.b@intel.com>
 <acvGy0C97UmDxLg2@intel.com>
 <DM4PR11MB6312922FD2D9B65F985EDE579053A@DM4PR11MB6312.namprd11.prod.outlook.com>
Date: Tue, 31 Mar 2026 16:48:26 +0300
Message-ID: <934b8aea90466bb00982720c1960286b96ca5602@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tue, 31 Mar 2026, "B, Jeevan" <jeevan.b@intel.com> wrote:
>> -----Original Message-----
>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Sent: Tuesday, March 31, 2026 6:36 PM
>> To: B, Jeevan <jeevan.b@intel.com>
>> Cc: igt-dev@lists.freedesktop.org; Nautiyal, Ankit K
>> <ankit.k.nautiyal@intel.com>
>> Subject: Re: [PATCH i-g-t v2] tests/kms_setmode: Add HDMI 2.0 clock limi=
t for
>> mode selection
>>=20
>> On Tue, Mar 31, 2026 at 04:11:00PM +0530, Jeevan B wrote:
>> > eDP modes with high clock rates were being forced on HDMI 2.0
>> > displays, causing kernel to reject with EINVAL. Add clock validation
>> > to skip incompatible eDP modes and fall back to supported modes.
>> >
>> > v2: Add HDMI 2.0 clock limit helper, drop crtc_supports_mode(),
>> >     and ensure per-connector compatibility to avoid invalid modes.
>> >
>> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
>> > ---
>> >  tests/kms_setmode.c | 44
>> ++++++++++++++++++++++++++++++++++++++++++--
>> >  1 file changed, 42 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index
>> > 1f2849bc2..f1c1afe45 100644
>> > --- a/tests/kms_setmode.c
>> > +++ b/tests/kms_setmode.c
>> > @@ -79,6 +79,9 @@
>> >  /* restricted pipe count */
>> >  #define CRTC_RESTRICT_CNT 2
>> >
>> > +/* Clock limit for HDMI 2.0 */
>> > +#define HDMI_2_0_MAX_CLOCK_KHZ 600000
>> > +
>> >  static int drm_fd;
>> >  static drmModeRes *drm_resources;
>> >  static int filter_test_id;
>> > @@ -165,6 +168,16 @@ static bool
>> connector_supports_mode(drmModeConnector *connector,
>> >  	return false;
>> >  }
>> >
>> > +static bool
>> hdmi_connector_mode_exceeds_hdmi20_limit(drmModeConnector
>> *connector,
>> > +						     drmModeModeInfo
>> *mode)
>> > +{
>> > +	if (connector->connector_type !=3D DRM_MODE_CONNECTOR_HDMIA
>> &&
>> > +	    connector->connector_type !=3D DRM_MODE_CONNECTOR_HDMIB)
>> > +		return false;
>> > +
>> > +	return mode->clock > HDMI_2_0_MAX_CLOCK_KHZ;
>>=20
>> Starting to test all kinds of random thing here does not seem maintainab=
le.
>>=20
>> I think the one sensible option is to make the test skip rather than fai=
l if it
>> couldn't find a common mode between the connectors and the modeset
>> subsequently failed.
>>=20
>> As for the external vs. internal connector situation, the test should pr=
obably
>> try to find a mode on the external connector(s) that has the same refres=
h rate
>> as one of the modes on the internal connector, and has the same resoluti=
on
>> (or less) than the internal panel. That way we can use pfit to upscale c=
ontent
>> on the internal panel instead of attempting to force the external connec=
tors to
>> use the internal panel's native mode.
>>=20
> Thanks, that makes sense.
>
> This test iterates through a large set of valid and invalid
> crtc/connector combinations, so trying to enforce strict compatibility
> in mode selection is making the logic complex and hard to maintain.
>
> It's also becoming harder with newer internal panels supporting high
> refresh rates, which often don't have matching modes on external
> connectors.
>
> I agree it's better to keep the selection simple and skip when no common
> mode is found or the modeset fails, instead of adding more heuristics.
>
> Longer term, it might be worth rethinking the mode selection strategy,
> but for now I'll keep this change minimal.

I think long term the test would be easier to maintain if it were
converted to igt_display_require() and igt_crtc_t and friends instead of
hand-rolling everything.

BR,
Jani.



>
> Thanks=20
> Jeevan B=20
>> > +}
>> > +
>> >  static bool crtc_supports_mode(struct crtc_config *crtc,
>> > drmModeModeInfo *mode)  {
>> >  	int i;
>> > @@ -270,8 +283,35 @@ static void get_mode_for_crtc(struct crtc_config
>> *crtc,
>> >  				if (conn->modes[j].clock < mode->clock)
>> >  					mode =3D &conn->modes[j];
>> >  			}
>> > -			*mode_ret =3D *mode;
>> > -			return;
>> > +
>> > +			/* Check HDMI 2.0 clock + per-connector compatibility
>> */
>> > +			{
>> > +				int k;
>> > +				bool compatible =3D true;
>> > +
>> > +				for (k =3D 0; k < crtc->connector_count; k++) {
>> > +					drmModeConnector *other_conn =3D
>> > +						crtc->cconfs[k].connector;
>> > +
>> > +					/* HDMI 2.0 clock constraint */
>> > +					if
>> (hdmi_connector_mode_exceeds_hdmi20_limit(other_conn,
>> > +
>> 	     mode)) {
>> > +						compatible =3D false;
>> > +						break;
>> > +					}
>> > +
>> > +					/* Ensure connector supports the
>> mode */
>> > +					if
>> (!connector_supports_mode(other_conn, mode)) {
>> > +						compatible =3D false;
>> > +						break;
>> > +					}
>> > +				}
>> > +
>> > +				if (compatible) {
>> > +					*mode_ret =3D *mode;
>> > +					return;
>> > +				}
>> > +			}
>> >  		}
>> >  	}
>> >
>> > --
>> > 2.43.0
>>=20
>> --
>> Ville Syrj=C3=A4l=C3=A4
>> Intel

--=20
Jani Nikula, Intel
