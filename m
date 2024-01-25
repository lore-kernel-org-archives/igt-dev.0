Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8920DC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 06:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CEE10E1BC;
	Thu, 25 Jan 2024 06:12:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B0010E1BC
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 06:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706163150; x=1737699150;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1OUO6ejN8ml3ZP7TuIQZRF8JL85vAJ2iJTPFhNq3Y8g=;
 b=eHnuroynXq5XuAT/AhHQG3WU+P4sWK9dpAZOU0f+i9fLsTLyzZMQAqNG
 vZgbV56FypFKagSCmen0d2HwnkJ9aGgexiZ5ZPwXuiDCiGGN7EeO2Mq6t
 ND5dz7sZ5hkgifzCITkhrdTHT+nQnxrgZbtjuhrhS66VFt8w5LgCxN7DU
 ncnxJ6GELMQxMkRKMPVShZMn67YcaGVZkOOpmGldt9Ih3RPMkgvXuM9D9
 gEWeMGzGdYaARk1I0wJj6qgLVrXyQYtjhucOkPU152NHEaMrA81xGFPoO
 n4sjuc7rEkmRtZQZOJWbdgCOowvwMfGxza1VeEwS2IoneK+k7cSfOtSLK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9183852"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9183852"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28381213"
Received: from unknown (HELO localhost) ([10.246.28.142])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 22:12:28 -0800
Date: Thu, 25 Jan 2024 07:12:24 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t 3/5] benchmarks/gem_wsim: use xe_bb_size() helper
Message-ID: <20240125061224.xpggdh2kkkzvetar@zkempczy-mobl2>
References: <20240124180713.268843-1-matthew.auld@intel.com>
 <20240124180713.268843-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240124180713.268843-3-matthew.auld@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 06:07:11PM +0000, Matthew Auld wrote:
> No need to open code this anymore.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  benchmarks/gem_wsim.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 955b6799e..257134539 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -1743,8 +1743,8 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
>  	struct dep_entry *dep;
>  	int i;
>  
> -	w->bb_size = ALIGN(PAGE_SIZE + xe_cs_prefetch_size(fd),
> -			   xe_get_default_alignment(fd));
> +	w->bb_size = xe_bb_size(fd, PAGE_SIZE);
> +
>  	w->bb_handle = xe_bo_create(fd, vm->id, w->bb_size,
>  				    vram_if_possible(fd, eq->hwe_list[0].gt_id),
>  				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -- 
> 2.43.0
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
