Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66BFD5D67D
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 17:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5772510E084;
	Thu,  7 Nov 2024 17:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYz+ZwOU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23ADA10E084
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731002038; x=1762538038;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8+9+UO4jVBX75yKp6zp7JF++/nn1QFPZUnZKi0ULBls=;
 b=NYz+ZwOUoghaxqNGnfnWl78wUFlM5bvvmqpwPTY+2Mjxbu/LX3T2QI6s
 6rRT2YiBrP+sgbTC2JHPDl+bnLn4Qprg0PPzvaNN0dcgWfDixjjCQY4T1
 gQRfbAOMq8Y88j2ChN0Vg+luqEshOQJVnHP8KVILAswbxJXORq0mRyxRW
 +FbYZNSTjHKsseknQFTJltl9f5ICxUF1hIB2Gws3SJLuIfRFlm0APBXRe
 CzHuWaXB16D4YFyr956d7IlEecdtDBb6ZlkX5KZXSc/3fcTeINpSUPe2+
 aP/PS6HFXUQviJLIoC2OleHYXpbR+cAsg0FeATpRvh/7tsNlnEdlDXKmI A==;
X-CSE-ConnectionGUID: zTH3lCNYTcCFeal3AcwSQQ==
X-CSE-MsgGUID: IQycVD+7Rhm1xJ+l4ifqFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="41482772"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="41482772"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 09:53:55 -0800
X-CSE-ConnectionGUID: 58F2HfBxRGGcUYRCk64JjQ==
X-CSE-MsgGUID: H3Y22n9ZR26O+XcO+khQug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; d="scan'208";a="85503362"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 09:53:53 -0800
Date: Thu, 7 Nov 2024 18:53:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, francois.dugast@intel.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com
Subject: Re: [PATCH] tests/intel/xe_fault_injection: Ignore expected errors
Message-ID: <20241107175350.lhu7c2zwyp2onpzi@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 francois.dugast@intel.com, lucas.demarchi@intel.com,
 matthew.brost@intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com
References: <20241106200244.119564-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106200244.119564-1-jonathan.cavitt@intel.com>
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
On 2024-11-06 at 20:02:44 +0000, Jonathan Cavitt wrote:
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
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Francois Dugast <francois.dugast@intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> CC: Matthew Brost <matthew.brost@intel.com>
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index d1c8b25307..5bdc3d09e6 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -30,6 +30,27 @@ enum injection_list_action {
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
> +	igt_emit_ignore_dmesg_regex("probe with driver xe failed with error -12");
> +
> +	/*
> +	 * If GuC module fault is injected, GuC is expected to fail,
> +	 * so also ignore GuC init failures in igt_runner.
> +	 */
> +	if (function_is_part_of_guc(function_name))
> +		igt_emit_ignore_dmesg_regex("GT0: GuC init failed with -ENOMEM"
> +					    "|GT0: Failed to initialize uC (-ENOMEM)");

imho zero in 'GT0' should be replaced with digits, like:

GT[0-9a-fA-F]*: GuC init failed with -ENOMEM"

Also do not use '(', replace it with dot:

"|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM"

You cannot emit string one after another now, as first regex will be lost,
so this should be concatenated into one big string and then emitted.

static char *probe_err_12 = "Probe...";
static char *guc_failed = "Probe..."
			  "|GT..."
			  "|GT...";

and use one of them. Or concatenate before emit.

Regards,
Kamil

> +}
> +
>  /*
>   * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
>   */
> @@ -175,6 +196,7 @@ igt_main
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
