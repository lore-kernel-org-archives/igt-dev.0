Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB7CC27C6E
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 08:38:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E86410E2B4;
	Mon, 17 Jun 2024 08:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqZU7vgj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E3310E2B4
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718613502; x=1750149502;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vFpbCP5OBMdfmOgEfuQVzrtTL/yoaQF7lXRkb+jaspE=;
 b=kqZU7vgjOyYjk3A9omkIHK1vAB7Gv7bkQN36t+5sFM7E+Qj4leqjZaxd
 a9Z3RbLqeKFaPqZkT+eRUUemvm6CMGGNy/TuM6fcoJ94g4cvA9UrWJOLi
 nznXgTGzmc2uk9aSaDVuhCyu5cQAgjzxaNmoDRH4m0NTfJ6tEPjzWzOuy
 bFd+zrFvvBVV5Xo9r1/rACOSHcAw7NH1YRQ23IwfPH3iou1w+aUCbRwj8
 3l/p5njqg2ump58rmavyRe4SNrSYPl9DXpOkB1w2Zt9nsW2zGh7ooRoS8
 QjapsnJJ8VVph7b8itjLIwPR3TcS+uYtERJWpU6LUPTtlkTmDEaHGPUXN g==;
X-CSE-ConnectionGUID: AuzuQlunSfmmW+SSJvaFMw==
X-CSE-MsgGUID: tLbBCoQaRDyShYyrg1hnSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26823501"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="26823501"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 01:38:21 -0700
X-CSE-ConnectionGUID: aYBbez8AQJGoZGWypoppTg==
X-CSE-MsgGUID: Az94R1dCSA2sm+jedUH/Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41845953"
Received: from opintica-mobl1 (HELO [10.245.244.234]) ([10.245.244.234])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 01:38:19 -0700
Message-ID: <ea23d6da-e054-4c16-a431-6981190c878c@intel.com>
Date: Mon, 17 Jun 2024 09:38:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] lib/intel_chipset: add Battlemage support
To: Andrzej Hajda <andrzej.hajda@intel.com>, igt-dev@lists.freedesktop.org
Cc: Ewelina Musial <ewelina.musial@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>
References: <20240617-bmg_chipset_info-v1-0-289e3215141e@intel.com>
 <20240617-bmg_chipset_info-v1-2-289e3215141e@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240617-bmg_chipset_info-v1-2-289e3215141e@intel.com>
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

On 17/06/2024 08:51, Andrzej Hajda wrote:
> Add basic definition for the Battlemage platform.
> Follow Lunar Lake convention.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   lib/intel_chipset.h     |  2 ++
>   lib/intel_device_info.c | 12 ++++++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 3f25345199b6..270392c83c2a 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -91,6 +91,7 @@ struct intel_device_info {
>   	bool is_meteorlake : 1;
>   	bool is_pontevecchio : 1;
>   	bool is_lunarlake : 1;
> +	bool is_battlemage : 1;
>   	const struct intel_cmds_info *cmds_info;
>   	const char *codename;
>   };
> @@ -205,6 +206,7 @@ void intel_check_pch(void);
>   #define IS_METEORLAKE(devid)	(intel_get_device_info(devid)->is_meteorlake)
>   #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
>   #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
> +#define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
>   
>   #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
>   #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index e80ea54707de..9250abd444db 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -515,6 +515,16 @@ static const struct intel_device_info intel_lunarlake_info = {
>   	.cmds_info = &xe2_cmds_info,
>   };
>   
> +static const struct intel_device_info intel_battlemage_info = {
> +	.graphics_ver = 20,
> +	.graphics_rel = 1,
> +	.display_ver = 14,
> +	.has_4tile = true,
> +	.has_flatccs = true,
> +	.is_battlemage = true,
> +	.codename = "battlemage"
> +};
> +
>   static const struct pci_id_match intel_device_match[] = {
>   	INTEL_I810_IDS(INTEL_VGA_DEVICE, &intel_i810_info),
>   	INTEL_I815_IDS(INTEL_VGA_DEVICE, &intel_i815_info),
> @@ -621,6 +631,8 @@ static const struct pci_id_match intel_device_match[] = {
>   
>   	XE_LNL_IDS(INTEL_VGA_DEVICE, &intel_lunarlake_info),
>   
> +	XE_BMG_IDS(INTEL_VGA_DEVICE, &intel_battlemage_info),
> +
>   	INTEL_VGA_DEVICE(PCI_MATCH_ANY, &intel_generic_info),
>   };
>   
> 
