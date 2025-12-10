Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30B4D3C912
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 14:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DAC10E719;
	Wed, 10 Dec 2025 14:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1aSKux/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7064E10E719
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 14:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765376590; x=1796912590;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=pnBsYs00iRTXvR5Ru7xPgIKGsgulm54hLZrbDh9hhB8=;
 b=Q1aSKux/iWyRNcyt2mc9yB9aeSx7WRayUyFWBK1N7+jLxF/3toOgfLjF
 0BUA0MJI9wAJoJK90yiFPCWQI08Mpkm4KAeydlP3fMslwrM26I8nmPKbx
 GFkPyR1Ahv4ppRS9ta/gQF/xVEtSb0X1ifjlwT7esJyubpxzyGuEao8jE
 wPNjSYjcQz8ZeiltiFCrlEBI6N87iKtfDCZJ+1uUGhcueKyGzw/Z8YEhc
 5R7OFtuQGVh7liBl4gpPQIw935/kj2qA9HRTEE4gdfD42IBjvRAMmek15
 aC59Todt2Qb1OUJdZH2mJco/20EXQPZxAE6E/+XlsAH3Zk/rYbm4wbJKD g==;
X-CSE-ConnectionGUID: efbALmaOR9SaBG/xzCldMg==
X-CSE-MsgGUID: Ah0R+5gaTrWIxSIRO5rWJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67306540"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="67306540"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:23:09 -0800
X-CSE-ConnectionGUID: LlMkDoshTZ6zqByRpoXgtw==
X-CSE-MsgGUID: qccsFA0nST+2Y5qIW0XjSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="196433774"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:23:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 04/10] lib/kms: Introduce igt_crtc_for_pipe()
In-Reply-To: <20251210093903.15934-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
 <20251210093903.15934-5-ville.syrjala@linux.intel.com>
Date: Wed, 10 Dec 2025 16:23:04 +0200
Message-ID: <2c2ed62ecaa64c44c321a77b75a42a1eb7848cd7@intel.com>
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

On Wed, 10 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Start weaning everyone off from poking inside display->pipes[]
> by hand. Introduce igt_crtc_for_pipe() as the preferred method
> for getting the correct crtc.
>
> Done by hand because this needs to be used in a few messy macros
> that cocci doesn't like.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.h | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 6e7cf112b1e2..5bb5c2cac19c 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -578,6 +578,11 @@ void igt_display_require_output(igt_display_t *displ=
ay);
>  void igt_display_require_output_on_pipe(igt_display_t *display, enum pip=
e pipe);
>  int igt_display_n_crtcs(igt_display_t *display);
>=20=20
> +static inline igt_pipe_t *igt_crtc_for_pipe(igt_display_t *display, enum=
 pipe pipe)
> +{
> +	return &display->pipes[pipe];
> +}
> +
>  const char *igt_output_name(igt_output_t *output);
>  drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
>  drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
> @@ -726,7 +731,7 @@ static inline bool igt_output_is_connected(igt_output=
_t *output)
>   */
>  #define for_each_pipe(display, pipe) \
>  	for_each_pipe_static(pipe) \
> -		for_each_if((display)->pipes[(pipe)].valid)
> +		for_each_if(igt_crtc_for_pipe((display), (pipe))->valid)
>=20=20
>  /**
>   * for_each_pipe_with_valid_output:
> @@ -745,7 +750,7 @@ static inline bool igt_output_is_connected(igt_output=
_t *output)
>  	for (int con__ =3D (pipe) =3D 0; \
>  	     assert(igt_can_fail()), (pipe) < igt_display_n_crtcs(display) && c=
on__ < (display)->n_outputs; \
>  	     con__ =3D (con__ + 1 < (display)->n_outputs) ? con__ + 1 : (pipe =
=3D pipe + 1, 0)) \
> -		 for_each_if((display)->pipes[pipe].valid) \
> +		for_each_if(igt_crtc_for_pipe((display), (pipe))->valid) \
>  			for_each_if ((((output) =3D &(display)->outputs[con__]), \
>  						igt_pipe_connector_valid((pipe), (output))))
>=20=20
> @@ -793,8 +798,9 @@ igt_output_t **__igt_pipe_populate_outputs(igt_displa=
y_t *display,
>   * If there are no valid planes for this pipe, nothing happens.
>   */
>  #define for_each_plane_on_pipe(display, pipe, plane)			\
> -	for (int j__ =3D 0; assert(igt_can_fail()), (plane) =3D &(display)->pip=
es[(pipe)].planes[j__], \
> -		     j__ < (display)->pipes[(pipe)].n_planes; j__++)
> +	for (int j__ =3D 0; assert(igt_can_fail()), \
> +		     (plane) =3D &igt_crtc_for_pipe((display), (pipe))->planes[j__], \
> +		     j__ < igt_crtc_for_pipe((display), (pipe))->n_planes; j__++)
>=20=20
>  /**
>   * for_each_connector_mode:

--=20
Jani Nikula, Intel
