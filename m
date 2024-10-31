Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F7ED767DA
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 15:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD1210E8BD;
	Thu, 31 Oct 2024 15:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VmdB1wFo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E7010E8BD
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730387098; x=1761923098;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HyBpgMAWXQqgDQc29UPoVgSzacKubMjpRRJdDnQubxo=;
 b=VmdB1wFoEfjJO5cHrO7Foe0XYE57IiWCHTBsWmDO2PDuDv6Qp+tWXUnX
 AeRb/WkZ70Q0HeYDcW+q59JPTUgo3nm0Tbht9cbEtTUUm8Dw+K1vz0n3X
 q/itc2O/9oXfoocPcdbLIQoTnKQTz8vhZavMW9JythLLd9keBm1RfXPSe
 jQjp/9nS6813Y0CDavqnvVRthr/Ov67AK6gfdH3WmHcnxmgfSSDDgBkPa
 VmECx5JGeEiwpKLWzTJty0R6Za4/vK6x5a3oBUPe8vnhpb7RUGKU2mWbS
 AgXKsBmccOVjpQSzY3IbC5hAPpnYNw09h1CGCdztBC/sBTxlPyouUf9Wt w==;
X-CSE-ConnectionGUID: SF0qW8NyRcyN37zZGMzibQ==
X-CSE-MsgGUID: RxoxAmMaT2KOwtn6xM2Quw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30021209"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="30021209"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 08:04:57 -0700
X-CSE-ConnectionGUID: ibGxrOKOTLmuX/7XVFHeUA==
X-CSE-MsgGUID: 3CvtWp1uTqCgYvna+1Dzzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82567921"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 08:04:55 -0700
Date: Thu, 31 Oct 2024 16:04:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_exec_comput_mode: Use valid exec queue
 for bind
Message-ID: <20241031150440.a27wjp7anu3fcxol@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
References: <20241031073604.35976-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241031073604.35976-1-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2024-10-31 at 08:36:04 +0100, Zbigniew Kempczyński wrote:
> Using gt_id as exec queue for binding is wrong and it works by accident
> because bcs engine used in the subtest reside on tile 0. But trying
> to run the test on engine which resides on different tile just fails.
> Lets use default binding engine for this.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

This is documented in lib header as exec queue, not as gt, so LGTM

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_exec_compute_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index e49633ace8..8fba9daef7 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -472,7 +472,7 @@ static void lr_mode_workload(int fd)
>  							ALLOC_STRATEGY_LOW_TO_HIGH);
>  
>  	sync.addr = to_user_pointer(&vm_sync);
> -	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, spin_addr, bo_size, &sync, 1);
> +	xe_vm_bind_async(fd, vm, 0, bo, 0, spin_addr, bo_size, &sync, 1);
>  	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
>  
>  	xe_spin_init_opts(spin, .addr = spin_addr, .write_timestamp = true);
> -- 
> 2.34.1
> 
