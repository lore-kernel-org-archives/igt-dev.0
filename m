Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E6BC3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 15:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F9310E05F;
	Wed, 17 Jul 2024 15:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLZKVhQ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E24910E05F
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721230266; x=1752766266;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6ND/bJijc08/HJ2ZvTY7scA2hwzzhmN3nNApvPwDj6Y=;
 b=PLZKVhQ8Tlg0FD9Pels2hUTAOt0yrtp8PzSdESyNUc0Ctj47Z6D13mct
 Z92PJ7tRyZeHfD9cGusvHzev0+nbGkc+45sFNmqf+YPT9v1dXkbV5hqc9
 UnJX39N4L465E/z6ByvL6T2rMfbQDSQuZFr0KGULNRobCx6JfHtCOZrHp
 ZjPMfG462Vbv/S6/vJYOWFN/N+hZgoMHMFloSPWlQC9chYhb82d4ElxqW
 okI63/a2O0eh/IlwDGq+BPm3r1VdZZvp9zeQyM6LtMQUK9h9JnJ/1V46o
 SPVUw/HWcD+2sWOHScxWj7H0HGWBEkzq6xD5Bb1HzUxE1XqSXSOO1oViT w==;
X-CSE-ConnectionGUID: hhouDQFuQLGFU1xIiFeLSQ==
X-CSE-MsgGUID: V/dzlJu4T7+XYw3pgTbU0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="30129543"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="30129543"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 08:31:06 -0700
X-CSE-ConnectionGUID: VB3S8CtCQyuLA6blIhniUg==
X-CSE-MsgGUID: 4fvYLjk6SeehsmVXDYxjRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="51147745"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 08:31:04 -0700
Date: Wed, 17 Jul 2024 17:31:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>, jeevan.b@intel.com,
 suraj.kandpal@intel.com
Subject: Re: [PATCH i-g-t 2/3] tests/intel/kms_pm_dc: Update deep-pkgc function
Message-ID: <20240717153101.v4kddn4v7jlvzkpm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 jeevan.b@intel.com, suraj.kandpal@intel.com
References: <20240717140556.640124-1-ramanaidu.naladala@intel.com>
 <20240717140556.640124-3-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240717140556.640124-3-ramanaidu.naladala@intel.com>
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

Hi Naladala,
On 2024-07-17 at 19:35:55 +0530, Naladala Ramanaidu wrote:
> Increased the C-state polling time from its previous value

Why?

> to 4 sec.Implement polling for PKG-C10 counters for every

Add space after dot '.', s/sec.Implement/sec. Implement/

> 5ms up to 16ms.

Same here, write why you need this change.

Also, imho you should split this into two patches and update subjects:

[PATCH i-g-t 2/4] tests/intel/kms_pm_dc: Increase C-state polling

[PATCH i-g-t 3/4] tests/intel/kms_pm_dc: Add polling for deep-pkgc

Regards,
Kamil

> 
> v2: Address and correct review comments (Suraj, Jeevan)
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 8fb35a2df..c1ca3acc0 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -592,7 +592,7 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
>  static void test_deep_pkgc_state(data_t *data)
>  {
>  	unsigned int pre_val = 0, cur_val = 0;
> -	time_t start = time(NULL), duration = 2, vb_delay, delay;
> +	time_t start = time(NULL), duration = 4, vb_delay, delay;
>  	enum pipe pipe;
>  	bool pkgc_flag = false;
>  	bool flip = true;
> @@ -623,10 +623,10 @@ static void test_deep_pkgc_state(data_t *data)
>  		data->mode = &output->config.connector->modes[j__];
>  		vb_delay = 1 * (MSECS / (data->mode->vrefresh));
>  		/*
> -		 * At least 5ms vblank time required to program higher
> +		 * At least 5ms vblank time for programming higher
>  		 * watermark levels
>  		 */
> -		if (vb_delay > (5 * MSEC))
> +		if (vb_delay > (5 * MSECS))
>  			break;
>  	}
>  
> @@ -635,23 +635,27 @@ static void test_deep_pkgc_state(data_t *data)
>  	setup_videoplayback(data);
>  
>  	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> -	pre_val = read_pkgc_counter(data->debugfs_root_fd);
> -	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
> +	delay = vb_delay * 0.5;
>  
>  	igt_plane_set_fb(primary, &data->fb_rgb);
>  	igt_display_commit(&data->display);
>  
> +	/* Waiting for the vblank to sync the frame time */
> +	igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 1);
> +	usleep(delay);
> +	pre_val = read_pkgc_counter(data->debugfs_root_fd);
> +
>  	while (time(NULL) - start < duration) {
>  		flip = !flip;
>  		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
>  		igt_display_commit(&data->display);
>  
> -		cur_val = read_pkgc_counter(data->debugfs_root_fd);
> +		igt_wait((cur_val = read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
> +			  vb_delay * 2, 5);
>  		if (cur_val > pre_val) {
>  			pkgc_flag = true;
>  			break;
>  		}
> -		usleep(delay);
>  	}
>  
>  	cleanup_dc3co_fbs(data);
> -- 
> 2.43.0
> 
