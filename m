Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1AECD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 18:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FFB10E1F2;
	Wed,  3 Apr 2024 18:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCRs4htU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F3210E1F2
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 18:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712170689; x=1743706689;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Yxffb/eIfSySguCD4Z3sPneCZkseknIhvZs9nbi6p24=;
 b=VCRs4htUnCxWp8N36++L522puXBQWvQE7SQle6XCedfxNrakVh2qvg8M
 Nor/GijI9/XqQdU3TlA2reEqOckVJEa8b1MtzOy/wWO8orQVdRzBDJR8c
 NFPNSAtErw7l1D6AHQ1nWQQK0hAwFgzygQJT8r73waMod9q2Lbn1sZ5dm
 iy6F9DS9fhbNnl4w5KfrBgS8+XFASf8eQGuAqKooreQ9LjB8qJlJ2SVtl
 4B9skOgQ4yP4WaSQ8zzbUdh7SAtvzqJ2QIweBX83tM5h8VUojp/WWPTFy
 Nosjd2JzeriC9udho8VihBd0KvjwMW4+/R0Jnim3BAeruwutayF5dO2G5 w==;
X-CSE-ConnectionGUID: etPwSN3wSZ6sxzRD7IrlZg==
X-CSE-MsgGUID: NkoE+6XET3iXGl0zAzJLPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7560213"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7560213"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 11:58:09 -0700
X-CSE-ConnectionGUID: bDbVzLHXQzSPkX1aRow7IA==
X-CSE-MsgGUID: NRllIv1HQ+etf97gbQA8rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="55984889"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 11:58:06 -0700
Date: Wed, 3 Apr 2024 20:57:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Hersen Wu <hersenxs.wu@amd.com>, rodrigo.siqueira@amd.com,
 aurabindo.pillai@amd.com, alex.hung@amd.com, hamza.mahfooz@amd.com,
 sunpeng.li@amd.com, wayne.lin@amd.com, markyacoub@google.com
Subject: Re: [PATCH] [i-g-t] tests/amdgpu/amd_ilr: Fix eDP PSR not be
 re-enabled after test
Message-ID: <20240403185746.qqvqdps6lbfaqdz7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Hersen Wu <hersenxs.wu@amd.com>,
 rodrigo.siqueira@amd.com, aurabindo.pillai@amd.com,
 alex.hung@amd.com, hamza.mahfooz@amd.com, sunpeng.li@amd.com,
 wayne.lin@amd.com, markyacoub@google.com
References: <20240403142830.25987-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240403142830.25987-1-hersenxs.wu@amd.com>
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
On 2024-04-03 at 10:28:30 -0400, Hersen Wu wrote:
> From: Hersen Wu <Hersenxs.Wu@amd.com>
> 
> At end of test, with disallow_edp_enter_psr = 0, run DPMS off, on
> for eDP. This will trigger DRM kernel driver enable eDP PSR.
> 
> Signed-off-by: Hersen Wu <Hersenxs.Wu@amd.com>
> Reviewed-by: Wayne Lin <wayne.lin@amd.com>

You do not need to resend with only r-b added, it can be
applied during merge.

Regards,
Kamil

