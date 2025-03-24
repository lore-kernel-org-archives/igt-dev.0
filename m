Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D09C3600B
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 14:00:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7EA10E2FD;
	Mon, 24 Mar 2025 14:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7U1XPiJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0111410E2FD
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742824834; x=1774360834;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=o0vehSsvcq5qLKchDapPP76runTtnMAFPPfmD8us2fw=;
 b=K7U1XPiJv5rzfTFAgAQk9naYbhJYh8QDSTUXu5MQPEY/AR2JnPGbWP2G
 H4ZoX7snXJT3BTwn9FJQhaoiWJLcL2b0cR2c6yrxHt/JD8Q7tINZc6Mqf
 35ouXdEIlzbcUpnwwWy0GWwDsYNEuiKO4x3wydg9dQ2MhNvP84oItkj3U
 PZzdZnGZYFnxRrK9R9AVzwZsjTZysuTtMQRAR8bhh4UlO+Gq2mwM0AFTp
 2dhIpQKJUCaMPRwD/vOf7uX5CUzCATwVE64yJam7ZCqtElWQI55JqQf1w
 vdEySRptffXLWSqNRkoUYRv+Yv6c61PhdYLLbRe8NXs6FiDmZ0/sbzQw1 w==;
X-CSE-ConnectionGUID: L8bfR6wKQOiBGYmNPKue3Q==
X-CSE-MsgGUID: S8S5naL4Q3qYKVyDNytP/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="61551328"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="61551328"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 07:00:34 -0700
X-CSE-ConnectionGUID: EDJ583+lR8iwJZ/ivs7z+w==
X-CSE-MsgGUID: w0hGIbqvTuC0MXUym3tXfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="125005372"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 07:00:32 -0700
Date: Mon, 24 Mar 2025 15:00:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Injection list
 clear at exit
Message-ID: <20250324140029.jr23ea4lzco54qer@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250321095306.798153-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321095306.798153-1-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2025-03-21 at 10:53:06 +0100, Marcin Bernatowicz wrote:
> Reintroduce clearing of the injection list as an exit handler to ensure
> fault injections are properly cleaned up.
> 
> Fixes: c0b2d9202f78 ("tests/intel/xe_fault_injection: Use igt_sysfs helpers")
> 

This empty line should be removed, it can be done at merge time.

> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 5409d19a6..1bd0f51a3 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -137,6 +137,12 @@ static void setup_injection_fault(void)
>  	close(dir);
>  }
>  
> +static void cleanup_injection_fault(int sig)
> +{
> +	/* If nothing specified (‘’) injection list is cleared */
> +	injection_list_do(INJECTION_LIST_ADD, "");
> +}
> +
>  static void set_retval(const char function_name[], long long retval)
>  {
>  	char path[96];
> @@ -371,6 +377,7 @@ igt_main
>  		fd = drm_open_driver(DRIVER_XE);
>  		igt_device_get_pci_slot_name(fd, pci_slot);
>  		setup_injection_fault();
> +		igt_install_exit_handler(cleanup_injection_fault);
>  	}
>  
>  	for (const struct section *s = vm_create_fail_functions; s->name; s++)
> -- 
> 2.31.1
> 
