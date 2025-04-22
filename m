Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F809C369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 11:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1827810E562;
	Tue, 22 Apr 2025 11:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8Z7Wz/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C159C10E562
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745320391; x=1776856391;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FQ5N3kCc+Ip7QQg/bpTcXZEw2ToTewf29cC9rHqYA9w=;
 b=m8Z7Wz/AvliDbgxzBmEqmwabxqsxisfTuOCTUlKwdZqkXnGc/Dx20pOT
 ygwRITRTfUm5AJyMNlIbZTEKOddgc+PWAtGi85g3Ni8ROK4MvD9w3b1z8
 cy1kxwK2H7SUykPRKmlZiFaaz+XKaRuECyZM3SfehtXh/a6zv/G6/dW5e
 7nvYcJ4eZ03sTznISLb+pFeuVWJ4ixGdUcPalFdtJl9/nIu8zPUSP1Ndi
 tHFoLZVLO92vOOipFya2y1YF5RiF39dMshjyVbFAsP2ugz2Ynxmq18MjB
 553wbxWWq0CUhkm81XeIcKfzyYhZkvX+tSOSh18Tf+CvB+y1vwqKYYj1z Q==;
X-CSE-ConnectionGUID: w4mmz04vR9ud/9MNsQ2WcA==
X-CSE-MsgGUID: 3A0jMboIRlK/Nfu6H1PoAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46789652"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="46789652"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 04:13:11 -0700
X-CSE-ConnectionGUID: pAS5WsB+TXqZnp+g56mdjQ==
X-CSE-MsgGUID: +HrlxrHMTCKCuFOqDqQfXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="163036592"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.80.187])
 ([10.245.80.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 04:13:09 -0700
Message-ID: <c152534e-1a53-49c6-a796-8a44b9a31de5@linux.intel.com>
Date: Tue, 22 Apr 2025 13:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 3/3] tests/intel/xe_fault_injection: Return
 result from inject_fault_probe()
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250422102941.1678-1-satyanarayana.k.v.p@intel.com>
 <20250422102941.1678-4-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250422102941.1678-4-satyanarayana.k.v.p@intel.com>
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



On 4/22/2025 12:29 PM, Satyanarayana K V P wrote:
> In the current implementation, test asserts if the captured error is not same as
> injected error. It is possible that the error received is translated to other
> error which can be returned to application and in some scenarios driver retries
> in case of failure and so, no error might be captured.
> 
> Considering above cases, not asserting the test in inject_fault_probe(), but
> returning error to the caller. Caller can check and assert if needed.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index ced613896..98a414bd3 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -224,9 +224,10 @@ static void set_retval(const char function_name[], long long retval)
>    * @xe_wa_init:				xe_wa_init
>    * @xe_wopcm_init:			xe_wopcm_init
>    */
> -static void
> +static int
>   inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>   {
> +	int err = 0;
>   	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
>   		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
>   
> @@ -236,8 +237,10 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>   
>   	igt_kmod_bind("xe", pci_slot);
>   
> -	igt_assert_eq(-errno, INJECT_ERRNO);
> +	err = -errno;
>   	injection_list_remove(function_name);
> +
> +	return err;
>   }
>   
>   /**
> @@ -579,7 +582,8 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>   
>   	for (const struct section *s = probe_fail_functions; s->name; s++)
>   		igt_subtest_f("inject-fault-probe-function-%s", s->name)
> -			inject_fault_probe(fd, pci_slot, s->name);
> +			igt_assert_eq(INJECT_ERRNO, inject_fault_probe(fd,
> +						pci_slot, s->name));

LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   
>   	for (const struct section *s = guc_fail_functions; s->name; s++)
>   		igt_subtest_f("probe-fail-guc-%s", s->name) {

