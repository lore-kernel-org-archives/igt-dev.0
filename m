Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAABACCF9F1
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 10:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367C810E8C9;
	Thu, 30 Oct 2025 10:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WmiSyV2M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD6610E8C9
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 10:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761819400; x=1793355400;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5YrYNZ0HqRPymAzXfo3AsvQU1cgOmYUsACUHHsEUtxw=;
 b=WmiSyV2MC48F/6D+8PNLG2YVUxxdLHZG9FMwI1lrviavC9Y0VkJtoEbs
 RyHP9pl9nXBc5YB+I/Zh/CFdIHuQNwMUNzQrIplxL2dS5ABBdp5HRcjDU
 o904+6tIfWZtdpsfzIKLt2HFLzqlzrZVDWNO6fLXLbYaWFELC01gT5myL
 78tCIZXmO1zvK/r9yvShTDgq3kkhAk3baMLdmzryKwpWNnstuyydbDPu7
 nPy1LlOkxndJfZ4FTxncTDK+I+OY+v4wR3ROfH3+vCuFMX1+38+JXOGd6
 AZ3oBybr07j8nSV7L2TAqcjczvPndZi69gD1alPIO10fMa1Bkanhc1HvO Q==;
X-CSE-ConnectionGUID: xqwZflhbSaaS2fF8f0ZOBQ==
X-CSE-MsgGUID: v039r5deQ/qEnAtZVxfoog==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74556856"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="74556856"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 03:16:39 -0700
X-CSE-ConnectionGUID: sVYSoPPISSG6f1qNi2N2ng==
X-CSE-MsgGUID: 56b6YMsIT/ywwfA50QNung==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="186003370"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 03:16:38 -0700
Date: Thu, 30 Oct 2025 11:16:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_configfs: Check for invalid
 char in the beginning
Message-ID: <20251030101611.ssl4b6vauahdyclj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>
References: <20251029215947.3580744-3-lucas.demarchi@intel.com>
 <20251029215947.3580744-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029215947.3580744-4-lucas.demarchi@intel.com>
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

Hi Lucas,
On 2025-10-29 at 14:59:49 -0700, Lucas De Marchi wrote:
> The test was supposed to check the beginning and the end of the number,
> but was actually doing the same check (the end) twice. Fix it.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel/xe_configfs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index ecba69dbd..08b0b0ae8 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -168,11 +168,11 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
>  		{ .test = "invalid-type",
>  		  .in = "rcs 11000001 4F100 DEADBEEF",
>  		},
> -		{ .test = "invalid-number",
> +		{ .test = "invalid-number-end",
>  		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
>  		},
> -		{ .test = "invalid-number",
> -		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
> +		{ .test = "invalid-number-start",
> +		  .in = "rcs cmd g1100000 4F100 DEADBEEF",

Looks good, what about invalid char in middle?

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  		},
>  		{ .test = "invalid-reg-addr-only",
>  		  .in = "rcs reg 4F100",
> -- 
> 2.51.0
> 
