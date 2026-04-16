Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB912F8D753
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 15:44:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA5210E8E5;
	Thu, 16 Apr 2026 15:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awlXyieA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70E010E139
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 15:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776354286; x=1807890286;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=7C7rMadqBolx7DN5pkRMi+LR1JGxhfnB93RP4fBkARM=;
 b=awlXyieAxoLYxplkJReJDDH2trBV51By3/Tb9jU6az5mP/bQyIIICP3l
 BObdj233Gr/iKxMDS8TvrGKNiDK5sZBQLqa6QJ5OCJt04RI/GRR8uo7Qi
 NvR8IXQEATzCIxmHhgzUKtyP5dfS9u0H10cvb+YvY7KZa4sKy4BQWHUEQ
 QGC6wj2E2sytHYaX7efq8aWDQ4gzm7rLHJZwBTL9KfPgzTFgHBUwnOfQ/
 i/rEqzsAyfCIU6qzSdIlL63hneh4iZgD4CXe8leh9UpgJ8RE9JH1lMKUF
 8lHeUKRp1G3LvPR87Jw9CZFEN/Mkv2F38XiikHJYNW+9kKndjnaoy3UaV w==;
X-CSE-ConnectionGUID: Fich8BkmRtuFm/LXSXZGBQ==
X-CSE-MsgGUID: bIfocBoDRqGSa+sU5nh5Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77057176"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77057176"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:44:46 -0700
X-CSE-ConnectionGUID: 9zCuyfDTTCGtRcxl10HghA==
X-CSE-MsgGUID: oPMqRTQmQsCcRa2EwvXEpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="231008659"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.108])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:44:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] tests/kms: Use for_each_plane_format()
In-Reply-To: <20260416141334.20086-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260416141334.20086-1-ville.syrjala@linux.intel.com>
 <20260416141334.20086-3-ville.syrjala@linux.intel.com>
Date: Thu, 16 Apr 2026 18:44:40 +0300
Message-ID: <4767f04c74476bdc0ae381fd690dab496d4668d9@intel.com>
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

On Thu, 16 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Replace the open coded copies of for_each_plane_format()
> with the real thing.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/kms_plane_scaling.c | 8 ++++----
>  tests/kms_rotation_crc.c  | 7 +++----
>  2 files changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index fde8b8370c9f..90dc5593579f 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -800,16 +800,16 @@ test_scaler_with_pixel_format_crtc(data_t *d, doubl=
e sf_plane,
>=20=20
>  	for_each_plane_on_crtc(crtc, plane) {
>  		struct igt_vec tested_formats;
> +		int iteration =3D 0;
> +		uint32_t format;
>=20=20
>  		if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
>  			continue;
>=20=20
>  		igt_vec_init(&tested_formats, sizeof(uint32_t));
>=20=20
> -		for (int j =3D 0; j < plane->drm_plane->count_formats; j++) {
> -			uint32_t format =3D plane->drm_plane->formats[j];
> -
> -			if (!test_crtc_iteration(d, crtc, j))
> +		for_each_plane_format(plane, format) {
> +			if (!test_crtc_iteration(d, crtc, iteration++))
>  				continue;
>=20=20
>  			if (test_format(d, &tested_formats, format) &&
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 4420053f1c6d..4a249ed21801 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -606,7 +606,7 @@ static void test_plane_rotation(data_t *data, int pla=
ne_type, bool test_bad_form
>=20=20
>  	for_each_crtc_with_valid_output(display, crtc, output) {
>  		igt_plane_t *plane;
> -		int i, j, c;
> +		int i, c;
>=20=20
>  		igt_display_reset(display);
>=20=20
> @@ -678,12 +678,11 @@ static void test_plane_rotation(data_t *data, int p=
lane_type, bool test_bad_form
>=20=20
>  			if (!data->override_fmt) {
>  				struct igt_vec tested_formats;
> +				uint32_t format;
>=20=20
>  				igt_vec_init(&tested_formats, sizeof(uint32_t));
>=20=20
> -				for (j =3D 0; j < plane->drm_plane->count_formats; j++) {
> -					uint32_t format =3D plane->drm_plane->formats[j];
> -
> +				for_each_plane_format(plane, format) {
>  					if (!test_format(data, &tested_formats, format))
>  						continue;

--=20
Jani Nikula, Intel
