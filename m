Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E5EFD7F91
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 10:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E92110EAF9;
	Fri, 27 Feb 2026 10:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B94Nl6p3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FCD10EAFA
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 10:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772188937; x=1803724937;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=KA5CDP300H2RfZ4YhbG1lQhijH2yZyPDAYj32IpFgEA=;
 b=B94Nl6p3BvBRAo/zeaUis7pyaEgCAUN2KqtHmT9zRUClfwKpfYkce3NT
 ZVPwNGgTfBuMJGza2dkA1qCOltY6wXd8EIioo1q7YWQ4MDRDEeWSHP6k8
 IykEgqOciPFUcI1m4akGm1q4J0ZnVxtE0RXI4EjQCQaAaVH/AN+eXobYi
 uOFENYjVMKQiUJmbVIsooBa2RshcJB7HN1NrquM4THdGwLonmbGTYJ/Yn
 mEHeEHMLLyWaPqT/nF322iAmuDBcZZC3qmwTRprBBi4KWEBUE47rKX9F3
 KhOkaCgwx2tTQrDIJeiGE5AXm5sWU0zdpoQAill8z1YoQv5gtUIvBRtjc Q==;
X-CSE-ConnectionGUID: Wyfv5TP4TYmpEg1iO7a6mQ==
X-CSE-MsgGUID: 8UqCE5mbShC4EVXquiaouQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90671874"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="90671874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:42:17 -0800
X-CSE-ConnectionGUID: v5XXb6w1TmiLXcJET9ulBw==
X-CSE-MsgGUID: dES7R9wDSHKM7VXej74QZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221486040"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:42:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/17] lib/kms: Replace
 igt_pipe_has_valid_output() with igt_crtc_has_valid_output()
In-Reply-To: <20260227080653.30389-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
 <20260227080653.30389-2-ville.syrjala@linux.intel.com>
Date: Fri, 27 Feb 2026 12:42:12 +0200
Message-ID: <851a2c31afaa11bf42aee53f50f6ef9d2805605e@intel.com>
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

On Fri, 27 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Rename igt_pipe_has_valid_output() into igt_crtc_has_valid_output()
> and pass in the full igt_crtc_t*.
>
> And since we already have the crtc the igt_require_pipe() call
> no longer makes any sense. Move that into the one caller
> (igt_display_require_output_on_pipe()) where it might matter.

It's subtle and a bit bonkers, actually. igt_require_pipe() checks for
the crtc being valid. Which it is if it originates from
for_each_crtc(). If pipe is PIPE_NONE, it's a NULL dereference, so we
can assume that doesn't happen. But the crtc may also originate from
igt_crtc_for_pipe(), which does *not* have the crtc validity check.

This patch seems okay, though.

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 6087de365a82..7454d16780f9 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2821,15 +2821,12 @@ static void igt_require_pipe(igt_display_t *displ=
ay, enum pipe pipe)
>  			kmstest_pipe_name(pipe));
>  }
>=20=20
> -static bool igt_pipe_has_valid_output(igt_display_t *display, enum pipe =
pipe)
> +static bool igt_crtc_has_valid_output(igt_crtc_t *crtc)
>  {
> +	igt_display_t *display =3D crtc->display;
>  	igt_output_t *output;
>=20=20
> -	igt_require_pipe(display, pipe);
> -
> -	for_each_valid_output_on_crtc(display,
> -				      igt_crtc_for_pipe(display, pipe),
> -				      output)
> +	for_each_valid_output_on_crtc(display, crtc, output)
>  		return true;
>=20=20
>  	return false;
> @@ -2949,7 +2946,7 @@ void igt_display_reset_outputs(igt_display_t *displ=
ay)
>  	for_each_crtc(display, crtc) {
>  		igt_output_t *output;
>=20=20
> -		if (!igt_pipe_has_valid_output(display, crtc->pipe))
> +		if (!igt_crtc_has_valid_output(crtc))
>  			continue;
>=20=20
>  		output =3D igt_get_single_output_for_pipe(display, crtc->pipe);
> @@ -3266,7 +3263,9 @@ void igt_display_require_output(igt_display_t *disp=
lay)
>   */
>  void igt_display_require_output_on_pipe(igt_display_t *display, enum pip=
e pipe)
>  {
> -	if (!igt_pipe_has_valid_output(display, pipe))
> +	igt_require_pipe(display, pipe);
> +
> +	if (!igt_crtc_has_valid_output(igt_crtc_for_pipe(display, pipe)))
>  		igt_skip("No valid connector found on pipe %s\n", kmstest_pipe_name(pi=
pe));
>  }

--=20
Jani Nikula, Intel
