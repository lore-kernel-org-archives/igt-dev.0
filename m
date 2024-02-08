Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EF7C48260
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 18:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA9410E403;
	Thu,  8 Feb 2024 18:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mP1mLVds";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D0110E403
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 18:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707417265; x=1738953265;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jdghrXjGCT5L/AE8Qj+bqlv1UmoCh7cOfPpejoamXNY=;
 b=mP1mLVdsiyOCCQETxYiB9DOJIssDdsO4y9rODvZ78EcGXIVYvcbfWMxA
 3W81Sd8Ub028YvkGTlLejcDcr8yo0aI5u0lO0H7VCT6Ed5oAXlhIr0lO+
 Uv45t5Wn8Q4mCljR4XOswwXSsX8hjiTLq+y8CpGFU7dfioPoVaZpx3YkI
 AcZvVDSlY4Kl7K5at1PipfNC0FqL003JuUk+TkL+zMtSuCwxPu589IMhx
 Hte9PL/QenVXHtQ1eCHiJqljPytl/VBPEer8ZIlrieOrIsAgIZiwevc5D
 IchXdGgDRAKqhj7Bwl0U+SANkDiE33YJ1Jgg1ORFEeRJt1Sp2kwRVAsPW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1183483"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1183483"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:34:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1759443"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 10:34:22 -0800
Date: Thu, 8 Feb 2024 19:34:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Hersen Wu <hersenxs.wu@amd.com>, rodrigo.siqueira@amd.com,
 aurabindo.pillai@amd.com, alex.hung@amd.com, hamza.mahfooz@amd.com,
 wayne.lin@amd.com, markyacoub@google.com
Subject: Re: [PATCH] [i-g-t] tests/amdgpu/amd_bypass: Fix psr edp rx crc read
 timeout
Message-ID: <20240208183418.u65kg72v4npwnq7e@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Hersen Wu <hersenxs.wu@amd.com>,
 rodrigo.siqueira@amd.com, aurabindo.pillai@amd.com,
 alex.hung@amd.com, hamza.mahfooz@amd.com, wayne.lin@amd.com,
 markyacoub@google.com
References: <20240202151026.52210-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240202151026.52210-1-hersenxs.wu@amd.com>
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

Hi Hersen,
On 2024-02-02 at 10:10:25 -0500, Hersen Wu wrote:
> With debugfs disallow_edp_enter_psr = true, disable edp psr
> before tx reading rx crc.
> 
> DPMS off, tx writes dpcd 0x600=2. eDP rx will reset dpcd 0x170=0.
> Rx psr and crc check for rx internal logic are disabled.
> With disallow_edp_enter_psr = true, when DPMS on, kernel driver
> will turn on edp. eDP Rx keep dpcd 0x170=0 (default value).
> Then tx reads eDP rx crc successfully.

These looks like a comment from lib/igt_amd.c at function
igt_amd_disallow_edp_enter_psr

Imho no need for coping this here or you should extend
comment in lib.

Regards,
Kamil

> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>  tests/amdgpu/amd_bypass.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index d192a30ea..01946de24 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -72,6 +72,17 @@ static void test_init(data_t *data)
>  	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
>  	igt_assert(data->output);
>  
> +	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +		kmstest_set_connector_dpms(data->output->display->drm_fd,
> +			data->output->config.connector, DRM_MODE_DPMS_OFF);
> +
> +		/* Disable PSR before reading eDP Rx CRC to avoid timeout */
> +		igt_amd_disallow_edp_enter_psr(data->drm_fd, data->output->name, true);
> +
> +		kmstest_set_connector_dpms(data->output->display->drm_fd,
> +			data->output->config.connector, DRM_MODE_DPMS_ON);
> +	}
> +
>  	data->mode = igt_output_get_mode(data->output);
>  	igt_assert(data->mode);
>  
> @@ -367,9 +378,23 @@ static void bypass_8bpc_test(data_t *data)
>  		igt_assert_crc_equal(&data->crc_fb, &data->crc_dprx);
>  	}
>  
> +	/* igt_pipe_crc_stop is called within igt_pipe_crc_collect_crc,
> +	 * but kernel drm_dp_aux_crc_work is not flushed out. Create
> +	 * and commit of new fb let kernel stop dp aux crc work.
> +	 */
> +	igt_create_pattern_fb(data->drm_fd, data->width, data->height,
> +			DRM_FORMAT_XRGB8888, 0, &fb);
> +	igt_plane_set_fb(data->primary, &fb);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
>  	igt_plane_set_fb(data->primary, NULL);
>  	test_fini(data);
>  	igt_remove_fb(data->drm_fd, &fb);
> +
> +	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +		/* Enable eDP PSR within kernel driver */
> +		igt_amd_disallow_edp_enter_psr(data->drm_fd, data->output->name, false);
> +	}
>  }
>  
>  igt_main
> -- 
> 2.25.1
> 
