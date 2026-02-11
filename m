Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B11E9E311
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 15:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0985C10E087;
	Wed, 11 Feb 2026 15:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lb400oYW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E6610E087
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770824464; x=1802360464;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=syGX52srcgsMSgW8MO+CqkM1yaPT4o/IHEw4IfSSgEs=;
 b=lb400oYW5/sxixTrFS/CyN8iJ9VGBattDRhYYrwpY3E/AG8PRCcMbiVn
 7bm0cU+1B5FK/d/Ro2hRJ/Swtha3zt5pwzJb0eKdcRfVU+F18hBFxZWr8
 DiQ1KPsg2BodUEIWdrV40hxxqvQsaLCFGhoOxhONryXBIXBVmWKU2sQdj
 0VUZwUUIkNTEyOkM5FwiiJpSnEJog0OMMPs/Tb9pZpdxeiSjqquDNMre5
 R+/z133327RGsKgzap+/7hwcB4dY3kBZalLf25FYYmRg3k7dJ1sa1U4E/
 wFNzma1v+q74CyvbdBCVT4RrzGUrASykuNW0iT62yKyhieBXNjeHc+Dxb g==;
X-CSE-ConnectionGUID: njVt7lH9TG+8N7e2Nr1LEA==
X-CSE-MsgGUID: GJimDEYGTeaEYv/J5ZOQ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75818241"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="75818241"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:41:04 -0800
X-CSE-ConnectionGUID: JXwnK0zfR3mHTjTdWOiQhA==
X-CSE-MsgGUID: N9ssZdStTzylnYexv8JH7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="242896252"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 07:41:02 -0800
Date: Wed, 11 Feb 2026 16:40:45 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/6] tools/meson: make per-tool dependencies
 instead of using global deps
Message-ID: <20260211154045.ih4vxygczi257xq6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org
References: <cover.1770212190.git.sebastian.brzezinka@intel.com>
 <a5e52453497b053767bb001cee20c7ad200a764c.1770212190.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5e52453497b053767bb001cee20c7ad200a764c.1770212190.git.sebastian.brzezinka@intel.com>
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
On 2026-02-04 at 15:16:03 +0100, Sebastian Brzezinka wrote:
> This patch updates tools/meson.build to stop linking all tools against the full igt_deps
> set plus zlib. Most tools don’t actually need cairo, glib, udev, pciaccess, or
> zlib, so the blanket dependency list pulls in far more libraries than necessary.
> 
> The patch replaces the flat tool list with a dictionary that assigns only the
> required extra dependencies to each tool. A small common base (lib_igt, libdrm)
> remains shared. Everything else is added per‑tool.
> 
> Tools that depended on global deps implicitly now declare their actual
> requirements (intel_dp_compliance, msm_dp_compliance, intel_l3_parity, intel_reg,
> amd_hdmi_compliance).
> 

Please add here Closes: tag for this:
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/16
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

btw please look into those issue/16 link, there is a script
which should help you identify what linking libs you are missing,
see below.

> ---
>  tools/meson.build | 100 +++++++++++++++++++++++-----------------------
>  1 file changed, 51 insertions(+), 49 deletions(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 8185ba160..acd394e23 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -11,51 +11,53 @@ foreach prog : tools_progs_noisnt
>  			install : false)
>  endforeach
>  
> -tools_progs = [
> -	'igt_facts',
[cut]
> -]
> -tool_deps = igt_deps
> -tool_deps += zlib
> +tools_progs = {
> +	'igt_facts': [cairo],
> +	'igt_power': [],
> +	'igt_stats': [],
> +	'intel_audio_dump': [],
> +	'intel_backlight': [],
> +	'intel_bios_dumper': [pciaccess],
> +	'intel_display_bandwidth': [],
> +	'intel_display_crc': [cairo],
> +	'intel_display_poller': [],
> +	'intel_dump_decode': [],
> +	'intel_error_decode': [zlib],
> +	'intel_forcewaked': [],
> +	'intel_gpu_frequency': [],
> +	'intel_firmware_decode': [],
> +	'intel_framebuffer_dump': [cairo],
> +	'intel_gpu_time': [],
> +	'intel_gtt': [pciaccess],
> +	'intel_guc_logger': [cairo],
> +	'intel_hdcp': [cairo],

This still do not build:

[1285/2063] Linking target tools/intel_hdcp
FAILED: tools/intel_hdcp
cc  -o tools/intel_hdcp tools/intel_hdcp.p/intel_hdcp.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,--start-group lib/libigt.so.0 /usr/lib/x86_64-linux-gnu/libdrm.so /usr/lib/x86_64-linux-gnu/libcairo.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-link,/opt/builds/build/lib
/usr/bin/ld: tools/intel_hdcp.p/intel_hdcp.c.o: undefined reference to symbol 'pthread_join@@GLIBC_2.2.5'
/usr/bin/ld: /lib/x86_64-linux-gnu/libpthread.so.0: error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status

Regards,
Kamil

> +	'intel_infoframes': [],
> +	'intel_lid': [],
> +	'intel_opregion_decode': [],
> +	'intel_panel_fitter': [],
> +	'intel_perf_counters': [],
> +	'intel_pm_rpm': [glib, cairo],
> +	'intel_reg_checker': [],
> +	'intel_residency': [cairo],
> +	'intel_stepping': [pciaccess],
> +	'intel_tiling_detect': [cairo],
> +	'intel_vbt_decode': [],
> +	'intel_watermark': [],
> +	'intel_gem_info': [cairo],
> +	'intel_gvtg_test': [cairo],
> +	'dpcd_reg': [],
> +	'lsgpu': [libudev, glib, cairo],
> +}
>  
[cut]
