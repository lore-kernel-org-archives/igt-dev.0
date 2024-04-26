Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC17C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 16:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B2410F189;
	Fri, 26 Apr 2024 16:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AC/Khzx6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30B610F189
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 16:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714149550; x=1745685550;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/rxsRKMMv8naUcH8/8YYfvFlv262ZOrAv7OnkuGR8J0=;
 b=AC/Khzx6kSjaU7dORQqwGeBprtYA64uKv9ijaDScr52G5SvQqsgVYvPJ
 7dwCY0DXpJwLtI45iQuRG6CiEqpxeP8QKtzrRX6BTzgx/OrBzIzdUkRAW
 8GVhYQyTx+hFmor7knC/7mfeIjSsIAkJdyBKyQ7nSqfSIsVhKpwUEv2jW
 hlQNbzdM27e4bDhjPoYS9mFIiX1LIc5HBISVMjZ5sd0sVzUFappHYgr2N
 eGJU4bXwBHMs/uJh5lE7aeKr2zq4FLQYTVlziZ2AKmyKUNwuDpwiEwR3o
 YZbiWCiyfc9n7eknAQjfwjOk8i2bgrH7a7D3B7jGjJpJmdWwf8dQV0ecw Q==;
X-CSE-ConnectionGUID: w2+soSlLRaGecVJ8n5zq0Q==
X-CSE-MsgGUID: uiVNQD36Q36O3jc/vAtgbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9762043"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="9762043"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 09:35:58 -0700
X-CSE-ConnectionGUID: /KlBAZ5HT9KIYEFPohN14Q==
X-CSE-MsgGUID: 0Zh2NHeQSg22j9akYQsmHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="26101371"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 09:35:56 -0700
Date: Fri, 26 Apr 2024 18:35:53 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH i-g-t] tests/device_reset: move later skips into subtests
Message-ID: <20240426163527.2uqtu37kpeyapwbe@zkempczy-mobl2>
References: <20240425140544.41750-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240425140544.41750-1-kamil.konieczny@linux.intel.com>
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

On Thu, Apr 25, 2024 at 04:05:44PM +0200, Kamil Konieczny wrote:
> It is safe to use skips just after igt_main() for skipping all
> subtests but later on they produce logs and even if CI will
> ignore that, such logs can mislead developers reading them.
> 
> Move a skip from middle of igt_main() code block into subtests
> which needed them.
> 
> v2: add space after while (Kamil)
> v3: remove macro in favor of function (Zbigniew)
> 
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/device_reset.c | 36 ++++++++++++++++++++++++++++++------
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index 583a59039..09558ff20 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -299,6 +299,29 @@ static bool is_sysfs_cold_reset_supported(int slot_fd)
>  	return true;
>  }
>  
> +/**
> + * cold_reset_not_supported:
> + * @fd: opened sysfs pci slot descriptor
> + *
> + * Check if device supports cold reset based on slot dir or sysfs file presence.
> + *
> + * Returns:
> + * NULL if device supports cold reset, otherwise a string description
> + */
> +static const char *cold_reset_not_supported(int slot_dir)
> +{
> +	static const char *no_slot = "Gfx Card does not support any pcie slot for cold reset";
> +	static const char *not_supported = "Gfx Card does not support cold reset";
> +
> +	if (slot_dir < 0)
> +		return no_slot;
> +
> +	if (!is_sysfs_cold_reset_supported(slot_dir))
> +		return not_supported;
> +
> +	return NULL;
> +}
> +
>  /* Unbind the driver from the device */
>  static void driver_unbind(struct device_fds *dev)
>  {
> @@ -424,22 +447,23 @@ igt_main
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
> +			const char *reason = cold_reset_not_supported(dev.fds.slot_dir);
> +
> +			igt_skip_on_f(reason, "%s\n", reason);
>  			unbind_reset_rebind(&dev, COLD_RESET);
>  			healthcheck(&dev);
>  		}
>  
>  		igt_describe("Cold Resets device with bound driver");
>  		igt_subtest("cold-reset-bound") {
> +			const char *reason = cold_reset_not_supported(dev.fds.slot_dir);
> +
> +			igt_skip_on_f(reason, "%s\n", reason);
>  			initiate_device_reset(&dev, COLD_RESET);
>  			/*
>  			 * Cold reset will initiate card boot sequence again,
> -- 
> 2.42.0
> 

I understand you want to be verbose when cold reset is not supported
and what's the reason. At the first glance cold_reset_not_supported()
is a little bit confusing (returns NULL in case it is fine). But at
least assignment is descriptive (reason = ...).

So:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
--
Zbigniew

