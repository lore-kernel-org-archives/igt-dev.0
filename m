Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A52C61DBD
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 09:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E8A10E487;
	Fri, 28 Aug 2026 09:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jekSXFlq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A90610E44D
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 09:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787911153; x=1819447153;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uv+wTGo591UhFMWUiOEzw1nbVwn0aDGzVWIv79KShZs=;
 b=jekSXFlqMcBFOBVa9hIuDaO/LkgJrJXZRLxQ0cJyVrhxskarolvwnVey
 gavae4VW0tNBAdIo5wHZqe5RJUqTzW95k5wzO1t4OpKJWh/XQk60B3Etu
 r6yfzloZgWTVfEmWdYmZJ2jTFaQi/tWrsmZZU+REoeSL0mSzqmdyJk4+m
 WbY3gKeFK4Jtuyj3wptBMwynfpV7jE96ERk0cnFGwFVf2r25yxm4nbKln
 Ctv93F7XT45bPuYcFvgYTz61t3QzronkNdSc7bBYY5+Afz4dNgSBt8as1
 6DPMJ5r9rJk34hTRaa2STnGvz8ekPwFAazIymHjSxvHMky3wgMTQE6QHn Q==;
X-CSE-ConnectionGUID: +QYVkmPaQTi05Mc6JWLdLA==
X-CSE-MsgGUID: 6avVnV11R/GXuEqN6cpzzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="87361999"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="87361999"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 02:59:13 -0700
X-CSE-ConnectionGUID: AGNrqm5STDG1IkDlTotZ1Q==
X-CSE-MsgGUID: 2rWYxIr/QsSy17820M1PDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="267517659"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 02:59:11 -0700
Date: Fri, 28 Aug 2026 11:58:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, chaitanya.kumar.borah@intel.com,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Mark Broadworth <Mark.Broadworth@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: Re: [PATCH i-g-t] tools: rename HDMI compliance utility
Message-ID: <20260828095854.7apqo5c7hy3n7oet@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, chaitanya.kumar.borah@intel.com,
 Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Mark Broadworth <Mark.Broadworth@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260827185355.378279-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827185355.378279-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2026-08-28 at 00:23:55 +0530, Swati Sharma wrote:
> Rename the AMD-specific HDMI compliance utility to a generic
> igt_hdmi_compliance binary and update the build rule.
> 
> Keep the existing AMD debugfs flow for pixel-format forcing. Skip
> that operation on Intel devices until a driver-supported interface
> for selecting the pixel encoding is available.
> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

I will forward this to few AMD GPU dev to make sure it will
work for them, +cc
Fangzhi Zuo <Jerry.Zuo@amd.com>
Harry Wentland <harry.wentland@amd.com>
Mark Broadworth <Mark.Broadworth@amd.com>
Vitaly Prosyak <vitaly.prosyak@amd.com>

Vitaly, can you forward this to your devs and/or CI team and help
us here, please.


Regards,
Kamil

> ---
>  tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} | 9 ++++++---
>  tools/meson.build                                      | 2 +-
>  2 files changed, 7 insertions(+), 4 deletions(-)
>  rename tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} (99%)
> 
> diff --git a/tools/amd_hdmi_compliance.c b/tools/igt_hdmi_compliance.c
> similarity index 99%
> rename from tools/amd_hdmi_compliance.c
> rename to tools/igt_hdmi_compliance.c
> index 2af4c0bab..ece0abd1d 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/igt_hdmi_compliance.c
> @@ -833,12 +833,15 @@ static void force_pixel_format(data_t *data, int pixel_format, int conn_id)
>  
>  	test_init(data, conn_id);
>  
> -	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
> -	igt_assert(fd >= 0);
> -
>  	igt_info("Setting %d on connector id %d\n",
>  			pixel_format, data->output->config.connector->connector_id);
>  
> +	igt_skip_on_f(is_intel_device(data->fd),
> +			      "pixel-format forcing is not supported on Intel devices\n");
> +
> +	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +
>  	switch (pixel_format) {
>  	case 1:
>  		entry_name = "force_rgb_output";
> diff --git a/tools/meson.build b/tools/meson.build
> index fbc6c0a00..68c31da92 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -183,7 +183,7 @@ executable('intel_gpu_top', 'intel_gpu_top.c',
>  	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
>  	                   lib_igt_drm_stub, lib_igt_tools_stub, math])
>  
> -executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
> +executable('igt_hdmi_compliance', 'igt_hdmi_compliance.c',
>  	   dependencies : [tool_deps],
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
> -- 
> 2.25.1
> 
