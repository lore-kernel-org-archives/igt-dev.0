Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4F7CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 17:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CF9112E44;
	Wed, 10 Apr 2024 17:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="midcyJlu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406D91130C8
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 17:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712771381; x=1744307381;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iJE83nNdcaMZKbembRcRpLUjuZKdhfkO+utgvWFDmvw=;
 b=midcyJluiZWdBHo+3PxAgY59Mm/yq5Fsw3GiSt66JdDzGEEJ/Sk8nCLX
 QKhZjeWXQGSVQwkWfbM/gklSNPp/j+Pg7qx2zeoyt2zdhZimfMVsUzzE5
 SwEBPsqYOtJ3y204jHUP8UJJb7+icvXN0rcuMFPjYTOB9oFwwyUbryYCO
 30LOSPLAlwGOB3Rz+35NrKPYyLOG+D5vpPfoman2Ca1UadWK9JVPsiDcz
 qml37HKB63AAV2zoDcqrUxPKTutd1kdNOxuUN6dhsiwDWgv9QFdaTbZH4
 bTM8wagBrAPofx3grwMptJhxRXZ4FpPjHmxj37NvaZEihK7BIgHIR0BTV A==;
X-CSE-ConnectionGUID: 9GyKkkMuQPKsfG4dzCd4mw==
X-CSE-MsgGUID: YYky8IYfREa8b+WePfuAkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8375407"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8375407"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:49:31 -0700
X-CSE-ConnectionGUID: eGk2+/xKQKWiJBXe0bm/Ag==
X-CSE-MsgGUID: oxVXI3EnT1K2xCBJEK/6pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="20586911"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:49:29 -0700
Date: Wed, 10 Apr 2024 19:49:25 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH i-g-t] tests/device_reset: move later skips into subtests
Message-ID: <20240410174925.rbxlrgzjyxl7eftd@zkempczy-mobl2>
References: <20240404154134.90603-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404154134.90603-1-kamil.konieczny@linux.intel.com>
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

On Thu, Apr 04, 2024 at 05:41:34PM +0200, Kamil Konieczny wrote:
> It is safe to use skips just after igt_main() for skipping all
> subtests but later on they produce logs and even if CI will
> ignore that, such logs can mislead developers reading them.
> 
> Move a skip from middle of igt_main() code block into subtests
> which needed them.
> 
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/device_reset.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 583a59039..9b3b8ee6c 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -424,22 +424,25 @@ igt_main
>  		healthcheck(&dev);
>  	}
>  
> -	igt_subtest_group {
> -		igt_fixture {
> -			igt_skip_on_f(dev.fds.slot_dir < 0, "Gfx Card does not support any "
> -				      "pcie slot for cold reset\n");
> -			igt_skip_on(!is_sysfs_cold_reset_supported(dev.fds.slot_dir));
> -		}
> +#define SKIP_IF_NO_COLD_RESET(slot_dir) \
> +	do { \
> +		igt_skip_on_f(slot_dir < 0, "Gfx Card does not support any " \
> +			      "pcie slot for cold reset\n"); \
> +		igt_skip_on(!is_sysfs_cold_reset_supported(slot_dir)); \
> +	} while(0)
>  
> +	igt_subtest_group {
>  		igt_describe("Unbinds driver from device, initiates cold reset"
>  			     " then rebinds driver to device");
>  		igt_subtest("unbind-cold-reset-rebind") {
> +			SKIP_IF_NO_COLD_RESET(dev.fds.slot_dir);

Why not to introduce:

igt_require_cold_reset();

?

--
Zbigniew

>  			unbind_reset_rebind(&dev, COLD_RESET);
>  			healthcheck(&dev);
>  		}
>  
>  		igt_describe("Cold Resets device with bound driver");
>  		igt_subtest("cold-reset-bound") {
> +			SKIP_IF_NO_COLD_RESET(dev.fds.slot_dir);
>  			initiate_device_reset(&dev, COLD_RESET);
>  			/*
>  			 * Cold reset will initiate card boot sequence again,
> -- 
> 2.42.0
> 
