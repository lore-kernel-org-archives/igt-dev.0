Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694A8C2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 17:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298D110E616;
	Tue,  9 Jul 2024 17:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpjCcq/E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89F610E616
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720547396; x=1752083396;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OL39f2F3ye3OK5B5vyyJZGd1Yl/qk49ejO/OcSdQ/io=;
 b=EpjCcq/EbKxyDEdkmPfhlrQi/Zg5xTu44sOEtRmSAXhONNAIuyEpG5RE
 5fMIeEyWKtrZvYXB+V7dCcKG6EIFnJOVu4bZJQ92QUswAjMMIE6aSsmMN
 /uelkABi75wmr92VvUvZyp4I55zA/X80MsRTXyD04jXZCICJgfpesAh90
 sV/RBk9D7GOGS079Uje3R072t5KoIxn2wYoPwcOz3Ray9BDfLc9MWm4gU
 3/oEjA/OSobgAHFb2Bj29ImmymOR/zqi5nsWAcdScu/ax7GNKBxCQGNWX
 bE+8Jgsl+hYq5YyP3+0XIj7WKBRY4RfA2gtlwS092DiyWXm5BoMA3A2DY Q==;
X-CSE-ConnectionGUID: nj+8Rg3ISVee9PImdwBbrA==
X-CSE-MsgGUID: Fz2DFkCTQpSoFWP/3Qh0Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="40340650"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="40340650"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 10:49:56 -0700
X-CSE-ConnectionGUID: a5bwRjiqSe6qwNElUtMEMw==
X-CSE-MsgGUID: eCqK8388SxmBDoO/UwfCww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="52338449"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 10:49:54 -0700
Date: Tue, 9 Jul 2024 19:49:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevan.b@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Modified the deep-pkgc
 subtest. Changes: 1. Added checks to avoid connector failures. 2. Added
 vblank wait to sync with frame time.
Message-ID: <20240709174937.mbfguklfxw4hsmzd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 igt-dev@lists.freedesktop.org, jeevan.b@intel.com
References: <20240703171339.381480-1-ramanaidu.naladala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240703171339.381480-1-ramanaidu.naladala@intel.com>
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
On 2024-07-03 at 22:43:39 +0530, Naladala Ramanaidu wrote:

your subject is too long:

[PATCH i-g-t] tests/intel/kms_pm_dc: Modified the deep-pkgc
 subtest. Changes: 1. Added checks to avoid connector failures. 2. Added
 vblank wait to sync with frame time.

it should be shorter, for example:

[PATCH i-g-t] tests/intel/kms_pm_dc: Fixed deep-pkgc subtest

How to write a git commit message: https://cbea.ms/git-commit/
other usfull links from CONTRIBUTING.md:

https://kernelnewbies.org/PatchPhilosophy
https://www.kernel.org/doc/html/latest/process/submitting-patches.html
https://www.kernel.org/doc/html/latest/process/submit-checklist.html

btw from your subject it looks like you are doing two changes,
consider splitting this into two pathes:

[PATCH i-g-t 1/2] tests/intel/kms_pm_dc: avoid connector failures in deep-pkgc
[PATCH i-g-t 2/2] tests/intel/kms_pm_dc: sync with frame time in deep-pkgc

Add cc here before s-o-b:

Cc: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 34 +++++++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index e1318bfa6..b92478d50 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -592,7 +592,7 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
>  static void test_deep_pkgc_state(data_t *data)
>  {
>  	unsigned int pre_val = 0, cur_val = 0;
> -	time_t start = time(NULL), duration = 2, delay;
> +	time_t start = time(NULL), duration = 4, vb_delay;
>  	enum pipe pipe;
>  	bool pkgc_flag = false;
>  	bool vrr_supported = false, flip = true;
> @@ -602,6 +602,12 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_output_t *output = NULL;
>  
>  	for_each_pipe_with_valid_output(display, pipe, output) {
> +
> +		/* check for the eDP connector */
> +		if(output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
> +		{
> +			igt_skip("No eDP output found, skipping the test.\n");

Why skip here? What if next one could work?

Regards,
Kamil

> +		}
>  		/* Check VRR capabilities before setting up */
>  		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
>  		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
> @@ -618,28 +624,46 @@ static void test_deep_pkgc_state(data_t *data)
>  
>  	igt_output_set_pipe(output, pipe);
>  
> +	for_each_connector_mode(output)
> +	{
> +		data->mode = &output->config.connector->modes[j__];
> +		vb_delay = 1 * (MSECS / (data->mode->vrefresh));
> +		/* At least 5ms vblank time required to program higher
> +		 * watermark level
> +		*/
> +		if(vb_delay >  5000)
> +		{
> +			break;
> +		}
> +	}
> +
> +
>  	data->output = output;
>  	data->mode = igt_output_get_mode(output);
>  	setup_videoplayback(data);
>  
>  	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> -	pre_val = read_pkgc_counter(data->debugfs_root_fd);
> -	delay = 1 * (MSECS / (data->mode->vrefresh - 10));
>  
>  	igt_plane_set_fb(primary, &data->fb_rgb);
>  	igt_display_commit(&data->display);
> +	/* Waiting for the vblank to sync the frame time */
> +	igt_wait_for_vblank_count(data->drm_fd,data->display.pipes[pipe].crtc_offset,1);
> +
> +	usleep(5000);
> +	pre_val = read_pkgc_counter(data->debugfs_root_fd);
>  
>  	while (time(NULL) - start < duration) {
>  		flip = !flip;
>  		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
>  		igt_display_commit(&data->display);
> -
> +		usleep(vb_delay);
>  		cur_val = read_pkgc_counter(data->debugfs_root_fd);
>  		if (cur_val > pre_val) {
>  			pkgc_flag = true;
>  			break;
>  		}
> -		usleep(delay);
> +
> +		usleep(5000);
>  	}
>  
>  	cleanup_dc3co_fbs(data);
> -- 
> 2.43.0
> 
