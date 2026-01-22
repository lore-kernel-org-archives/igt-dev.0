Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173DDD3EE74
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 15:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5F910E06E;
	Thu, 22 Jan 2026 15:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoeoN3k/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A82E10E06E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 15:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769094217; x=1800630217;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=GegXlARGzBQhgiVoiv0QWs9POjhUs23+/RSyQ+ToHhs=;
 b=hoeoN3k/Nvn7PcCWNAqNnt5YyczuoUcyJzrYS/vC3D+DJaZ0rKH0+5Bi
 DLoEfR588Hhb25pe44BqRTueHB7FtUHmky2wKzqOesgJK6wNsb3WCNDr4
 M+xRf1tHzfxgwK+dYUZ2IQADPUSQBkNLHr0dPAgHI3/SguZFQeevyN6UZ
 XoAHO+UVSzbtS0ByaBJyk6Wi9YgNLCIJFAKzguHxs0Q68U+SakqD6LeKX
 3IXaKCTuDsDYU6ejpTXYKmOZOhlChDjEIPjvQ69OmQ+MOfxHVQLWdtESY
 si07D0OVoT1EV/hGA3svf3ey8gRNkZW5EKZ8+XfReVOIQI3SerzaeWJ7X g==;
X-CSE-ConnectionGUID: erXhulEwTsmyLtGX636rWw==
X-CSE-MsgGUID: c3PbGH59R1mScGdMY5p9Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="69355640"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="69355640"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:03:37 -0800
X-CSE-ConnectionGUID: lGxXwPvOSQm3adJ4qtRqzg==
X-CSE-MsgGUID: kyhBfgc9T/WqjJAu4sURrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="211611668"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:03:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 09/10] lib/kms: Rename 'pipe[]' variables to 'crtc[]'
In-Reply-To: <20260122125937.10807-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
 <20260122125937.10807-10-ville.syrjala@linux.intel.com>
Date: Thu, 22 Jan 2026 17:03:32 +0200
Message-ID: <09ff7f190da242354df3142716a5b191ed76f618@intel.com>
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

