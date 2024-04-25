Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBA0C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 12:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C2710EDA6;
	Thu, 25 Apr 2024 12:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjlmoFYL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DE410EDA6
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714048128; x=1745584128;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=qsx4vFCKIWKTdw/Bq7YkKjMCf728aolL7iVR3/kFKnY=;
 b=QjlmoFYLawU1lhhOZU/FhNuPsF60KTrAgX/vtd4VNymEJklTaJi0YIhH
 1PI0ZqBYrNZT/QNgFG7uYzmOUMMJGnV93vshDR3NwbZOPFPTa8ftHczyy
 2xUJsxxzGRh08ufU2Ps2tEp/iwDOOzsD6EHUE3uk/Yn6eHgN0Lz7H/IT/
 hdNd1YW0qFpAm26PZBFMUol9RKPXT7YUbUgkQ2Q9YbRjQ3HdMhScx5TkJ
 rwJ6JqYSN3RU8Vhf3jyVGylqSbex1HfaCh/lkBTjUzhfjykysCbaZZ2xd
 odUgHzvVsR2hBbPW8y3ypPx1KBZcAAWm0rxsAGK1gXNx/UJXopkCbL0Ds Q==;
X-CSE-ConnectionGUID: 6AOwSlZNTW+FLUnVNp1Cjw==
X-CSE-MsgGUID: prxBITT2QjOKZpLA/6D99A==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12663634"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="12663634"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 05:28:47 -0700
X-CSE-ConnectionGUID: 8ynkBzP2SNi5DtYnvhgf5Q==
X-CSE-MsgGUID: rYtwZAf8S5CoBOhY4PDpjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25683519"
Received: from bgrzegor-mobl2.ger.corp.intel.com (HELO [10.213.21.50])
 ([10.213.21.50])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 05:28:46 -0700
Message-ID: <c81b7354-e123-4c15-99de-0c7627e5bef7@intel.com>
Date: Thu, 25 Apr 2024 14:28:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/gpu_cmds: be ready to use xe2 gpgpu fill on
 newer platforms
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240425121337.433948-1-dominik.grzegorzek@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240425121337.433948-1-dominik.grzegorzek@intel.com>
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

Hi Dominik,

On 25.04.2024 14:13, Dominik Grzegorzek wrote:
> Doing xe2 gpgpu pipeline implementation we mostly taken into account
> possibility of reusing the implementation for future platforms.
> But not everywhere. Make it common.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>   lib/gpu_cmds.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index f37e725e7..40522d58e 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -1030,7 +1030,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
>   	intel_bb_out(ibb, 0);
>   
>   	/* stateless data port */
> -	tmp = intel_graphics_ver(ibb->devid) == IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
> +	tmp = intel_graphics_ver(ibb->devid) >= IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
>   	intel_bb_out(ibb, 0 | tmp);                  //dw3
>   
>   	/* surface */
> @@ -1056,7 +1056,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
>   	/* dynamic state buffer size */
>   	intel_bb_out(ibb, 1 << 12 | 1);                             //dw13
>   	/* indirect object buffer size */
> -	if (intel_graphics_ver(ibb->devid) == IP_VER(20, 0))	    //dw14
> +	if (intel_graphics_ver(ibb->devid) >= IP_VER(20, 0))	    //dw14

nice catch, should be like this from the start.

Acked-by: Christoph Manszewski <christoph.manszewski@intel.com>

Christoph

>   		intel_bb_out(ibb, 0);
>   	else
>   		intel_bb_out(ibb, 0xfffff000 | 1);
