Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542C1C369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 11:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C22F10EAE3;
	Thu, 17 Apr 2025 11:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nm0O7gs6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE0110EAE3
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744890883; x=1776426883;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QnByU5LmGBC+WLy8Q+a0RXbzrCUvfMyXDnU+0dHNUkk=;
 b=Nm0O7gs68nrd6nQGTElUamJR4nHUY3LT0z4QJi6SpgxYHgHiscBjlyo+
 5b34NSOy4CK7UNqPtQsWuoa25bsztkvTGJCG3h4zkpX/S29ijLE4lTTh3
 s6FH55foPH9nN9/lO7khaAz0bJJeG/JfNPGyB+vN7HheGEwk9ru4WIn08
 Sp4shm8hM5y1U2oin/NMEJUMiH1zaM6KGzRkJ0lqbEYl4PakSeH1uRVU7
 gDu0f/cx0poSs90QyUcPOQ68TedqTXMu89LbalFuw1uO4OxQtru+VlGdL
 YOCZQTpss547nyWCS8PxWiZ2GMUqYFophM2wE8uOHyrmY9r8jnu3VBmGz g==;
X-CSE-ConnectionGUID: 13GeG2TGTz2QR6PVZpTYZw==
X-CSE-MsgGUID: BenJ+/yNS8C9MkhnFh8cCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46357921"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="46357921"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:54:42 -0700
X-CSE-ConnectionGUID: hRz9pgYrTMmjK+vFbx9qcA==
X-CSE-MsgGUID: /JK0Av4gRzSn8I4D3kbGKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="130740930"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.80.165])
 ([10.245.80.165])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:54:41 -0700
Message-ID: <2ce06211-6cbd-421b-8f1c-26a12ddd9742@linux.intel.com>
Date: Thu, 17 Apr 2025 13:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 3/3] tests/intel/xe_fault_injection: Do not
 assert for probe_guc_fail_* functions.
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250415082711.4831-1-satyanarayana.k.v.p@intel.com>
 <20250415082711.4831-4-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250415082711.4831-4-satyanarayana.k.v.p@intel.com>
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

Hi,

On 4/15/2025 10:27 AM, Satyanarayana K V P wrote:
> In the current implementation, test asserts if the captured error is not same as
> injected error. It is possible that the error received is translated to other
> error which can be returned to application and in some scenarios driver retries
> in case of failure and so, no error might be captured.
> 
> Considering above cases, added flags to control the assertion after injecting
> error. Test does not assert for probe_guc_fail_* functions as driver some times
> retries in case of failure. The main idea of injecting errors for these guc
> functions is to check the robustness of the driver.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 252209308..3c389a268 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -28,6 +28,11 @@
>   #define BO_SIZE		(1024*1024)
>   #define INJECT_ITERATIONS	100
>   
> +enum assert_flags {
> +	INJECT_ASSERT_ON_FAIL,
> +	INJECT_NOASSERT_ON_FAIL,
> +};
> +
>   int32_t inject_iters_raw;
>   struct fault_injection_params {
>   	/* @probability: Likelihood of failure injection, in percent. */
> @@ -223,7 +228,7 @@ static void set_retval(const char function_name[], long long retval)
>    * @xe_wopcm_init:			xe_wopcm_init
>    */
>   static void
> -inject_fault_probe(int fd, char pci_slot[], const char function_name[])
> +inject_fault_probe(int fd, int flags, char pci_slot[], const char function_name[])
>   {
>   	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
>   		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
> @@ -232,7 +237,8 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>   	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
>   	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
> -	igt_assert_eq(-errno, INJECT_ERRNO);
> +	if (flags & INJECT_ASSERT_ON_FAIL)
> +		igt_assert_eq(-errno, INJECT_ERRNO);
>   	injection_list_remove(function_name);
>   }

Would it make sense to return the probe result from 
inject_fault_probe(...) and decide to assert/not assert outside?

>   
> @@ -263,7 +269,7 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
>   	for (int i = iter_start; i < iter_end; i++) {
>   		fault_params->space = i;
>   		setup_injection_fault(fault_params);
> -		inject_fault_probe(fd, pci_slot, function_name);
> +		inject_fault_probe(fd, INJECT_NOASSERT_ON_FAIL, pci_slot, function_name);

		inject_fault_probe(fd, pci_slot, function_name);

>   		igt_kmod_unbind("xe", pci_slot);
>   	}
>   }
> @@ -575,7 +581,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>   
>   	for (const struct section *s = probe_fail_functions; s->name; s++)
>   		igt_subtest_f("inject-fault-probe-function-%s", s->name)
> -			inject_fault_probe(fd, pci_slot, s->name);
> +			inject_fault_probe(fd, INJECT_ASSERT_ON_FAIL, pci_slot,	s->name);

	igt_assert_eq(INJECT_ERRNO, inject_fault_probe(fd, pci_slot, 
function_name));

>   
>   	for (const struct section *s = guc_fail_functions; s->name; s++)
>   		igt_subtest_f("probe-fail-guc-%s", s->name) {