On Thu, 22 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Rename a lot of the igt_crtc_t* arrays to
> 'crtc[]' from the misleading 'pipe[]'/etc names
> they are using currently.
>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @find@
> identifier CRTC;
> type T;
> @@
> T {
>   ...
>   igt_crtc_t *
> -  CRTC
> +  crtc
>   [...];
>   ...
> }
>
> @depends on find@
> identifier find.CRTC;
> type find.T;
> T *DATA;
> @@
> - DATA->CRTC
> + DATA->crtc
>
> @depends on find@
> identifier find.CRTC;
> type find.T;
> T DATA;
> @@
> - DATA.CRTC
> + DATA.crtc
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/amdgpu/amd_dp_dsc.c  | 10 +++++-----
>  tests/amdgpu/amd_hotplug.c | 19 ++++++++++---------
>  tests/amdgpu/amd_plane.c   | 29 ++++++++++++++++-------------
>  tests/amdgpu/amd_subvp.c   |  8 ++++----
>  tests/kms_bw.c             | 12 ++++++------
>  5 files changed, 41 insertions(+), 37 deletions(-)
>
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index 25ea4660c821..266211dda81f 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -36,7 +36,7 @@ typedef struct data {
>  	igt_display_t display;
>  	igt_plane_t *primary[MAX_PIPES];
>  	igt_output_t *output[MAX_PIPES];
> -	igt_crtc_t *pipe[MAX_PIPES];
> +	igt_crtc_t *crtc[MAX_PIPES];
>  	igt_pipe_crc_t *pipe_crc[MAX_PIPES];
>  	drmModeModeInfo mode[MAX_PIPES];
>  	enum pipe pipe_id[MAX_PIPES];
> @@ -65,12 +65,12 @@ static void test_init(data_t *data)
>=20=20
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] =3D PIPE_A + i;
> -		data->pipe[i] =3D igt_crtc_for_pipe(&data->display,
> +		data->crtc[i] =3D igt_crtc_for_pipe(&data->display,
>  						  data->pipe_id[i]);
> -		data->primary[i] =3D igt_crtc_get_plane_type(
> -				data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
> +		data->primary[i] =3D igt_crtc_get_plane_type(data->crtc[i],
> +							   DRM_PLANE_TYPE_PRIMARY);
>  		data->pipe_crc[i] =3D
> -				igt_crtc_crc_new(data->pipe[i],
> +				igt_crtc_crc_new(data->crtc[i],
>  						 IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>=20=20
> diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> index 82de393b6d32..5aaf97bc812a 100644
> --- a/tests/amdgpu/amd_hotplug.c
> +++ b/tests/amdgpu/amd_hotplug.c
> @@ -39,7 +39,7 @@ typedef struct data {
>  	igt_plane_t *overlay[MAX_PIPES];
>  	igt_plane_t *cursor[MAX_PIPES];
>  	igt_output_t *output[MAX_PIPES];
> -	igt_crtc_t *pipe[MAX_PIPES];
> +	igt_crtc_t *crtc[MAX_PIPES];
>  	igt_pipe_crc_t *pipe_crc[MAX_PIPES];
>  	drmModeModeInfo mode[MAX_PIPES];
>  	enum pipe pipe_id[MAX_PIPES];
> @@ -55,16 +55,17 @@ static void test_init(data_t *data)
>=20=20
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] =3D PIPE_A + i;
> -		data->pipe[i] =3D igt_crtc_for_pipe(&data->display,
> +		data->crtc[i] =3D igt_crtc_for_pipe(&data->display,
>  						  data->pipe_id[i]);
> -		data->primary[i] =3D igt_crtc_get_plane_type(
> -			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
> -		data->overlay[i] =3D igt_crtc_get_plane_type_index(
> -			data->pipe[i], DRM_PLANE_TYPE_OVERLAY, 0);
> -		data->cursor[i] =3D igt_crtc_get_plane_type(
> -			data->pipe[i], DRM_PLANE_TYPE_CURSOR);
> +		data->primary[i] =3D igt_crtc_get_plane_type(data->crtc[i],
> +							   DRM_PLANE_TYPE_PRIMARY);
> +		data->overlay[i] =3D igt_crtc_get_plane_type_index(data->crtc[i],
> +								 DRM_PLANE_TYPE_OVERLAY,
> +								 0);
> +		data->cursor[i] =3D igt_crtc_get_plane_type(data->crtc[i],
> +							  DRM_PLANE_TYPE_CURSOR);
>  		data->pipe_crc[i] =3D
> -			igt_crtc_crc_new(data->pipe[i],
> +			igt_crtc_crc_new(data->crtc[i],
>  					 IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>=20=20
> diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
> index 369bce509a87..7c57a5e0934d 100644
> --- a/tests/amdgpu/amd_plane.c
> +++ b/tests/amdgpu/amd_plane.c
> @@ -44,7 +44,7 @@ typedef struct data {
>  	igt_plane_t *overlay[MAX_PIPES];
>  	igt_plane_t *overlay2[MAX_PIPES];
>          igt_output_t *output[MAX_PIPES];
> -        igt_crtc_t *pipe[MAX_PIPES];
> +        igt_crtc_t *crtc[MAX_PIPES];
>          igt_pipe_crc_t *pipe_crc[MAX_PIPES];
>          drmModeModeInfo mode[MAX_PIPES];
>          enum pipe pipe_id[MAX_PIPES];
> @@ -156,17 +156,19 @@ static void test_init(data_t *data)
>=20=20
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] =3D PIPE_A + i;
> -		data->pipe[i] =3D igt_crtc_for_pipe(display, data->pipe_id[i]);
> -		data->primary[i] =3D igt_crtc_get_plane_type(
> -			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
> -		data->overlay[i] =3D igt_crtc_get_plane_type_index(
> -			data->pipe[i], DRM_PLANE_TYPE_OVERLAY, 0);
> -		data->overlay2[i] =3D igt_crtc_get_plane_type_index(
> -			data->pipe[i], DRM_PLANE_TYPE_OVERLAY, 1);
> -		data->cursor[i] =3D igt_crtc_get_plane_type(
> -			data->pipe[i], DRM_PLANE_TYPE_CURSOR);
> +		data->crtc[i] =3D igt_crtc_for_pipe(display, data->pipe_id[i]);
> +		data->primary[i] =3D igt_crtc_get_plane_type(data->crtc[i],
> +							   DRM_PLANE_TYPE_PRIMARY);
> +		data->overlay[i] =3D igt_crtc_get_plane_type_index(data->crtc[i],
> +								 DRM_PLANE_TYPE_OVERLAY,
> +								 0);
> +		data->overlay2[i] =3D igt_crtc_get_plane_type_index(data->crtc[i],
> +								  DRM_PLANE_TYPE_OVERLAY,
> +								  1);
> +		data->cursor[i] =3D igt_crtc_get_plane_type(data->crtc[i],
> +							  DRM_PLANE_TYPE_CURSOR);
>  		data->pipe_crc[i] =3D
> -			igt_crtc_crc_new(data->pipe[i],
> +			igt_crtc_crc_new(data->crtc[i],
>  					 IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>=20=20
> @@ -265,7 +267,7 @@ static void set_regamma_lut(data_t *data, lut_t const=
 *lut, int n)
>  {
>  	size_t size =3D lut ? sizeof(lut->data) * lut->size : 0;
>  	const void *ptr =3D lut ? lut->data : NULL;
> -	igt_crtc_replace_prop_blob(data->pipe[n], IGT_CRTC_GAMMA_LUT, ptr,
> +	igt_crtc_replace_prop_blob(data->crtc[n], IGT_CRTC_GAMMA_LUT, ptr,
>  				       size);
>  }
>=20=20
> @@ -627,7 +629,8 @@ static void test_display_mpo(data_t *data, enum test =
test, uint32_t format, int
>  	igt_skip_on_f(valid_outputs < display_count,
>  			"Valid outputs (%d) should be equal or greater than %d\n", valid_outp=
uts, display_count);
>=20=20
> -	regamma_lut_size =3D igt_crtc_get_prop(data->pipe[0], IGT_CRTC_GAMMA_LU=
T_SIZE);
> +	regamma_lut_size =3D igt_crtc_get_prop(data->crtc[0],
> +					     IGT_CRTC_GAMMA_LUT_SIZE);
>  	igt_assert_lt(0, regamma_lut_size);
>  	lut_init(&lut, regamma_lut_size);
>  	lut_gen(&lut);
> diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
> index f6465ba35b50..bfb747bf35a4 100644
> --- a/tests/amdgpu/amd_subvp.c
> +++ b/tests/amdgpu/amd_subvp.c
> @@ -16,7 +16,7 @@ struct data {
>  	igt_display_t display;
>  	igt_plane_t *primary[IGT_MAX_PIPES];
>  	igt_output_t *output[IGT_MAX_PIPES];
> -	igt_crtc_t *pipe[IGT_MAX_PIPES];
> +	igt_crtc_t *crtc[IGT_MAX_PIPES];
>  	igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
>  	drmModeModeInfo mode[IGT_MAX_PIPES];
>  	enum pipe pipe_id[IGT_MAX_PIPES];
> @@ -65,11 +65,11 @@ static void test_init(struct data *data)
>=20=20
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] =3D PIPE_A + i;
> -		data->pipe[i] =3D igt_crtc_for_pipe(&data->display,
> +		data->crtc[i] =3D igt_crtc_for_pipe(&data->display,
>  						  data->pipe_id[i]);
> -		data->primary[i] =3D igt_crtc_get_plane_type(data->pipe[i],
> +		data->primary[i] =3D igt_crtc_get_plane_type(data->crtc[i],
>  							   DRM_PLANE_TYPE_PRIMARY);
> -		data->pipe_crc[i] =3D igt_crtc_crc_new(data->pipe[i],
> +		data->pipe_crc[i] =3D igt_crtc_crc_new(data->crtc[i],
>  						     IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>=20=20
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index 13e2bdfba266..646210ae653a 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -67,7 +67,7 @@ typedef struct data {
>          igt_plane_t *primary[IGT_MAX_PIPES];
>          igt_output_t *output[IGT_MAX_PIPES];
>  	igt_output_t *connected_output[IGT_MAX_PIPES];
> -        igt_crtc_t *pipe[IGT_MAX_PIPES];
> +        igt_crtc_t *crtc[IGT_MAX_PIPES];
>          igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
>          drmModeModeInfo mode[IGT_MAX_PIPES];
>          enum pipe pipe_id[IGT_MAX_PIPES];
> @@ -125,17 +125,17 @@ static void test_init(data_t *data, bool physical)
>=20=20
>  	for_each_pipe(display, i) {
>  		data->pipe_id[i] =3D i;
> -		data->pipe[i] =3D igt_crtc_for_pipe(&data->display,
> +		data->crtc[i] =3D igt_crtc_for_pipe(&data->display,
>  						  data->pipe_id[i]);
> -		data->primary[i] =3D igt_crtc_get_plane_type(
> -			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
> +		data->primary[i] =3D igt_crtc_get_plane_type(data->crtc[i],
> +							   DRM_PLANE_TYPE_PRIMARY);
>  		data->pipe_crc[i] =3D
> -			igt_crtc_crc_new(data->pipe[i],
> +			igt_crtc_crc_new(data->crtc[i],
>  					 IGT_PIPE_CRC_SOURCE_AUTO);
>  	}
>=20=20
>  	for (i =3D 0; i < display->n_outputs && i < max_pipes; i++) {
> -		if (!data->pipe[i] && !physical)
> +		if (!data->crtc[i] && !physical)
>  			continue;
>=20=20
>  		output =3D &display->outputs[i];

--=20
Jani Nikula, Intel
