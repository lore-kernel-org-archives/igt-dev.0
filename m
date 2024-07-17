Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5837C3DA4B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 13:58:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B60610E0EF;
	Wed, 17 Jul 2024 13:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XbkAuM1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617C810E0EF
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 13:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721224733; x=1752760733;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=X/j6Orej1EGEdhRZmYHcjp/EXpjBgHjYi6FJhbZPvKw=;
 b=XbkAuM1FCjdeYBw44oGHkJFiVFXcIBEbIGgd4uQ3mkOv9gG6GjaWN3jr
 CQiSDJEfHCV91abuXNVcNQL5lzcHzWO4/0AJdPqgiTgGP0rgfZZJ0KXGT
 aML5JOAc5T7a6sKyKlUEz+9pNlHnNL2VvhXGXWBaJUhnrAcu9XA4TtFID
 e0yfDFF26zJxRSuHsMuTkbzODsMDzkjVUwAbxijw2+TJMMpQjjCOOT9G6
 4YEs5RmUTDUJrAWMTNjvyKySuWyMcl0Pv+Jcv2Iz6SS5CvXxg29ljvu3x
 H/28qqMJof4M4JMQSlDur02Xn6ahbWzL5uPr0gPtCnoFm6TpEyzwJ2HoC A==;
X-CSE-ConnectionGUID: 4R9olpx/StCGQ0DmIiGpmg==
X-CSE-MsgGUID: 1uhWSKmYS8ufSY6OpB748Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12588450"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="12588450"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 06:58:52 -0700
X-CSE-ConnectionGUID: KjLzz1MVTWu7M9lXLKvUeg==
X-CSE-MsgGUID: ezzQ9oKsQ8OdvjLBMA6RdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="81063926"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 06:58:50 -0700
Date: Wed, 17 Jul 2024 15:58:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 tursulin@ursulin.net, robdclark@chromium.org,
 lucas.demarchi@intel.com, healych@amazon.com,
 Daniel Vetter <daniel@ffwll.ch>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v5 2/2] tools/gputop: toggle sysfs profiling knob if
 available for device
Message-ID: <20240717135847.irocdiqdwpxufbry@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 tursulin@ursulin.net, robdclark@chromium.org,
 lucas.demarchi@intel.com, healych@amazon.com,
 Daniel Vetter <daniel@ffwll.ch>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240716205756.2973341-1-adrian.larumbe@collabora.com>
 <20240716205756.2973341-3-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240716205756.2973341-3-adrian.larumbe@collabora.com>
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
On 2024-07-16 at 21:57:24 +0100, Adrián Larumbe wrote:
> For every DRM device that enables its job accounting HW from user space,
> toggle it right before obtaining per-client fdinfo numbers.
> 
> Make sure profiling status is returned to its original state before
> exiting, by handling the SIGINT signal just like in intel_gpu_top.
> 
> Also add the static IGT profiling library to gputop's list of build
> dependencies.
> 
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tools/gputop.c    | 33 ++++++++++++++++++++++++++++++++-
>  tools/meson.build |  2 +-
>  2 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 6c7cf6927464..23388c92b63a 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -29,6 +29,7 @@
>  #include "igt_core.h"
>  #include "igt_drm_clients.h"
>  #include "igt_drm_fdinfo.h"
> +#include "igt_profiling.h"
>  #include "drmtest.h"
>  
>  enum utilization_type {
> @@ -391,10 +392,19 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
>  	return 1;
>  }
>  
> +static volatile bool stop_top;
> +
> +static void sigint_handler(int sig)
> +{
> +	(void) sig;
> +	stop_top = true;
> +}
> +
>  int main(int argc, char **argv)
>  {
>  	struct gputop_args args;
>  	unsigned int period_us;
> +	struct igt_profiled_device *profiled_devices = NULL;
>  	struct igt_drm_clients *clients = NULL;
>  	int con_w = -1, con_h = -1;
>  	int ret;
> @@ -413,9 +423,22 @@ int main(int argc, char **argv)
>  	if (!clients)
>  		exit(1);
>  
> +

Spurious line, rest looks ok.
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +	profiled_devices = igt_devices_profiled();
> +	if (profiled_devices != NULL) {
> +		igt_devices_configure_profiling(profiled_devices, true);
> +
> +		if (signal(SIGINT, sigint_handler) == SIG_ERR) {
> +			fprintf(stderr, "Failed to install signal handler!\n");
> +			igt_devices_configure_profiling(profiled_devices, false);
> +			igt_devices_free_profiling(profiled_devices);
> +			profiled_devices = NULL;
> +		}
> +	}
> +
>  	igt_drm_clients_scan(clients, NULL, NULL, 0, NULL, 0);
>  
> -	while (n != 0) {
> +	while ((n != 0) && !stop_top) {
>  		struct igt_drm_client *c, *prevc = NULL;
>  		int i, engine_w = 0, lines = 0;
>  
> @@ -443,9 +466,17 @@ int main(int argc, char **argv)
>  		usleep(period_us);
>  		if (n > 0)
>  			n--;
> +
> +		if (profiled_devices != NULL)
> +			igt_devices_update_original_profiling_state(profiled_devices);
>  	}
>  
>  	igt_drm_clients_free(clients);
>  
> +	if (profiled_devices != NULL) {
> +		igt_devices_configure_profiling(profiled_devices, false);
> +		igt_devices_free_profiling(profiled_devices);
> +	}
> +
>  	return 0;
>  }
> diff --git a/tools/meson.build b/tools/meson.build
> index c02c020d0b31..df26c4b95e3f 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -69,7 +69,7 @@ endif
>  executable('gputop', 'gputop.c',
>             install : true,
>             install_rpath : bindir_rpathdir,
> -           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
> +           dependencies : [lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math])
>  
>  intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>  executable('intel_l3_parity', sources : intel_l3_parity_src,
> -- 
> 2.45.1
> 
