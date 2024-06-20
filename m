Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059F6C2BA1A
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 12:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948B910E983;
	Thu, 20 Jun 2024 12:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQDMZMKT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0208B10E95E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718886494; x=1750422494;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=51NvHjTLRmp2TucK1ZaFnYbfAuN+dPdzICx5kYvRBSQ=;
 b=PQDMZMKTaDBpiTYE0wjgwxXs6ruFDpLrqDSgCnfZlmOzcFdjHTJlQDUO
 UUqecgghfxC2rKH7kbeCJ9TWSaqwg1EzFd80LlHpvSwpB6OvqGx5PJiMN
 oBGIJEDKMI5YbPDlezDZZUowQW8RuHZ7ITnTUv8Wpf5b6u11zzBPJL8Tk
 tNfsopVE0wPppFnwATiLDXB0Uw5/z9JWIuMrgwDBpwhBbulUkkF1I0y5U
 V3+k4aYnOLBsNIabyNEd58SYlxWVsFvHSdQKiVh834WyONbKsBuAV8ezh
 pwRHZRFhjfORcaakUR6WSyvOEHQb0sgeNQ+0IW21j1/5JmL0jVn5hGTy8 w==;
X-CSE-ConnectionGUID: L2AVM5ARSJWODjcTKl9Mjg==
X-CSE-MsgGUID: 9VVDa0TiTgexDU1ZiD5DlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19634968"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="19634968"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 05:28:14 -0700
X-CSE-ConnectionGUID: vsU0CpESSD64K9AtgUEJKQ==
X-CSE-MsgGUID: 2E1pGDVvRsyJpEEqCnS6Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="46576991"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.80.70])
 ([10.245.80.70])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 05:28:12 -0700
Message-ID: <3ab018ec-4c7a-407e-9d6a-652081589aa2@intel.com>
Date: Thu, 20 Jun 2024 14:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/intel_device_info: Add blitter/render
 definition for BMG
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240620094822.524239-1-zbigniew.kempczynski@intel.com>
 <20240620094822.524239-2-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240620094822.524239-2-zbigniew.kempczynski@intel.com>
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
> Xe2 definition used for LNL works either for BMG so lets use it.
>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   lib/intel_device_info.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 9250abd444..298047e741 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -522,7 +522,8 @@ static const struct intel_device_info intel_battlemage_info = {
>   	.has_4tile = true,
>   	.has_flatccs = true,
>   	.is_battlemage = true,
> -	.codename = "battlemage"
> +	.codename = "battlemage",
> +	.cmds_info = &xe2_cmds_info,
>   };
>   
>   static const struct pci_id_match intel_device_match[] = {

