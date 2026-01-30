Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A673AE6BF0D
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 13:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DB910E9E9;
	Fri, 30 Jan 2026 13:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yo4j1y4q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F3010E9E9
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 13:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769780362; x=1801316362;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=as7nONZqW1oYj5wY3nDQjdrQibLtHlzqzSidBYlHIe0=;
 b=Yo4j1y4qIY7HUjVatAxkt6o9k45dbdjO1ak1aspn71mRR4+425avRchO
 A5xItgoRVIm2VLNFjDdCJoWZblVm6VIBi3jI2PUJv1irc+/QdtMtaHYHt
 pw3gzg28Ie81o98c7MKHPqOzYO6rcLdE8dHx8HuWgajZML1nJ/KwBcNze
 Do20vOClhJHTUKjDct12IFVcXVxVMiy5B9bLaOLopHaV+UKacWv6uY6Vb
 6Us9FrZnUIfI4fmu3eLLEZ7Na2TOxkcxaPUsYoSBS+03M8fVVlTC+SCQb
 bvyF2ka00YNaOa4OFxXXIjU0Fu6ZAIqt8r88aGmOTis/SXShSxSR5Ftww A==;
X-CSE-ConnectionGUID: jbys8He2RCG7lbJDGjrCjA==
X-CSE-MsgGUID: CQU0n1byRauXvI2/HDbxXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81763476"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="81763476"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:39:22 -0800
X-CSE-ConnectionGUID: Oo9dX9fqQr+/d0hMYNyLlg==
X-CSE-MsgGUID: vvwGiVTCRXyx0ryP0NmiCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="209104997"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:39:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 02/15] tests/drm_read: Use for_each_crtc*()
In-Reply-To: <20260130105237.14481-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-3-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 15:39:18 +0200
Message-ID: <a7d1c4e07b761b9ff2d5ff2f456053377433e996@intel.com>
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

On Fri, 30 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert tests/drm_read to use the crtc based iterators
> (as opposed to the old pipe based ones).
>
> This one was done manually due to coccinelle refusing
> to cooperate with me.
>
> I left the old 'pipe' variable around since its final value
> gets used in a bunch of places after the loop. I'll probably
> need further cleanup later, but this seems sufficient for now.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/drm_read.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/tests/drm_read.c b/tests/drm_read.c
> index c44e207f7dd8..e745e98534bd 100644
> --- a/tests/drm_read.c
> +++ b/tests/drm_read.c
> @@ -280,6 +280,7 @@ int igt_main()
>  	igt_fixture() {
>  		struct sigaction alarm_action =3D {};
>  		igt_output_t *output;
> +		igt_crtc_t *crtc;
>=20=20
>  		igt_assert_neq(sigaction(SIGALRM, NULL, &alarm_action), -1);
>  		alarm_action.sa_flags &=3D ~SA_RESTART;
> @@ -292,16 +293,17 @@ int igt_main()
>  		igt_display_require(&display, fd);
>  		igt_display_require_output(&display);
>=20=20
> -		for_each_pipe_with_valid_output(&display, pipe, output) {
> +		for_each_crtc_with_valid_output(&display, crtc, output) {
>  			drmModeModeInfo *mode =3D igt_output_get_mode(output);
>=20=20
>  			igt_create_pattern_fb(fd, mode->hdisplay, mode->vdisplay,
>  					      DRM_FORMAT_XRGB8888,
>  					      DRM_FORMAT_MOD_LINEAR, &fb);
>=20=20
> -			igt_output_set_crtc(output,
> -				            igt_crtc_for_pipe(output->display, pipe));
> +			igt_output_set_crtc(output, crtc);
>  			igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRI=
MARY), &fb);
> +
> +			pipe =3D crtc->pipe;
>  			break;
>  		}

--=20
Jani Nikula, Intel
