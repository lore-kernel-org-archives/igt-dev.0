Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83DBC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 12:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E60710F6C0;
	Mon, 18 Mar 2024 12:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWPFUss4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1B710F6D5
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 12:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710765645; x=1742301645;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gObsoVq+KTJ/39+/HBGF9fOj2N8z1rflcYY8KmssVdM=;
 b=LWPFUss4PY+cq7GhcvHmMiZMMAmOHDhXlEpWVqmzs4HpLJq2ZoU2A+Mu
 4zIWwhgJvu8a8bgtr/6QTKc3UuIJ5eC2l7UZvd1/KWai/8ZVWEtzTZhyL
 3Ocktih8gR6aJgkCV6I2wj7X9W59C5NN/L3lvXV/sCPeiqluwnJ0V1FJT
 3AUd9JBeQzP3noBNOT22MHhFMckiue5VrB/G91jaet7av5aCPwO7KRbV8
 r+1v08SFYnFsOrRovDJ/nLWiEbO2AYiIlsU+WaECH6XoEVm7oVkgdyyba
 1tjNxZf6ASNb1L7V94Ugo3KzUWBVy7QxDxqX2LSJ2/+KcIXRl6m32kZFP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16212038"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16212038"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 05:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13929417"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 05:40:42 -0700
Date: Mon, 18 Mar 2024 13:40:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 tvrtko.ursulin@intel.com, daniel@ffwll.ch, boris.brezillon@collabora.com
Subject: Re: [PATCH 2/2] tools/gputop: toggle sysfs profiling knob if
 available for device
Message-ID: <20240318124039.btbkh5ann72ez5nk@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 tvrtko.ursulin@intel.com, daniel@ffwll.ch,
 boris.brezillon@collabora.com
References: <20240316220229.249119-1-adrian.larumbe@collabora.com>
 <20240316220229.249119-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240316220229.249119-2-adrian.larumbe@collabora.com>
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
On 2024-03-16 at 22:00:38 +0000, Adrián Larumbe wrote:
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
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  tools/gputop.c    | 30 +++++++++++++++++++++++++++++-
>  tools/meson.build |  2 +-
>  2 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index 71e28f43ee4c..d6885be6aa16 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -27,7 +27,9 @@
>  #include <stdbool.h>
>  
>  #include "igt_drm_clients.h"
> +#include "igt_device_scan.h"
>  #include "igt_drm_fdinfo.h"
> +#include "igt_profiling.h"
>  #include "drmtest.h"
>  
>  static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> @@ -243,9 +245,17 @@ static int client_cmp(const void *_a, const void *_b, void *unused)
>  
>  }
>  
> +static bool stop_top;
--------- ^^^^^^
Add 'volatile' here as compiler could optimise your loop into
while(true).

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
------------------------------------------------- ^^^^^^^^^^^^^^^^^^
> +           dependencies : [lib_igt, lib_igt_drm_clients, math])
----------------------------- ^^^^^^^
This will blow-up size of tool, also why did you removed
lib_igt_drm_fdinfo?

Regards,
Kamil

>  
>  intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
>  executable('intel_l3_parity', sources : intel_l3_parity_src,
> -- 
> 2.43.0
> 
