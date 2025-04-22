Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53B6C369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 09:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D07F10E531;
	Tue, 22 Apr 2025 09:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="laMFweBJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050D610E531
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745315231; x=1776851231;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=asY8WFAOfdqIImhRaiyPWpGTCYGwzZRBSiFwmeoxgng=;
 b=laMFweBJDB/A0J9a26HtIw3rFLyebNbonuDO1mHDVjbGDTTKcyM43DAd
 xvDUseTj+9juAzvRsd555BQBSSoxvvwj19uSOMuhtao3jzJt20L63+ibU
 aZDzOvsW7SLhG7sUDT3CtDqbQVd7EUYcTWDO2lnGnAl6ONzXNpKI1/TVR
 KB3mPiTB0t7plK53FZRrg4BW22PlNEo0lgFr9xUyFKz+eONJtrUisy5LX
 +6WHmiemEkzzumu3IlS84krOqIyn2ZM9L5gEM7oYSzqQxr29zKAptVXGU
 GGcdxPTSwJxpulv736JVGEtSY1c/x0VqhRYviRb7hD/yv857azeteXuF3 A==;
X-CSE-ConnectionGUID: dT408TzXQ0q9n9YWbkLJdw==
X-CSE-MsgGUID: Dtct/tKNTpGpMs18wmQA1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="49528390"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="49528390"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:47:11 -0700
X-CSE-ConnectionGUID: rfc28aHYQPq/e5WQlk5S6g==
X-CSE-MsgGUID: sGVt92/FSfmDMsKvssBrIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="169164722"
Received: from tropinsk-mobl1.ger.corp.intel.com (HELO [10.245.80.187])
 ([10.245.80.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 02:47:09 -0700
Message-ID: <11e9c6e9-143e-4428-893a-04e1df6735ab@linux.intel.com>
Date: Tue, 22 Apr 2025 11:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 3/3] tests/intel/xe_fault_injection: Do not
 assert for probe_guc_fail_* functions.
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250421074545.5549-1-satyanarayana.k.v.p@intel.com>
 <20250421074545.5549-4-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250421074545.5549-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 4/21/2025 9:45 AM, Satyanarayana K V P wrote:
> In the current implementation, test asserts if the captured error is not same as
> injected error. It is possible that the error received is translated to other
> error which can be returned to application and in some scenarios driver retries
> in case of failure and so, no error might be captured.
> 
> Considering above cases, not asserting the test in inject_fault_probe(), but
> returing error to the caller. Caller can check and assert if needed. Test does

returning

> not assert for probe_guc_fail_* functions as driver some times retries in case
> of failure. The main idea of injecting errors for these guc functions is to
> check the robustness of the driver.

Looks description not related to the patch.

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index d95b51f2d..ae8f79aee 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -224,7 +224,7 @@ static void set_retval(const char function_name[], long long retval)
>    * @xe_wa_init:				xe_wa_init
>    * @xe_wopcm_init:			xe_wopcm_init
>    */
> -static void
> +static int
>   inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>   {
>   	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
> @@ -234,8 +234,8 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>   	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
> -	igt_assert_eq(-errno, INJECT_ERRNO);
>   	injection_list_remove(function_name);
> +	return -errno;

It's better to store the errno after the operation for which the result 
is to be returned.

>   }
>   
>   /**
> @@ -470,7 +470,7 @@ const char *help_str =
>   
>   igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>   {
> -	int fd, sysfs;
> +	int fd, sysfs, ret;
>   	struct drm_xe_engine_class_instance *hwe;
>   	struct fault_injection_params fault_params;
>   	static uint32_t devid;
> @@ -576,8 +576,10 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>   	}
>   
>   	for (const struct section *s = probe_fail_functions; s->name; s++)
> -		igt_subtest_f("inject-fault-probe-function-%s", s->name)
> -			inject_fault_probe(fd, pci_slot, s->name);
> +		igt_subtest_f("inject-fault-probe-function-%s", s->name) {
> +			ret = inject_fault_probe(fd, pci_slot,	s->name);
> +			igt_assert_eq(ret, INJECT_ERRNO);
> +		}
>   
>   	for (const struct section *s = guc_fail_functions; s->name; s++)
>   		igt_subtest_f("probe-fail-guc-%s", s->name) {

