Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B823CCD4F3D
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 21:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDA310E24A;
	Wed, 20 May 2026 21:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jn3idAs5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D49110E0C6
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 21:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779311548; x=1810847548;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JDaDIr7OaWEsc72My/zwBeCryg34/qppe2YCSc7sYkM=;
 b=jn3idAs5ZBfcstgoOt3RirNKxUESctOwaUltGn8OPJUzW9AIcAp1CYs5
 +Pwju2lOf1AhY4AM17hO09lKLpuQKhKZV0D3Ljt9NSgG6XvmW2BJOOlxl
 7N+PWsrsrh2JUCGmQoU64A1ZyZ6ZZFST6Y/rJUlBsR5HcMeuXC0q+bcl3
 0i0LfwrKaNlhgVzBhAEbyCSrWDZm/WSlb9C6KeKIw7tJUFl1PIeMVmkIW
 soy5fCw93tHLXaWVqCeuemcbZAFFAwRN1rTSWMtkBE/6/MqEnwEHxtevj
 FJXSbe2/u1c7tbc/MNrv0ctus6VltaonKrGGL8Rvk0r2LhSNXl+xgMfPE w==;
X-CSE-ConnectionGUID: ZIV5CkebQ5a9tbaFa/itSQ==
X-CSE-MsgGUID: XYyReNbHQ+WPu1JnT7mGNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80204003"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="80204003"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 14:12:28 -0700
X-CSE-ConnectionGUID: AWh2l+cLQou6N5NOavYQkA==
X-CSE-MsgGUID: IylTxcktSFCPRcnVI0y9sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; d="scan'208";a="242128024"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.99])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 14:12:26 -0700
Date: Wed, 20 May 2026 23:12:23 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH 1/3] lib/gpu_cmds: replace open coded ibb data copy with
 helper
Message-ID: <jvgw4xnrkmhhebai7riw7b2svx7govkueuld5yyprwksld3ydc@gxj7hygsc4gr>
References: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
 <20260520-ibb_fixes-v1-1-d0c8ab2d07d3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520-ibb_fixes-v1-1-d0c8ab2d07d3@intel.com>
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

On Wed, May 20, 2026 at 11:56:21AM +0200, Andrzej Hajda wrote:
> Helper, beside code compaction and increased readability, adds buffer
> overflow checks, which are missing here.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/gpu_cmds.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index f7b6c8703f7c..9dad73b6df4d 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -70,18 +70,7 @@ gen7_fill_kernel(struct intel_bb *ibb,
>  		const uint32_t kernel[][4],
>  		size_t size)
>  {
> -	uint32_t *kernel_dst;
> -	uint32_t offset;
> -
> -	intel_bb_ptr_align(ibb, 64);
> -	kernel_dst = intel_bb_ptr(ibb);
> -	offset = intel_bb_offset(ibb);
> -
> -	memcpy(kernel_dst, kernel, size);
> -
> -	intel_bb_ptr_add(ibb, size);
> -
> -	return offset;
> +	return intel_bb_copy_data(ibb, kernel, size, 64);

Agree, it is much better now:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  }
>  
>  static uint32_t
> 
> -- 
> 2.54.0
> 
