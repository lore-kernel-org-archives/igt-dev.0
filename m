Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC772C27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 12:27:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9474310E95E;
	Thu, 20 Jun 2024 12:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmORaNxH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4911D10E95E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718886475; x=1750422475;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=npjUo29JPVdHtKFMp3+hYaOnVGU/uXQSnAgeB5rlVmI=;
 b=GmORaNxHZXKzY2DOChNceqLCEBKEAYiiq0jDukLo4d2arB4ajse6xiPy
 /Vj8rgDPF2ADrfmRb3oYR+hiTwoCy/gTmurd2A+6w56NY010muBm1KKTX
 WkfGEe1O+0OMr7T2cXX5GLlNLoseGOkqqASHI2Z5JHKgXbnEVABzXV/wR
 qJGFS5fxKlyQNyJ2ORe4Mvn0ReJ79WiJDvMiTyZeDplyaHugFK0nG1It+
 BRHBWWbAdeC6ngMFcwhjZC7OuR4YQvRDT0s0B6mb1eCH6tbyIvS0wDvfi
 ++MeQBA8/e9sd+pJCv2JF1c7cfCTMUxeiBeRmuBz//Tj43izFKRx6qwx0 g==;
X-CSE-ConnectionGUID: jaa39FxeQHO7WX63vwJcLQ==
X-CSE-MsgGUID: iRPDJ7lfTk2T1vvcZcfjsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19634917"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="19634917"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 05:27:54 -0700
X-CSE-ConnectionGUID: rodUFmLgQjKxzuNkVVDQOA==
X-CSE-MsgGUID: Dvf9knG6SimWZ7qTTZH/4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="46576863"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.80.70])
 ([10.245.80.70])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 05:27:53 -0700
Message-ID: <e14a02c7-ebc6-49d7-b455-badb14912b96@intel.com>
Date: Thu, 20 Jun 2024 14:27:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/intel_cmds_info: Remove duplicate
 block-copy tiling definition
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240620094822.524239-1-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240620094822.524239-1-zbigniew.kempczynski@intel.com>
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



On 20.06.2024 11:48, Zbigniew Kempczyński wrote:
> Block-copy definition for Xe2 duplicates DG2+ so remove it.
>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   lib/intel_cmds_info.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
> index 1416e02cd4..d581edb6eb 100644
> --- a/lib/intel_cmds_info.c
> +++ b/lib/intel_cmds_info.c
> @@ -64,11 +64,6 @@ static const struct blt_cmd_info
>   						 BLT_CMD_EXTENDED |
>   						 BLT_CMD_SUPPORTS_COMPRESSION);
>   
> -static const struct blt_cmd_info
> -		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
> -						 BLT_CMD_EXTENDED |
> -						 BLT_CMD_SUPPORTS_COMPRESSION);
> -
>   static const struct blt_cmd_info
>   		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
>   						 BLT_CMD_EXTENDED);
> @@ -183,7 +178,7 @@ const struct intel_cmds_info gen12_pvc_cmds_info = {
>   const struct intel_cmds_info xe2_cmds_info  = {
>   	.blt_cmds = {
>   		[XY_FAST_COPY] = &dg2_xy_fast_copy,
> -		[XY_BLOCK_COPY] = &xe2_xy_block_copy,
> +		[XY_BLOCK_COPY] = &dg2_xy_block_copy,
>   		[MEM_COPY] = &pvc_mem_copy,
>   		[MEM_SET] = &pvc_mem_set,
>   	},

