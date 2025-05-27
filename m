Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F83C54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 10:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA3B10E473;
	Tue, 27 May 2025 10:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JW5HkYDO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E6C10E43A
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 10:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748342819; x=1779878819;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=7q4pY3eaDPr3nVq4NlrAeKBBjqfUW124PVFmwX8dyd4=;
 b=JW5HkYDOxhobLgKqVhollC7oj/q9++d8ZGC7WCA+CvBU0M6I+raq+xGc
 72CnbUG37Dk6CDBncI+NINvzeanqF8NqTFJK1MsLxZJPg6lnBP91kcAUy
 UJ+OADVeSPJzWOaQDJG87Cd3SmOoKaBlpSFi+YaaRFoa0o0pY+0NUcEJZ
 86fK/Gg6U6Wu9rAu3U66PpVlHpe38+X2HJnIjqmRuxKWLXNSYnIX4rpTc
 iR8U0BYUl/uwmAPYngKEwopc2UbrlhKuLd7BJGUYwsbEEzer85HJLJ748
 LQXob4G/ynhbKosmuCkwN/NAAokIFo9klvAqDOiQGcb5ZUvJ19wpoipt8 w==;
X-CSE-ConnectionGUID: TNBbfksRTqWFNvgSAsK6fg==
X-CSE-MsgGUID: 2MoI9DDeT2KEtBkATdhuMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50024584"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="50024584"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 03:46:59 -0700
X-CSE-ConnectionGUID: NZ70OqpJRH6OWeBR7XqCAw==
X-CSE-MsgGUID: kftaR+JSRa6Xw8Oc4OJKyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="143731923"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 27 May 2025 03:46:41 -0700
Received: from [10.245.113.199] (unknown [10.245.113.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6B64B33BDE;
 Tue, 27 May 2025 11:46:39 +0100 (IST)
Message-ID: <f9f841a2-e927-4624-afdc-baeecda8e5d5@intel.com>
Date: Tue, 27 May 2025 12:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] [PATCH i-g-t] tests/intel/xe_fault_injection: Inject errors
 for VF provision
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250526140134.21967-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250526140134.21967-1-satyanarayana.k.v.p@intel.com>
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



On 26.05.2025 16:01, Satyanarayana K V P wrote:
> Use the kernel fault injection infrastructure to test error handling of xe

s/xe/the Xe driver

> during VF provisioning of various resources like GGTT, contexts, lmem (in

this is on VF side, so

s/VF provisioning/reading VF provisioning data

s/lmem/LMEM

> case of DGFX) and doorbells so that more code paths are tested, such as
> error handling and unwinding.
> 
> The test injects multiple errors into each resource and tests all possible
> ways of error handling.
> 
> Error can be injected using:
> igt@xe_fault_injection@probe-fail-vf-provision-xe_should_fail_vf_provisioning_ggtt
> igt@xe_fault_injection@probe-fail-vf-provision-xe_should_fail_vf_provisioning_ctxs
> igt@xe_fault_injection@probe-fail-vf-provision-xe_should_fail_vf_provisioning_dbs
> igt@xe_fault_injection@probe-fail-vf-provision-xe_should_fail_vf_provisioning_lmem

since we really don't care about specific resource it should be simpler
(and still sufficient in term of coverage) to have single test case:

	igt@xe_fault_injection@probe-fail-vf-provision

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Test-With: 20250523073638.24842-1-satyanarayana.k.v.p@intel.com
> ---
>  tests/intel/xe_fault_injection.c | 166 +++++++++++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index f9bd5c761..40b5b2e16 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -29,6 +29,42 @@
>  #define BO_SIZE		(1024*1024)
>  #define INJECT_ITERATIONS	100
>  
> +enum {
> +	VF_PROVISION_MIN  = 0,
> +	VF_PROVISION_GGTT = VF_PROVISION_MIN,
> +	VF_PROVISION_LMEM,
> +	VF_PROVISION_CTXS,
> +	VF_PROVISION_DBS,
> +	VF_PROVISION_MAX,
> +};
> +
> +enum {
> +	VF_PROVISION_ERR_MIN,
> +	/* Force resource location invalid  */
> +	VF_PROVISION_ERR_EINVAL = VF_PROVISION_ERR_MIN,
> +	/* Force resource size bigger than HW limit */
> +	VF_PROVISION_ERR_ENOSPC,
> +	/* Force resource size to zero */
> +	VF_PROVISION_ERR_ENODATA,
> +	/* Force resource size larger than received with invalid base address. */
> +	VF_PROVISION_ERR_ESRMNT,
> +	/* Force resource size smaller than received */
> +	VF_PROVISION_ERR_EREMCHG,
> +	/* Force resource size larger than received */
> +	VF_PROVISION_ERR_EDQUOT,
> +	VF_PROVISION_ERR_MAX
> +};

I'm not sure that we need enum to describe list of potential error codes
we want to inject - all we need is just a list or those errors (like
below) that we will loop over

> +
> +int vf_provision_err_inject_list[VF_PROVISION_ERR_MAX] = {
> +	-22 /* VF_PROVISION_ERR_EINVAL */,
> +	-28 /* VF_PROVISION_ERR_ENOSPC */,
> +	-61 /*VF_PROVISION_ERR_ENODATA */,
> +	-69 /* VF_PROVISION_ERR_ESRMNT */,
> +	-78 /* VF_PROVISION_ERR_EREMCHG */,
> +	-122 /* VF_PROVISION_ERR_EDQUOT */
> +};
> +
> +
>  int32_t inject_iters_raw;
>  struct fault_injection_params {
>  	/* @probability: Likelihood of failure injection, in percent. */
> @@ -71,6 +107,11 @@ static bool function_is_part_of_guc(const char function_name[])
>  	       strstr(function_name, "_wopcm_") != NULL;
>  }
>  
> +static bool function_is_part_of_vf(const char function_name[])
> +{
> +	return strstr(function_name, "_vf_") != NULL;
> +}
> +
>  static void ignore_faults_in_dmesg(const char function_name[])
>  {
>  	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
> @@ -87,6 +128,19 @@ static void ignore_faults_in_dmesg(const char function_name[])
>  		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
>  	}
>  
> +	/*
> +	 * If VF provisiong faults are injected, Guc and VF provision is
> +	 * expected fail. So, ignore failures in igt_runner.
> +	 */
> +	if (function_is_part_of_vf(function_name)) {
> +		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> +		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> +		strcat(regex, "|GT[0-9a-fA-F]*: VF: Unexpected GGTT reassignment: [0-9] != [0-9]");
> +		strcat(regex, "|GT[0-9a-fA-F]*: VF: Unexpected CTXs reassignment: [0-9] != [0-9]");
> +		strcat(regex, "|GT[0-9a-fA-F]*: VF: Unexpected DBs reassignment: [0-9] != [0-9]");
> +		strcat(regex, "|GT[0-9a-fA-F]*: VF: Unexpected LMEM reassignment: [0-9] != [0-9]");
> +	}

this whole idea of filtering out the specific error messages doesn't
make much sense IMO, as it is too fragile to any changes in the driver
code or runtime due to use of different platform or config.

can't we just assume that once the test injects some faults into the
driver any error messages generated by the driver are expected and all
of them should be ignored ? I guess our only expectation from the driver
is that it will not crash and whether there will be zero, one or more
different error messages it shouldn't really bother us, as in some cases
the driver could still even fully recover after single fault

> +
>  	igt_emit_ignore_dmesg_regex(regex);
>  }
>  
> @@ -278,6 +332,103 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
>  	}
>  }
>  
> +static void get_fault_params(int fault_type, int has_vram,
> +			     struct fault_injection_params *fault_params)
> +{
> +	igt_assert(fault_params);
> +
> +	igt_debug("has_vram = %d, fault_type = %d\n", has_vram, fault_type);
> +
> +	if (has_vram) {
> +		switch (fault_type) {
> +		case VF_PROVISION_GGTT:
> +			fault_params->space = 1;
> +			break;
> +		case VF_PROVISION_LMEM:
> +			fault_params->space = 2;
> +			break;
> +		case VF_PROVISION_CTXS:
> +			fault_params->space = 3;
> +			break;
> +		case VF_PROVISION_DBS:
> +			fault_params->space = 4;

we shouldn't make too much assumptions about the driver implementation
(here the ordering of functions called by the VF driver during probe) as
this may change any time, without impacting VF functionality, but might
confuse the test code up to reporting false regressions

> +			break;
> +		default:
> +			return;
> +		}
> +	} else {
> +		switch (fault_type) {
> +		case VF_PROVISION_GGTT:
> +			fault_params->space = 1;
> +			break;
> +		case VF_PROVISION_CTXS:
> +			fault_params->space = 2;
> +			break;
> +		case VF_PROVISION_DBS:
> +			fault_params->space = 3;
> +			break;
> +		default:
> +			return;
> +		}
> +	}
> +
> +	fault_params->times = 1;

as discussed offline, we will just loop over the permutation of:

	{ space } x { times } x { interval }

parameters to inject faults at different calls during collecting
provisioning data to check driver reaction to altered or inconsistent
info about one or more resources

> +}
> +/**
> + * SUBTEST: probe-fail-vf-provision-%s
> + * Description: inject an error in the injectable function %arg[1] then reprobe driver
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_should_fail_vf_provisioning_ggtt:     Inject an error when provisoning ggtt.
> + * @xe_should_fail_vf_provisioning_lmem:     Inject an error when provisoning lmem.
> + * @xe_should_fail_vf_provisioning_ctxs:     Inject an error when provisoning ctxs.
> + * @xe_should_fail_vf_provisioning_dbs:     Inject an error when provisoning dbs.
> + */
> +static void probe_fail_vf_provision(int fd, char pci_slot[], const char function_name[],
> +               struct fault_injection_params *fault_params)
> +{
> +	int auto_probe_en = igt_sriov_is_driver_autoprobe_enabled(fd);
> +	const char *func_name = "xe_should_fail_vf_provisioning";

btw, avoid using similar names (here: function_name vs func_name)

> +	unsigned int totalvfs = igt_sriov_get_total_vfs(fd);
> +	int fault_type, i;
> +
> +	igt_skip_on(!totalvfs);
> +	igt_assert(fault_params);
> +
> +	if (!strcmp("xe_should_fail_vf_provisioning_ggtt", function_name))
> +		fault_type = VF_PROVISION_GGTT;
> +	else if (!strcmp("xe_should_fail_vf_provisioning_lmem", function_name))
> +		fault_type = VF_PROVISION_LMEM;
> +	else if (!strcmp("xe_should_fail_vf_provisioning_ctxs", function_name))
> +		fault_type = VF_PROVISION_CTXS;
> +	else if (!strcmp("xe_should_fail_vf_provisioning_dbs", function_name))
> +		fault_type = VF_PROVISION_DBS;
> +	else
> +		fault_type = VF_PROVISION_GGTT;
> +
> +	igt_skip_on(!strcmp("xe_should_fail_vf_provisioning_lmem", function_name) &&
> +		    !xe_has_vram(fd));
> +
> +	ignore_faults_in_dmesg(function_name);
> +	for (i = VF_PROVISION_ERR_MIN; i < VF_PROVISION_ERR_MAX; i++) {
> +		if (igt_sriov_get_enabled_vfs(fd))
> +			igt_sriov_disable_vfs(fd);
> +
> +		get_fault_params(fault_type, xe_has_vram(fd), fault_params);
> +		setup_injection_fault(fault_params);
> +
> +		injection_list_add(func_name);
> +		set_retval(func_name, vf_provision_err_inject_list[i]);
> +
> +		igt_sriov_enable_driver_autoprobe(fd);
> +		igt_sriov_enable_vfs(fd, totalvfs);
> +		igt_sriov_disable_vfs(fd);
> +		if (!auto_probe_en)
> +			igt_sriov_disable_driver_autoprobe(fd);
> +		injection_list_remove(func_name);
> +	}
> +}
>  /**
>   * SUBTEST: exec-queue-create-fail-%s
>   * Description: inject an error in function %arg[1] used in exec queue create IOCTL to make it fail
> @@ -551,6 +702,14 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>  		{ }
>  	};
>  
> +	const struct section vf_proviosin_fail_functions[] = {
> +		{ "xe_should_fail_vf_provisioning_ggtt" },
> +		{ "xe_should_fail_vf_provisioning_lmem" },
> +		{ "xe_should_fail_vf_provisioning_ctxs" },
> +		{ "xe_should_fail_vf_provisioning_dbs" },

btw, this might give impression that there are multiple fault injection
points, while we just have one

> +		{}
> +	};
> +
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -586,6 +745,13 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>  		igt_subtest_f("oa-add-config-fail-%s", s->name)
>  			oa_add_config_fail(fd, sysfs, devid, s->name);
>  
> +	for (const struct section *s = vf_proviosin_fail_functions; s->name; s++)
> +		igt_subtest_f("probe-fail-vf-provision-%s", s->name) {
> +			memcpy(&fault_params, &default_fault_params,
> +					sizeof(struct fault_injection_params));
> +			probe_fail_vf_provision(fd, pci_slot, s->name, &fault_params);
> +		}
> +
>  	igt_fixture {
>  		igt_kmod_unbind("xe", pci_slot);
>  	}

