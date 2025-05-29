Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33C7C54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 20:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4CD10E240;
	Thu, 29 May 2025 20:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9Nx2I34";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B696B10E240
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 20:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748549649; x=1780085649;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=e3Erwuv1FSeDc+Yxgavfo5NqzfP1uztakHxF985Dmog=;
 b=X9Nx2I34Oi+22l4rfvDX+rcF7gBBqyv2ija4r28ms4f82zPeZuwo8WV0
 YerYiN+AcLyHc9iUjio2QDrCGP8BQpczHwelWGe+BKPva8oayK/iTUvXW
 TCYcymTkpVkSeOnf/C49fGyFl/VGG0KrQlQ9Ao8QNs6M8nLsA5DUks4HX
 LeRGfzJWDBlO4ub0JTaLIWHufzOXaMT0wKv04mVaRer4ULKc4UAM9/qh1
 xN5hBqqAfmtTNlw4ESaNq17f9FcqpMLjZ1cyLefCsDXPVHSHG4f2aqyLx
 FdvLCPr/L1uekfrqgkd15l0GR2o9bQxOWpfUtNtQFKzNEepgrCtqAVBP6 w==;
X-CSE-ConnectionGUID: LIGBHynoQPSqLsNiHmoVEw==
X-CSE-MsgGUID: UXw7Gcc1QLCT+9Wu2U61JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50735018"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50735018"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 13:14:07 -0700
X-CSE-ConnectionGUID: /7hy02OjQTuWC3PvF/gU0A==
X-CSE-MsgGUID: OCNV++BjRNeERzPMuHdzTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="143619869"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 29 May 2025 13:14:05 -0700
Received: from [10.245.113.199] (unknown [10.245.113.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E674B34959;
 Thu, 29 May 2025 21:14:03 +0100 (IST)
Message-ID: <bafb3f48-e1bb-4ed4-8419-dd5e85875795@intel.com>
Date: Thu, 29 May 2025 22:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
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



On 29.05.2025 15:31, Satyanarayana K V P wrote:
> Currently, numerous fault messages have been included in the dmesg ignore list,
> and this list continues to expand. Each time a new fault injection point is
> introduced or a new feature is activated, additional fault messages appear,
> making it cumbersome to manage the dmesg ignore list.
> 
> This new patch automatically ignores all error messages from dmesg, eliminating
> the need to add or maintain a dmesg ignore message list.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 35 +++++++-------------------------
>  1 file changed, 7 insertions(+), 28 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index f9bd5c761..0dffbe5da 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -64,30 +64,9 @@ static int fail_function_open(void)
>  	return debugfs_fail_function_dir_fd;
>  }
>  
> -static bool function_is_part_of_guc(const char function_name[])
> +static void ignore_faults_in_dmesg(void)
>  {
> -	return strstr(function_name, "_guc_") != NULL ||
> -	       strstr(function_name, "_uc_") != NULL ||
> -	       strstr(function_name, "_wopcm_") != NULL;
> -}
> -
> -static void ignore_faults_in_dmesg(const char function_name[])
> -{
> -	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
> -	char regex[1024] = "probe with driver xe failed with error -12";
> -
> -	/*
> -	 * If GuC module fault is injected, GuC is expected to fail,
> -	 * so also ignore GuC init failures in igt_runner.
> -	 */
> -	if (function_is_part_of_guc(function_name)) {
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
> -	}
> -
> -	igt_emit_ignore_dmesg_regex(regex);
> +	igt_emit_ignore_dmesg_regex(".*");

that will filter out all messages, no?

maybe we should look for KERN_ERR level messages

if IGT can't filter by level then at least look for our errors:

	xe 0000:00:02.0 [drm] *ERROR*
	xe ... [drm] *ERROR*
	[drm] *ERROR*
	*ERROR*

and we want to catch/report all warn/WARN/BUG without just relying on
taint (and WARN will also catch our xe_asserts)

