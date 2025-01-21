Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0549C02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 08:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667DB89119;
	Tue, 21 Jan 2025 08:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4Es2uPK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441A10E059
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 08:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737448357; x=1768984357;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=SO0MNBW9+RwZPtoVD1vZUAjcsqfjVIn758S9x7KmbVU=;
 b=M4Es2uPK8SaIMPhrswBadrHFWuuvJQS4N15MrPjtVnUUyXipYhNAVi9X
 9kOSJf3L/Ifoav1RtZ4zH19PIgY2M0oAwOienxP3diQTfI1GRTvZMXRTF
 7xpmeZco/Yjq5PmFhP/SERVgQQKZ55yF3dZQg6Dkd31TbxIQatgRjfoP1
 wm0k7qzzXVv/J30njz68FXDFLdLM8oDWmsRH4rzsTJSMCWacdWSNVhNWS
 pKVG57ZGjTh+evpGrdRBp0mzMLBwAE5LFnSzvEVTEfsGtSgpR+DjmO6cd
 jOyfE5wAvs/JMN2tKT8SsbPwWeFoXGmDFocG+pvqF5Yw8Skc4tfkKSnU9 A==;
X-CSE-ConnectionGUID: 4qZZkb1OTmuVGeUvAqXYbA==
X-CSE-MsgGUID: mbM5J/XbSmSoPn/H9PN/yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="55398613"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="55398613"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 00:32:36 -0800
X-CSE-ConnectionGUID: 3UbXr9zWQie1oXfogHI7nA==
X-CSE-MsgGUID: 2nNUQmKtQlO95FGhUlFV7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="107286196"
Received: from zhenyiz1-mobl.ccr.corp.intel.com (HELO [10.245.113.241])
 ([10.245.113.241])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 00:32:35 -0800
Message-ID: <b0c3515e-ab7f-454d-b24d-5a7d912ada76@linux.intel.com>
Date: Tue, 21 Jan 2025 09:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] lib/igt_facts : Cleanup
To: Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com
References: <20250121063207.71737-1-pravalika.gurram@intel.com>
 <20250121063207.71737-3-pravalika.gurram@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250121063207.71737-3-pravalika.gurram@intel.com>
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

Hi Pravalika,

Please wait for Kamil to answer my questions in the original
thread before changing the code.

How did you test this patch?

Please see my comments below.

Thanks

On 21.01.2025 07:32, Pravalika Gurram wrote:
> fix BOOL_COMPARISON, COMPARISON_TO_NULL,
> LINE_SPACING, PARENTHESIS_ALIGNMENT,
> Remove extern from header warning from checkpatch
> 
> 'Fixes: 1a9c3117328 ("lib/igt_facts: Library and unit testing")'
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  lib/igt_facts.c | 20 ++++++++++----------
>  lib/igt_facts.h |  3 ++-
>  2 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/igt_facts.c b/lib/igt_facts.c
> index bd6742065..6e7efbaf3 100644
> --- a/lib/igt_facts.c
> +++ b/lib/igt_facts.c
> @@ -677,18 +677,18 @@ static void igt_facts_test_add_get(struct igt_list_head *head)
>  	const char *last_test = NULL;
>  
>  	ret = igt_facts_list_add(name, value, last_test, head);
> -	igt_assert(ret == true);
> +	igt_assert(ret);
>  
>  	/* Assert that there is one element in the linked list */
>  	igt_assert_eq(igt_list_length(head), 1);
>  
>  	/* Assert that the element in the linked list is the one we added */
>  	fact = igt_facts_list_get(name, head);
> -	igt_assert(fact != NULL);
> +	igt_assert(fact);
>  	igt_assert_eq(strcmp(fact->name, name), 0);
>  	igt_assert_eq(strcmp(fact->value, value), 0);
> -	igt_assert(fact->present == true);
> -	igt_assert(fact->last_test == NULL);
> +	igt_assert(fact->present);
> +	igt_assert(!fact->last_test);
>  }
>  
>  /**
> @@ -729,16 +729,16 @@ static void igt_facts_test_mark_and_sweep(struct igt_list_head *head)
>  
>  	/* Assert that the two updated elements are present */
>  	fact = igt_facts_list_get(name1, head);
> -	igt_assert(fact != NULL);
> -	igt_assert(fact->present == true);
> +	igt_assert(!fact);
This one is wrong.


> +	igt_assert(fact->present);
>  
>  	fact = igt_facts_list_get(name2, head);
> -	igt_assert(fact != NULL);
> -	igt_assert(fact->present == true);
> +	igt_assert(!fact);
This one is wrong too.


> +	igt_assert(fact->present);
>  
>  	/* Assert that the third element was deleted */
>  	fact = igt_facts_list_get(name3, head);
> -	igt_assert(fact == NULL);
> +	igt_assert(!fact);
>  }
>  
>  /**
> @@ -766,7 +766,7 @@ __noreturn void igt_facts_test(void)
>  	/* Assert that igt_facts_list_mark_and_sweep() cleans up the list */
>  	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) == false);
>  	igt_facts_list_mark_and_sweep(&igt_facts_list_pci_gpu_head);
> -	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) == true);
> +	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head));
>  
>  	/* Test the mark and sweep pattern used to delete elements
>  	 * from the list
> diff --git a/lib/igt_facts.h b/lib/igt_facts.h
> index e96f88083..60d702977 100644
> --- a/lib/igt_facts.h
> +++ b/lib/igt_facts.h
> @@ -37,7 +37,8 @@ struct igt_facts_config {
>  	bool enabled;
>  	bool disable_udev;
>  };
> -extern struct igt_facts_config igt_facts_config;
> +
> +struct igt_facts_config igt_facts_config;
>  
>  void igt_facts_lists_init(void);
>  void igt_facts(const char *last_test);

