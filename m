Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9ABEA795E
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 09:46:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC5010E6CC;
	Fri,  6 Feb 2026 09:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sz8ki9BJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33AB10E6AD
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770371195; x=1801907195;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=17io2XSiQOTnjQk2dRPMOB3Kp+jxY+OH4aasYyNZhHM=;
 b=Sz8ki9BJ/z/kHIMvIj/a+5BbgEGf2FK15g2cFZ/Lw88y1VWmOx/e6xHu
 Wxl6Mm0ngpOyTogGmS7zOQtWqh95CpUgjBpUgk3cEKWyj5vlzip4GkfyC
 L+vKqOcxDtKIFDpFVA9+UylS524Nqg65PMm95K9kRz/2kIaal0a4QiaYn
 OgqG84aV6tgxgWt6OYOZCv4lAe3ZqLV6r+xCzpZl2w0ZiajbSBW3XOmOl
 mH9NGDtzvsK/5GprnY+XI7rvmwLpaKrV5QWM5xg2C3vA4bg44W/C0/zqu
 0CqMdgReLwt/j4RxTc2RvesgM0fxGPfHlnbfgmNJ8Q3F1obIIyEd8J0KP Q==;
X-CSE-ConnectionGUID: uqHXeOY7RYmDmxUY8ywX5w==
X-CSE-MsgGUID: 0WXkOgq+Sn2HU8VE/1UrSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70593633"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="70593633"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:46:34 -0800
X-CSE-ConnectionGUID: XzaDEUD6SLOZtys+S8oN1A==
X-CSE-MsgGUID: Da0RxcFoT+2TF+uBLJUXLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="241492447"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:46:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 10/12] tests/kms: Convert to for_each_crtc(), part 5
In-Reply-To: <20260205133019.9161-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
 <20260205133019.9161-11-ville.syrjala@linux.intel.com>
Date: Fri, 06 Feb 2026 11:46:30 +0200
Message-ID: <51ae3d359ac9b95f46fa28cac18ef73a96132d08@intel.com>
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
> Convert more for_each_pipe()s into for_each_crtc(). Deal
> with the special case where we use the iterator variable
> after breaking out from the loop.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @@
> iterator name for_each_pipe;
> iterator name for_each_crtc;
> typedef igt_crtc_t;
> identifier PIPE;
> expression DISPLAY;
> @@
> - enum pipe PIPE;
> + igt_crtc_t *crtc;
> <+...
> - for_each_pipe(DISPLAY, PIPE)
> + for_each_crtc(DISPLAY, crtc)
> {
> <...
> (
> - igt_crtc_for_pipe(..., PIPE)
> + crtc
> |
> - kmstest_pipe_name(PIPE)
> + igt_crtc_name(crtc)
> |
> - PIPE
> + crtc->pipe
> )
> ...>
> }
> ...+>
> - return PIPE;
> + return crtc->pipe;
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_cursor_legacy.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index da7225c45e65..717a31f4fa64 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -425,7 +425,7 @@ static void populate_cursor_args(igt_display_t *displ=
ay, enum pipe pipe,
>  static enum pipe
>  find_connected_pipe(igt_display_t *display, bool second, igt_output_t **=
output)
>  {
> -	enum pipe pipe;
> +	igt_crtc_t *crtc;
>  	bool first_output =3D false;
>  	bool found =3D false;
>=20=20
> @@ -437,13 +437,13 @@ find_connected_pipe(igt_display_t *display, bool se=
cond, igt_output_t **output)
>  	/* Clear display, events will be eaten by commit.. */
>  	igt_display_reset(display);
>=20=20
> -	for_each_pipe(display, pipe) {
> -		for_each_valid_output_on_pipe(display, pipe, *output) {
> +	for_each_crtc(display, crtc) {
> +		for_each_valid_output_on_pipe(display, crtc->pipe, *output) {
>  			if (igt_output_get_driving_crtc(*output) !=3D NULL)
>  				continue;
>=20=20
>  			igt_output_set_crtc(*output,
> -					    igt_crtc_for_pipe((*output)->display, pipe));
> +					    crtc);
>  			if (intel_pipe_output_combo_valid(display)) {
>  				found =3D true;
>=20=20
> @@ -466,7 +466,7 @@ find_connected_pipe(igt_display_t *display, bool seco=
nd, igt_output_t **output)
>  	else
>  		igt_require_f(found, "No valid outputs found\n");
>=20=20
> -	return pipe;
> +	return crtc->pipe;
>  }
>=20=20
>  static void flip_nonblocking(igt_display_t *display, enum pipe pipe_id, =
bool atomic, struct igt_fb *fb, void *data)

--=20
Jani Nikula, Intel