> ---
>  lib/igt_amd.c          |  5 ---
>  tests/amdgpu/amd_ilr.c | 84 ++++++++++++++++++++++++++++++++++--------
>  2 files changed, 69 insertions(+), 20 deletions(-)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index c0c4dfc67..149af5151 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1185,11 +1185,6 @@ void igt_amd_disallow_edp_enter_psr(int drm_fd, char *connector_name, bool enabl
>  	const char *allow_edp_psr = "1";
>  	const char *dis_allow_edp_psr = "0";
>  
> -	/* if current psr is not enabled, skip this debugfs */
> -	if (!igt_amd_psr_support_drv(drm_fd, connector_name, PSR_MODE_1) &&
> -		!igt_amd_psr_support_drv(drm_fd, connector_name, PSR_MODE_2))
> -		return;
> -
>  	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
>  	igt_assert(fd >= 0);
>  	ret = openat(fd, DEBUGFS_DISALLOW_EDP_ENTER_PSR, O_WRONLY);
> diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
> index 46ad6f60a..b09980a15 100644
> --- a/tests/amdgpu/amd_ilr.c
> +++ b/tests/amdgpu/amd_ilr.c
> @@ -205,21 +205,22 @@ static void test_flow(data_t *data, enum sub_test option)
>  			continue;
>  		}
>  
> -		/* igt_amd_output_has_ilr_setting only checks if debugfs
> -		 * exist. ilr settings could be all 0s -- not supported.
> -		 * IGT needs to check if ilr settings values are supported.
> +		/* states under /sys/kernel/debug/dri/0/eDP-1:
> +		 * psr_capability.driver_support (drv_support_psr): yes
> +		 * ilr_setting (intermediate link rates capabilities,
> +		 * ilr_cap): yes/no
> +		 * kernel driver disallow_edp_enter_psr (dis_psr): no
>  		 */
> -		igt_amd_read_ilr_setting(data->drm_fd, output->name, data->supported_ilr);
> -		if (data->supported_ilr[0] == 0)
> -			continue;
> -
> -		igt_info("Testing on output: %s\n", output->name);
>  
> -		/* Init only if display supports ilr link settings */
> +		/* Init only eDP */
>  		test_init(data, output);
>  
> -		/* Disable eDP PSR to avoid timeout when reading CRC */
> -		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, true);
> +		/* set_all_output_pipe_to_none: no pipe is enabled.
> +		 * DPMS on/off will not take effect until
> +		 * next igt_display_commit_atomic.
> +		 * eDP enter power saving mode within test_init
> +		 * drv_support_psr: yes; ilr_cap: no; dis_psr: no
> +		 */
>  
>  		mode = igt_output_get_mode(output);
>  		igt_assert(mode);
> @@ -229,7 +230,44 @@ static void test_flow(data_t *data, enum sub_test option)
>  				      mode->vdisplay, DRM_FORMAT_XRGB8888,
>  				      0, &data->fb);
>  		igt_plane_set_fb(data->primary, &data->fb);
> +
> +		/* drv_support_psr: yes; ilr_cap: no; dis_psr: no
> +		 * commit stream. eDP exit power saving mode.
> +		 */
>  		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		/* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
> +
> +		/* igt_amd_output_has_ilr_setting only checks if debugfs
> +		 * exist. ilr settings could be all 0s -- not supported.
> +		 * IGT needs to check if ilr settings values are supported.
> +		 * Supported_ilr is read from DPCD registers. Make sure
> +		 * eDP exiting power saving mode before reading supported_ilr.
> +		 * This check will let test be skipped for non-ilr eDP.
> +		 */
> +		igt_amd_read_ilr_setting(data->drm_fd, output->name, data->supported_ilr);
> +		if (data->supported_ilr[0] == 0)
> +			continue;
> +
> +		igt_info("Testing on output: %s\n", output->name);
> +
> +		/* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
> +		kmstest_set_connector_dpms(data->drm_fd,
> +			output->config.connector, DRM_MODE_DPMS_OFF);
> +		/* eDP enter power saving mode.
> +		 * drv_support_psr: yes; ilr_cap: no; dis_psr: no.
> +		 */
> +
> +		/* Disable eDP PSR to avoid timeout when reading CRC */
> +		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, true);
> +		/* drv_support_psr: yes; ilr_cap: no: dis_psr: yes */
> +
> +		/* eDP exit power saving mode and setup psr */
> +		kmstest_set_connector_dpms(data->drm_fd,
> +			output->config.connector, DRM_MODE_DPMS_ON);
> +		/* drv_support_psr: no; ilr_cap: yes: dis_psr: yes
> +		 * With dis_psr yes, drm kernel driver
> +		 * disable psr, psr_en is set to no.
> +		 */
>  
>  		/* Collect info of Reported Lane Count & ILR */
>  		igt_amd_read_link_settings(data->drm_fd, output->name, data->lane_count,
> @@ -247,18 +285,34 @@ static void test_flow(data_t *data, enum sub_test option)
>  				break;
>  		}
>  
> +		/* drv_support_psr: no; ilr_cap: yes; dis_psr: yes */
> +		kmstest_set_connector_dpms(data->drm_fd,
> +			output->config.connector, DRM_MODE_DPMS_OFF);
> +		/* eDP enter power saving mode.
> +		 * drv_support_psr: no; ilr_cap: no; dis_psr: yes.
> +		 */
> +
> +		/* Enable PSR after reading eDP Rx CRC */
> +		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
> +		/* drv_support_psr: no; ilr_cap: no: dis_psr: no */
> +
> +		/* eDP exit power saving mode and setup psr */
> +		kmstest_set_connector_dpms(data->drm_fd,
> +			output->config.connector, DRM_MODE_DPMS_ON);
> +		/* drv_support_psr: yes; ilr_cap: yes: dis_psr: no */
> +
>  		/* Reset preferred link settings*/
>  		memset(data->supported_ilr, 0, sizeof(data->supported_ilr));
>  		igt_amd_write_ilr_setting(data->drm_fd, output->name, 0, 0);
> +		/* drv_support_psr: yes; ilr_cap: yes; dis_psr: no */
>  
> +		/* commit 0 stream. eDP enter power saving mode */
>  		igt_remove_fb(data->drm_fd, &data->fb);
> +		/* drv_support_psr: yes; ilr_cap: no; dis_psr: no */
>  
>  		test_fini(data);
> -
> -		/* Enable eDP PSR */
> -		igt_amd_disallow_edp_enter_psr(data->drm_fd, output->name, false);
> +		/* drv_support_psr: yes; ilr_cap: no; dis_psr: no */
>  	}
> -
>  }
>  
>  igt_main
> -- 
> 2.25.1
> 
