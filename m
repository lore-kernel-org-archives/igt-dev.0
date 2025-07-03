Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0DCC83030
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 19:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB7910E1C2;
	Thu,  3 Jul 2025 19:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzA5O8LB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBD310E1C2
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 19:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751570751; x=1783106751;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dmyUvXiz2i7P5Q0r9xC1nfw9bXoMnYEpYj06zKAFZLs=;
 b=WzA5O8LB3XjbdCYUQFi2QJ07RLFIh91qqgn4hP/7VPFccB8VWo/4TZ+S
 20geiZ2PjoAUaZINjcflgMFggtWrHUgoxPbSdzfALFtGjRJiTWpVdRDbz
 sW2r8sy8AJZdkLzLrqCVvAWh9vcnYJ3VHnGwCurS7hHic+L1HtwbbhNH4
 flLNi8JWbNKeKNUhj0FG8zezmrdlCHZx7kuf18Es7qNmAExyPUCMTiwhY
 M6EQRaUPFwDnxlYt/8mQzlpRhYVETXBifPh8WDAgG9BRqF0P0lviveEMm
 Cvq4a4xrab4NDQHMAz88MPP0Qkmnz/DZBucjhIvFvEBZQiNZjDZ24Rm0e Q==;
X-CSE-ConnectionGUID: lOQHBtJ9Q3Ocnd2DYhiewg==
X-CSE-MsgGUID: QrOVN1rGSWSmqjiFZZdfaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57684483"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="57684483"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:25:50 -0700
X-CSE-ConnectionGUID: HIG2VmwkSW6cJv/MocRzIQ==
X-CSE-MsgGUID: uTo3o2JkRGma8bushpsRjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="178115161"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 12:25:48 -0700
Message-ID: <4d2b52a5-40a1-4896-a215-77e6012225ae@linux.intel.com>
Date: Thu, 3 Jul 2025 21:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] igt_core: igt_hook_get_pointer() for external
 hooks
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250703150304.101208-1-peter.senna@linux.intel.com>
 <20250703150304.101208-2-peter.senna@linux.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250703150304.101208-2-peter.senna@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Sorry Lucas and Gustavo for the typo in your email address...

On 7/3/2025 5:03 PM, Peter Senna Tschudin wrote:
> Previously, all igt_hooks were defined, initialized, and freed within
> lib/igt_core.c, limiting hook creation to this file. To enable other
> libraries to add hooks, introduce a function that returns a pointer to
> the main hook structure.
> 
> This change allows hooks to be created from external libraries without
> requiring separate initialization or teardown of the hook
> infrastructure.
> 
> Cc: Gustavo Sousa <gustavo.sousa@linux.intel.com>
> Cc: Lucas de Marchi <lucas.demarchi@linux.intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  lib/igt_core.c | 12 ++++++++++++
>  lib/igt_core.h |  9 +++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index c2674a272..f7a1ee36c 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3604,3 +3604,15 @@ unsigned int igt_measured_usleep(unsigned int usec)
>  
>  	return igt_nsec_elapsed(&ts) / NSEC_PER_USEC;
>  }
> +
> +/**
> + * igt_hook_get_pointer: To allow for using hooks from other libraries, this
> + * function returns the pointer to the struct that is likely already
> + * initialized.
> + *
> + * Returns: Pointer to the igt_hook structure.
> + */
> +struct igt_hook *igt_hook_get_pointer(void)
> +{
> +	return igt_hook;
> +}
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 2db579423..2e65c89dd 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1601,4 +1601,13 @@ void igt_pci_system_cleanup(void);
>  void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
>  
>  unsigned int igt_measured_usleep(unsigned int usec);
> +
> +/**
> + * igt_hook_get_pointer: To allow for using hooks from other libraries, this
> + * function returns the pointer to the struct that is likely already
> + * initialized.
> + *
> + * Returns: Pointer to the igt_hook structure.
> + */
> +struct igt_hook *igt_hook_get_pointer(void);
>  #endif /* IGT_CORE_H */

