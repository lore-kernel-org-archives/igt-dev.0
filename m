Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6136FC02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 14:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF8F10E1C4;
	Fri, 24 Jan 2025 14:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d0tHrBSq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2318410E1C4
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737727661; x=1769263661;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=35Y/5eVto84X850PLUtrZD7Gt+mi/OdRWvTIc8M1y4s=;
 b=d0tHrBSq0ySoK0tA1PSBEPcHzOWYzgLG+7EbsgYwZnehQsn3FlwRuNJL
 2uQJxzbKT/vjtrxGkKxGXMm6/wNI5FGyXWWU0zZr2xR29U4rdD2IxbR/j
 0WrfUU+qbyric490w8x3sFoJHPtVNqasNTvtkAzYrBXdz/g1/kRVEpgdn
 j1gKH9nmIw41l4Tdv5bgAPUuGoNFUnprHQyVKqJbJ8YkinyP0dKsQwZJL
 EGY2qQinS9OC3OkqO8grN7yP+UigaOHDieD+Jte6Rkm+rBDtHfBCrxs4W
 nMnO80MGkM4S9Xe0UE9olGPv+TE7C1fLMXjTHku6taFXOrl+Dq32Rn+er g==;
X-CSE-ConnectionGUID: luOSf7nhRlal+uBIMCyDeA==
X-CSE-MsgGUID: McqhjxzJSDC+ybKqFBHLcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="63613261"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="63613261"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 06:07:41 -0800
X-CSE-ConnectionGUID: Ora7vT6vSQKDAOgkB9PAMw==
X-CSE-MsgGUID: bfO15lsIS/O3zhmDkxSDCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="107574830"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 06:07:39 -0800
Date: Fri, 24 Jan 2025 15:07:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 jordan.l.justen@intel.com, christoph.manszewski@intel.com
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_eudebug_online: Fix 32b
 compilation errors
Message-ID: <20250124140737.kibixx5eputcoqoi@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 jordan.l.justen@intel.com, christoph.manszewski@intel.com
References: <20250122144419.327706-1-dominik.grzegorzek@intel.com>
 <20250122144419.327706-3-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250122144419.327706-3-dominik.grzegorzek@intel.com>
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
On 2025-01-22 at 15:44:19 +0100, Dominik Grzegorzek wrote:
> Fix metadata allocation so it is properly sized on 32b and further
> calculations of its size.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

btw imho you could define a macro for count '2' or a macro for
size but I do not know if there are any plans to change it
in future? So instead of:

2 * sizeof(**metadata)

#define EUDEBUG_METADATA_SIZE (2*sizeof(uint64_t))
or even also define '2' as a size for it.

This could be left for later, lets first proceed with this fix.

Regards,
Kamil

> ---
>  tests/intel/xe_eudebug_online.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 1a146d8c4..726fc55b1 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -1063,8 +1063,8 @@ static void run_online_client(struct xe_eudebug_client *c)
>  	uint32_t *ptr;
>  	int fd, vm_flags;
>  
> -	metadata[0] = calloc(2, sizeof(*metadata));
> -	metadata[1] = calloc(2, sizeof(*metadata));
> +	metadata[0] = calloc(2, sizeof(**metadata));
> +	metadata[1] = calloc(2, sizeof(**metadata));
>  	igt_assert(metadata[0]);
>  	igt_assert(metadata[1]);
>  
> @@ -1086,10 +1086,10 @@ static void run_online_client(struct xe_eudebug_client *c)
>  	metadata[1][0] = target_offset;
>  	metadata[1][1] = buf->size;
>  	metadata_id[0] = xe_eudebug_client_metadata_create(c, fd, DRM_XE_DEBUG_METADATA_ELF_BINARY,
> -							   2 * sizeof(*metadata), metadata[0]);
> +							   2 * sizeof(**metadata), metadata[0]);
>  	metadata_id[1] = xe_eudebug_client_metadata_create(c, fd,
>  							   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
> -							   2 * sizeof(*metadata), metadata[1]);
> +							   2 * sizeof(**metadata), metadata[1]);
>  
>  	vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
>  	vm_flags |= c->flags & SHADER_PAGEFAULT ? DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
> @@ -1144,10 +1144,10 @@ static void run_online_client(struct xe_eudebug_client *c)
>  	xe_eudebug_client_vm_destroy(c, fd, create.vm_id);
>  
>  	xe_eudebug_client_metadata_destroy(c, fd, metadata_id[0], DRM_XE_DEBUG_METADATA_ELF_BINARY,
> -					   2 * sizeof(*metadata));
> +					   2 * sizeof(**metadata));
>  	xe_eudebug_client_metadata_destroy(c, fd, metadata_id[1],
>  					   DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
> -					   2 * sizeof(*metadata));
> +					   2 * sizeof(**metadata));
>  
>  	intel_buf_destroy(buf);
>  
> -- 
> 2.34.1
> 
