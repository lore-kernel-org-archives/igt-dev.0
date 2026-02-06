Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A652EB28FE
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 09:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A70810E65D;
	Fri,  6 Feb 2026 09:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xp7BodKO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D6810E65D
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 09:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770371127; x=1801907127;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=HixNjQvbvsh5tgNHSdnxHtGgPgGQUydoCE9i5wI2lO4=;
 b=Xp7BodKOo52UED+3Xj7RfxbCKW6HCRwv/5tIAkZIoy538Z2lAyu7Zbtw
 ue9e+rr9sDpPPzZf7JXNU2ietYSGbILjKJvAzcDfxwlFFHGIHKWgApfMy
 rMssNpdPeKgoahZOoB9NJ7g9YOG64ARiRKgR/LA6YR53ZIjR2sjPFDgSH
 c2zWOIh5unKRvvUnb8v/3ckPNkRlY/tJDNUw2G4oaod5sJhDzWfuR3Myi
 VhcLjXOBNIpVQTIApSBSq+1J8CqZXOVCYrPgQFMG1emLc4AsBNXsOXuef
 ri5t3lBDpAhd7Jcb/kPKdy6SfX7RC/pil8Hq7FdkyAYwojETfG3baU/uv Q==;
X-CSE-ConnectionGUID: kOehXF2LSa+SwM/hbOQMkw==
X-CSE-MsgGUID: nsGwkKWBRxW1u0PGBsEVDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71644892"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71644892"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:45:26 -0800
X-CSE-ConnectionGUID: 9yQDnq9+S1CJqvGYxYXCyw==
X-CSE-MsgGUID: iyILxRGqR8eCEmwhsAMzCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210622757"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:45:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 09/12] tests/kms: Convert to for_each_crtc(), part 4
In-Reply-To: <20260205133019.9161-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
 <20260205133019.9161-10-ville.syrjala@linux.intel.com>
Date: Fri, 06 Feb 2026 11:45:22 +0200
Message-ID: <ba29c3bcee4391e4d75c6c38806aed2299211899@intel.com>
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

On Thu, 05 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert more for_each_pipe()s into for_each_crtc(). In
> these cases we already have a local 'igt_crtc_t*' variable
> within the loop, so we'll just hoist that upwards to be the
> loop iterator instead.

[snip]

> @@ -2915,6 +2914,7 @@ static void igt_handle_spurious_hpd(igt_display_t *=
display)
>   */
>  void igt_display_reset_outputs(igt_display_t *display)
>  {
> +	igt_crtc_t *crtc;
>  	int i;
>  	drmModeRes *resources;
>=20=20
> @@ -2968,14 +2968,13 @@ void igt_display_reset_outputs(igt_display_t *dis=
play)
>  	 * display. */
>  	igt_display_reset(display);
>=20=20
> -	for_each_pipe(display, i) {
> -		igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, i);
> +	for_each_crtc(display, crtc) {

Side note, I especially like the improved clarity in places like this
that use a plain 'int i' for both for_each_pipe() and some other random
iteration.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>  		igt_output_t *output;
>=20=20
> -		if (!igt_pipe_has_valid_output(display, i))
> +		if (!igt_pipe_has_valid_output(display, crtc->pipe))
>  			continue;
>=20=20
> -		output =3D igt_get_single_output_for_pipe(display, i);
> +		output =3D igt_get_single_output_for_pipe(display, crtc->pipe);
>=20=20
>  		if (crtc->num_primary_planes > 1) {
>  			igt_plane_t *old_primary =3D &crtc->planes[0];

--=20
Jani Nikula, Intel
