Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59407C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 14:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EA310E417;
	Mon, 24 Mar 2025 14:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W98b3Ozk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC40610E417
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742827006; x=1774363006;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VcQ+kq1GGbXls/FA3ggo28AG7gavqt7W9vw6I4+wkfM=;
 b=W98b3Ozk4d99r3510WPCN7NZTzJNmN3zPF4bUD1md8HXhiTaY73OPcYt
 8wesQUjpYNkGPL+vcoiC7zwP3rB1ZAOyXvcGSNcWdjh24YZIZgOi7kCeF
 GJnI3b97DZ2rIBi1MkPvuz84RP5JRKmzeyUoeByHNhJTmDOIZZIr2EQpz
 /JPOMFnMSqBOwiyHxlNOLt3BxTCtRAQ0KXgsZ96qKxi9odAkc2q1UNC/j
 4gjsXo6Tis9KTPkMpSTd7l8eMmQglWMckabrvUy37ObqNYhwbxBHf6Y6Q
 xmZKxXzWXRWeDVY8BXK7AEcPF4wcelK4jmzHFO8wNv17FzneId8ryJ3Ga Q==;
X-CSE-ConnectionGUID: O6uSQA1KTVaisLJRavLqTg==
X-CSE-MsgGUID: 5k9e9FxyRESI5Tf8dD/58g==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43190996"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="43190996"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 07:36:45 -0700
X-CSE-ConnectionGUID: CHhnp6VrR02nLrFbfmBlOA==
X-CSE-MsgGUID: GA8VcNVWRfiUbltdK2tmKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124228755"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 07:36:43 -0700
Date: Mon, 24 Mar 2025 15:36:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Injection list
 clear at exit
Message-ID: <20250324143641.gyrvzallb4gqpocg@kamilkon-desk.igk.intel.com>
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
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Applied, thank you for a fix.

Regards,
Kamil

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
