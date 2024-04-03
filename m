Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8898CD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 17:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8090C112DDF;
	Wed,  3 Apr 2024 17:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJ17dsAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060141127CE
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712164962; x=1743700962;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=IHCe17O7jVKjjtWqOAmzlLM3IR2gaFuMU+yf8PkpLPk=;
 b=mJ17dsAZAhsI5IaJaW2ALQJU2JaqnFAdb3pmDm8Fu4SCbu6Ae+s7vbpJ
 wBNuUC0U0xj10RHvnAz0W/lqQNYK/WpOrky5FiNCopmUGDIwXH4T4djFM
 3AZsrvLr/jOnmrMcxzzrbhUMugaCQSIZ1gFQK4NdZyEQnY6wzhUHPaEe6
 qoELB7nwZXMA3wDw4Ct3i0JvAwXs5MF8IAMaGYs3vS/kZPXTjZ3iKQwn0
 9MLS08bBQ+5ADeCtrQP/qKHKG9CoLqp7k1LmgqxTPrCjFUCQCKxQhGevj
 ZEa9FkbE/Bl8+nOaZn9qhCxv7LSYKd2Gb6gBPaU07lm7XLUFeawfY+4kw A==;
X-CSE-ConnectionGUID: woTSXc6QQRy9E9s1S9axtg==
X-CSE-MsgGUID: Dm0vk0MbRiablZaEDRkBSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11232114"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11232114"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 10:22:41 -0700
X-CSE-ConnectionGUID: qdwXdGdeSjuZbiJeGFx+Og==
X-CSE-MsgGUID: xCG1mU+8QbuGV35yuIOhag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="22995960"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 10:22:39 -0700
Date: Wed, 3 Apr 2024 19:22:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 tursulin@ursulin.net, daniel@ffwll.ch,
 boris.brezillon@collabora.com, zbigniew.kempczynski@intel.com,
 healych@amazon.com, kernel@collabora.com
Subject: Re: [PATCH v2 2/2] tools/gputop: toggle sysfs profiling knob if
 available for device
Message-ID: <20240403172236.zi7ruqdyzdto2q45@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 tursulin@ursulin.net, daniel@ffwll.ch,
 boris.brezillon@collabora.com, zbigniew.kempczynski@intel.com,
 healych@amazon.com, kernel@collabora.com
References: <20240402222813.277470-1-adrian.larumbe@collabora.com>
 <20240402222813.277470-3-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240402222813.277470-3-adrian.larumbe@collabora.com>
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

Hi Adrián,
On 2024-04-02 at 23:27:45 +0100, Adrián Larumbe wrote:
> For every DRM device that enables its job accounting HW from user space,
> toggle it right before obtaining per-client fdinfo numbers.
> 
> Make sure profiling status is returned to its original state before
> exiting, by handling the SIGINT signal just like in intel_gpu_top.
> 
> Also dynamically link gputop against igt lib instead of separate per-file
> static libraries to avoid dependence cascade because of using igt_sysfs
> functions.
> 
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  tools/gputop.c    | 30 +++++++++++++++++++++++++++++-
>  tools/meson.build |  2 +-
>  2 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 71e28f43ee4c..5b390cbdb3e7 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -26,8 +26,10 @@
>  #include <sys/sysmacros.h>
>  #include <stdbool.h>
>  
> +#include "igt_device_scan.h"
>  #include "igt_drm_clients.h"
>  #include "igt_drm_fdinfo.h"
> +#include "igt_profiling.h"
>  #include "drmtest.h"
>  
>  static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> @@ -243,9 +245,17 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
>  
>  }
>  
> +static volatile bool stop_top;
> +
> +static void sigint_handler(int  sig)
> +{
> +	stop_top = true;
> +}
> +
>  int main(int argc, char **argv)
>  {
>  	unsigned int period_us = 2e6;
> +	struct igt_profiled_device *profiled_devices = NULL;
>  	struct igt_drm_clients *clients = NULL;
>  	int con_w = -1, con_h = -1;
>  
> @@ -253,9 +263,22 @@ int main(int argc, char **argv)
>  	if (!clients)
>  		exit(1);
>  
> +	igt_devices_scan(false);
> +
> +	profiled_devices = igt_devices_profiled();
> +	if (profiled_devices != NULL)
> +		igt_devices_toggle_profiling(profiled_devices, true);
> +
> +	if (signal(SIGINT, sigint_handler) == SIG_ERR) {
> +		fprintf(stderr, "Failed to install signal handler!\n");
> +		igt_devices_toggle_profiling(profiled_devices, false);
> +		free(profiled_devices);
> +		profiled_devices = NULL;
> +	}
> +
>  	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>  
> -	for (;;) {
> +	while (!stop_top) {
>  		struct igt_drm_client *c, *prevc = NULL;
>  		int i, engine_w = 0, lines = 0;
>  		struct winsize ws;
> @@ -293,5 +316,10 @@ int main(int argc, char **argv)
>  		usleep(period_us);
>  	}
>  
> +	if (profiled_devices != NULL) {
> +		igt_devices_toggle_profiling(profiled_devices, false);
> +		free(profiled_devices);
> +	}
> +
>  	return 0;
>  }
> diff --git a/tools/meson.build b/tools/meson.build
> index ac79d8b5840c..a126d6cad7ba 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -68,7 +68,7 @@ endif
>  executable('gputop', 'gputop.c',
>             install : true,
>             install_rpath : bindir_rpathdir,
> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
> +           dependencies : [lib_igt, lib_igt_drm_clients, math])

Why not creating lib_igt_profiling with only needed dependeces and
adding it here? Before your patch:

ldd build/tools/gputop

linux-vdso.so.1 (0x00007ffc5e120000)
libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007bf0a4200000)
/lib64/ld-linux-x86-64.so.2 (0x00007bf0a452b000)

After:

ldd gputop |wc -l
78

Regards,
Kamil

>  
>  intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>  executable('intel_l3_parity', sources : intel_l3_parity_src,
> -- 
> 2.44.0
> 
