Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC29EB28F8
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 09:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6920F10E613;
	Fri,  6 Feb 2026 09:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3ePhQH4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C739410E613
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770369666; x=1801905666;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=Tl8M7GrJgdt6MTgnbA99nQAd2w2Nu7pGujvH3hxrRuI=;
 b=A3ePhQH4f2x3+RuDstPnYpiDTmOjHWELpBeXbWqRomqw1r1HiftTAK8v
 8pgBo7jO5VXkVSJsq44iL1erd8gSV+AZ38xhHejQRjoZlG/7QVpCT/KO4
 JTFrCy1rS0ZKqIhTplG4mn5pSmf5zhf30/zioDxvgOBxcDfMUa8embY50
 UxZ5CSIphxd3p/MFHjnun2aJIpBjo9L/lj2kN7n3EXI/VPdirh72u/Pd5
 2wtK9fuwamINNw1wLfGk+tbsRrNARXYpbXTw8R3dKE7dieKkpYGuPhv2X
 rsMJWXBZm8WF/aMA+Iau6RBPNEGJ+hLb/SC5iQawwWlQLDfe9uhdL34px Q==;
X-CSE-ConnectionGUID: HMCPj6iFTXKDdCeUkLO9zg==
X-CSE-MsgGUID: R+U86eSIQH2zfcSxa4IJkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71476628"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71476628"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:21:05 -0800
X-CSE-ConnectionGUID: qiDlYS/BRaChCsXlR0MM9A==
X-CSE-MsgGUID: GRICcHFeQ76LzBAabKyeqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="248439721"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:21:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 02/12] tests/intel/kms_legacy_colorkey: Convert to
 for_each_crtc()
In-Reply-To: <20260205133019.9161-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
 <20260205133019.9161-3-ville.syrjala@linux.intel.com>
Date: Fri, 06 Feb 2026 11:21:00 +0200
Message-ID: <6233a4d1889c25a9d9eab7d0b9cd9249bf48f250@intel.com>
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
> Replace the for_each_pipe() with for_each_crtc().
> kms_legacy_colorkey is a bit of a special case becasue

*because

> the iterator is a file level static variable.

And yeah, that's icky.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @find@
> iterator name for_each_pipe;
> identifier PIPE;
> @@
> for_each_pipe(..., PIPE) { ... }
>
> @change depends on find@
> typedef igt_crtc_t;
> identifier find.PIPE;
> @@
> - static int PIPE;
> + static igt_crtc_t *crtc;
>
> @depends on find && change@
> iterator name for_each_crtc;
> identifier find.PIPE;
> expression DISPLAY;
> @@
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
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_legacy_colorkey.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/kms_legacy_colorkey.c b/tests/intel/kms_legacy_c=
olorkey.c
> index b720ccf4394b..15def4f35936 100644
> --- a/tests/intel/kms_legacy_colorkey.c
> +++ b/tests/intel/kms_legacy_colorkey.c
> @@ -44,7 +44,7 @@ IGT_TEST_DESCRIPTION("Check that the legacy set colorke=
y ioctl only works on spr
>=20=20
>  static int drm_fd;
>  static igt_display_t display;
> -static int p;
> +static igt_crtc_t *crtc;
>  static igt_plane_t *plane;
>  static uint32_t max_id;
>=20=20
> @@ -66,8 +66,8 @@ int igt_main()
>  		kmstest_set_vt_graphics_mode();
>=20=20
>  		igt_display_require(&display, drm_fd);
> -		for_each_pipe(&display, p) {
> -			for_each_plane_on_pipe(&display, p, plane) {
> +		for_each_crtc(&display, crtc) {
> +			for_each_plane_on_pipe(&display, crtc->pipe, plane) {
>  				max_id =3D max(max_id, plane->drm_plane->plane_id);
>  			}
>  		}
> @@ -77,9 +77,10 @@ int igt_main()
>  	igt_describe("Test to check the legacy set colorkey ioctl "
>  		     "only works for sprite planes.\n");
>  	igt_subtest_with_dynamic("basic") {
> -		for_each_pipe(&display, p) {
> -			igt_dynamic_f("pipe-%s", kmstest_pipe_name(p)) {
> -				for_each_plane_on_pipe(&display, p, plane) {
> +		for_each_crtc(&display, crtc) {
> +			igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
> +				for_each_plane_on_pipe(&display, crtc->pipe,
> +						       plane) {
>  					bool is_valid =3D (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY ||
>  							 plane->type =3D=3D DRM_PLANE_TYPE_CURSOR);

--=20
Jani Nikula, Intel
