Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A054F01821
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 11:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF84010ECDA;
	Fri,  6 Mar 2026 11:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KM5z5W5D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C478B10ECDA
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772794843; x=1804330843;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=r0HNSj3kMBTMn6qOprZL5CmyIo7VXKY6xgyR64m99uw=;
 b=KM5z5W5DZtT/tjr0StZS0ahWls6LgEa9nYXqCWkBsvtlIChhNmx/1xHs
 3s68SX6c88RA70MIVg1i8djSS77XPs8Upzkne54PvGqFcuCFiPuPPWut1
 PcaPV/R+nCn2n3/k8lu8gCcETZ0O1pV3/ZlfE9pGPMw9S453o2hFiQxQu
 Z82gVlFcGmLt/vMKOaBaIFBTIV6GznCaTdo2Z7ptrAKFQl32Uzr9czROp
 6d0RHC9YTlzNir3L7Qj0bWne1/ho1HyNxjhr7oP+nEsUwjtE6+5qhb/0S
 LwFHfrPADA5+BhRFfQjI95Yqmc36Y48obUdmUwyE8+IUMfMUvbk1aZr8R g==;
X-CSE-ConnectionGUID: 6T5IInz7S1uigzxHYeE7xw==
X-CSE-MsgGUID: kaQ8KGTRRoyvuWHLJb7+fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73091356"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73091356"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:00:42 -0800
X-CSE-ConnectionGUID: nA20Ua8cSzKEzD7EJoZ43Q==
X-CSE-MsgGUID: Sa6/LjzKS6CIeFXjrlZ6cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="219114899"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:00:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH i-g-t 1/5] tests/nouveau_crc: Extract
 {setup,cleanup}_test()
In-Reply-To: <20260305134038.6995-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
 <20260305134038.6995-2-ville.syrjala@linux.intel.com>
Date: Fri, 06 Mar 2026 13:00:32 +0200
Message-ID: <151de89dadffe3ab8112f5fa03bcf3f9c17fd882@intel.com>
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

On Thu, 05 Mar 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Prep for dynamic subtests by extracting the per-subtest setup/cleanup
> fixtures to separate functions.
>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/nouveau_crc.c | 89 +++++++++++++++++++++++++--------------------
>  1 file changed, 50 insertions(+), 39 deletions(-)
>
> diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
> index c080ded3e621..393414339ab0 100644
> --- a/tests/nouveau_crc.c
> +++ b/tests/nouveau_crc.c
> @@ -317,6 +317,54 @@ static void test_source_outp_inactive(data_t *data)
>  	destroy_crc_colors(data, colors, n_colors);
>  }
>=20=20
> +static void setup_test(data_t *data)
> +{
> +	int dir;
> +
> +	igt_display_require_output_on_crtc(data->crtc);
> +
> +	/* Disable the output from the previous iteration of pipe tests, if the=
re is
> +	 * one
> +	 */
> +	if (data->output) {
> +		igt_output_set_crtc(data->output, NULL);
> +		igt_display_commit(&data->display);
> +	}
> +
> +	data->output =3D igt_get_single_output_for_crtc(data->crtc);
> +	data->mode =3D igt_output_get_mode(data->output);
> +
> +	/* None of these tests need to perform modesets, just page flips. So ru=
nning
> +	 * display setup here is fine
> +	 */
> +	igt_output_set_crtc(data->output,
> +			    data->crtc);
> +	data->primary =3D igt_output_get_plane(data->output, 0);
> +	igt_create_color_fb(data->drm_fd,
> +			    data->mode->hdisplay,
> +			    data->mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 0.0, 0.0,
> +			    &data->default_fb);
> +	igt_plane_set_fb(data->primary, &data->default_fb);
> +	igt_display_commit(&data->display);
> +
> +	dir =3D igt_debugfs_crtc_dir(data->drm_fd,
> +				   data->crtc->pipe,
> +				   O_DIRECTORY);
> +	igt_require_fd(dir);
> +	data->nv_crc_dir =3D openat(dir, "nv_crc", O_DIRECTORY);
> +	close(dir);
> +	igt_require_fd(data->nv_crc_dir);
> +}
> +
> +static void cleanup_test(data_t *data)
> +{
> +	igt_remove_fb(data->drm_fd, &data->default_fb);
> +	close(data->nv_crc_dir);
> +}
> +
>  data_t data =3D {0};
>=20=20
>  #define pipe_test(name) igt_subtest_f("pipe-%s-" name, kmstest_pipe_name=
(pipe))
> @@ -337,46 +385,10 @@ int igt_main()
>=20=20
>  	for_each_pipe_static(pipe) {
>  		igt_fixture() {
> -			int dir;
> -
>  			data.crtc =3D igt_crtc_for_pipe(&data.display, pipe);
>  			igt_require(data.crtc->valid);
> -			igt_display_require_output_on_crtc(data.crtc);
>=20=20
> -			/* Disable the output from the previous iteration of pipe tests, if t=
here is
> -			 * one
> -			 */
> -			if (data.output) {
> -				igt_output_set_crtc(data.output, NULL);
> -				igt_display_commit(&data.display);
> -			}
> -
> -			data.output =3D igt_get_single_output_for_crtc(data.crtc);
> -			data.mode =3D igt_output_get_mode(data.output);
> -
> -			/* None of these tests need to perform modesets, just page flips. So =
running
> -			 * display setup here is fine
> -			 */
> -			igt_output_set_crtc(data.output,
> -					    data.crtc);
> -			data.primary =3D igt_output_get_plane(data.output, 0);
> -			igt_create_color_fb(data.drm_fd,
> -					    data.mode->hdisplay,
> -					    data.mode->vdisplay,
> -					    DRM_FORMAT_XRGB8888,
> -					    DRM_FORMAT_MOD_LINEAR,
> -					    0.0, 0.0, 0.0,
> -					    &data.default_fb);
> -			igt_plane_set_fb(data.primary, &data.default_fb);
> -			igt_display_commit(&data.display);
> -
> -			dir =3D igt_debugfs_crtc_dir(data.drm_fd,
> -						   data.crtc->pipe,
> -						   O_DIRECTORY);
> -			igt_require_fd(dir);
> -			data.nv_crc_dir =3D openat(dir, "nv_crc", O_DIRECTORY);
> -			close(dir);
> -			igt_require_fd(data.nv_crc_dir);
> +			setup_test(&data);
>  		}
>=20=20
>  		/* We don't need to test this on every pipe, but the setup is the same=
 */
> @@ -414,8 +426,7 @@ int igt_main()
>  			test_source_outp_inactive(&data);
>=20=20
>  		igt_fixture() {
> -			igt_remove_fb(data.drm_fd, &data.default_fb);
> -			close(data.nv_crc_dir);
> +			cleanup_test(&data);
>  		}
>  	}

--=20
Jani Nikula, Intel
