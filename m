Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B428C52D7C
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 11:54:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0146F10E047;
	Fri, 23 Aug 2024 11:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPfLaAsA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018EF10E047
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 11:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724414088; x=1755950088;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oigNP+Czc3elMgXOt/prJvv0mIwMTvly8bbVtrXC7T4=;
 b=jPfLaAsA5YR2ySgQihCv5MRwaTGtduRVkD2H6njONznoRYIkjH8y3gHi
 er7N7oKVM++1GbwjBPchDyQMbGN/D+dexPOzVkcChMb/ZxxRZPBpE2QHp
 gdV8ynVQ9S6Vl/fxbGii1zLslh+3gxzCR4mqLbQELgC8c06SjxB5mtYe6
 aEZzdiXCjFNli5BbkxpzxeA6674YEXIexYdLVKCIeb1P3+yyd7yk1J9Tw
 0aQcK4YMyT5AuhebjgNVqZYxcQ7MHij2ACVhq13RU7fvKEdb+UZXfb7VD
 3E1BKrMT0ONiAvNxufDQ6dC7sxEqkfOpSks+uGwosQYATvMl/QogvoSHn A==;
X-CSE-ConnectionGUID: 7R4uPlvbRbGBhfHw1DcTyA==
X-CSE-MsgGUID: v/12mEd5TxeRRSM/69cQpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22690557"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="22690557"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 04:54:48 -0700
X-CSE-ConnectionGUID: JFPUauB+R/aoA95Olkh/4g==
X-CSE-MsgGUID: VGUHwUSsQF2+1tqXuL2z7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="84960820"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 04:54:46 -0700
Date: Fri, 23 Aug 2024 13:54:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] tests/intel/xe_vm: initialize bind_ops.extensions field
Message-ID: <20240823115431.wh2mg4xv76q2sdio@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240823110221.68234-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240823110221.68234-1-andrzej.hajda@intel.com>
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

Hi Andrzej,
On 2024-08-23 at 13:02:21 +0200, Andrzej Hajda wrote:
> Zeroing structure on allocation ensures all fields are initialized
> and allows to drop 0-initialzations.
> 
> Fixes: 2e5b3647f428 ("tests/intel/xe_vm: Add bind array -ENOBUFS section")
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  tests/intel/xe_vm.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index c3960fedeec7..7a8740b69627 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -917,7 +917,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  	} *data;
>  	int i, b;
>  
> -	bind_ops = malloc(sizeof(*bind_ops) * n_execs);
> +	bind_ops = calloc(n_execs, sizeof(*bind_ops));
>  	igt_assert(bind_ops);
>  
>  	vm = xe_vm_create(fd, 0, 0);
> @@ -935,15 +935,10 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  
>  	for (i = 0; i < n_execs; ++i) {
>  		bind_ops[i].obj = bo;
> -		bind_ops[i].obj_offset = 0;
>  		bind_ops[i].range = bo_size;
>  		bind_ops[i].addr = addr;
>  		bind_ops[i].op = DRM_XE_VM_BIND_OP_MAP;
> -		bind_ops[i].flags = 0;
> -		bind_ops[i].prefetch_mem_region_instance = 0;
>  		bind_ops[i].pat_index = intel_get_pat_idx_wb(fd);
> -		bind_ops[i].reserved[0] = 0;
> -		bind_ops[i].reserved[1] = 0;
> 

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  		addr += bo_size;
>  	}
> -- 
> 2.34.1
> 
