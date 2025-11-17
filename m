Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD01ACEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 09:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D81910E335;
	Mon, 17 Nov 2025 09:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hLkpB98g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FF010E330
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 09:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763373403; x=1794909403;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/izxKOErdXscspBmSQoB65Nx8/ZQUkS4MYO3DXwqLUA=;
 b=hLkpB98gZ4Qne81Xbbu2PAfrWd9RjyPsI0fJdAhJiTG/ugwo4oe9MV6/
 BFKI/xJnWN3NcvAeDtXnSWHh//Ox9f6KS5hywCdl3DEY3VEDcWPb7XoWi
 g551fCU1aPw6TlbGQK8/+gqIrM88rkmStRSQeBUpTh+6zWdEmSnkeqO5T
 y7Su5xZjcEiC4m5E0YQj1ves1G2XQJEkND4OInn+dnGmam1prSjrMQKxF
 VTaRU/AzTKajgjVurgX8umggdiSlC5W3YA0TQt6vNLmt/TCQR/RxlITVQ
 69y6g7dcv29AuyQ5P8Oi/JJW/0UK0erV2KnHpXDwKxLsD679kqZ6M8WCp w==;
X-CSE-ConnectionGUID: A79E6Sx4Qi+zhH8ZQW0ZWg==
X-CSE-MsgGUID: 7Opvs1fQQq+UCHddqbYKzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65301973"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65301973"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:56:42 -0800
X-CSE-ConnectionGUID: zx8WlUodT1WPdfEzaYVuEQ==
X-CSE-MsgGUID: 0kQ1KpZPRjG6w9k+XWeIUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="195548772"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.254])
 ([10.245.244.254])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:56:42 -0800
Message-ID: <41e7e20f-3fbd-4ce8-a829-194cf9b8f2f0@intel.com>
Date: Mon, 17 Nov 2025 09:56:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/intel/xe_pat: switch PAT tests to igt_srandom()
To: Zongyao Bai <zongyao.bai@intel.com>, igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
References: <20251115011730.3700391-1-zongyao.bai@intel.com>
 <20251115011730.3700391-2-zongyao.bai@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251115011730.3700391-2-zongyao.bai@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 15/11/2025 01:17, Zongyao Bai wrote:
> For consistency with the igt framework, use igt_srandom() to generate
> random seed instead of srand().
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel/xe_pat.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 59dfb6b11..54bedefbb 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -1161,15 +1161,9 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
>   	int fd;
>   
>   	igt_fixture {
> -		uint32_t seed;
> -
> +		igt_srandom();
>   		fd = drm_open_driver(DRIVER_XE);
>   		dev_id = intel_get_drm_devid(fd);
> -
> -		seed = time(NULL);
> -		srand(seed);
> -		igt_debug("seed: %d\n", seed);
> -
>   		xe_device_get(fd);
>   	}
>   

