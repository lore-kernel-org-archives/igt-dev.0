Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE9EC27C77
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 08:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB0B10E2FB;
	Mon, 17 Jun 2024 08:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INwONdIU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21FE10E2FB
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 08:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718613276; x=1750149276;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=I/UUoQsJMstWayQRPAC1le5n0xu5thJyYM0TvpdgsUY=;
 b=INwONdIUafWPt1l4NpPQyNw2c6N8ES9GkwA+Qw2GOwTtQgvkizfwZFiA
 TWyedwqJtnAe9NQ/ClAvtXJ+uiZbkqCTZmGsVXwESm1qOsQfkz9cecAbX
 QnPJ2YnYHdPWW+uVx8iOE0K7yCprzp4NLcafIJ4XdVk5cJplYxfICsnLe
 qn87TQWMk7YBP0iPTNItpiqJP6fZgZhF/YgWbP9MJm8fK3PiB43HqOuzH
 HOziRrhNNmLGfQme8LWK+pPHf6u+YFReH5/r6F50kFMm2oMFukrldH+6B
 nwWJld5xOQIVx7AUpAn2I3EPnItKa8rn1W9CAqX+ShJdZpLrnIPDYOIR4 Q==;
X-CSE-ConnectionGUID: GYvPemLVQX6ozvVf3AsNGA==
X-CSE-MsgGUID: uoh7acGfTsy+NSJPdG0bTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="40843284"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="40843284"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 01:34:35 -0700
X-CSE-ConnectionGUID: OGEhDIc9Swu3zoHxVtd3BA==
X-CSE-MsgGUID: bQRN0UFPQPC5ahJV7Fn94Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41227513"
Received: from opintica-mobl1 (HELO [10.245.244.234]) ([10.245.244.234])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 01:34:34 -0700
Message-ID: <0ece7dbe-046e-4549-935b-cb80037299bd@intel.com>
Date: Mon, 17 Jun 2024 09:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib: sync xe_pciids.h with kernel
To: Andrzej Hajda <andrzej.hajda@intel.com>, igt-dev@lists.freedesktop.org
Cc: Ewelina Musial <ewelina.musial@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20240617-bmg_chipset_info-v1-0-289e3215141e@intel.com>
 <20240617-bmg_chipset_info-v1-1-289e3215141e@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240617-bmg_chipset_info-v1-1-289e3215141e@intel.com>
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
> This synchronizes with kernel commit
> e54700f7d6aa ("drm/xe/bmg: Add PCI IDs")
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   lib/xe_pciids.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
> index c7fc288dacee..73d972a8aca1 100644
> --- a/lib/xe_pciids.h
> +++ b/lib/xe_pciids.h
> @@ -208,4 +208,11 @@
>   	MACRO__(0x64A0, ## __VA_ARGS__), \
>   	MACRO__(0x64B0, ## __VA_ARGS__)
>   
> +#define XE_BMG_IDS(MACRO__, ...) \
> +	MACRO__(0xE202, ## __VA_ARGS__), \
> +	MACRO__(0xE20B, ## __VA_ARGS__), \
> +	MACRO__(0xE20C, ## __VA_ARGS__), \
> +	MACRO__(0xE20D, ## __VA_ARGS__), \
> +	MACRO__(0xE212, ## __VA_ARGS__)
> +
>   #endif
> 
