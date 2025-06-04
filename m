Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4707BC5B555
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 17:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E6610E724;
	Wed,  4 Jun 2025 17:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y3yImI7G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D0F10E724
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 17:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749056645; x=1780592645;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g0rOCNIsm/YHfeTYf5k0/Juhel5GXOFwwKSkB/1lZ64=;
 b=Y3yImI7Gz5T8D/Gfw4B4xJP220QI0Za2EUZZbCLfnvJX+RlE0gAT/EU8
 WbQae2oOiJSXp5pJs0VtM7w+VJg51FsskJhMjPUBzXgFbPngiu/Sgdk0U
 FTsFaStMyGfIZmTakMwNb5jF5r8uhNuk1F28Yf1KvwRrt/AbgtQtmZseD
 K10fsSDG1C7JAlWyKsf278ZRK7KubnqQ2bjdnJ0CjzpAKDq/PPMPHlAgd
 H4wM0YRe4+Ff4W2YYYm1muGOgdBsCd+IZBTF1eZ02Kdnyj/zoqCwYbhgT
 I+GWSJSKPP90VM7Fl5lUnhRy4ZrBudWQx6CSi6HPG0R1POmfxF36bqaMU A==;
X-CSE-ConnectionGUID: zexJe0fvTo+XwQ1xrXSpqA==
X-CSE-MsgGUID: d/3SSGrMQDyQijszO1ZRgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="73686455"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="73686455"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:04:05 -0700
X-CSE-ConnectionGUID: JvjzMqyqTYe7a7Vz5DUn1g==
X-CSE-MsgGUID: j1IKrwDKT6SUhffkE+81SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="176131859"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:04:02 -0700
Date: Wed, 4 Jun 2025 19:04:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, francois.dugast@intel.com,
 rodrigo.vivi@intel.com, john.c.harrison@intel.com
Subject: Re: [PATCH v3] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Message-ID: <20250604170400.mte7k3mun3ucwmtr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com,
 alex.zuo@intel.com, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, francois.dugast@intel.com,
 rodrigo.vivi@intel.com, john.c.harrison@intel.com
References: <20250604161923.38226-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250604161923.38226-1-jonathan.cavitt@intel.com>
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
On 2025-06-04 at 16:19:23 +0000, Jonathan Cavitt wrote:
> From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> 
> Currently, numerous fault messages have been included in the dmesg
> ignore list, and this list continues to expand.  Each time a new fault
> injection point is introduced or a new feature is activated, additional
> fault messages appear, making it cumbersome to manage the dmesg ignore
> list.
> 
> However, we can safely assert that all dmesg reports that contain
> *ERROR* in their message can be ignored, so add them to the dmesg ignore
> list.  This unfortunately does not include the device probe error
> itself, so that must be added separately.
> 
> While we're here, we should also assert that any errors we see are only
> coming from the target PCI device.
> 
> v2:
> - Only ignore error-level dmesg reports (or, at least, reports with
>   *ERROR* in them), and device probe failues
> - Add PCI data to regex (Michal)
> 
> v3: (Michal)
> - Revert name change
> - Add change log
> - Remove fixes tag from commit
> - Rename ignore_faults_in_dmesg to igt_ignore_dmesg_errors_from_dut, and
>   move to lib/igt_core.c
> - Minor code fixes
> 
> v4:
> - Return ignore_faults_in_dmesg to tests/intel/xe_fault_injection.c, but
>   keep it renamed to ignore_dmesg_errors_from_dut (Kamil)
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_core.c                   |  1 +
>  tests/intel/xe_fault_injection.c | 39 ++++++++++++--------------------
>  2 files changed, 16 insertions(+), 24 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index b06cdfd894..ad70718b4a 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -76,6 +76,7 @@
>  #include "igt_rc.h"
>  #include "igt_list.h"
>  #include "igt_map.h"
> +#include "igt_device.h"

Please drop this change.

Regards,
Kamil

>  #include "igt_device_scan.h"
>  #include "igt_thread.h"
>  #include "igt_vec.h"
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 9fe6bfe351..14aaeebf5e 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -64,28 +64,19 @@ static int fail_function_open(void)
>  	return debugfs_fail_function_dir_fd;
>  }
>  
> -static bool function_is_part_of_guc(const char function_name[])
> +static void ignore_dmesg_errors_from_dut(int fd)
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
>  	/*
> -	 * If GuC module fault is injected, GuC is expected to fail,
> -	 * so also ignore GuC init failures in igt_runner.
> +	 * Driver probe is expected to fail in all cases, so ignore in igt_runner.
> +	 * Additionally, all error-level reports are expected, so ignore those as well.
>  	 */
> -	if (function_is_part_of_guc(function_name)) {
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed: -ENOMEM");
> -	}
> +	static const char *store = "probe with driver xe failed with error|\\*ERROR\\*";
> +	char pci_slot[NAME_MAX];
> +	char regex[1024];
> +
> +	/* Only block dmesg reports that target the pci slot of the given fd */
> +	igt_device_get_pci_slot_name(fd, pci_slot);
> +	snprintf(regex, sizeof(regex), "%s:.*(%s)", pci_slot, store);
>  
>  	igt_emit_ignore_dmesg_regex(regex);
>  }
> @@ -234,7 +225,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>  	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
>  		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
>  
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  
> @@ -299,7 +290,7 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
>  	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
>  	xe_exec_queue_destroy(fd, exec_queue_id);
>  
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
> @@ -334,7 +325,7 @@ vm_create_fail(int fd, const char function_name[], unsigned int flags)
>  {
>  	igt_assert_eq(simple_vm_create(fd, flags), 0);
>  
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(simple_vm_create(fd, flags) != 0);
> @@ -397,7 +388,7 @@ vm_bind_fail(int fd, const char function_name[])
>  
>  	igt_assert_eq(simple_vm_bind(fd, vm), 0);
>  
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(simple_vm_bind(fd, vm) != 0);
> @@ -445,7 +436,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
>  	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
>  	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
>  
> -	ignore_faults_in_dmesg(function_name);
> +	ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
> -- 
> 2.43.0
> 
