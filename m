Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D39C7EE33
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 11:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4AB010E658;
	Thu, 29 Aug 2024 11:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OvhIk0to";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2C110E658
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724932722; x=1756468722;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NiyEiEaYURIqGT6Sj0WRzwXIaUET4SMuDOElgHPttFY=;
 b=OvhIk0toYo7L1UDARt4bQVQWOZ685g/oG2QKOuXPJh4UU3VovxhtquYd
 tI8qA5PQ5eFQbdlJsXK8PClEnVWeU8gZalnxG0Jgc5dWEZR+6U4h+u7dQ
 pJ3GAsg2ARuOz9Lj1q8E0mmGPehWkIt45jgJTchaw5dYmaROFgLpjW2t+
 VGcT34NE9f0uPmr1/my0lAoM0fmDP+A2MzHqTUajRgO1M3ckBbox0y0Vn
 NOq1rBdoIcUF1ni52WAWL0Hj2hMihiIBBTuBKud5ugr1gSam22+XzqcRo
 ceaQdIeFXoPP1Sj12hNL14ukvfIrC5+bsatonx/zzJq6bx3TMkj8srXeC Q==;
X-CSE-ConnectionGUID: 6JYJrm0bQBy0DBM8cNaEtw==
X-CSE-MsgGUID: spxbz4BiSf2ou4n0JSjceg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34675780"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="34675780"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 04:58:42 -0700
X-CSE-ConnectionGUID: ENBwH/mHQ1SCR9F1uOuLGA==
X-CSE-MsgGUID: E93rnnmrRJujrFgRcLm5qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="67932546"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.101.34])
 ([10.245.101.34])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 04:58:39 -0700
Message-ID: <bc863495-ca9e-416c-9497-545cc1cdd401@linux.intel.com>
Date: Thu, 29 Aug 2024 13:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_core: Refactor libpciaccess init/cleanup
 wrappers
To: igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
References: <20240829075811.87076-1-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240829075811.87076-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 8/29/2024 9:58 AM, Marcin Bernatowicz wrote:
> Enable reinitialization of the libpciaccess global state, necessary
> to correctly handle dynamic add/remove of PCI devices, such as the
> creation/removal of Virtual Functions (VFs). Update
> igt_pci_system_cleanup() to conditionally call pci_system_cleanup()
> based on the initialization state. Introduce igt_pci_system_reinit()
> for explicit reinitialization of the libpciaccess global state,
> particularly useful after PCI device changes, to be used in
> subsequent patches.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> ---
>   lib/igt_core.c | 42 ++++++++++++++++++++++++++++++++++++------
>   lib/igt_core.h | 36 ++++++++++++++++++++++++------------
>   2 files changed, 60 insertions(+), 18 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 3ff3e0392..4710899bf 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3414,21 +3414,51 @@ void igt_srandom(void)
>   }
>   
>   /* IGT wrappers around libpciaccess init/cleanup functions */
> +static int pci_system_initialized;
> +static pthread_mutex_t pci_system_mutex = PTHREAD_MUTEX_INITIALIZER;
> +
> +void igt_pci_system_cleanup(void)
> +{
> +	pthread_mutex_lock(&pci_system_mutex);
> +	if (pci_system_initialized) {
> +		pci_system_cleanup();
> +		pci_system_initialized = 0;
> +	}
> +	pthread_mutex_unlock(&pci_system_mutex);
> +}
>   
>   static void pci_system_exit_handler(int sig)
>   {
> -	pci_system_cleanup();
> +	igt_pci_system_cleanup();
>   }
>   
> -static void __pci_system_init(void)
> +int igt_pci_system_init(void)
>   {
> -	if (!igt_warn_on_f(pci_system_init(), "Could not initialize libpciaccess global data\n"))
> +	int ret = 0;
> +	bool install_handler = false;
> +
> +	pthread_mutex_lock(&pci_system_mutex);
> +	if (!pci_system_initialized) {
> +		ret = igt_warn_on_f(pci_system_init(),
> +				    "Could not initialize libpciaccess global data\n");
> +		if (ret) {
> +			pci_system_initialized = 0;
> +		} else {
> +			pci_system_initialized = 1;
> +			install_handler = true;
> +		}

To be simplified with:

if (!pci_system_initialized) {
     ret = igt_warn_on_f(pci_system_init(), "Could not initialize...\n");
     if (!ret) {
         pci_system_initialized = 1;
         install_handler = true;
     }
}

> +	}
> +	pthread_mutex_unlock(&pci_system_mutex);
> +
> +	if (install_handler)
>   		igt_install_exit_handler(pci_system_exit_handler);
> +
> +	return ret;
>   }
>   
> -int igt_pci_system_init(void)
> +int igt_pci_system_reinit(void)
>   {
> -	static pthread_once_t once_control = PTHREAD_ONCE_INIT;
> +	igt_pci_system_cleanup();
>   
> -	return pthread_once(&once_control, __pci_system_init);
> +	return igt_pci_system_init();
>   }
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 06c5314bf..0d7e948a8 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1518,28 +1518,40 @@ void igt_kmsg(const char *format, ...);
>    * igt_pci_system_init:
>    * IGT wrapper around pci_system_init()
>    *
> - * Runs pci_system_init() and installs pci_system_cleanup() as IGT exit handler when
> - * called first per thread, subsequent calls are noop.  Tests should use this wrapper
> + * Runs pci_system_init() and installs igt_pci_system_cleanup() as IGT exit handler when
> + * called first per thread, subsequent calls are noop. Tests should use this wrapper
>    * instead of pci_system_init() to avoid memory leaking which happens each time a call
>    * to pci_system_init() is repeated not preceded by pci_system_cleanup() (may easily
>    * happen in consequence of long jumps performed by IGT flow control functions).
>    *
> - * Return value: equal return value of pthread_once() (return value of pci_system_init()
> - *		 can't be passed through pthread_once())
> + * Return:
> + * Return value of pci_system_init() or 0 if pci system is already initialized.
>    */
>   int igt_pci_system_init(void);
>   
> +/**
> + * igt_pci_system_reinit:
> + * Reinitialize libpciaccess global data.
> + *
> + * Executes igt_pci_system_cleanup() and igt_pci_system_init() to refresh
> + * the PCI system state, typically needed after PCI devices are added or
> + * removed.
> + *
> + * Note: All previously obtained handles (pci_dev, mmio) become invalid
> + * after this call. Do not use old handles post-reinitialization.
> + *
> + * Return: Outcome of igt_pci_system_init().
> + */
> +int igt_pci_system_reinit(void);
> +
>   /**
>    * igt_pci_system_cleanup():
> - * IGT replacement for pci_system_cleanup()
> + * IGT wrapper around pci_system_cleanup()
>    *
> - * For use in IGT library and tests to avoid destroying libpciaccess global data.
> - * Direct calls to pci_system_cleanup() should be either dropped or replaced with this
> - * wrapper (for code clarity), otherwise subsequent access to libpciaccess global data
> - * may be lost unless preceded by direct call to pci_system_init() (not recommended).
> + * Runs pci_system_cleanup() if igt_pci_system_init() was successfully called
> + * before. This allows to refresh the libpciaccess global data when followed
> + * by igt_pci_system_init(), see igt_pci_system_reinit().
>    */
> -static inline void igt_pci_system_cleanup(void)
> -{
> -}
> +void igt_pci_system_cleanup(void);
>   
>   #endif /* IGT_CORE_H */

