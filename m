Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176B7CCD184
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 09:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE3E10E5AA;
	Tue, 21 Oct 2025 09:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2UwSa+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B94A10E2E7
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Oct 2025 09:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761037545; x=1792573545;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SChi1Xns0Bk9qY1c125mp7KvbL6PBESw/RQOZdarxhU=;
 b=I2UwSa+LTmYmQz7dbS0UGdofPXkO2olMKlfhjQf+wydUOI4j6GjKJ5Ll
 Vromurr8w0SyCiG4s0iNaD3mAnrDiFXJHGfsmtgBLEmjy282oJpqRGQQd
 bW/TEHZkMhQNHxgf1sECp1Mo+0idt3sYjB834iiFZ3e64PndtjuDqgtFn
 X4VeruuDqnTUMHAaSnzTG9LvMOcXbQaJsrAT1L2rx7nnG04vTQr8kUQX6
 8/j25zYMk+bhpAaKgBZxjWIlaNxSCy1PIY3779VPFUJjgI1GvP2Z5/B2+
 84cmurvxMRnku1NlIYRUu1yQmzsPYnQQ5fyVftJnlCkPMNHBW/xwb8oEi g==;
X-CSE-ConnectionGUID: OzAu6sxPRCy4fQgyIW5B/A==
X-CSE-MsgGUID: ddrjrZBNQ6GVLLJ20W3/fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73831239"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="73831239"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 02:05:45 -0700
X-CSE-ConnectionGUID: ZK7y5PtGQcmNBmoRXJWjcw==
X-CSE-MsgGUID: uEkx4R3aQE6F3FkEVDduZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="214174126"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.111])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 02:05:43 -0700
Date: Tue, 21 Oct 2025 11:05:42 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Mark Yacoub <markyacoub@google.com>,
 =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH i-g-t v2 1/1] lib/drmtest: Fix device opening with
 DRIVER_ANY
Message-ID: <v6egc5juewmmsrk3ynogqq3f6scpmy7zklba7ovdztygdjytle@6ifqrzpumtdt>
References: <20251020174127.170084-1-kamil.konieczny@linux.intel.com>
 <20251020174127.170084-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020174127.170084-2-kamil.konieczny@linux.intel.com>
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

On Mon, Oct 20, 2025 at 07:41:27PM +0200, Kamil Konieczny wrote:
> When using IGT_FORCE_DRIVER with DRIVER_ANY, honor user choice
> when forced driver is excluded in DRIVER_ANY or it is not
> listed in known modules. With this following tests should
> work:
> 
> sudo IGT_FORCE_DRIVER=vgem ./core_getversion --r basic
> 
> or on Virtual Machine with VKMS driver:
> 
> sudo IGT_FORCE_DRIVER=vkms ./kms_plane
> 
> v2: improve also function documentation (Zbigniew)
> 
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: Mark Yacoub <markyacoub@google.com>
> Cc: José Expósito <jose.exposito89@gmail.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Tested-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  lib/drmtest.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index a1fb0b5ba..590c4671a 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -324,6 +324,8 @@ static void log_opened_device_path(const char *device_path)
>   * A special case is the use of the IGT_FORCE_DRIVER environment variable. In
>   * such case, even if opened device is compatible with given @chipset flag, the
>   * function returns error if forced driver is not compatible with @chipset.
> + * In case of DRIVER_ANY in @chipset, it is treated as compatible with forced
> + * name, even when driver was excluded by ANY or is not listed in known drivers.
>   *
>   * Returns: DRM file descriptor or -1 on error
>   */
> @@ -341,19 +343,30 @@ int __drm_open_device(const char *name, unsigned int chipset)
>  	if (__get_drm_device_name(fd, dev_name, sizeof(dev_name) - 1) == -1)
>  		goto err;
>  
> +	/*
> +	 * When using forced driver with DRIVER_ANY honor any driver name,
> +	 * also those excluded from DRIVER_ANY or those that are not listed
> +	 * in known modules.
> +	 */
>  	forced = forced_driver();
> -	if (forced && chipset == DRIVER_ANY && strcmp(forced, dev_name)) {
> -		igt_debug("Expected driver \"%s\" but got \"%s\"\n",
> +	if (forced && chipset == DRIVER_ANY) {
> +		if (strcmp(forced, dev_name)) {
> +			igt_debug("Expected driver \"%s\" but got \"%s\"\n",
>  				  forced, dev_name);
> -		goto err;
> +			goto err;
> +		} else {
> +			goto opened;
> +		}
>  	}
>  
>  	modulename_to_chipset(dev_name, &chip);
>  
> -	if ((chipset & chip) == chip) {
> -		log_opened_device_path(name);
> -		return fd;
> -	}
> +	if ((chipset & chip) != chip)
> +		goto err;
> +
> +opened:
> +	log_opened_device_path(name);
> +	return fd;
>  
>  err:
>  	close(fd);
> -- 
> 2.51.1
> 

LGTM now,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
