Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57A0C02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 08:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6419E10E1DB;
	Tue, 21 Jan 2025 08:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2QhVc/a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D1710E1DB
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737447666; x=1768983666;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=WCBfaA4Uah8Q/wTTR3neRBHL+W+xLAke+B3jYeTC5UU=;
 b=K2QhVc/aUbsf+MTpZn32DktOJzvPHxAgxKF/M4aMFj+f3w4jT0LYpj1R
 00rEklQb19GHONeAdN+rfhgsiCxnFc1tbRmGCXYXREbe3+3qZVIeveuhz
 iGxMz5lGf3fvtpAhcNp707y3jJ4cInodXwNF0iZQonDa9JNc57nt6fTlH
 pU5zlUoxolcOiSajvapOrFnEvvCC7NR2dULd7vnS2GtieQ7SurePwXDlI
 LIZGTe9G6HD6aSzEpEs4Nn0vhZJ5nAN125YzIZ0MM6v/YOylheL2EBZbJ
 qXwtx09cbM9jjMqIZlnlUeqIKzLe76riPR4rrmGN7qCDTxKUQ5o69gBpv w==;
X-CSE-ConnectionGUID: Vy5bAftORsyYc/ICGkb81A==
X-CSE-MsgGUID: u3AAW6lITY2EYZTvSDN2xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="55397144"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="55397144"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 00:21:06 -0800
X-CSE-ConnectionGUID: wY6vsxFERyGHdQkwyPcoRA==
X-CSE-MsgGUID: h4GyfelAQj64qIqCVMdxDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="107283709"
Received: from zhenyiz1-mobl.ccr.corp.intel.com (HELO [10.245.113.241])
 ([10.245.113.241])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 00:21:05 -0800
Message-ID: <21d050fd-f30f-4759-86b7-343d3f7b1015@linux.intel.com>
Date: Tue, 21 Jan 2025 09:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib/igt_facts: Make igt_facts_test noreturn
To: Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com
References: <20250121063207.71737-1-pravalika.gurram@intel.com>
 <20250121063207.71737-2-pravalika.gurram@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250121063207.71737-2-pravalika.gurram@intel.com>
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

On 21.01.2025 07:32, Pravalika Gurram wrote:
> noreturn attribute is used to improve the optimization by informing to
> the compiler that function does not return .
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  lib/igt_facts.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_facts.c b/lib/igt_facts.c
> index 2e04a7c86..bd6742065 100644
> --- a/lib/igt_facts.c
> +++ b/lib/igt_facts.c
> @@ -748,7 +748,7 @@ static void igt_facts_test_mark_and_sweep(struct igt_list_head *head)
>   *
>   * Returns: bool indicating if the tests passed
>   */
> -void igt_facts_test(void)
> +__noreturn void igt_facts_test(void)

How did you find this? Is the compiler complaining?

>  {
>  	const char *last_test = "Unit Testing";
>  
> @@ -776,4 +776,6 @@ void igt_facts_test(void)
>  	/* Clean up the list and call igt_facts(). This should not crash */
>  	igt_facts_list_mark_and_sweep(&igt_facts_list_pci_gpu_head);
>  	igt_facts(last_test);
> +
> +	igt_exit();
>  }
Why adding igt_exit() here?

How did you test this patch?

Thanks,

Peter
