Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE90D5C0F4
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 15:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FDF10E9EB;
	Fri,  8 Nov 2024 15:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eeizSAW4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AF310E9EB
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 15:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731081508; x=1762617508;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NQlHIC2RJ+j9G4yV+2q/aaWuSItnGGbefgrF9z7AIkM=;
 b=eeizSAW45+RubzaF8X+H7gZbkI9MKH0406cGCGGaGZAPo15KOR4NvEgH
 2gZaWziOrMnSD7r15dERMyW+hh08dKlcT28XDTTmYv7ixqCdiYes5O5Ve
 94qHxJZ4qCQBn9jnQ2xymiXBtxj9IDG2Hh7lhS6QzsgzMHJuk7jGV/Zxi
 R3eCpVC+ppzo+1fXwJokirGULh49a5JrgB1QzDWgshSJ1cfEPp4K7nMFb
 /nIjKAePZppNFCbaVj9/IpsfNzDNeJpSG08FmC82pYr+BvIOE2RJkzxrj
 59xioqs9oEBrjwOao4yYJy9qVmrMFWX2NCeOtd3TWgK+NK1bD2tYxBpq7 w==;
X-CSE-ConnectionGUID: ftA/b9Y6SvGdRPH1vM+MdA==
X-CSE-MsgGUID: x5dpobc3S82yWEX4JgezEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30367068"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="30367068"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 07:58:28 -0800
X-CSE-ConnectionGUID: Y5Zvu48pSEefWl8aL48E/w==
X-CSE-MsgGUID: YXEtBDrUTReLe95wJDZs+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="90162611"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 07:58:26 -0800
Date: Fri, 8 Nov 2024 16:58:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, francois.dugast@intel.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH v2] tests/intel/xe_fault_injection: Ignore expected errors
Message-ID: <20241108155824.deuiikqqcvog32ms@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 francois.dugast@intel.com, lucas.demarchi@intel.com,
 matthew.brost@intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com
References: <20241107195959.98509-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107195959.98509-1-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2024-11-07 at 19:59:59 +0000, Jonathan Cavitt wrote:
> The following errors can be observed when running the xe_fault_injection
> subtests:
> 
> [drm] *ERROR* GT0: GuC init failed with -ENOMEM
> [drm] *ERROR* GT0: Failed to initialize uC (-ENOMEM)
> probe with driver xe failed with error -12
> 
> Add these messages to the dmesg ignore regex to the applicable tests
> (specifically, all tests for the last error, and all tests that target
> GuC subsystems for the first two errors).
> 
> v2:
> - Fix and merge regex (Kamil)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Francois Dugast <francois.dugast@intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> CC: Matthew Brost <matthew.brost@intel.com>
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index d1c8b25307..8b181808ed 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -30,6 +30,30 @@ enum injection_list_action {
>  	INJECTION_LIST_REMOVE,
>  };
>  
> +static bool function_is_part_of_guc(char function_name[])
> +{
> +	return strstr(function_name, "_guc_") != NULL ||
> +	       strstr(function_name, "_uc_") != NULL ||
> +	       strstr(function_name, "_wopcm_") != NULL;
> +}
> +
> +static void ignore_faults_in_dmesg(char function_name[])
> +{
> +	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
> +	char regex[1024] = "probe with driver xe failed with error -12";
> +
> +	/*
> +	 * If GuC module fault is injected, GuC is expected to fail,
> +	 * so also ignore GuC init failures in igt_runner.
> +	 */
> +	if (function_is_part_of_guc(function_name)) {
> +		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> +		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");

This could be one call to strcat, but it is not a blocker.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +	}
> +
> +	igt_emit_ignore_dmesg_regex(regex);
> +}
> +
>  /*
>   * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
>   */
> @@ -175,6 +199,7 @@ igt_main
>  			if (regexec(&regex, line, 2, pmatch, 0) == 0) {
>  				strcpy(function_name, line);
>  				function_name[pmatch[1].rm_eo - 1] = '\0';
> +				ignore_faults_in_dmesg(function_name);
>  				igt_dynamic_f("function-%s", function_name)
>  					inject_fault_try_bind(fd, pci_slot, function_name);
>  			}
> -- 
> 2.43.0
> 
