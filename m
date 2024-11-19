Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF6FD6C299
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 20:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7B310E0A4;
	Tue, 19 Nov 2024 20:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBA2D3Py";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8213310E0A4
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 20:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732049406; x=1763585406;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2N2OjDXOLlvUMSUBqAivA4HCSpUbvEgq0Adb8ERFwtU=;
 b=KBA2D3PyVgvg1s8cZnLEk2VOwNMulSghL/B2cPBCpqmTO8oRf4CDOe7+
 46o4PykrrlWKhByhUvO8d6cZ1/ZLb6anTixNake/BBMzErZOHRZUOhmCD
 7p2ulUfK/Wx4fXMcwTpPgh/bDam9nZ1Y5v/FQQ289UknTRV4XdOxFZGMS
 T8S8E3PSrmwD7VNtbZ83mAqo+zMJlxyIBsvr6eIXA6i1nO9AtMhth81ru
 D4T7N41AZvUwV5KEpWr5KnLVL66N2lvkOtRzt9rDDhL6kRTe/fFDCyoEX
 X0JDwUK2dwE6NhBU1GM4tES3QXYPDzxeh3cV/jtfoFU8dVpGgtlywnWHw Q==;
X-CSE-ConnectionGUID: 9PP8Paj6RJ6Nm0YdBqR8LQ==
X-CSE-MsgGUID: V9NTFSmpTxyr6B87YD4kwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="49615415"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="49615415"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 12:50:05 -0800
X-CSE-ConnectionGUID: UaSR0BnUTtmN7x/sDLn1xw==
X-CSE-MsgGUID: qIK2NQYbSce6rCkFbBxw2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89496891"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 12:50:04 -0800
Date: Tue, 19 Nov 2024 21:50:01 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, francois.dugast@intel.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH v2] tests/intel/xe_fault_injection: Ignore expected errors
Message-ID: <20241119205001.3xwoinayeqsehhcz@kamilkon-desk.igk.intel.com>
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

There were recently changes apllied to this test and now your patch
do not apply, also imho we need to test it again so please rebase
and resend.

Regards,
Kamil

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
