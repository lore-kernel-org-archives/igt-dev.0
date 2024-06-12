Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9FFC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 07:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8763110E7A4;
	Wed, 12 Jun 2024 07:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZYkBJcO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EAE10E7A4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 07:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718175764; x=1749711764;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=pnfSUNvO2ttqukmrW9wA+0WEpjlElCjDy7s2xBfB87E=;
 b=YZYkBJcOb7pYkvUs9t+lBsE8r4J/ifHNXZnWHIWxjbodXfVgJ5T7wPJp
 FUp82K6rAZqsSj2L7kTmCIYRiZnCbq3hT0cqlRxDv9hIMfA6JNrPeViL1
 e22X7FHcj2L2pFfxiO98UE90dMzhffyQ6fDp+6dZSL/wSm3EiSmJRuDB1
 hzPn44jeI+QoOiAPZNIXvTQrC3UVcRXlQSkRE/D8SepHnCOI3HD5vCjkg
 5G2l8ilDGuxmQ9BcRIG/4LGYQ1cNdpQWoDGrp0oxDM6Zj/qYAwqQzBTJ9
 CYp132YIvxE/bwKdsIHV0uspsnjxa3ZmmjId/lSO4cdS298UrPlUQtHmo A==;
X-CSE-ConnectionGUID: quJhcla/SY2+U6xjEg2VlQ==
X-CSE-MsgGUID: PGauB8QeTUSA6ELgYQXe5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="25550689"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="25550689"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:02:43 -0700
X-CSE-ConnectionGUID: fFm7k99nSQG8slKJvMZtAQ==
X-CSE-MsgGUID: RGgN3asUSHCo4usufjSjeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="39618990"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.4.197])
 ([10.246.4.197])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:02:43 -0700
Message-ID: <838970cd-b554-4f7e-89b6-4e6fe8396cd9@intel.com>
Date: Wed, 12 Jun 2024 09:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/7] lib/drmtest: add function for retriving
 chipset
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
 <20240607153629.52596-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240607153629.52596-2-kamil.konieczny@linux.intel.com>
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



On 07.06.2024 17:36, Kamil Konieczny wrote:
> A few tests uses chipset value for control and checks, so
> instead of testing it with, for example, is_intel_driver(),
> allow to retrieve it once and give it back to test.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   lib/drmtest.c | 21 +++++++++++++++++++++
>   lib/drmtest.h |  2 ++
>   2 files changed, 23 insertions(+)
>
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index f8810da43..8ea96ba76 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -241,6 +241,27 @@ static void modulename_to_chipset(const char *name, unsigned int *chip)
>   	}
>   }
>   
> +/**
> + * drm_get_chipset:
> + * @fd: a drm file descriptor
> + *
> + * Returns:
> + * chipset if driver name found in modules[] array, for example: DRIVER_INTEL
> + * DRIVER_ANY if drm device name not known
> + */
> +unsigned int drm_get_chipset(int fd)
> +{
> +	unsigned int chip = DRIVER_ANY;
> +	char name[32] = "";
> +
> +	if (__get_drm_device_name(fd, name, sizeof(name) - 1))
> +		return chip;
> +
> +	modulename_to_chipset(name, &chip);
> +
> +	return chip;
> +}
> +
>   static const char *chipset_to_str(int chipset)
>   {
>   	switch (chipset) {
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index bbe5f252f..4d9b60882 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -72,6 +72,8 @@ enum intel_driver {
>   
>   void __set_forced_driver(const char *name);
>   
> +unsigned int drm_get_chipset(int fd);
> +
>   /**
>    * ARRAY_SIZE:
>    * @arr: static array

