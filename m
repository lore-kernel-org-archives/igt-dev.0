Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8944E99078
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 10:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5B010E945;
	Fri, 10 Apr 2026 10:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZU/bguaW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2EC10E945
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 10:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775816749; x=1807352749;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dbKQFCRQbJpfOZaqSe4aoB2lrHbyLmIfyNyn+Z147Jw=;
 b=ZU/bguaW/rM0zkq5Ikk9EUwD4TR4R4kP9pY4Yur2dwawy/GDeMsuyt33
 x/bZk8brkgjlsoMkgiu5UQHmpx3B8t2nwguLuKKj9+zDDPibBF/Mrc/mL
 NEO9NOf1SEPYCtpNXCtHRyO0r/awfW3Aa/uwanWRRUgTTKTXSX90Dmblz
 VejbpqtGfmUI5u47l8bDG5wD4nSAtM6JFP2dIy2iZBQLQT6/i5OUVjDde
 aSNW5gcJ1Io0kt3riokorxbNfc2YXSowPYzWVwlfP60VYU3pdZmTCNiVg
 RUc2RPnU86Jq7+EjernGb/sWdNQRhu1Anat2CA9nobq5KzooobD+KpfTW g==;
X-CSE-ConnectionGUID: PVXsJrRKQMS6u/gYf1Jj+A==
X-CSE-MsgGUID: QbYBfgjDQMaawOhTPlO0UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87910820"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="87910820"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 03:25:48 -0700
X-CSE-ConnectionGUID: ctiy4B6AQOaSLcQx+TsMaA==
X-CSE-MsgGUID: 70DAEG8kS8a/IpkjeNlcIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="228930387"
Received: from zzombora-mobl1 (HELO localhost) ([10.245.244.89])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 03:25:44 -0700
Date: Fri, 10 Apr 2026 13:25:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Message-ID: <adjQJE8Ok5K_sNuc@intel.com>
References: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Apr 10, 2026 at 06:07:31PM +0800, Jason-JH Lin wrote:
> Adapt rotation CRC tests for MTK devices by using Intel-like pipe CRC
> approach with explicit vblank synchronization.
> MTK devices require a vblank wait to ensure rotation completes before
> CRC capture.

Instead of adding these checks all over igt I think you should
try to fix you kernel CRC implementation to not hand out garbage
CRCs.

> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>  tests/kms_rotation_crc.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 4420053f1c6d..972fe9f56839 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -310,12 +310,12 @@ static void prepare_crtc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
>  	/* defer crtc cleanup + crtc active for later on amd - not valid
>  	 * to enable CRTC without a plane active
>  	 */
> -	if (!is_amdgpu_device(data->gfx_fd))
> +	if (is_intel_device(data->gfx_fd) || is_mtk_device(data->gfx_fd))
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  	data->pipe_crc = igt_crtc_crc_new(crtc,
>  				          IGT_PIPE_CRC_SOURCE_AUTO);
>  
> -	if (!is_amdgpu_device(data->gfx_fd) && start_crc)
> +	if ((is_intel_device(data->gfx_fd) || is_mtk_device(data->gfx_fd)) && start_crc)
>  		igt_pipe_crc_start(data->pipe_crc);
>  }
>  
> @@ -324,7 +324,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
>  #define TEST_HEIGHT(km) \
>  	 min_t((km)->vdisplay, (km)->vdisplay, TEST_MAX_HEIGHT)
>  
> -static void prepare_fbs(data_t *data, igt_output_t *output,
> +static void prepare_fbs(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
>  			igt_plane_t *plane, enum rectangle_type rect, uint32_t format)
>  {
>  	drmModeModeInfo *mode;
> @@ -410,6 +410,8 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
>  				data->pipe_crc,
>  				&data->crc_rect[data->output_crc_in_use][rect].flip_crc);
>  		} else {
> +			if (is_mtk_device(data->gfx_fd))
> +				igt_wait_for_vblank(crtc);
>  			igt_pipe_crc_get_current(
>  				display->drm_fd, data->pipe_crc,
>  				&data->crc_rect[data->output_crc_in_use][rect].flip_crc);
> @@ -434,6 +436,8 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
>  				&data->crc_rect[data->output_crc_in_use][rect].ref_crc);
>  			igt_remove_fb(data->gfx_fd, &data->fb_flip);
>  		} else {
> +			if (is_mtk_device(data->gfx_fd))
> +				igt_wait_for_vblank(crtc);
>  			igt_pipe_crc_get_current(
>  				display->drm_fd, data->pipe_crc,
>  				&data->crc_rect[data->output_crc_in_use][rect].ref_crc);
> @@ -472,7 +476,7 @@ static void test_single_case(data_t *data, igt_crtc_t *crtc,
>  
>  	igt_debug("Testing case %i on pipe %s, format %s\n", rect,
>  		  igt_crtc_name(crtc), igt_format_str(format));
> -	prepare_fbs(data, output, plane, rect, format);
> +	prepare_fbs(data, output, crtc, plane, rect, format);
>  
>  	igt_plane_set_rotation(plane, data->rotation);
>  	if (igt_rotation_90_or_270(data->rotation))
> @@ -499,6 +503,8 @@ static void test_single_case(data_t *data, igt_crtc_t *crtc,
>  	if (is_amdgpu_device(data->gfx_fd)) {
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_output);
>  	} else {
> +		if (is_mtk_device(data->gfx_fd))
> +			igt_wait_for_vblank(crtc);
>  		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
>  								 &crc_output);
>  	}
> @@ -530,6 +536,8 @@ static void test_single_case(data_t *data, igt_crtc_t *crtc,
>  		if (is_amdgpu_device(data->gfx_fd)) {
>  			igt_pipe_crc_collect_crc(data->pipe_crc, &crc_output);
>  		} else {
> +			if (is_mtk_device(data->gfx_fd))
> +				igt_wait_for_vblank(crtc);
>  			igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
>  									 &crc_output);
>  		}
> @@ -701,7 +709,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>  						 data->override_fmt, test_bad_format);
>  			}
>  		}
> -		if (is_intel_device(data->gfx_fd)) {
> +		if (is_intel_device(data->gfx_fd) || is_mtk_device(data->gfx_fd)) {
>  			igt_pipe_crc_stop(data->pipe_crc);
>  		}
>  	}
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
