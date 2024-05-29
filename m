Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CE7C27C44
	for <igt-dev@archiver.kernel.org>; Wed, 29 May 2024 15:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5A310EC5B;
	Wed, 29 May 2024 15:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kWgH5kW1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9B310FED3
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2024 15:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716994833; x=1748530833;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sLKupu3WFR2Kx4b6duL1BqgcONegG59vtY6GWJHXQo8=;
 b=kWgH5kW1wfymnsD68/NLB5RnO5zniU0Je9LdrUfqtNj0/JRsYuCmo8eT
 4hCtRaGwBvl1YlrAPQwHL6qu1eNk1Yw0xTx0rwqBTQDmQDUJhCnYcs5I6
 ZmfA7otx473NAwEBGFBughU39TbGWNjjkD+4+DRjLRQ7NF+2r5Htc6oi4
 xiFjRxiz7OSzmR9K/yG7/HYm4dYpqMXIubb6eDIZcF+uOLcIcrXTnEfSg
 sV52xLsHTgN02g306EcXw6hsbDZf8W8XoJGoNK3Hl11fPXFxCvxealaVI
 /qDVWoCNo6ABMl35cg+f7Dml5wGDF5NFyA6NXHdqWkkDd2Zr1wsWw/QlD A==;
X-CSE-ConnectionGUID: qZPcI14ZSbavfDmDLslr0g==
X-CSE-MsgGUID: JhhCZIDrQr2iguuYbPvmnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="38788208"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="38788208"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 08:00:32 -0700
X-CSE-ConnectionGUID: Lz3K3xt3TIycY05f5R9y7Q==
X-CSE-MsgGUID: yp9oFeHrS/yOGDYrkVvNxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35430826"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 08:00:31 -0700
Date: Wed, 29 May 2024 17:00:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t 5/5] tests/intel-ci/xe: Add fbdev tests to XE BAT
Message-ID: <20240529150029.r26lqj6u6hpchuy3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
 <20240528054223.2945356-6-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240528054223.2945356-6-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-05-28 at 11:12:23 +0530, Bhanuprakash Modem wrote:
> Add few fbdev tests to XE BAT.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index c57706f25..aa98b37e6 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -1,6 +1,12 @@
>  # Should be the first test
>  igt@xe_module_load@load
>  
> +igt@fbdev@eof
> +igt@fbdev@info
> +igt@fbdev@nullptr
> +igt@fbdev@read
> +igt@fbdev@write
> +
>  igt@kms_addfb_basic@addfb25-4-tiled
>  igt@kms_addfb_basic@addfb25-bad-modifier
>  igt@kms_addfb_basic@addfb25-modifier-no-flag
> -- 
> 2.43.2
> 
