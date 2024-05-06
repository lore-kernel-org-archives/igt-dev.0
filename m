Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773DEC10F16
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 15:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9F810EDD2;
	Mon,  6 May 2024 15:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEcDS8lR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B2C10EDD2
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 15:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715007792; x=1746543792;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Dqr4wjJ3P7rK18HXHPSMzPilY7wUyoqLgdlUM8lmGPg=;
 b=SEcDS8lRQF/RZ+8qdV+1+sybTkMqeUFTrRR+2cCBgRn3lksUoSdzIuDi
 VuwZrS0fZSGjGNAFaNS9ib4PskBbvdopgK3tmZafkQiDHgt2mbNJj6mum
 mi5upiZxSZd5QiRuNo0bQUEx3wu+5g8UB5N9Tg0+qfz2VbzJ4u46MaAT0
 ypVZAcvEmWL/fJIAAniux3EzRqFScW8UGqobQtC+/m9fE9WxItVly9abO
 BuU5T632e3Iv/Qc/uunihFt7Cnh03av9cMEXYEi5ne4vBjdRmAQSezLRJ
 HdEtuOD7P8D7lm4Or7g8TiJVh4BpqyhJA0pGrWpUVb3lAoGnmp3hpj7d2 g==;
X-CSE-ConnectionGUID: X0KuijzeTvSfJpO6Qd68LA==
X-CSE-MsgGUID: gpi053qpRwm6p3U26Sa/Gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="28232834"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28232834"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 08:03:11 -0700
X-CSE-ConnectionGUID: +Dg8QJkTSPq/g71MKzT/6A==
X-CSE-MsgGUID: f5okMICvQlydQvT7n75/Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28779362"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.219])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 08:03:09 -0700
Date: Mon, 6 May 2024 17:03:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH v4 i-g-t] tests/device_reset: move later skips into
 subtests
Message-ID: <20240506150305.4ae5ocndvtiq2esr@zkempczy-mobl2>
References: <20240426173559.46528-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240426173559.46528-1-kamil.konieczny@linux.intel.com>
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

On Fri, Apr 26, 2024 at 07:35:59PM +0200, Kamil Konieczny wrote:
> It is safe to use skips just after igt_main() for skipping all
> subtests but later on they produce logs and even if CI will
> ignore that, such logs can mislead developers reading them.
> 
> Move a skip from middle of igt_main() code block into subtests
> which needed them.
> 
> v2: add space after while (Kamil)
> v3: remove macro in favor of function (Zbigniew)
> v4: rename function and make it compact (Zbigniew)
> 
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/device_reset.c | 46 ++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 40 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 583a59039..b8b292513 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -299,6 +299,39 @@ static bool is_sysfs_cold_reset_supported(int slot_fd)
>  	return true;
>  }
>  
> +/**
> + * cold_reset_not_supported:
> + * @fd: opened sysfs pci slot descriptor
> + * @reason: fail description
> + *
> + * Check if device supports cold reset based on slot dir or sysfs file presence.
> + *
> + * Returns:
> + * false if cold reset not supported, also writes a reason for it
> + * true if supported
> + */
> +static bool has_cold_reset(int slot_dir, const char **reason)
> +{
> +	static const char *no_slot = "Gfx Card does not support any pcie slot for cold reset";
> +	static const char *not_supported = "Gfx Card does not support cold reset";
> +
> +	if (slot_dir < 0) {
> +		if (reason)
> +			*reason = no_slot;
> +
> +		return true;
> +	}
> +
> +	if (!is_sysfs_cold_reset_supported(slot_dir)) {
> +		if (reason)
> +			*reason = not_supported;
> +
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  /* Unbind the driver from the device */
>  static void driver_unbind(struct device_fds *dev)
>  {
> @@ -424,22 +457,23 @@ igt_main
>  		healthcheck(&dev);
>  	}
>  
> -	igt_subtest_group {
> -		igt_fixture {
> -			igt_skip_on_f(dev.fds.slot_dir < 0, "Gfx Card does not support any "
> -				      "pcie slot for cold reset\n");
> -			igt_skip_on(!is_sysfs_cold_reset_supported(dev.fds.slot_dir));
> -		}
>  
> +	igt_subtest_group {
>  		igt_describe("Unbinds driver from device, initiates cold reset"
>  			     " then rebinds driver to device");
>  		igt_subtest("unbind-cold-reset-rebind") {
> +			const char *reason;
> +
> +			igt_skip_on_f(!has_cold_reset(dev.fds.slot_dir, &reason), "%s\n", reason);
>  			unbind_reset_rebind(&dev, COLD_RESET);
>  			healthcheck(&dev);
>  		}
>  
>  		igt_describe("Cold Resets device with bound driver");
>  		igt_subtest("cold-reset-bound") {
> +			const char *reason;
> +
> +			igt_skip_on_f(!has_cold_reset(dev.fds.slot_dir, &reason), "%s\n", reason);
>  			initiate_device_reset(&dev, COLD_RESET);
>  			/*
>  			 * Cold reset will initiate card boot sequence again,
> -- 
> 2.42.0
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
