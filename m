Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDA6C5B548
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675D010E048;
	Wed, 28 Aug 2024 14:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALOxgD+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7178E10E048
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724856337; x=1756392337;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zTsHjaRwQm09bd9TkhNmSsfToxzXoIzjcA/qjqgC4AY=;
 b=ALOxgD+ZqMaAWxpWNVi79Rt86s6pEAC0KfpSDdP07mmvUIr2yMIAOX24
 W1Gz8EFUpdL0cqSt4pAGl4xvB4UppSbH/C/KhvS3jSPSTcHIwPBCOV+17
 VddJS/alG8G9AmQIi8mEh+JzSajqwGHBNtx6DSWZmqy1eXCE7icki1Ccu
 NfXiPtZ0ovzbCRy6Q9vrgT+9TqW6gahFqpucShhpWodNzTiFOISDM3Pdt
 UKUJyxuyootCnWH4C8mCQopwCu77ZSRmJxPTnb3XewO/R3xPNzT2/927T
 zJh53WkYr7O8eeFM1bpBxOb2Oww+x+vUhnmdD+0FDiTblwnnu3SSYhFsd g==;
X-CSE-ConnectionGUID: XbD2fJp6RcKL1xFI10X4sw==
X-CSE-MsgGUID: fq+jxwrbQOS4FgMJT+kZ+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="40867115"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="40867115"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:45:37 -0700
X-CSE-ConnectionGUID: GrK7JVqYS6KdkXLEYrc86g==
X-CSE-MsgGUID: okdCIpadQiqlE9jeFY+siA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="68130523"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.103])
 ([10.245.192.103])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:45:36 -0700
Message-ID: <bcda1ef0-343b-4d94-ba03-631f3d741517@linux.intel.com>
Date: Wed, 28 Aug 2024 16:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 02/10] tests/intel/xe_drm_fdinfo: Print timestamp
 for debug
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
 <20240827165449.1706784-3-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240827165449.1706784-3-lucas.demarchi@intel.com>
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


On 8/27/2024 6:54 PM, Lucas De Marchi wrote:
> xe_spin is capable of writing the timestamp from the GPU side. This is a
> good way to compare what we are reading from the fdinfo with what the
> GPU is seeing. Example output:
>
> (xe_drm_fdinfo:10404) DEBUG: rcs: spinner ended (timestamp=9817720)
> (xe_drm_fdinfo:10404) DEBUG: bcs: spinner ended (timestamp=9755785)
> (xe_drm_fdinfo:10404) DEBUG: vecs: spinner ended (timestamp=9653024)
> (xe_drm_fdinfo:10404) DEBUG: ccs: spinner ended (timestamp=9722776)
> (xe_drm_fdinfo:10404) DEBUG: rcs: sample 1: cycles 19513436, total_cycles 130596422980
> (xe_drm_fdinfo:10404) DEBUG: rcs: sample 2: cycles 29331470, total_cycles 130606141449
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/intel/xe_drm_fdinfo.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index e3a99a2dc..074a89711 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -416,6 +416,7 @@ spin_sync_start(int fd, struct spin_ctx *ctx)
>   		return;
>   
>   	ctx->spin_opts.addr = ctx->addr;
> +	ctx->spin_opts.write_timestamp = true;
>   	ctx->spin_opts.preempt = true;
>   	xe_spin_init(ctx->spin, &ctx->spin_opts);
>   
> @@ -448,7 +449,8 @@ spin_sync_end(int fd, struct spin_ctx *ctx)
>   	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>   
>   	ctx->ended = true;
> -	igt_debug("%s: spinner ended\n", engine_map[ctx->class]);
> +	igt_debug("%s: spinner ended (timestamp=%u)\n", engine_map[ctx->class],
> +		  ctx->spin->timestamp);
>   }
>   
>   static void
