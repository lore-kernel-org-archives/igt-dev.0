Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFF4CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 15:42:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0D910E84D;
	Wed,  8 Oct 2025 15:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSpsHP8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA3D10E146
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 15:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759938175; x=1791474175;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LtU7qNbiHghTpvKtRv8yGnXViFmRMk1vaQAwVZmvLQ8=;
 b=KSpsHP8rhvVw59ddfEzDcGcx0yQT/vTrOAWl7yIx+o6SCeQHilqYpTtW
 nsrwoiCatkDQzHFkEZolIqY+evqpNnXaDya9RJ4RdLzg3NVPiYGflwYLT
 V7WBJ3zcX+raREogor1qsq9ysRceJp8vrjLC/hQJ1aDTNg6CiI5hc8tBh
 6Qj3JZ0l10siO51MvBkJeCy6p4u/tZi8hyUxGFzOZ7KCViDGNQoc9eXa5
 OGSCLVUrQMBQWP6QT74E/uwvIhrLGbCNj26T50Wmq3m7aZuQSQFBVD1nU
 VB/s/Pfkc2toCQHfl8U6oSvQUemT6WyXh7D2PD4/2jOj1TenMMkF5znZW A==;
X-CSE-ConnectionGUID: hEoz3CPkRXuIdJPpwI+S4Q==
X-CSE-MsgGUID: TvDraBHKRricRmTeuX3MOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73562782"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="73562782"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 08:42:55 -0700
X-CSE-ConnectionGUID: zaRsdOAuToiKPbgA8fQtog==
X-CSE-MsgGUID: 1lX7Qe8uSPu4BM/LdPi7NQ==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 08:42:53 -0700
Date: Wed, 8 Oct 2025 17:42:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: igt-dev@lists.freedesktop.org, lukasz.laguna@intel.com,
 marcin.bernatowicz@intel.com
Subject: Re: [PATCH v1] tests/intel/xe_fault_injection: Set guc_wait_ucode pf
 only
Message-ID: <20251008154250.cpg7bsj4vdy23woi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 igt-dev@lists.freedesktop.org, lukasz.laguna@intel.com,
 marcin.bernatowicz@intel.com
References: <20251001151857.104568-1-zhanjun.dong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251001151857.104568-1-zhanjun.dong@intel.com>
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

Hi Zhanjun,
On 2025-10-01 at 11:18:57 -0400, Zhanjun Dong wrote:
> guc_wait_ucode is pf only function, set the flag to run normally in the VF

s/normally/it/

Did you mean 'to not run it in the VF'? Or in other words:
'to run it only in PF'?

> environment.
> 

+cc Lukasz and Marcin

Regards,
Kamil

> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 9e98b3ada..5fca9aefa 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -548,7 +548,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>  		unsigned int flags;
>  		bool pf_only;
>  	} probe_fail_functions[] = {
> -		{ "guc_wait_ucode" },
> +		{ "guc_wait_ucode", 0, true },
>  		{ "wait_for_lmem_ready" },
>  		{ "xe_add_hw_engine_class_defaults" },
>  		{ "xe_device_create" },
> -- 
> 2.34.1
> 
