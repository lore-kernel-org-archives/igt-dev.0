Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D84FD8FD2
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 16:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E06310E9C4;
	Thu, 26 Feb 2026 16:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QuFbLlUj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B43310E9C4
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772123408; x=1803659408;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gyuDjwk5T3EaCz64ETWfYjBbJQMkCwxeU6HlwQAkse8=;
 b=QuFbLlUjcs90yJU9LXLhBMM4CjoYMg0aCWIF4Zm+t4Jl7O7arHAZ69Hv
 AxinkmvhxHZWot5Ul18oAHAwYM/i3gcZJlmk95SguvTuo2pfC4hOMIJxp
 1NnFr4FVDYmcGAv2qyrzRF7UYD9lBhhPfjhJ4V9uo10C7OEqUa8gB1LNd
 qs5f7K8U/KeoUwjabO3yobfMzySg1dfJNf4l5/kLdru3CHtK7HtfgYf0f
 4XbBGIyXZsVT76R4u6cEI3aSkFW4Z4C3DphQnc2tBAp9eYyxpUQ1ae1KZ
 o7bd4WfvwgA5laTwQ0/9HJgbG2D1bshTmrwWRbe8kKEXr0eIB20I1lmHN w==;
X-CSE-ConnectionGUID: jEGIHl6CQcOJyqkHx4S2Pg==
X-CSE-MsgGUID: AF1Z9bPUSJWZ4WKI1AilUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="75791584"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="75791584"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:30:08 -0800
X-CSE-ConnectionGUID: e1QGfHaeQ8iSc/hPrXfM9A==
X-CSE-MsgGUID: ISo7Q0fPRhWu9mTmLSPJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214572359"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 08:30:07 -0800
Date: Thu, 26 Feb 2026 17:30:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
Subject: Re: [PATCH v3 i-g-t 1/4] tools/meson: make per-tool dependencies
 instead of using global deps
Message-ID: <20260226163004.34wvzcruzogb56tn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com
References: <cover.1771510028.git.sebastian.brzezinka@intel.com>
 <014b324e5cb2e5fe00aca8bdb4ee2b03da75668d.1771510028.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <014b324e5cb2e5fe00aca8bdb4ee2b03da75668d.1771510028.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-02-19 at 15:14:50 +0100, Sebastian Brzezinka wrote:
> Rework tools/meson.build to stop linking every tool against the full
> global igt_deps set. Most tools do not require cairo, glib, udev,
> pciaccess, or zlib, and the previous all‑tools‑get‑everything approach
> pulled in unnecessary libraries.
> 
> Introduce a small shared base dependency set (lib_igt, libdrm) and
> switch to a per‑tool dependency dictionary. Tools now declare their
> actual extra requirements explicitly, reducing over‑linking and making
> dependency intent clearer.
> 
> Fold previously standalone tool definitions into the unified tools_progs
> structure and use consistent executable() creation. The tools list is
> also reordered to keep it clean and logically grouped.
> 
> This is a build‑system cleanup only; no functional behavior changes.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/meson.build | 121 ++++++++++++++++++++++------------------------
>  1 file changed, 57 insertions(+), 64 deletions(-)

There is much work done with little gain and one regression.
I used following script script:

#!/bin/sh
# SPDX-License-Identifier: MIT

# compile igt source with changes in 'new' folder
# keep non-modified compilation in 'old' folder

cd new
find build/tools/ -maxdepth 1 -type f | while read line; do
        nnew=$(ldd $line |wc -l)
        nold=$(ldd ../old/$line |wc -l)
        echo $nnew $nold $line
done
cd ..

From output there are two tools with changes, regression:

10 7 build/tools/intel_gpu_top

improvement:

10 79 build/tools/lsgpu

Can you create lsgpu linking like one done for intel_gpu_top
and work on more improvements in this series?

Regards,
Kamil

> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 8185ba160..0fc2427f9 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -11,51 +11,60 @@ foreach prog : tools_progs_noisnt
>  			install : false)
>  endforeach
>  
> -tools_progs = [
> -	'igt_facts',
> -	'igt_power',
> -	'igt_stats',
> -	'intel_audio_dump',
> -	'intel_backlight',
> -	'intel_bios_dumper',
> -	'intel_display_bandwidth',
> -	'intel_display_crc',
> -	'intel_display_poller',
> -	'intel_dump_decode',
> -	'intel_error_decode',
> -	'intel_forcewaked',
> -	'intel_gpu_frequency',
> -	'intel_firmware_decode',
> -	'intel_framebuffer_dump',
> -	'intel_gpu_time',
> -	'intel_gtt',
> -	'intel_guc_logger',
> -	'intel_hdcp',
> -	'intel_infoframes',
> -	'intel_lid',
> -	'intel_opregion_decode',
> -	'intel_panel_fitter',
> -	'intel_perf_counters',
> -	'intel_pm_rpm',
> -	'intel_reg_checker',
> -	'intel_residency',
> -	'intel_stepping',
> -	'intel_tiling_detect',
> -	'intel_vbt_decode',
> -	'intel_watermark',
> -	'intel_gem_info',
> -	'intel_gvtg_test',
> -	'dpcd_reg',
> -	'lsgpu',
> -]
> -tool_deps = igt_deps
> -tool_deps += zlib
> +tool_deps = [lib_igt, libdrm]
> +tools_progs = {
> +	'amd_hdmi_compliance': [tool_deps, cairo],
> +	'dpcd_reg': [tool_deps],
> +	'gputop': [lib_igt_drm_clients,
> +		   lib_igt_drm_fdinfo,
> +		   lib_igt_profiling,
> +		   math],
> +	'igt_facts': [tool_deps, cairo],
> +	'igt_power': [tool_deps],
> +	'igt_stats': [tool_deps],
> +	'intel_audio_dump': [tool_deps],
> +	'intel_backlight': [tool_deps],
> +	'intel_bios_dumper': [tool_deps, pciaccess],
> +	'intel_display_bandwidth': [tool_deps],
> +	'intel_display_crc': [tool_deps, cairo],
> +	'intel_display_poller': [tool_deps],
> +	'intel_dump_decode': [tool_deps],
> +	'intel_error_decode': [tool_deps, zlib],
> +	'intel_firmware_decode': [tool_deps],
> +	'intel_forcewaked': [tool_deps],
> +	'intel_framebuffer_dump': [tool_deps, cairo],
> +	'intel_gem_info': [tool_deps, cairo],
> +	'intel_gpu_frequency': [tool_deps],
> +	'intel_gpu_time': [tool_deps],
> +	'intel_gpu_top': [lib_igt_perf,
> +			  lib_igt_device_scan,
> +			  lib_igt_drm_clients,
> +			  lib_igt_drm_fdinfo,
> +			  math],
> +	'intel_gtt': [tool_deps, pciaccess],
> +	'intel_guc_logger': [tool_deps, cairo, pthreads],
> +	'intel_gvtg_test': [tool_deps, cairo],
> +	'intel_hdcp': [tool_deps, cairo, pthreads],
> +	'intel_infoframes': [tool_deps],
> +	'intel_lid': [tool_deps],
> +	'intel_opregion_decode': [tool_deps],
> +	'intel_panel_fitter': [tool_deps],
> +	'intel_perf_counters': [tool_deps],
> +	'intel_pm_rpm': [tool_deps, glib, cairo],
> +	'intel_reg_checker': [tool_deps],
> +	'intel_residency': [tool_deps, cairo],
> +	'intel_stepping': [tool_deps, pciaccess],
> +	'intel_tiling_detect': [tool_deps, cairo],
> +	'intel_vbt_decode': [tool_deps],
> +	'intel_watermark': [tool_deps],
> +	'lsgpu': [tool_deps, libudev, glib, cairo],
> +}
>  
> -foreach prog : tools_progs
> -	executable(prog, prog + '.c',
> -		   dependencies : tool_deps,
> -		   install_rpath : bindir_rpathdir,
> -		   install : true)
> +foreach prog, deps : tools_progs
> +	executable( prog, prog + '.c',
> +		    dependencies: deps,
> +		    install_rpath: bindir_rpathdir,
> +		    install: true)
>  endforeach
>  
>  if libudev.found()
> @@ -65,25 +74,19 @@ if libudev.found()
>  		'igt_compliance_utils.c'
>  	]
>  	executable('intel_dp_compliance', sources : intel_dp_compliance_src,
> -		   dependencies : [tool_deps, libudev],
> +		   dependencies : [tool_deps, libudev, glib, cairo],
>  		   install_rpath : bindir_rpathdir,
>  		   install : true)
>  endif
> -
> -executable('gputop', 'gputop.c',
> -           install : true,
> -           install_rpath : bindir_rpathdir,
> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
> -
>  intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>  executable('intel_l3_parity', sources : intel_l3_parity_src,
> -	   dependencies : tool_deps,
> +	   dependencies : [tool_deps, libudev],
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
>  intel_reg_src = [ 'intel_reg.c', 'intel_reg_decode.c', 'intel_reg_spec.c' ]
>  executable('intel_reg', sources : intel_reg_src,
> -	   dependencies : tool_deps,
> +	   dependencies : [tool_deps, pciaccess, cairo],
>  	   install : true,
>  	   install_rpath : bindir_rpathdir,
>  	   c_args : [
> @@ -94,16 +97,6 @@ install_data(['intel_gpu_abrt', 'intel-gfx-fw-info'], install_dir : bindir)
>  
>  install_subdir('registers', install_dir : datadir)
>  
> -executable('intel_gpu_top', 'intel_gpu_top.c',
> -	   install : true,
> -	   install_rpath : bindir_rpathdir,
> -	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
> -
> -executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
> -	   dependencies : [tool_deps],
> -	   install_rpath : bindir_rpathdir,
> -	   install : true)
> -
>  if libudev.found()
>  	msm_dp_compliance_src = [
>  		'msm_dp_compliance.c',
> @@ -111,7 +104,7 @@ if libudev.found()
>  		'igt_compliance_utils.c'
>  	]
>  	executable('msm_dp_compliance', sources : msm_dp_compliance_src,
> -			dependencies : [tool_deps, libudev],
> +			dependencies : [tool_deps, libudev, cairo, glib],
>  			install_rpath : bindir_rpathdir,
>  			install : true)
>  endif
> -- 
> 2.52.0
> 
