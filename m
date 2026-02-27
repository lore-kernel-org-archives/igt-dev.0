Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92713FD7F90
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 10:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286E610E10A;
	Fri, 27 Feb 2026 10:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CpaBO14h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769D110E10A
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 10:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772189499; x=1803725499;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=X78u1U5r4yk3oBFhPL5MRQCWvB07XY0CSeCKj/QyBfI=;
 b=CpaBO14hid+2eLhY3YrJVNr75eyfoGW9hSiSZ6/qCs37JSoenJlKOtNM
 YwK6O8He4gqxOFYGTsui/llqmW3/XI2gNTmHaMMn4GSwIPoYgnw02mVyb
 uH0YL/kthDctKoh39k/JF6lZDXRggIuSyieyM6jL2WEQ0guU08ZGLiic7
 eggbl+FHm151mXgJl9yoDDJOQxm/YeVNky6wP4PnFp7ZI30p5tYAmTZ5x
 qrkSf3OVf6/WiX+mFAAqdX0TratGCPVZ8zmcb6AFS99uqCWTaJR+ZI69U
 BAEH/+X6h/z9zSSOdLU7l26flhKcglKPtOqBOqWm5mSRyWvTlHN7iZ54s A==;
X-CSE-ConnectionGUID: TGwL5S8wTsCXxEKHkIlOag==
X-CSE-MsgGUID: XM6cBqX3S0KRptPWVujXrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73335990"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73335990"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:51:38 -0800
X-CSE-ConnectionGUID: AOCjQge/QWK4w3OPxEeYpg==
X-CSE-MsgGUID: cSduOqNzTW+0qy/tQ0e8kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="214300548"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 02:51:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 06/17] tests/kms: Clean up crtc->pipe comparions
In-Reply-To: <20260227080653.30389-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
 <20260227080653.30389-7-ville.syrjala@linux.intel.com>
Date: Fri, 27 Feb 2026 12:51:33 +0200
Message-ID: <d5925f05253d820ef88fc4e7cc6081f7ec9ebae6@intel.com>
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
> Change a few leftover crtc->pipe comparisons to
> just compare the crtc pointers instead.

*comparisons in the Subject.

>
>  #include "scripts/iterators.cocci"
>
> @@
> typedef igt_crtc_t;
> igt_crtc_t *CRTC1;
> igt_crtc_t *CRTC2;
> binary operator OP =3D { =3D=3D, !=3D };
> @@
> - CRTC1->pipe OP CRTC2->pipe
> + CRTC1 OP CRTC2
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_display_modes.c  | 2 +-
>  tests/kms_plane_multiple.c | 2 +-
>  tests/kms_tiled_display.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index 6c17f002d8c8..18582cf1500c 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -201,7 +201,7 @@ static void run_extendedmode_test(data_t *data) {
>  					      output1) {
>=20=20
>  			for_each_crtc(display, crtc2) {
> -				if (crtc->pipe =3D=3D crtc2->pipe)
> +				if (crtc =3D=3D crtc2)
>  					continue;
>=20=20
>  				for_each_valid_output_on_crtc_local(display, crtc2,
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 660283df751d..d8a32d9526ad 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -548,7 +548,7 @@ static void run_2_display_test(data_t *data, uint64_t=
 modifier, const char *name
>  					      crtc,
>  					      output1) {
>  			for_each_crtc(display, crtc2) {
> -				if (crtc->pipe =3D=3D crtc2->pipe)
> +				if (crtc =3D=3D crtc2)
>  					continue;
>=20=20
>  				for_each_valid_output_on_crtc_local(display, crtc2,
> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
> index 8aae2bcaadba..95e45ed416d1 100644
> --- a/tests/kms_tiled_display.c
> +++ b/tests/kms_tiled_display.c
> @@ -237,7 +237,7 @@ static void setup_mode(data_t *data)
>=20=20
>  			if (count > 0) {
>  				for (prev =3D count - 1; prev >=3D 0; prev--) {
> -					if (crtc->pipe =3D=3D conns[prev].crtc->pipe) {
> +					if (crtc =3D=3D conns[prev].crtc) {
>  						pipe_in_use =3D true;
>  						break;
>  					}

--=20
Jani Nikula, Intel
