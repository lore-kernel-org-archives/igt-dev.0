Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F04C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 15:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FF610E400;
	Mon, 25 Mar 2024 15:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6+7TH47";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E5F10E400
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711382327; x=1742918327;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xJ7TVp6s4B4W9JBX2+o/CrVNWsG4+wTBl39WwZMjdnE=;
 b=b6+7TH47AIcJnzkEqYKPPrCx5aGe3wH6fTrerVHIeKxcM/7t6Brn9QMl
 /+mwquJ0FHm2VgOpJFTOaIXvas3v6na9XixnKJ8iIu0ZA2htJCmNurci+
 5Fv+YufuBmXO1ybqx2yILqxgd7EXTs7Qd+akN/iTrUM8/oEtDroBqoZH3
 GBg9+Wn62p9mP1STUGB9W87Fhb/ZnO/fW2a90f+UdOMw3IKBe+7X0JWaO
 rc9qCqyKeBvsyncsjqc98Eyx7WJ6IN2wH8qytBSBtJdNVa64OcVNBp40u
 ZUDCgE+ugEot0/fHqpkkEB9ZOlqp/SvzmfKJhpgrG03Tbokk+M9fl3mdq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17830200"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="17830200"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 08:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="15738213"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:58:44 -0700
Date: Mon, 25 Mar 2024 16:58:42 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org, oak.zeng@intel.com
Subject: Re: [PATCH] Fix WB caching PAT index for coherency mode
Message-ID: <20240325155842.jsyhw34xeyr6w74h@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 igt-dev@lists.freedesktop.org, oak.zeng@intel.com
References: <3f2c5a052be93e68e44d203f164dbcc36941e34b.1711148627.git.jagmeet.randhawa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3f2c5a052be93e68e44d203f164dbcc36941e34b.1711148627.git.jagmeet.randhawa@intel.com>
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

Hi Jagmeet,
On 2024-03-22 at 16:09:06 -0700, Jagmeet Randhawa wrote:

One nit about subject:
[PATCH] Fix WB caching PAT index for coherency mode

this should start with test name you want to fix and have "i-g-t"
after PATCH, so:

[PATCH i-g-t] tests/intel/xe_vm: Fix WB caching PAT index for coherency mode

> By default "coh_mode" is "XE_COH_NONE" and
> "cpu_caching" is set to "DRM_XE_GEM_CPU_CACHING_WB"
> because write back (WB) caching requires
> a valid coherence mode, and "coh_mode" is set to
> "XE_COH_NONE" there is no coherence leading to this
> contradiction. So to address this issue, we set the
> pat_index with intel_get_pat_idx_wb(fd);
-----------------------------------------^
End sentence with dot.

Also please simplify your description, it looks like you
repeat yourself.

You missed Cc and your signed off by, so here write:

Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_vm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 7c061c497..1f458174d 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1789,6 +1789,7 @@ static void bind_flag_invalid(int fd)
>  	bind.bind.range = bo_size;
>  	bind.bind.addr = addr;
>  	bind.bind.op = DRM_XE_VM_BIND_OP_MAP;
> +	bind.bind.pat_index = intel_get_pat_idx_wb(fd);
>  	bind.num_syncs = 1;
>  	bind.syncs = (uintptr_t)sync;
>  
> -- 
> 2.25.1
> 
