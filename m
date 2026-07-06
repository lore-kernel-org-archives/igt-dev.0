Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D705C43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 11:07:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB28A10E34C;
	Mon,  6 Jul 2026 11:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWKcy/2t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B905F10E330
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 11:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783336024; x=1814872024;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g0hARugmLpri1knEpSmLim7zsh17T+oxKTKv5lAjF2w=;
 b=mWKcy/2tp3bxGftbaYaKY7p4THsOyQNGT8wZutwb9zLmASIZOOiYAYGl
 4oHjMiw2m1iyuL5EUg1Ib1szgw5D34oH6CnRH7PmYEd58eBycjT11X0oe
 +r4ObaKx/jRYuThLDwys7NBIqGUeT3QNfQy1+UMo/nOV0+lSjuUKwcwre
 fB4DztqJshKXvIWPvQn67fSgEMM2BQR8M0XO7nUYV8M7nSPMUdCfu9uM0
 LVuGOKm1+ronlMy92Xl6bNZN3ATRTUyonsrZoz7mo9X+GDAKBaEefGcvV
 o9EM3Dh+aEcwNgxLMoEwVzyrWN2VRCW2lKmAuijHQTPhD7RRfE0kz8pj4 Q==;
X-CSE-ConnectionGUID: 6Wjxx03RTJeycPOWsI8vMQ==
X-CSE-MsgGUID: +SCINQUsRw+S9Kh7XVpiFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94571631"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="94571631"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 04:07:04 -0700
X-CSE-ConnectionGUID: ltcNUS0HRgKXhb2c1E+hpw==
X-CSE-MsgGUID: fidp7Cn6T1qpvicSYtqUgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="283780079"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 04:07:03 -0700
Date: Mon, 6 Jul 2026 13:07:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 31/31] tools/lsgpu: link with minimal
 sub-libraries
Message-ID: <20260706110700.5xkqnd54ajpkwiyp@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <7eb931dd2fbb99b980e94fd52fff258fb82075f0.1783088106.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7eb931dd2fbb99b980e94fd52fff258fb82075f0.1783088106.git.sebastian.brzezinka@intel.com>
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
On 2026-07-03 at 16:29:05 +0200, Sebastian Brzezinka wrote:
> lsgpu only needs device enumeration and the lightweight tool stubs.
> Replace #include "igt.h" with the minimal header set and stop linking
> against libigt.so.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   8  (ldd | wc -l)
> 

Please add Closes: tag here.

Regards,
Kamil

> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/lsgpu.c     | 2 +-
>  tools/meson.build | 7 ++++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> index 935371dea..7d6b70b9b 100644
> --- a/tools/lsgpu.c
> +++ b/tools/lsgpu.c
> @@ -34,7 +34,7 @@
>  #include <signal.h>
>  #include <sys/ioctl.h>
>  
> -#include "igt.h"
> +#include "igt_core.h"
>  #include "igt_device_scan.h"
>  
>  /**
> diff --git a/tools/meson.build b/tools/meson.build
> index 6e694164f..fbc6c0a00 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -27,7 +27,6 @@ tools_progs = [
>  	'intel_tiling_detect',
>  	'intel_gem_info',
>  	'dpcd_reg',
> -	'lsgpu',
>  ]
>  tool_deps = igt_deps
>  tool_deps += zlib
> @@ -172,6 +171,12 @@ install_data(['intel_gpu_abrt', 'intel-gfx-fw-info'], install_dir : bindir)
>  
>  install_subdir('registers', install_dir : datadir)
>  
> +executable('lsgpu', 'lsgpu.c',
> +	   dependencies : [lib_igt_device_scan, lib_igt_tools_stub,
> +	                    lib_igt_drm_stub, glib, libudev, libpci],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  executable('intel_gpu_top', 'intel_gpu_top.c',
>  	   install : true,
>  	   install_rpath : bindir_rpathdir,
> -- 
> 2.53.0
> 
