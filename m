Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DC1C5AD49
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 17:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BFA10E84F;
	Fri, 30 May 2025 17:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDhAxbQE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7285E10E854
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 17:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748626730; x=1780162730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E2z3M2wwnlpiFMArmocwqyMcKJvdzh9eVMW+RmsFNd0=;
 b=gDhAxbQEOgq8Vu5QvLqS0jjFXNVHA+60I0jIYwWez3Sr0oWmRY/DBOnp
 mhlDfRc1Ic2FHuMbkGLpfXYbbp5hzxfHBZvsde0zt+g5Ua5otGn/+CCW6
 YHfyFXRnGeRPeJ4PbsgcqsjM1IJTF+0pdG2tPYkCAJ8sQdSzweqwE9u6T
 3H9ZtWtwkYm5bOrJWiSbduuV/EKxtkaQEPKIh4JTWfJacqNebrKw1pdKY
 KKvodCi1p4vxV52ZbI01Opw5eN32kUctBv1qiJd1NFdC50nRZJhBb993S
 5JxlnZbvqUdGlvps+MpUKUj/tX5uscUMn1fzu2fEmYkKEJ03tYojrWl01 g==;
X-CSE-ConnectionGUID: 8CF5X3zWTTi0FpcOj4FTcg==
X-CSE-MsgGUID: iavxUv4ERziMfBrOiUTgOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50597619"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="50597619"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 10:38:50 -0700
X-CSE-ConnectionGUID: OslyLoKPRCi6o0nuPCJREg==
X-CSE-MsgGUID: +6l8PmCLSS+N4OeAQ0eqTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="174939814"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 10:38:47 -0700
Date: Fri, 30 May 2025 19:38:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, igt-dev@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Message-ID: <20250530173829.ee5jq3o6pxlpj5qa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
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

Hi Satyanarayana,
On 2025-05-29 at 19:01:32 +0530, Satyanarayana K V P wrote:
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

Please also add to discussion Rodrigo
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Regards,
Kamil

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
>  }
>  
>  /*
> @@ -234,7 +213,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
>  		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
>  
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  
> @@ -299,7 +278,7 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
>  	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
>  	xe_exec_queue_destroy(fd, exec_queue_id);
>  
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
> @@ -334,7 +313,7 @@ vm_create_fail(int fd, const char function_name[], unsigned int flags)
>  {
>  	igt_assert_eq(simple_vm_create(fd, flags), 0);
>  
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(simple_vm_create(fd, flags) != 0);
> @@ -397,7 +376,7 @@ vm_bind_fail(int fd, const char function_name[])
>  
>  	igt_assert_eq(simple_vm_bind(fd, vm), 0);
>  
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(simple_vm_bind(fd, vm) != 0);
> @@ -445,7 +424,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
>  	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
>  	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
>  
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_faults_in_dmesg();
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
> -- 
> 2.43.0
> 
