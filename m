Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02624E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 11:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19B110E3A4;
	Tue, 10 Dec 2024 11:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3g9uHB+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F7910E3A4
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 11:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733829151; x=1765365151;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XZtNyeCcW63dsKTQtSOK/4V880BYuvTn+yQI9V0+090=;
 b=D3g9uHB+fomICBiWsZCdp8YIbyIB9UsTJMvpaTBGD4o+u3BmN4/UcmN1
 1W7mXpRo9QcK1PVLZ8/H9psAJS9duNwST2ypKnCKzkk5eoZM07Z9BDxkP
 m44XfGITZK3XFYdxZ9O7P+0m8MMdGiPWNND2+5bAO7aTfTPyCdJXiqNPb
 SDtWEJoi2QgBfEFeljpyiBzqQc2FTcxRVgaW1vBRLwN43n42brdSip13W
 Ab1I2PO3y3kzH97cRmmPv7vBZSvF2XawPuiHzDZeNjndsvI5HHKSIr5eW
 BgpqyKk7+v/tuUaJHbhLI3LoVxvcwPK39z5empsB9BDnsT/0ihzEoRdLN Q==;
X-CSE-ConnectionGUID: Lxb2qgCCTSG7fdW84nnAZg==
X-CSE-MsgGUID: sYziyw4ISGKFT9TktlbI6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34089079"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34089079"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 03:12:31 -0800
X-CSE-ConnectionGUID: Y6Kas1BYT8yuJunfeZBWgA==
X-CSE-MsgGUID: 2s2wKUWSSv6olw1wAeZrng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95581807"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 03:12:30 -0800
Date: Tue, 10 Dec 2024 12:12:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
Subject: Re: [PATCH v5 1/2] lib/xe/xe_spin: move the spinner related
 functions to lib
Message-ID: <20241210111211.fdqgdaxnl7ovotl3@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
References: <20241206111032.572276-1-pravalika.gurram@intel.com>
 <20241206111032.572276-2-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241206111032.572276-2-pravalika.gurram@intel.com>
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

Hi Pravalika,
On 2024-12-06 at 16:40:31 +0530, Pravalika Gurram wrote:
> move spin_ctx_init,spin_ctx_start,spin_ctx_end,spin_ctx_destroy
> to xe spin lib to avoid code redundancy.
> removed xe_cork*  functions to avoid duplicate spinner code.
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  lib/xe/xe_spin.c            | 160 +++++++++++++++++++----------
>  lib/xe/xe_spin.h            |  56 ++++++----
>  tests/intel/xe_drm_fdinfo.c | 200 +++++++-----------------------------
>  tests/intel/xe_vm.c         |  17 +--
>  4 files changed, 188 insertions(+), 245 deletions(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 3adacc3a8..f9b18dfc0 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -292,77 +292,125 @@ void xe_spin_free(int fd, struct igt_spin *spin)
>  	free(spin);
>  }
>  
> -void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
> -		  struct xe_cork *cork)
> +struct xe_cork *
> +xe_cork_create(int fd, struct drm_xe_engine_class_instance *hwe,
> +		uint32_t vm, uint16_t width, uint16_t num_placements,
> +		struct xe_cork_opts *opts)

While you changed public library functions definitions please
also add descriptions to all, see for example lib/drmtest.c or
lib/xe/xe_gt.c

Regards,
Kamil

>  {
> -	uint64_t addr = xe_get_default_alignment(fd);
> -	size_t bo_size = xe_bb_size(fd, SZ_4K);
> -	uint32_t vm, bo, exec_queue, syncobj;

...cut...

