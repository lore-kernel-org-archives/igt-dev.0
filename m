Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50038C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 08:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0542210FDFA;
	Wed, 24 Apr 2024 08:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y31wy7QU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DBD10FDFA
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 08:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713947423; x=1745483423;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=f+U7jtNqTW4UbfaZt8rq1OylCnHPMqQ0JOEWdtTMt0k=;
 b=Y31wy7QUu9zsmZR+nfD8MyhS4l19bQ9ZfYdyZohk9fzd10g2If/ON1Td
 OfopYuiQhBKMAai4A/alQdKCrYnrnkNDXzUmDKRCVJRHwYuE0Uwx00R3W
 lFqMjJXLttwDkpK7cRiiOzg/wJz/Cvl8zXwEbt/3Ompcy0T0BleRBqf8D
 EbUWTydyO8UltULUYz0NngT4cHiU1hTvML2vqBwJBnCJCVWdr8xVlJThN
 Q+tmzUy0sBAO1IV4TSSTgOlMgEJx/x1TJA+py72VibNfFlG928WC9D+Tx
 y2BxeNk0ze/ZOzp5r8epKQOeg7lVDuWm9LtqZQIxA5Q2p30bW7Km31gst A==;
X-CSE-ConnectionGUID: n+s5opAMSyWeoFjH1HvU0w==
X-CSE-MsgGUID: v4YQXjXGTwyrkIV7hiq/yw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9785261"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9785261"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:30:22 -0700
X-CSE-ConnectionGUID: 6h0ch1USTlahPyx7st5kDQ==
X-CSE-MsgGUID: BvocElj+T8+13jQ4jpS3dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="47896454"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.244.156])
 ([10.245.244.156])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:30:21 -0700
Message-ID: <51acd02b-9353-434f-86fa-3a8bd581e40f@intel.com>
Date: Wed, 24 Apr 2024 09:30:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_vm.c: Enforce explicit WB caching in
 bind-flag-invalid
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org, oak.zeng@intel.com
References: <bf76c34f97ed5e2ff935d4e8ff31c68dd13eb2d8.1713902821.git.jagmeet.randhawa@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <bf76c34f97ed5e2ff935d4e8ff31c68dd13eb2d8.1713902821.git.jagmeet.randhawa@intel.com>
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

On 23/04/2024 21:16, Jagmeet Randhawa wrote:
> Update the bind-flag-invalid test by replacing xe_bo_create
> with xe_bo_create_caching, which introduces an additional
> parameter for setting the CPU caching mode explicitly.
> The cpu_caching parameter is now set to DRM_XE_GEM_CPU_CACHING_WB,
> aligning the buffer object's caching policy with the Write-Back (WB)
> memory type expected by intel_get_pat_idx_wb. Previously,
> xe_bo_create relied on a default cpu_caching that may or
> may not have been compatible with intel_get_pat_idx_wb.
> 
> Suggested-by: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>   tests/intel/xe_vm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 13cca2752..d40a6d76e 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1776,13 +1776,14 @@ static void bind_flag_invalid(int fd)
>   	uint32_t bo, bo_size = xe_get_default_alignment(fd);
>   	uint64_t addr = 0x1a0000;
>   	uint32_t vm;
> +	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
>   	struct drm_xe_vm_bind bind;
>   	struct drm_xe_sync sync[1] = {
>   		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>   	};
>   
>   	vm = xe_vm_create(fd, 0, 0);
> -	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
> +	bo = xe_bo_create_caching(fd, vm, bo_size, vram_if_possible(fd, 0), 0, cpu_caching);

I think this will now blow up on dgpu, if using VRAM. WC for cpu_caching 
is the only supported mode when mapping VRAM. I don't see anything wrong 
with the existing code though. xe_bo_create() will already handle such 
things for you, and intel_get_pat_idx_wb() is meant to be compatible 
with most things (exception is maybe display).

>   	sync[0].handle = syncobj_create(fd, 0);
>   
>   	memset(&bind, 0, sizeof(bind));
