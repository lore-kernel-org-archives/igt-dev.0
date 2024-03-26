Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C951C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 07:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAEA10ED94;
	Tue, 26 Mar 2024 07:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cwx+DV3y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC31110ED8F
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711439508; x=1742975508;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VsvUYvZF1dCLo3dOGcjI5HzonHXixxqNmG06CaRIDd8=;
 b=Cwx+DV3yoQFk0HVH+PxQibPcYThnAdxuq66Nm/OOAs6VnCO6WjKC6Fw9
 f5eygqT/pEG09Toeo+xCRLvgPYZPr8fy93CjY+83rRAzgP6LZIB5SVAoP
 SUoLKqKE/YKnfbD8/a+kkEfbqQxzG2JioxyB/MkDgxoILDeK82Mv96yAL
 k97pc6Fx/4YAaguMvXKPurdT5LqWWKCHOwuCc6i0cCnbQoIxmV3a1JgYL
 DBswO431WuSekkNxFBFgjJrr4If6IA2jjwkp7AiZ/0He3fFaKOg4EV9Dx
 cW9uxUTxgrW2ojjcEeMYXSJMZmWduPGffVVNbg2wNaPI4q1V5j7gFRusE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6586917"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6586917"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 00:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="47039888"
Received: from unknown (HELO [10.245.245.97]) ([10.245.245.97])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 00:51:47 -0700
Message-ID: <da64d666-7cae-4ed8-a298-9b588374aebd@intel.com>
Date: Tue, 26 Mar 2024 07:51:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_vm: Fix WB caching PAT index for
 coherency mode
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org, oak.zeng@intel.com,
 jonathan.cavitt@intel.com, kamil.konieczny@linux.intel.com
References: <20240325212700.127810-1-jagmeet.randhawa@intel.com>
 <20240325212700.127810-2-jagmeet.randhawa@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240325212700.127810-2-jagmeet.randhawa@intel.com>
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

On 25/03/2024 21:27, Jagmeet Randhawa wrote:
> Resolve a coherency conflict by setting the
> correct PAT index for WB caching with
> intel_get_pat_idx_wb(fd), addressing the
> mismatch between the default "XE_COH_NONE"
> coherency mode and DRM_XE_GEM_CPU_CACHING_WB.

Could maybe reword to something like:

"Ensure we set a suitable default pat_index, which is always compatible 
with any CPU caching mode, like intel_get_pat_idx_wb(). For example, 
currently we are blindly selecting pat_index=0 which has COH_NONE on LNL 
and then attempting to use that with CPU caching mode WB, which is not 
supported by the KMD."

> This conflict occurs for VLK:54352.
> 
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Oak Zeng <oak.zeng@intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/intel/xe_vm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 7c061c497..1f458174d 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1789,6 +1789,7 @@ static void bind_flag_invalid(int fd)
>   	bind.bind.range = bo_size;
>   	bind.bind.addr = addr;
>   	bind.bind.op = DRM_XE_VM_BIND_OP_MAP;
> +	bind.bind.pat_index = intel_get_pat_idx_wb(fd);
>   	bind.num_syncs = 1;
>   	bind.syncs = (uintptr_t)sync;
>   
