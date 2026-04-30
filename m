Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0332FF8875
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 08:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B4510F2B5;
	Thu, 30 Apr 2026 08:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MN+Dqlcf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A9810F2B5
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 08:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777537865; x=1809073865;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=jB4Y5Nj3bLn49LC9oCvTeAGxk4ON/n/7Y6AGiNHS+ps=;
 b=MN+DqlcfR/sot32sA+mRplo7Ia497Z87AfSJC1f6B6Z+AxjVbjimX+7E
 LfqSAEcC/jpsg26iwWmvXjLC0u/Z5gQIwKC5c2gm6U5+0wE6jFeqEVwH3
 vDuDpek9ZEal8ofJxD5PEuNDaRCxX87ZyYLHQWw28fpfbmF6o6rsQfZbO
 30PXWMb93TvnsTQ7XPj3qWlPD7EMGP3dWieAyCS8KWY+GG8aARDic/Ipn
 ynR92kIecUVe2tdLQ1tK2GGa2QxQZ0enCAl6DhdolkA5/6kI+KrvzCkZb
 DYxObdEKCElsjPR6+wbjyChyat8EZo5L0O4R4TTHX+OUpgr2nAs+xMh5V A==;
X-CSE-ConnectionGUID: Nlq8fDtcRReLgn+eZndplA==
X-CSE-MsgGUID: hCexDMwvQoik5jiHNQchqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78672985"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78672985"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 01:31:05 -0700
X-CSE-ConnectionGUID: H0e6Xi/2RkCIdzW+JLHScw==
X-CSE-MsgGUID: CFzaL+dXQeqiJQO3OTwXXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="238842717"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 01:31:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Reddy
 Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Cc: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t v3 03/11] tests/intel/kms_frontbuffer_tracking:
 update the outdated fbc status reasons
In-Reply-To: <8f0315369761db097a299fac068cc02f12256002.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
 <20260416092559.88735-4-vinod.govindapillai@intel.com>
 <d37a835b-69e5-4eaa-a6d8-fd98b02df74a@intel.com>
 <8f0315369761db097a299fac068cc02f12256002.camel@intel.com>
Date: Thu, 30 Apr 2026 11:30:59 +0300
Message-ID: <648f45b3e47ba9e791ec07e19150590397fe8300@intel.com>
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

On Thu, 30 Apr 2026, "Govindapillai, Vinod" <vinod.govindapillai@intel.com>=
 wrote:
> On Thu, 2026-04-30 at 09:07 +0530, Reddy Guddati, Santhosh wrote:
>>=20
>>=20
>> On 16-04-2026 14:55, Vinod Govindapillai wrote:
>> > Replace the fbc status check for "mode too large for compression"
>> > wchich
>> > is no longer being set by the driver with "plane size too big" and
>> > "surface size too big" fbc status checks.
>> >=20
>> > Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>> > ---
>> > =C2=A0 tests/intel/kms_frontbuffer_tracking.c | 18 ++++++++++++++----
>> > =C2=A0 1 file changed, 14 insertions(+), 4 deletions(-)
>> >=20
>> > diff --git a/tests/intel/kms_frontbuffer_tracking.c
>> > b/tests/intel/kms_frontbuffer_tracking.c
>> > index b01959d2c..5bdfbd105 100644
>> > --- a/tests/intel/kms_frontbuffer_tracking.c
>> > +++ b/tests/intel/kms_frontbuffer_tracking.c
>> > @@ -1667,16 +1667,25 @@ static bool fbc_stride_not_supported(void)
>> > =C2=A0=20
>> > =C2=A0=C2=A0	intel_fbc_get_fbc_status(prim_mode_params.crtc,
>> > fbc_status, sizeof(fbc_status));
>> > =C2=A0=20
>> > -	return strstr(fbc_status, "FBC disabled: framebuffer
>> > stride not supported\n");
>> > +	return strstr(fbc_status, "FBC disabled: stride not
>> > supported\n");
>> > =C2=A0 }
>> > =C2=A0=20
>> > -static bool fbc_mode_too_large(void)
>> > +static bool fbc_plane_size_too_big(void)
>> > =C2=A0 {
>> > =C2=A0=C2=A0	char fbc_status[128];
>> > =C2=A0=20
>> > =C2=A0=C2=A0	intel_fbc_get_fbc_status(prim_mode_params.crtc,
>> > fbc_status, sizeof(fbc_status));
>> > =C2=A0=20
>> > -	return strstr(fbc_status, "FBC disabled: mode too large
>> > for compression\n");
>> > +	return strstr(fbc_status, "FBC disabled: plane size too
>> > big\n");
>> > +}
>> > +
>> > +static bool fbc_surface_size_too_big(void)
>>=20
>> Same here, The next commit deletes all this code and replace all this
>> with intel_fbc_found_skip_reason(). Imho, we should squash this
>> commit.
>
> These are basically separate changes - one patch one logical change. In
> that way it would be easier to track/debug - bisect etc. Well.. this is
> how I have seen how Ville/Jani have been approaching the changes in the
> driver.. so following that approach.=C2=A0

IMO always err on the side of small incremental changes. It's easier to
review, easier to find errors when bisecting, and (if needed) easier to
squash afterwards.

BR,
Jani.

>
> BR
> Vinod=20
>

--=20
Jani Nikula, Intel
