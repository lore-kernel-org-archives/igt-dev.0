Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C7BD1AD46
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 10:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF8310E063;
	Wed, 16 Oct 2024 10:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1BamACn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E5410E063
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729075088; x=1760611088;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mpltpnCQVCL297kZ8MHYG5gpDuE4OJqsv/NshVtTm5A=;
 b=g1BamACn3rwJjnfPHsJzghaZuMbIoVW1rmVCK1gZvdv3Q2WhqZwm4D4H
 Lbt+TR0ZCNhS+2u0M1d98XAxilR52AT/vQLz3ADurtAYWZ6zsIQuIrEfr
 GYxhVLwURGfXNvWC91U8UhoW6tZu/nrkbkM5z9ADGUR9/6DCLmkPrN1X0
 aDMaqDypGpru4zlex/ex4Xgw8cpbaY4lqHARI5HNGgvlNy9WA9SJEUIDU
 zNVjMAfnrOQSdv80SH2Amy9zE0yUy2zo1n5DUV+/8Gzs4BpjDXrsCEFON
 XvAGMaai27w/stcGDR1SAnULc9pkjOKi+u8Cqggjx5ss9DyBRyKTNFX4T w==;
X-CSE-ConnectionGUID: RvLc7sRdSDCLc9VW8qMVWw==
X-CSE-MsgGUID: NLkZB2k8ROefoCQlDlPHcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="46009911"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="46009911"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 03:38:03 -0700
X-CSE-ConnectionGUID: Y2qmNMvQRj+NJeNeSiwDUw==
X-CSE-MsgGUID: +MAZdZtESUOU7CrBH9YMoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="78635900"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.76])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 03:38:01 -0700
Date: Wed, 16 Oct 2024 12:37:57 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_exec_compute_mode: Use
 xe_find_engine_by_class
Message-ID: <20241016103757.5o3zprwevb2wsbbd@zkempczy-mobl2>
References: <20241016101933.4191790-1-pravalika.gurram@intel.com>
 <20241016101933.4191790-3-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241016101933.4191790-3-pravalika.gurram@intel.com>
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

On Wed, Oct 16, 2024 at 03:49:33PM +0530, Pravalika Gurram wrote:
> Use 'xe_find_engine_by_class' helper to get the engine info with the
> required engine class.  Stop assuming engine id is equal to 1
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 82e607848..b238503ea 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -461,7 +461,10 @@ static void lr_mode_workload(int fd)
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>  	bo_size = xe_bb_size(fd, sizeof(*spin));
> -	engine = xe_engine(fd, 1);
> +

Unnecessary blank line. With this nit fixed:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Don't send next revision, just remind me when CI results will be available.
I'll remove it before pushing.

--
Zbigniew

> +	engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_COPY);
> +	igt_assert(engine);
> +
>  	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
>  	spin = xe_bo_map(fd, bo, bo_size);
>  
> -- 
> 2.34.1
> 
