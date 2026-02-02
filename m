Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883C0E73158
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 11:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D3110E458;
	Mon,  2 Feb 2026 11:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7d3StFF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B789310E458
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 11:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770030649; x=1801566649;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yl9gBVLX/HbMJtSgOM6d+9U95FTabcCpBxmqJoqGcw4=;
 b=f7d3StFF2RGpzmkfhscBJZfMM+AjIM4YktveQ5w5uL8V8mwjLQRHzgm1
 zLXxBoM3DzGEOyKBN4vehxCls3FxrYS3vOQwtFpg8iHXleaxDpcmVfPnr
 sAFE7N/BiQSD14xCuippCbE8UJFXdiK6QT+9dpGB574Up1oy4TFHYtVzJ
 NY1dMrXUg69xoTDMCGJVuEWZoxaYxXlpEMLQURoxp7op64BtVjX9SgRfT
 OIu2X3pvfksVJRbCrb8q+T3mJ0hfih3SZENytkkB0OKH+4AvwsZrh2dNu
 oedHPRjUtXnwip08n5/HjXhcJJHzzCyTl1WCHWcWhcttfvUa0E77nwEGZ A==;
X-CSE-ConnectionGUID: tVqsAF0eSxGbzt1TAIcnfQ==
X-CSE-MsgGUID: bj3QYAZxQCGFy0Apq96lwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="70905000"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="70905000"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 03:10:49 -0800
X-CSE-ConnectionGUID: pGAj2kPoRCOx1EpZN1W1+A==
X-CSE-MsgGUID: YUP7OJJESh27YDByUoPQkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="232421940"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.153])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 03:10:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/15] lib/kms: Introduce for_each_crtc*()
In-Reply-To: <aXzP4wDaz9hCkKKi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-2-ville.syrjala@linux.intel.com>
 <8ce09d54c3f0208797f5b256e8aa27d29c6f4fbf@intel.com>
 <aXzP4wDaz9hCkKKi@intel.com>
Date: Mon, 02 Feb 2026 13:10:35 +0200
Message-ID: <70db2072688f084cff3321a97b02ac561a1eeb0e@intel.com>
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

On Fri, 30 Jan 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Jan 30, 2026 at 03:38:03PM +0200, Jani Nikula wrote:
>> On Fri, 30 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>> > +/**
>> > + * for_each_crtc:
>> > + * @display: a pointer to an #igt_display_t structure
>> > + * @crtc: The CRTC
>> > + *
>> > + * This for loop iterates over all CRTCs.
>> > + *
>> > + * Note that this cannot be used to enumerate per-CRTC subtest names =
since it
>> > + * depends upon runtime probing of the actual kms driver that is bein=
g tested.
>> > + * Use #for_each_pipe_static instead.
>> > + */
>> > +#define for_each_crtc(display, crtc) \
>> > +	for ((crtc) =3D &(display)->crtcs[0]; \
>> > +	     (crtc) < &(display)->crtcs[(display)->n_crtcs]; \
>> > +	     (crtc)++) \
>> > +		for_each_if ((crtc)->valid)
>>=20
>> I feel like for_each_crtc() should iterate the CRTCs in CRTC order, not
>> pipe order. What's the plan? Are we eventually going to have ->crtcs[]
>> in CRTC order?
>
> I don't even know what it means to have them in pipe order. It should be
> one and the same right now because the kernel anyway has them in the
> same order. I guess it just means we could theoeretically have holes
> in the array with crtc->valid=3D=3Dfalse for fused off pipes?
>
> But yeah, if/when we start to reorder the pipes, I think we should keep
> this stuff in CRTC order, and get rid of the holes.

In igt_display_require(), the loop is:

	for (i =3D 0; i < resources->count_crtcs; i++) {
		igt_crtc_t *crtc;
		int pipe_enum =3D is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd,=
 i) : i;

		crtc =3D igt_crtc_for_pipe(display, pipe_enum);
		crtc->pipe =3D pipe_enum;

		crtc->valid =3D true;
		crtc->crtc_id =3D resources->crtcs[i];
		/* offset of a pipe in crtcs list */
		crtc->crtc_offset =3D i;
	}

And igt_crtc_for_pipe() returns &display->crtcs[pipe] i.e. the
display->crtcs is currently in pipe order, and it could have holes if
pipes have been fused off.

Feels like this is so convoluted all over the place that we'd be better
off resetting everything back to assuming pipe =3D=3D=3D crtc index, and
fixing stuff from ground up. :/


BR,
Jani.


--=20
Jani Nikula, Intel
